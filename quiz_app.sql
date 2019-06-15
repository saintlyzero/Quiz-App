-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 15, 2019 at 07:40 AM
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
-- Table structure for table `aptitude`
--

CREATE TABLE `aptitude` (
  `qid` int(11) NOT NULL,
  `question` varchar(500) DEFAULT NULL,
  `opt1` varchar(500) DEFAULT NULL,
  `opt2` varchar(500) DEFAULT NULL,
  `opt3` varchar(500) DEFAULT NULL,
  `opt4` varchar(500) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aptitude`
--

INSERT INTO `aptitude` (`qid`, `question`, `opt1`, `opt2`, `opt3`, `opt4`, `answer`) VALUES
(1, 'what is what', 'a', 'b', 'c', 'd', 'a'),
(2, 'what is 2+2', '4', '5', '8', '19', '4'),
(4, 'What is 7+9', '14', '16', '89', '77', '16'),
(5, 'What is 27+9', '54', '916', '989', '797', '816'),
(6, 'What is 127+19', '4454', '22916', '41989', '12797', '816'),
(7, 'What is 827 - 99', '854', '8916', '8989', '8797', '1816'),
(8, 'What is 90+9', '99', '6', '9', '997', '999'),
(9, 'What is the a+b?', 'a', 'b', 'A+b', 'a+b', 'A+B'),
(10, 'What is the a+b?', 'a', 'b', 'A+b', 'a+b', 'A+B'),
(11, 'What is the z+y?', 'a+x', 'x+y', 'A+b', 'a+b', 'A+B'),
(13, 'How Are you Boi?', 'Good', 'OP', 'Very good', 'Mehh', 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `logical`
--

CREATE TABLE `logical` (
  `qid` int(11) NOT NULL,
  `question` varchar(500) DEFAULT NULL,
  `opt1` varchar(500) DEFAULT NULL,
  `opt2` varchar(500) DEFAULT NULL,
  `opt3` varchar(500) DEFAULT NULL,
  `opt4` varchar(500) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logical`
--

INSERT INTO `logical` (`qid`, `question`, `opt1`, `opt2`, `opt3`, `opt4`, `answer`) VALUES
(1, 'This is Logical question', 'No', 'Yes', 'Yes Yes', 'No no', 'Yes Yes');

-- --------------------------------------------------------

--
-- Table structure for table `quantitative`
--

CREATE TABLE `quantitative` (
  `qid` int(11) NOT NULL,
  `question` varchar(500) DEFAULT NULL,
  `opt1` varchar(500) DEFAULT NULL,
  `opt2` varchar(500) DEFAULT NULL,
  `opt3` varchar(500) DEFAULT NULL,
  `opt4` varchar(500) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quantitative`
--

INSERT INTO `quantitative` (`qid`, `question`, `opt1`, `opt2`, `opt3`, `opt4`, `answer`) VALUES
(1, 'This is verbal question', 'verbal1', 'verbal 2', 'verbal 3', 'verbal 17', 'verbal 2');

-- --------------------------------------------------------

--
-- Table structure for table `test_log`
--

CREATE TABLE `test_log` (
  `test_id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
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

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'abc', 'abc_a@gmail.com', 'pass'),
(2, 'xyz', 'zyxasdasd', 'xyz'),
(3, 'xyz12', 'asd', 'xyz'),
(5, 'lmn', 'shubham@.com', 'lmn');

-- --------------------------------------------------------

--
-- Table structure for table `user_performance`
--

CREATE TABLE `user_performance` (
  `up_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `logical_qno` int(11) DEFAULT NULL,
  `logical_score` varchar(30) DEFAULT NULL,
  `quantitative_qno` int(11) DEFAULT NULL,
  `quantitative_score` varchar(30) DEFAULT NULL,
  `aptitude_qno` int(11) DEFAULT NULL,
  `aptitude_score` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_performance`
--

INSERT INTO `user_performance` (`up_id`, `user_name`, `logical_qno`, `logical_score`, `quantitative_qno`, `quantitative_score`, `aptitude_qno`, `aptitude_score`) VALUES
(1, 'abc', 1, '0', 99, '88', 122, '50'),
(2, 'xyz', 1, '10', 1, '15', 1, '0'),
(4, 'lmn', 1, '0', 199, '188', 1, '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_detail`
--
ALTER TABLE `admin_detail`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `aptitude`
--
ALTER TABLE `aptitude`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `logical`
--
ALTER TABLE `logical`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `quantitative`
--
ALTER TABLE `quantitative`
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
-- AUTO_INCREMENT for table `aptitude`
--
ALTER TABLE `aptitude`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `logical`
--
ALTER TABLE `logical`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quantitative`
--
ALTER TABLE `quantitative`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `test_log`
--
ALTER TABLE `test_log`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_performance`
--
ALTER TABLE `user_performance`
  MODIFY `up_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
