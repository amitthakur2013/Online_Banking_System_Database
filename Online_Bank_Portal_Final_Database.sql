-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bankdb2
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `acct_no` bigint NOT NULL,
  `user_id` int NOT NULL,
  `acct_type` varchar(255) NOT NULL,
  `balance` double NOT NULL,
  `joint_userid` int DEFAULT NULL,
  `operation_type` varchar(255) NOT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`acct_no`,`user_id`),
  KEY `FKcwcof6gi0txp7t7mow4ii4584` (`branch_id`),
  KEY `FK7m8ru44m93ukyb61dfxw0apf6` (`user_id`),
  CONSTRAINT `FK7m8ru44m93ukyb61dfxw0apf6` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKcwcof6gi0txp7t7mow4ii4584` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (123456,1,'current',18227.5,0,'single',1001),(200589,1,'fixed deposit',150000,0,'single',1001),(369852,2,'savings',23535.64,0,'single',1001),(564789,2,'fixed deposit',14000,0,'single',1001),(963412,1,'savings',8462.05,0,'single',1001);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiary`
--

DROP TABLE IF EXISTS `beneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficiary` (
  `benif_id` bigint NOT NULL,
  `accountno` bigint NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `ifsc_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  PRIMARY KEY (`benif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiary`
--

LOCK TABLES `beneficiary` WRITE;
/*!40000 ALTER TABLE `beneficiary` DISABLE KEYS */;
INSERT INTO `beneficiary` VALUES (6,852369,'State Bank of India','Khandra','SBIN0006579','Soham Singh','somu'),(7,147852,'HDFC Bank','Kormangalam','HDFC1239658','Rohan Kumar','ron');
/*!40000 ALTER TABLE `beneficiary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biller`
--

DROP TABLE IF EXISTS `biller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biller` (
  `biller_id` bigint NOT NULL,
  `electricbill_no` varchar(255) DEFAULT NULL,
  `mob_no` varchar(255) DEFAULT NULL,
  `premium_no` varchar(255) DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`biller_id`),
  KEY `FKka89302vtyimgv6kug8p1fnd6` (`vendor_id`),
  CONSTRAINT `FKka89302vtyimgv6kug8p1fnd6` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biller`
--

LOCK TABLES `biller` WRITE;
/*!40000 ALTER TABLE `biller` DISABLE KEYS */;
INSERT INTO `biller` VALUES (202,'','6294556478','',101),(234,'258963','','',103),(237,'','','120025',105);
/*!40000 ALTER TABLE `biller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `ifsc_code` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1001,'Kormangalam','Kormangalam bank','Bangalore','SBIN0002589','0225639874');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (240);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `trans_id` bigint NOT NULL,
  `amount` double NOT NULL,
  `avail_bal` double NOT NULL,
  `created_on` varchar(255) NOT NULL,
  `from_account_no` bigint DEFAULT NULL,
  `from_user_id` int DEFAULT NULL,
  `ref_no` bigint NOT NULL,
  `remark` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `benif_id` bigint DEFAULT NULL,
  `biller` varchar(255) DEFAULT NULL,
  `trans_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `FK7br6rr8qs0268fikn8hp00xe4` (`benif_id`),
  CONSTRAINT `FK7br6rr8qs0268fikn8hp00xe4` FOREIGN KEY (`benif_id`) REFERENCES `beneficiary` (`benif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (196,125,9474.05,'2021-05-12 10:25:09',963412,1,202105121025090,'','success',6,'','Fund_Transfer'),(197,144,9330.05,'2021-05-12 10:25:31',963412,1,202105121025310,'','success',7,'','Fund_Transfer'),(198,149,9181.05,'2021-05-12 10:45:45',963412,1,202105121045450,'Mob Recharge','success',NULL,'Mobile_Recharge - Airtel','Bill_Payment'),(199,328,18952.5,'2021-05-12 11:30:46',123456,1,202105121130460,'For June Premium','success',NULL,'Insurance SBI Life Insurance','Bill_Payment'),(200,101,18851.5,'2021-05-12 11:32:13',123456,1,202105121132130,'','success',NULL,'Mobile_Recharge - Airtel','Bill_Payment'),(201,125,18726.5,'2021-05-12 11:33:18',123456,1,202105121133180,'For Book','success',7,'','Fund_Transfer'),(205,100,18626.5,'2021-05-12 11:59:51',123456,1,202105121159510,'','success',NULL,'Insurance - LIC India','Bill_Payment'),(215,399,18227.5,'2021-05-12 16:41:32',123456,1,202105121641310,'Data Pack','success',NULL,'Mobile_Recharge - Jio','Bill_Payment'),(216,205,8976.05,'2021-05-12 16:43:37',963412,1,202105121643370,'Month- June','success',NULL,'Insurance - SBI Life Insurance','Bill_Payment'),(230,260,8716.05,'2021-05-13 11:37:23',963412,1,202105131137230,'','success',NULL,'Insurance - SBI Life Insurance','Bill_Payment'),(235,254,8462.05,'2021-05-13 13:39:27',963412,1,202105131339270,'','success',NULL,'Electric_Bill - Adani Electric Group','Bill_Payment');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `login_pwd` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `trans_pwd` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Karol Bagh, New Delhi','1977-05-28','rohit123@gmail.com','Rohit','Male','Sharma','rohit@123','1234567890','1234','rohit123'),(2,'Kota,Jaipur,Rajasthan','1998-06-25','sonam123@gmail.com','Sonam','Female','Kumari','sonam@123','9632587412','12345','sonam123'),(3,'White field area, Bangalore','1995-04-22','ankit123@yahoo.com','Ankit','Male','Kumar','ankit@123','8478546930','123456','ankit123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_beneficiary`
--

DROP TABLE IF EXISTS `user_beneficiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_beneficiary` (
  `user_id` int NOT NULL,
  `benif_id` bigint NOT NULL,
  KEY `FKse5ddj7bk5kfe8ho932yr5lof` (`benif_id`),
  KEY `FKhv4x6ip18bibg7mnis9k5mfx2` (`user_id`),
  CONSTRAINT `FKhv4x6ip18bibg7mnis9k5mfx2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKse5ddj7bk5kfe8ho932yr5lof` FOREIGN KEY (`benif_id`) REFERENCES `beneficiary` (`benif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_beneficiary`
--

LOCK TABLES `user_beneficiary` WRITE;
/*!40000 ALTER TABLE `user_beneficiary` DISABLE KEYS */;
INSERT INTO `user_beneficiary` VALUES (1,6),(1,7);
/*!40000 ALTER TABLE `user_beneficiary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_biller`
--

DROP TABLE IF EXISTS `user_biller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_biller` (
  `user_id` int NOT NULL,
  `biller_id` bigint NOT NULL,
  KEY `FKc0jhjiehuke0irskitohefh8s` (`biller_id`),
  KEY `FK7gyffshquxytxcqkbtwv8x09x` (`user_id`),
  CONSTRAINT `FK7gyffshquxytxcqkbtwv8x09x` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKc0jhjiehuke0irskitohefh8s` FOREIGN KEY (`biller_id`) REFERENCES `biller` (`biller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_biller`
--

LOCK TABLES `user_biller` WRITE;
/*!40000 ALTER TABLE `user_biller` DISABLE KEYS */;
INSERT INTO `user_biller` VALUES (1,202),(1,234),(1,237);
/*!40000 ALTER TABLE `user_biller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `vendor_id` bigint NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `v_email` varchar(255) DEFAULT NULL,
  `v_name` varchar(255) DEFAULT NULL,
  `v_phone` varchar(255) DEFAULT NULL,
  `v_company_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (101,'Mobile_Recharge','xyz@gmail.com','Anil Ambani','001205621','Airtel'),(102,'Mobile_Recharge','wax@gmail.com','Mukesh Ambani','025896310','Jio'),(103,'Electric_Bill','dfg@gmail.com','M Adani','012547856','Adani Electric Group'),(104,'Electric_Bill','hyt@yahoo.com','Jhunjhunwala','025632147','State Electric Group'),(105,'Insurance','vvv@yahoo.com','A Mangalam','022356147','LIC India'),(106,'Insurance','vgh@gmail.com','Mathura Sharma','011456398','SBI Life Insurance');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bankdb2'
--

--
-- Dumping routines for database 'bankdb2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-13 20:32:46
