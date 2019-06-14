-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 14, 2019 at 03:24 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_detail`
--

CREATE TABLE `admin_detail` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) DEFAULT NULL,
  `admin_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aptitude_question_set`
--

CREATE TABLE `aptitude_question_set` (
  `qid` int(11) NOT NULL,
  `question` varchar(500) DEFAULT NULL,
  `opt1` varchar(500) DEFAULT NULL,
  `opt2` varchar(500) DEFAULT NULL,
  `opt3` varchar(500) DEFAULT NULL,
  `opt4` varchar(500) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logical_question_set`
--

CREATE TABLE `logical_question_set` (
  `qid` int(11) NOT NULL,
  `question` varchar(500) DEFAULT NULL,
  `opt1` varchar(500) DEFAULT NULL,
  `opt2` varchar(500) DEFAULT NULL,
  `opt3` varchar(500) DEFAULT NULL,
  `opt4` varchar(500) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quantitative_question_set`
--

CREATE TABLE `quantitative_question_set` (
  `qid` int(11) NOT NULL,
  `question` varchar(500) DEFAULT NULL,
  `opt1` varchar(500) DEFAULT NULL,
  `opt2` varchar(500) DEFAULT NULL,
  `opt3` varchar(500) DEFAULT NULL,
  `opt4` varchar(500) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_log`
--

CREATE TABLE `test_log` (
  `test_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` varchar(30) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `score` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_performance`
--

CREATE TABLE `user_performance` (
  `up_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `logical_qno` int(11) DEFAULT NULL,
  `logical_score` varchar(30) DEFAULT NULL,
  `quantitative_qno` int(11) DEFAULT NULL,
  `quantitative_score` varchar(30) DEFAULT NULL,
  `aptitude_qno` int(11) DEFAULT NULL,
  `aptitude_score` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_detail`
--
ALTER TABLE `admin_detail`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `aptitude_question_set`
--
ALTER TABLE `aptitude_question_set`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `logical_question_set`
--
ALTER TABLE `logical_question_set`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `quantitative_question_set`
--
ALTER TABLE `quantitative_question_set`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `test_log`
--
ALTER TABLE `test_log`
  ADD PRIMARY KEY (`test_id`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_performance`
--
ALTER TABLE `user_performance`
  ADD PRIMARY KEY (`up_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_detail`
--
ALTER TABLE `admin_detail`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aptitude_question_set`
--
ALTER TABLE `aptitude_question_set`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logical_question_set`
--
ALTER TABLE `logical_question_set`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quantitative_question_set`
--
ALTER TABLE `quantitative_question_set`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_log`
--
ALTER TABLE `test_log`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_performance`
--
ALTER TABLE `user_performance`
  MODIFY `up_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
