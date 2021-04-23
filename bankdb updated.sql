-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 23, 2021 at 04:46 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bankdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `Acct_No` int(11) NOT NULL DEFAULT '0',
  `User_Id` int(11) NOT NULL DEFAULT '0',
  `Acct_Type` varchar(50) NOT NULL,
  `Operation_Type` varchar(50) NOT NULL,
  `Joint_Userid` int(11) DEFAULT NULL,
  `Branch_Id` int(11) NOT NULL,
  `Balance` decimal(65,2) NOT NULL,
  PRIMARY KEY (`Acct_No`,`User_Id`),
  KEY `Branch_Id` (`Branch_Id`),
  KEY `User_Id` (`User_Id`),
  KEY `Joint_Userid` (`Joint_Userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Acct_No`, `User_Id`, `Acct_Type`, `Operation_Type`, `Joint_Userid`, `Branch_Id`, `Balance`) VALUES
(100101102, 1, 'Saving', 'Single', NULL, 1001, '55432.65'),
(100345676, 1, 'Saving', 'Joint', 2, 1001, '999.00'),
(100345676, 2, 'Saving', 'Joint', 1, 1001, '999.00'),
(100678456, 2, 'Saving', 'Single', NULL, 1001, '8876.90'),
(997684356, 1, 'Current', 'Single', NULL, 1001, '324.90');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary`
--

CREATE TABLE IF NOT EXISTS `beneficiary` (
  `Benif_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Accountno` int(9) NOT NULL,
  `Bank_Name` varchar(100) NOT NULL,
  `Branch_Name` varchar(50) NOT NULL,
  `Ifsc_Code` varchar(11) NOT NULL,
  `Nickname` varchar(20) NOT NULL,
  PRIMARY KEY (`Benif_Id`),
  KEY `accountno` (`Accountno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=154324 ;

--
-- Dumping data for table `beneficiary`
--

INSERT INTO `beneficiary` (`Benif_Id`, `Name`, `Accountno`, `Bank_Name`, `Branch_Name`, `Ifsc_Code`, `Nickname`) VALUES
(154321, 'Aman Singh', 978765456, 'Bank of baroda', 'Mhow', 'BARBOMHOWXX', 'Aman'),
(154322, 'Ayushi Jain', 987789345, 'HDFC', 'Mumbai', 'HDFCBOMYXXX', 'Ayushi'),
(154323, 'Amesh Jain', 123098456, 'Axis Bank', 'Pune', 'AXISPUNEXXX', 'Amesh');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE IF NOT EXISTS `branch` (
  `Branch_Id` int(11) NOT NULL AUTO_INCREMENT,
  `City` varchar(50) DEFAULT NULL,
  `Branch_Name` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phone_No` varchar(13) NOT NULL,
  `Ifsc_Code` varchar(11) NOT NULL,
  PRIMARY KEY (`Branch_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1004 ;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`Branch_Id`, `City`, `Branch_Name`, `Address`, `Phone_No`, `Ifsc_Code`) VALUES
(1001, 'Bangalore', 'State Bank of India, Kormangalam', 'Kormangalam,Bangalore,Karnataka', '022-123-4567', 'SBIN1236579'),
(1002, 'Bangalore', 'State Bank of India, BTM Layout', 'BTM Layout, Bangalore', '022-456-1478', 'SBIN4560000'),
(1003, 'White Field', 'State Bank of India, White Field', 'White Field, Bangalore', '022-625-1477', 'SBIN0004589');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `Trans_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Ref_No` int(11) NOT NULL,
  `Amount` double NOT NULL,
  `Remark` varchar(50) NOT NULL,
  `Status` varchar(39) NOT NULL,
  `Created_On` datetime NOT NULL,
  `Avail_Bal` double NOT NULL,
  `To_Benif_Id` int(11) NOT NULL,
  `From_Account_No` int(30) NOT NULL,
  `From_User_Id` int(11) NOT NULL,
  PRIMARY KEY (`Trans_Id`),
  KEY `benif_id` (`To_Benif_Id`),
  KEY `User_Id` (`From_User_Id`),
  KEY `accountno_2` (`From_Account_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `transactions`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `User_Id` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(255) DEFAULT NULL,
  `Last_Name` varchar(255) DEFAULT NULL,
  `Gender` varchar(8) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone_No` varchar(13) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Login_Pwd` varchar(20) DEFAULT NULL,
  `Trans_Pwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`User_Id`),
  KEY `User_Id` (`User_Id`),
  KEY `User_Id_2` (`User_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_Id`, `First_Name`, `Last_Name`, `Gender`, `Email`, `Phone_No`, `Address`, `DOB`, `Login_Pwd`, `Trans_Pwd`) VALUES
(1, 'Rohit', 'Sharma', 'Male', 'rohit123@gmail.com', '1234567890', 'Karol Bagh, New Delhi', '1977-05-28', 'rohit@123', '1234'),
(2, 'Sonam', 'Kumari', 'Female', 'sonam123@gmail.com', '9632587412', 'Kota,Jaipur,Rajasthan', '1998-06-25', 'sonam@123', '12345'),
(3, 'Ankit', 'Kumar', 'Male', 'ankit123@yahoo.com', '8478546930', 'White field area, Bangalore', '1995-04-22', 'ankit@123', '123456');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Branch_Id`) REFERENCES `branch` (`Branch_Id`),
  ADD CONSTRAINT `account_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`To_Benif_Id`) REFERENCES `beneficiary` (`benif_id`) ON DELETE CASCADE ON UPDATE CASCADE;
