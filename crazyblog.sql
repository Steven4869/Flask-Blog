-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2021 at 05:10 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crazyblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `SNO` int(11) NOT NULL,
  `Name` text NOT NULL,
  `phoneno` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `emailid` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`SNO`, `Name`, `phoneno`, `message`, `emailid`, `date`) VALUES
(1, 'EREN', '8585858585', 'THIS IS FOR TESTING PURPOSE.', 'EARSED@gmail.com', '2020-12-31 21:17:07'),
(2, 'STEVEN PENS', '9090696969', 'this is my first message.', 'steven@gmail.com', '2021-01-01 16:10:56'),
(3, 'EREN YEAGER', '6969696969', 'This is the first time, I am trying this working program and hope you will like it.', 'erenyeager@gmail.com', '2021-01-01 16:14:38');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `SNO` int(11) NOT NULL,
  `TITLE` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `CONTENT` text NOT NULL,
  `POSTEDBY` text NOT NULL,
  `DATE` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`SNO`, `TITLE`, `slug`, `CONTENT`, `POSTEDBY`, `DATE`) VALUES
(1, 'Elon Musk becomes world\'s richest person ', 'first-post', 'Elon Musk has become the world\'s richest person, as his net worth crossed $185bn (£136bn).\r\n\r\nThe Tesla and SpaceX entrepreneur was pushed into the top slot after Tesla\'s share price increased on Thursday.\r\n\r\nHe takes the top spot from Amazon founder Jeff Bezos, who had held it since 2017.\r\n\r\nMr Musk\'s electric car company Tesla has surged in value this year, and hit a market value of $700bn (£516bn) for the first time on Wednesday.', 'Steven Pens ', '2021-01-07'),
(2, 'Two more life-saving Covid drugs discovered', 'second-post', 'Two more life-saving drugs have been found that can cut deaths by a quarter in patients who are sickest with Covid.\r\n\r\nThe anti-inflammatory medications, given via a drip, save an extra life for every 12 treated, say researchers who have carried out a trial in NHS intensive care units.\r\n\r\nSupplies are already available across the UK so they can be used immediately to save hundreds of lives, say experts.\r\n\r\nThere are over 30,000 Covid patients in UK hospitals - 39% more than in April.', 'Steven Pens', '2021-01-08'),
(3, 'How Narendra Modi misread the mood of India\'s angry farmers', 'third-post', 'After more than 45 days of protests and eight rounds of talks with the government, India\'s farmers have refused to budge.\r\n\r\nNothing short of a repeal of three market-friendly farm laws - designed to loosen rules around the sale, pricing and storage of farm produce - will make the farmers retreat from protest sites ringing the capital, Delhi. On Tuesday, the Supreme Court, responding to a bunch of petitions, put the laws on hold. The uncertainty lingers.', 'Steven Pens', '2021-01-13'),
(4, 'Trump impeached a historic 2nd time as 10 Republicans join Democrats to remove him over Capitol riot', 'fouth-post', 'It was another historic day in Donald Trump’s presidency as Democrats and Republicans sparred in the House of Representatives over whether to impeach him for an unprecedented second time. The House voted 232 to 197 in its favour as the Democrats prevailed due to their majority in the lower chamber. In an extraordinary move, 10 Republicans broke rank with their party to approve the article of impeachment.\r\n\r\nThe second impeachment was triggered after the storming of the Capitol on January 6 by hundreds of the president’s armed supporters which resulted in the death of five people and scores of injuries. They were protesting the certification process of Joe Biden’s victory by the Congress.', 'Steven Pens', '2021-01-21'),
(5, 'Joe Biden takes over as President, Kamala Harris as Vice President of US', 'fifth-post', 'Joe Biden took oath as the 46th President of the United States of America at a scaled-back ceremony in the US Capitol building in Washington last night that was largely stripped of its usual pomp due to the Coronavirus and security concerns. In his first speech as US president, Mr Biden vowed to defeat political extremism and white supremacy.\r\n \r\nHe spoke of unifying the country and pledged that he will be the President for all Americans. He said, America has been tested and they have come out stronger for it. Mr Biden said, they will repair their alliances and engage once again. 78 year old Biden has become the oldest US President in history. His deputy Kamala Harris was also sworn in as 49th Vice-President of the country. The daughter of immigrants from Jamaica and India, Kamala Harris made history as America\'s first woman and first person with south Asian roots to take the office of the Vice President.', 'Steven Pens', '2021-01-21'),
(6, 'Google\'s Sundar Pichai, Apple\'s Tim Cook Applaud Joe Biden\'s Immigration Reforms', 'sixth-post', ' US IT sector and business groups, including technology giants Google and Apple, have applauded President Joe Biden\'s steps to initiate immigration reforms, underlining that the move would boost American economy, create jobs and attract and retain the best talent from across the world.\r\n\r\nOn day one of his presidency on Wednesday, President Biden sent a comprehensive immigration bill to Congress which proposes major overhauls to the system, including granting legal status and a path to citizenship to tens of thousands of undocumented immigrants and other groups and reduce the time that family members must wait outside the US for green cards.', 'Steven Pens', '2021-01-24'),
(9, 'US Judge Blocks Biden\'s 100-Day Freeze On Deportations', 'seventh-post', 'A US federal judge on Tuesday blocked President Joe Biden\'s administration from implementing a 100-day pause on deportations.\r\nJudge Drew Tipton granted a 14-day temporary restraining order until the case could be further examined, following a request by Texas Attorney General Ken Paxton.\r\n\r\n\"A near-complete suspension of deportations would only serve to endanger Texans and undermine federal law,\" Paxton said in a statement.\r\n\r\nOn his first day in the White House Biden signed a moratorium on the deportation of undocumented migrants who arrived in the United States before November 1, 2020, thus fulfilling a campaign promise.\r\n\r\nPaxton, a close ally of former president Donald Trump, immediately appealed the order.\r\n\r\n\"I commend the Court for prioritizing the law and safety of our citizens,\" Paxton said in the statement.\r\n\r\nLeading US civil rights group, the American Civil Liberties Union (ACLU), in turn filed a brief asking the court to deny the request.', 'Steven Pens', '2021-01-27'),
(10, 'checck', 'eight-post', 'lets check it out\r\n<p>\r\nhere we go less ', 'steven', '2021-01-28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`SNO`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`SNO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `SNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `SNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
