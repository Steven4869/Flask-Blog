from flask import Flask,render_template,request, session,redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
import json
import os
import math
from datetime import datetime
with open('config.json','r') as c:
    params=json.load(c)["params"]
local_server=True
app=Flask(__name__,template_folder='templates')
#app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=True
app.secret_key= 'super-secret-key'
app.config['UPLOAD_FOLDER']=params['upload_location']
if (local_server):
    app.config['SQLALCHEMY_DATABASE_URI']=params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
db = SQLAlchemy(app)


class posts(db.Model):
    SNO = db.Column(db.Integer, primary_key=True)
    TITLE = db.Column(db.String(50))
    slug = db.Column(db.String(12))
    CONTENT = db.Column(db.String(120))
    POSTEDBY = db.Column(db.String(50))
    date = db.Column(db.String(12))

class contacts(db.Model):
    SNO = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(50))
    phoneno = db.Column(db.String(12))
    message = db.Column(db.String(120))
    emailid = db.Column(db.String(50))
    date = db.Column(db.String(12))
@app.route("/")
def home():
    post1=posts.query.filter_by().all()
    last=math.ceil(len(post1)/int(params['no_of_posts']))


    page=request.args.get('page')
    if(not str(page).isnumeric()):
        page=1
    page= int(page)
    post1=post1[(page - 1)*int(params['no_of_posts']) :(page -1)*int(params['no_of_posts'])+int(params['no_of_posts'])]
    if(page==1):
        prev="#"
        next="/?page="+str(page+1)
    elif(page==last):
        prev="/?page="+str(page-1)
        next="#"
    else:
        prev="/?page="+str(page-1)
        next="/?page="+str(page+1)
    return render_template('index.html',params=params,post1=post1,prev=prev,next=next)
@app.route("/about")
def about():
    return render_template('about.html',params=params)
@app.route("/dashboard",methods=['GET','POST'])
def dashboard():
    if ('user' in session and session['user']==params['admin_user']):
        post1=posts.query.all()
        return render_template('dashboard.html',params=params,post1=post1)
    if request.method =='POST':
        username=request.form.get('uname')
        userpass=request.form.get('pass')
        if (username==params['admin_user'] and userpass==params['admin_password']):
            session['user']= username
            post1 = posts.query.all()
            return render_template('dashboard.html',params=params,post1=post1)
    return render_template('login.html',params=params)
@app.route("/dash")
def dash():
    return render_template('post.html',params=params)
@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post=posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html',params=params,post=post)
@app.route("/signout")
def signout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/uploader", methods = ['GET','POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if (request.method=='POST'):
            f=request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)) )
            return "UPLOADED SUCCESSFULLY"
@app.route("/delete/<string:SNO>",methods=['GET','POST'])
def delete(SNO):
    if ('user' in session and session['user'] == params['admin_user']):
        post1=posts.query.filter_by(SNO=SNO).first()
        db.session.delete(post1)
        db.session.commit()
        return redirect('/dashboard')



@app.route("/edit/<string:SNO>",methods=['GET','POST'])
def edit(SNO):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method=='POST':
            title=request.form.get('TITLE')
            slug=request.form.get('SLUG')
            content=request.form.get('CONTENT')
            postedby=request.form.get('POSTEDBY')
            date=datetime.now()

            if SNO=='0':
                post1=posts(TITLE=title,slug=slug,POSTEDBY=postedby,CONTENT=content,date=date)
                db.session.add(post1)
                db.session.commit()
            else:
                post1=posts.query.filter_by(SNO=SNO).first()
                post1.TITLE=title
                post1.slug=slug
                post1.postedby=postedby
                post1.content=content
                post1.date=date
                db.session.commit()
                return redirect('/edit/' + SNO)
    post1 = posts.query.filter_by(SNO=SNO).first()
    return render_template('edit.html',params=params,SNO=SNO,post1=post1)

@app.route("/contact", methods = ['GET','POST'])
def contact():
    if(request.method=='POST'):
        """ADD ENTRY TO THE DATABASE"""
        name=request.form.get('name')
        email=request.form.get('email')
        phone=request.form.get('phone')
        message=request.form.get('message')
        entry=contacts(Name=name,phoneno=phone,emailid=email,message=message,date=datetime.now())
        db.session.add(entry)
        db.session.commit()
    return render_template('contact.html',params=params)
app.run(debug=True)
