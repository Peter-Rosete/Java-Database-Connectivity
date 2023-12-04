CREATE DATABASE  IF NOT EXISTS `library_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library_system`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: library_system
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_fname` varchar(50) DEFAULT NULL,
  `author_lname` varchar(50) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_isbn` bigint unsigned NOT NULL,
  `book_title` varchar(100) NOT NULL,
  `book_author_id` int unsigned NOT NULL,
  `book_type` varchar(50) NOT NULL,
  `book_price` float NOT NULL,
  `book_year` char(4) NOT NULL,
  `book_publisher` varchar(50) NOT NULL,
  `book_genre` varchar(50) NOT NULL,
  `book_language` varchar(50) NOT NULL,
  PRIMARY KEY (`book_isbn`),
  KEY `FK_book_author_id` (`book_author_id`),
  CONSTRAINT `FK_book_author_id` FOREIGN KEY (`book_author_id`) REFERENCES `author` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_copies`
--

DROP TABLE IF EXISTS `book_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_copies` (
  `copy_id` int unsigned NOT NULL AUTO_INCREMENT,
  `book_isbn` bigint unsigned NOT NULL,
  `copy_available` tinyint(1) NOT NULL DEFAULT '1',
  `copy_loc` int unsigned NOT NULL,
  PRIMARY KEY (`copy_id`,`book_isbn`),
  KEY `FK_copy_loc` (`copy_loc`),
  CONSTRAINT `FK_copy_loc` FOREIGN KEY (`copy_loc`) REFERENCES `library` (`library_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_record`
--

DROP TABLE IF EXISTS `book_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_record` (
  `record_id` int unsigned NOT NULL AUTO_INCREMENT,
  `patron_id` int unsigned NOT NULL,
  `copy_id` int unsigned NOT NULL,
  `br_date_checked_out` date NOT NULL,
  `br_date_due` date NOT NULL,
  `br_date_returned` date DEFAULT NULL,
  `br_book_state` varchar(25) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `FK_patron_id_br` (`patron_id`),
  KEY `FK_copy_id_br` (`copy_id`),
  CONSTRAINT `FK_copy_id_br` FOREIGN KEY (`copy_id`) REFERENCES `book_copies` (`copy_id`),
  CONSTRAINT `FK_patron_id_br` FOREIGN KEY (`patron_id`) REFERENCES `patron` (`patron_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checked_out`
--

DROP TABLE IF EXISTS `checked_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checked_out` (
  `checked_out_id` int unsigned NOT NULL AUTO_INCREMENT,
  `patron_id` int unsigned NOT NULL,
  `book_isbn` bigint unsigned NOT NULL,
  `copy_id` int unsigned NOT NULL,
  `date_checked_out` date NOT NULL,
  `date_due` date NOT NULL DEFAULT '1900-01-01',
  `renewed_available` smallint unsigned NOT NULL DEFAULT '2',
  PRIMARY KEY (`checked_out_id`),
  KEY `FK_patron_id_checkout` (`patron_id`),
  KEY `FK_book_isbn_checkout` (`book_isbn`),
  KEY `FK_copy_id_checkout` (`copy_id`),
  CONSTRAINT `FK_book_isbn_checkout` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`book_isbn`),
  CONSTRAINT `FK_copy_id_checkout` FOREIGN KEY (`copy_id`) REFERENCES `book_copies` (`copy_id`),
  CONSTRAINT `FK_patron_id_checkout` FOREIGN KEY (`patron_id`) REFERENCES `patron` (`patron_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cus_record`
--

DROP TABLE IF EXISTS `cus_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cus_record` (
  `record_id` int unsigned NOT NULL AUTO_INCREMENT,
  `patron_id` int unsigned NOT NULL,
  `book_isbn` bigint unsigned NOT NULL,
  `copy_id` int unsigned NOT NULL,
  `cr_date_checked_out` date NOT NULL,
  `cr_date_due` date NOT NULL,
  `cr_date_returned` date DEFAULT NULL,
  `cr_book_state` varchar(25) NOT NULL,
  `cr_fees` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_id`),
  KEY `FK_patron_id_cr` (`patron_id`),
  KEY `FK_book_isbn_cr` (`book_isbn`),
  KEY `FK_copy_id_cr` (`copy_id`),
  CONSTRAINT `FK_book_isbn_cr` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`book_isbn`),
  CONSTRAINT `FK_copy_id_cr` FOREIGN KEY (`copy_id`) REFERENCES `book_copies` (`copy_id`),
  CONSTRAINT `FK_patron_id_cr` FOREIGN KEY (`patron_id`) REFERENCES `patron` (`patron_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fee`
--

DROP TABLE IF EXISTS `fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee` (
  `fee_id` int unsigned NOT NULL AUTO_INCREMENT,
  `patron_id` int unsigned NOT NULL,
  `book_isbn` bigint unsigned NOT NULL,
  `copy_id` int unsigned NOT NULL,
  `fee_date_checked_out` date NOT NULL,
  `fee_date_due` date NOT NULL,
  `fee_fees` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`fee_id`),
  KEY `FK_patron_id_fee` (`patron_id`),
  KEY `FK_book_isbn_fee` (`book_isbn`),
  KEY `FK_copy_id_fee` (`copy_id`),
  CONSTRAINT `FK_book_isbn_fee` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`book_isbn`),
  CONSTRAINT `FK_copy_id_fee` FOREIGN KEY (`copy_id`) REFERENCES `book_copies` (`copy_id`),
  CONSTRAINT `FK_patron_id_fee` FOREIGN KEY (`patron_id`) REFERENCES `patron` (`patron_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hold`
--

DROP TABLE IF EXISTS `hold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hold` (
  `patron_id` int unsigned NOT NULL,
  `book_isbn` bigint unsigned NOT NULL,
  `copy_id` int unsigned NOT NULL,
  `hold_join_date` datetime NOT NULL,
  `hold_pickup_loc` int unsigned NOT NULL,
  PRIMARY KEY (`patron_id`,`copy_id`,`book_isbn`),
  KEY `FK_copy_id_hold` (`copy_id`),
  KEY `FK_book_isbn_hold` (`book_isbn`),
  KEY `FK_pickup_hold` (`hold_pickup_loc`),
  CONSTRAINT `FK_book_isbn_hold` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`book_isbn`),
  CONSTRAINT `FK_copy_id_hold` FOREIGN KEY (`copy_id`) REFERENCES `book_copies` (`copy_id`),
  CONSTRAINT `FK_patron_id_hold` FOREIGN KEY (`patron_id`) REFERENCES `patron` (`patron_id`),
  CONSTRAINT `FK_pickup_hold` FOREIGN KEY (`hold_pickup_loc`) REFERENCES `library` (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library` (
  `library_id` int unsigned NOT NULL AUTO_INCREMENT,
  `library_name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state_abbr` char(2) NOT NULL,
  `zip_code` char(10) NOT NULL,
  PRIMARY KEY (`library_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `overdue_book`
--

DROP TABLE IF EXISTS `overdue_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overdue_book` (
  `overdue_id` int unsigned NOT NULL AUTO_INCREMENT,
  `patron_id` int unsigned NOT NULL,
  `book_isbn` bigint unsigned NOT NULL,
  `copy_id` int unsigned NOT NULL,
  `date_checked_out` date NOT NULL,
  `date_due` date NOT NULL,
  `renewed_available` smallint NOT NULL,
  PRIMARY KEY (`overdue_id`),
  KEY `FK_patron_id_ob` (`patron_id`),
  KEY `FK_copy_id_ob` (`copy_id`),
  KEY `FK_book_isbn_ob` (`book_isbn`),
  CONSTRAINT `FK_book_isbn_ob` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`book_isbn`),
  CONSTRAINT `FK_copy_id_ob` FOREIGN KEY (`copy_id`) REFERENCES `book_copies` (`copy_id`),
  CONSTRAINT `FK_patron_id_ob` FOREIGN KEY (`patron_id`) REFERENCES `patron` (`patron_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patron`
--

DROP TABLE IF EXISTS `patron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patron` (
  `patron_id` int unsigned NOT NULL AUTO_INCREMENT,
  `patron_fname` varchar(50) NOT NULL,
  `patron_lname` varchar(50) NOT NULL,
  `patron_birthday` date NOT NULL,
  `patron_address` varchar(50) NOT NULL,
  `patron_city` varchar(50) NOT NULL,
  `patron_state` char(2) NOT NULL,
  `patron_zip_code` char(10) NOT NULL,
  `patron_phone` char(10) DEFAULT NULL,
  `patron_email` varchar(50) NOT NULL,
  `patron_on_hold` tinyint(1) NOT NULL DEFAULT '0',
  `patron_hold_reason` varchar(50) DEFAULT NULL,
  `patron_blacklisted` tinyint(1) NOT NULL DEFAULT '0',
  `patron_blacklisted_reason` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`patron_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int unsigned NOT NULL AUTO_INCREMENT,
  `staff_fname` varchar(50) NOT NULL,
  `staff_lname` varchar(50) NOT NULL,
  `staff_role` varchar(50) NOT NULL,
  `staff_birthday` date NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `zip_code` char(10) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waitlist`
--

DROP TABLE IF EXISTS `waitlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitlist` (
  `patron_id` int unsigned NOT NULL,
  `book_isbn` bigint unsigned NOT NULL,
  `waitlist_join_datetime` datetime NOT NULL,
  `waitlist_pickup_loc` int unsigned NOT NULL,
  PRIMARY KEY (`patron_id`,`book_isbn`),
  KEY `FK_book_isbn_waitlist` (`book_isbn`),
  KEY `FK_pickup_waitlist` (`waitlist_pickup_loc`),
  CONSTRAINT `FK_book_isbn_waitlist` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`book_isbn`),
  CONSTRAINT `FK_patron_id_waitlist` FOREIGN KEY (`patron_id`) REFERENCES `patron` (`patron_id`),
  CONSTRAINT `FK_pickup_waitlist` FOREIGN KEY (`waitlist_pickup_loc`) REFERENCES `library` (`library_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23 16:19:54
