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
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Diana Wynne','Jones'),(2,'Neil','Gaiman'),(3,'Hiromu','Arakawa'),(4,'Jane','Austen'),(5,'Patrick','Ness'),(6,'Erin','Morgenstern'),(7,'Naomi','Novik'),(8,'Katherine','Arden'),(9,'Margaret','Rogerson'),(10,'Tara','Westerover'),(11,'Dami','Lee'),(12,'Silvia','Moreno-Garcia'),(13,'Andrzej','Sapkowski'),(14,'Sydney','Padua'),(15,'Lydia','Kang'),(16,'Charlie','Mackesy');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (9780007106530,'Charmed Life (Chrestomanci, #1)',1,'Paperback',10.99,'2000','HarperCollins Children\'s Books','Fiction','English'),(9780060530945,'The Graveyard Book',2,'Paperback',8.99,'2009','HarperCollins','Fiction','English'),(9780061477973,'House of Many Ways (Howl\'s Moving Castle, #3)',1,'Paperback',8.99,'2009','Greenwillow Books','Fiction','English'),(9780061478772,'Castle in the Air (Howl\'s Moving Castle, #2)',1,'Paperback',8.99,'2008','Greenwillow Books','Fiction','English'),(9780061478789,'Howl\'s Moving Castle (Howl\'s Moving Castle, #1)',1,'Paperback',9.99,'2008','Greenwillow Books','Fiction','English'),(9780062075130,'Earwig and the Witch',1,'Paperback',6.99,'2012','Greenwillow Books','Fiction','English'),(9780062224088,'Fortunately, the Milk',2,'Paperback',7.99,'2013','HarperCollins','Fiction','English'),(9780062262264,'The View from the Cheap Seats: Selected Nonfiction',2,'Hardcover',26.99,'2016','William Morrow','Fiction','English'),(9780062330260,'Trigger Warning: Short Fictions and Disturbances',2,'Hardcover',26.99,'2015','William Morrow','Fiction','English'),(9780062564337,'Anansi Boys',2,'Mass Market Paperbound',9.99,'2009','William Morrow','Fiction','English'),(9780062976581,'The Boy, the Mole, the Fox and the Horse',16,'Hardcover',22.99,'2019','HarperOne','Fiction','English'),(9780063070707,'The Ocean at the End of the Lane',2,'Paperback',16.99,'2013','William Morrow','Fiction','English'),(9780063070721,'Neverwhere (London Below, #1)',2,'Paperback',16.99,'2009','William Morrow','Fiction','English'),(9780063081918,'American Gods (American Gods, #1)',2,'Paperback',19.99,'2011','William Morrow','Fiction','English'),(9780141439518,'Pride and Prejudice',4,'Paperback',9,'2002','Penguin Classics','Fiction','English'),(9780142420140,'Fire and Hemlock',1,'Paperback',9.99,'2012','Firebird','Fiction','English'),(9780307744432,'The Night Circus',6,'Paperback',16,'2011','Doubleday','Fiction','English'),(9780307908278,'The Thrilling Adventures of Lovelace and Babbage: The (Mostly) True Story of the First Computer',14,'Hardcover',40,'2015','Pantheon','Fiction','English'),(9780316029186,'The Last Wish (The Witcher, #0.5)',13,'Mass Market Paperbound',8.99,'2008','Orbit','Fiction','English'),(9780316029193,'Blood of Elves (The Witcher, #1)',13,'Paperback',16.99,'2009','Orbit','Fiction','English'),(9780316219136,'The Time of Contempt (The Witcher, #2)',13,'Paperback',16.99,'2013','Orbit','Fiction','English'),(9780316219181,'Baptism of Fire (The Witcher, #3)',13,'Paperback',16.99,'2014','Orbit','Fiction','English'),(9780316273718,'The Tower of Swallows (The Witcher, #4)',13,'Paperback',16.99,'2016','Orbit','Fiction','English'),(9780316273831,'The Lady of the Lake (The Witcher, #5)',13,'Paperback',16.99,'2017','Orbit','Fiction','English'),(9780316389709,'Sword of Destiny (The Witcher, #0.7)',13,'Paperback',16.99,'2015','Orbit','Fiction','English'),(9780316441629,'Season of Storms (The Witcher, #6)',13,'Paperback',16.99,'2018','Orbit','Fiction','English'),(9780345481283,'His Majesty\'s Dragon (Temeraire, #1)',7,'Mass Market Paperbound',7.99,'2006','Del Rey','Fiction','English'),(9780345481290,'Throne of Jade (Temeraire, #2)',7,'Mass Market Paperbound',7.99,'2006','Del Rey','Fiction','English'),(9780345481306,'Black Powder War (Temeraire, #3)',7,'Mass Market Paperbound',7.99,'2006','Del Rey','Fiction','English'),(9780380789023,'Smoke and Mirrors',2,'Mass Market Paperbound',7.99,'2009','HarperCollins','Fiction','English'),(9780393356182,'Norse Mythology',2,'Paperback',15.95,'2018','W. W. Norton & Company','Fiction','English'),(9780399180996,'Spinning Silver',7,'Kindle Edition',17,'2018','Del Rey','Fiction','English'),(9780399590504,'Educated',10,'Hardcover',28,'2018','Random House','Non-Fiction','English'),(9780525515029,'Small Spaces (Small Spaces, #1)',8,'Hardcover',16.99,'2018','G.P. Putnam\'s Sons Books for Young Readers','Fiction','English'),(9780525620785,'Mexican Gothic',12,'Hardcover',27,'2020','Del Rey','Fiction','English'),(9780593128480,'A Deadly Education (The Scholomance, #1)',7,'Hardcover',28,'2020','Del Rey','Fiction','English'),(9780593128862,'The Last Graduate (The Scholomance, #2)',7,'Hardcover',28,'2021','Del Rey','Fiction','English'),(9780763660659,'A Monster Calls',5,'Paperback',12,'2011','Candlewick','Fiction','English'),(9780804179058,'Uprooted',7,'Paperback',17,'2015','Del Rey','Fiction','English'),(9781101885956,'The Bear and the Nightingale (Winternight Trilogy, #1)',8,'Paperback',17,'2017','Del Rey','Fiction','English'),(9781101885987,'The Girl in the Tower (Winternight Trilogy, #2)',8,'Paperback',17,'2017','Del Rey','Fiction','English'),(9781101886014,'The Winter of the Witch (Winternight Trilogy, #3)',8,'Paperback',17,'2019','Del Rey','Fiction','English'),(9781101971383,'The Starless Sea',6,'Paperback',16.95,'2019','Doubleday','Fiction','English'),(9781421501758,'Fullmetal Alchemist, Vol. 5 (Fullmetal Alchemist, #5)',3,'Paperback',9.99,'2006','VIZ Media LLC','Fiction','English'),(9781421503196,'Fullmetal Alchemist, Vol. 6 (Fullmetal Alchemist, #6)',3,'Paperback',9.99,'2005','VIZ Media LLC','Fiction','English'),(9781421504582,'Fullmetal Alchemist, Vol. 7 (Fullmetal Alchemist, #7)',3,'Paperback',9.99,'2006','VIZ Media LLC','Fiction','English'),(9781421504599,'Fullmetal Alchemist, Vol. 8 (Fullmetal Alchemist, #8)',3,'Paperback',9.99,'2006','VIZ Media LLC','Fiction','English'),(9781421504605,'Fullmetal Alchemist, Vol. 9 (Fullmetal Alchemist, #9)',3,'Paperback',9.99,'2006','VIZ Media LLC','Fiction','English'),(9781421504612,'Fullmetal Alchemist, Vol. 10 (Fullmetal Alchemist, #10)',3,'Paperback',9.99,'2006','VIZ Media LLC','Fiction','English'),(9781421508382,'Fullmetal Alchemist, Vol. 11 (Fullmetal Alchemist, #11)',3,'Paperback',9.99,'2006','VIZ Media LLC','Fiction','English'),(9781421508399,'Fullmetal Alchemist, Vol. 12 (Fullmetal Alchemist, #12)',3,'Paperback',9.99,'2007','VIZ Media LLC','Fiction','English'),(9781421511580,'Fullmetal Alchemist, Vol. 13 (Fullmetal Alchemist, #13)',3,'Paperback',9.99,'2007','VIZ Media LLC','Fiction','English'),(9781421513799,'Fullmetal Alchemist, Vol. 14 (Fullmetal Alchemist, #14)',3,'Paperback',9.99,'2007','VIZ Media LLC','Fiction','English'),(9781421513805,'Fullmetal Alchemist, Vol. 15 (Fullmetal Alchemist, #15)',3,'Paperback',9.99,'2008','VIZ Media LLC','Fiction','English'),(9781421513812,'Fullmetal Alchemist, Vol. 16 (Fullmetal Alchemist, #16)',3,'Paperback',9.99,'2007','VIZ Media LLC','Fiction','English'),(9781421521619,'Fullmetal Alchemist, Vol. 17 (Fullmetal Alchemist, #17)',3,'Paperback',9.99,'2009','VIZ Media LLC','Fiction','English'),(9781421525365,'Fullmetal Alchemist, Vol. 18 (Fullmetal Alchemist, #18)',3,'Paperback',9.99,'2007','VIZ Media LLC','Fiction','English'),(9781421525686,'Fullmetal Alchemist, Vol. 19 (Fullmetal Alchemist, #19)',3,'Paperback',9.99,'2009','VIZ Media LLC','Fiction','English'),(9781421530345,'Fullmetal Alchemist, Vol. 20 (Fullmetal Alchemist, #20)',3,'Paperback',9.99,'2008','VIZ Media LLC','Fiction','English'),(9781421532325,'Fullmetal Alchemist, Vol. 21 (Fullmetal Alchemist, #21)',3,'Paperback',9.99,'2009','VIZ Media LLC','Fiction','English'),(9781421534138,'Fullmetal Alchemist, Vol. 22 (Fullmetal Alchemist, #22)',3,'Paperback',9.99,'2010','VIZ Media LLC','Fiction','English'),(9781421536309,'Fullmetal Alchemist, Vol. 23 (Fullmetal Alchemist, #23)',3,'Paperback',9.99,'2010','VIZ Media LLC','Fiction','English'),(9781421538129,'Fullmetal Alchemist, Vol. 24 (Fullmetal Alchemist, #24)',3,'Paperback',9.99,'2011','VIZ Media LLC','Fiction','English'),(9781421539249,'Fullmetal Alchemist, Vol. 25 (Fullmetal Alchemist, #25)',3,'Paperback',9.99,'2011','VIZ Media LLC','Fiction','English'),(9781421539621,'Fullmetal Alchemist, Vol. 26 (Fullmetal Alchemist, #26)',3,'Paperback',9.99,'2011','VIZ Media LLC','Fiction','English'),(9781421539843,'Fullmetal Alchemist, Vol. 27 (Fullmetal Alchemist, #27)',3,'Paperback',9.99,'2011','VIZ Media LLC','Fiction','English'),(9781452167657,'Be Everything at Once: Tales of a Cartoonist Lady Person',11,'Paperback',9.99,'2018','Chronicle Books LLC','Biography','English'),(9781481497589,'An Enchantment of Ravens',9,'Hardcover',19.99,'2017','Margaret K. McElderry Books','Fiction','English'),(9781481497619,'Sorcery of Thorns',9,'Hardcover',17.99,'2019','Margaret K. McElderry Books','Fiction','English'),(9781591169208,'Fullmetal Alchemist, Vol. 1 (Fullmetal Alchemist, #1)',3,'Paperback',9.99,'2005','VIZ Media LLC','Fiction','English'),(9781591169239,'Fullmetal Alchemist, Vol. 2 (Fullmetal Alchemist, #2)',3,'Paperback',9.99,'2005','VIZ Media LLC','Fiction','English'),(9781591169253,'Fullmetal Alchemist, Vol. 3 (Fullmetal Alchemist, #3)',3,'Paperback',9.99,'2005','VIZ Media LLC','Fiction','English'),(9781591169291,'Fullmetal Alchemist, Vol. 4 (Fullmetal Alchemist, #4)',3,'Paperback',9.99,'2011','VIZ Media LLC','Fiction','English'),(9781977313102,'Quackery: A Brief History of the Worst Ways to Cure Everything',15,'Compact Disc',42.99,'2017','Workman Publishing Company','Non-Fiction','English');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book_copies`
--

LOCK TABLES `book_copies` WRITE;
/*!40000 ALTER TABLE `book_copies` DISABLE KEYS */;
INSERT INTO `book_copies` VALUES (1,9781421525686,1,2),(2,9780316273831,1,1),(3,9781481497589,1,1),(4,9780062976581,1,2),(5,9780141439518,1,2),(6,9780062262264,1,2),(7,9781421534138,1,1),(8,9781452167657,1,2),(9,9780316219181,1,2),(10,9781421539843,1,1),(11,9780061478789,1,3),(12,9780061477973,1,2),(13,9780399590504,1,2),(14,9781977313102,1,3),(15,9780307744432,1,1),(16,9781421538129,1,2),(17,9780804179058,1,3),(18,9780316273718,1,3),(19,9781421513799,1,3),(20,9780345481283,1,3),(21,9780593128862,1,3),(22,9780062075130,1,3),(23,9781421539621,1,3),(24,9781421501758,1,1),(25,9780316219136,1,2),(26,9781101885987,1,1),(27,9780316029193,1,3),(28,9781421525365,1,2),(29,9780316441629,1,3),(30,9781421504582,1,1),(31,9780393356182,1,1),(32,9780062330260,1,3),(33,9780307908278,1,2),(34,9781421508399,1,3),(35,9781101885956,1,1),(36,9781421513812,1,2),(37,9781591169239,1,2),(38,9781481497619,1,2),(39,9781591169291,1,3),(40,9780763660659,1,3),(41,9780593128480,1,1),(42,9781421504612,1,1),(43,9780063081918,1,1),(44,9781591169253,1,2),(45,9780525515029,1,2),(46,9780316389709,1,2),(47,9780525620785,1,3),(48,9780380789023,1,2),(49,9781591169208,1,2),(50,9781101971383,1,3),(51,9780062224088,1,3),(52,9780345481290,1,2),(53,9781421504605,1,3),(54,9781101886014,1,2),(55,9781421530345,1,3),(56,9781421508382,1,1),(57,9781421521619,0,2),(58,9780345481306,1,3),(59,9780062564337,1,1),(60,9780060530945,1,3),(61,9780063070707,1,3),(62,9780399180996,1,1),(63,9781421503196,1,1),(64,9780061478772,1,1),(65,9781421511580,1,3),(66,9781421513805,1,1),(67,9781421536309,1,3),(68,9781421532325,1,2),(69,9781421504599,1,3),(70,9780063070721,1,2),(71,9780007106530,1,2),(72,9780142420140,1,1),(73,9780316029186,1,3),(74,9781421539249,1,3),(75,9781421525686,1,3),(76,9780316273831,1,1),(77,9781481497589,1,2),(78,9780062976581,1,3),(79,9780141439518,1,3),(80,9780062262264,1,2),(81,9781421534138,1,1),(82,9781452167657,1,1),(83,9780316219181,1,2),(84,9781421539843,1,3),(85,9780061478789,1,1),(86,9780061477973,1,3),(87,9780399590504,1,1),(88,9781977313102,1,3),(89,9780307744432,1,1),(90,9781421538129,1,1),(91,9780804179058,1,1),(92,9780316273718,1,3),(93,9781421513799,1,2),(94,9780345481283,1,3),(95,9780399180996,1,2),(96,9781421503196,1,3),(97,9780061478772,1,3),(98,9781421511580,1,3),(99,9781421513805,1,1),(100,9781421536309,1,1),(101,9781421532325,1,2),(102,9781421504599,1,1),(103,9780063070721,1,1),(104,9780007106530,1,3),(105,9780142420140,1,2),(106,9780316029186,1,1),(107,9781421539249,1,1),(108,9780316441629,1,1),(109,9781421504582,1,1),(110,9780393356182,1,2),(111,9780062330260,1,3),(112,9780307908278,1,3),(113,9781421508399,1,3),(114,9781101885956,1,1),(115,9781421513812,1,2),(116,9781591169239,1,2),(117,9781481497619,1,2),(118,9781591169291,1,1),(119,9780763660659,1,3),(120,9780593128480,1,1),(121,9781421504612,1,2),(122,9780063081918,1,3),(123,9781591169253,1,3),(124,9780525515029,1,1),(125,9780316389709,1,2),(126,9780525620785,1,2),(127,9780380789023,1,2),(128,9781591169208,1,1),(129,9781101971383,1,1),(130,9780062224088,1,3),(131,9780345481290,1,1),(132,9781421504605,1,3),(133,9781101886014,1,3),(134,9781421530345,1,2),(135,9781421508382,1,2),(136,9781421521619,1,2),(137,9780345481306,1,1),(138,9780062564337,1,3),(139,9780060530945,1,3),(140,9780063070707,1,2),(141,9780399180996,1,2),(142,9781421503196,1,1),(143,9780061478772,1,1),(144,9781421511580,1,2),(145,9781421513805,1,3),(146,9781421536309,1,1),(147,9781421532325,1,1),(148,9781421504599,1,2),(149,9780063070721,1,3),(150,9780007106530,1,1),(151,9780142420140,1,1),(152,9780316029186,1,2),(153,9781421539249,1,1),(154,9781421525686,1,3),(155,9780316273831,1,1),(156,9781481497589,1,3),(157,9780062976581,1,2),(158,9780141439518,1,1),(159,9780062262264,1,1),(160,9781421534138,1,2),(161,9781452167657,1,3),(162,9780316219181,1,3),(163,9781421539843,1,2),(164,9780061478789,1,2),(165,9780061477973,1,3);
/*!40000 ALTER TABLE `book_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book_record`
--

LOCK TABLES `book_record` WRITE;
/*!40000 ALTER TABLE `book_record` DISABLE KEYS */;
INSERT INTO `book_record` VALUES (1,10,91,'2021-03-01','2021-04-13','2021-03-20','Excellent'),(2,10,2,'2021-03-11','2021-04-01','2021-03-20','Excellent'),(3,10,6,'2021-03-15','2021-04-05','2021-03-20','Excellent'),(4,23,46,'2021-04-03','2021-04-24','2021-05-23','Excellent'),(5,15,2,'2021-04-08','2021-04-29','2021-05-23','Fair'),(6,12,43,'2021-04-21','2021-05-12','2021-05-23','Excellent'),(7,23,70,'2021-05-05','2021-05-26','2021-05-23','Fair'),(8,10,66,'2021-05-19','2021-06-09','2021-05-23','Excellent'),(9,10,101,'2021-05-02','2021-05-23','2021-05-23','Excellent'),(10,14,57,'2021-03-02','2021-03-23',NULL,'Excellent');
/*!40000 ALTER TABLE `book_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `checked_out`
--

LOCK TABLES `checked_out` WRITE;
/*!40000 ALTER TABLE `checked_out` DISABLE KEYS */;
INSERT INTO `checked_out` VALUES (10,14,9781421521619,57,'2021-03-02','2021-04-13',0);
/*!40000 ALTER TABLE `checked_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cus_record`
--

LOCK TABLES `cus_record` WRITE;
/*!40000 ALTER TABLE `cus_record` DISABLE KEYS */;
INSERT INTO `cus_record` VALUES (1,10,9780804179058,91,'2021-03-01','2021-03-22','2021-03-20','Excellent',0),(2,10,9780316273831,2,'2021-03-11','2021-04-01','2021-03-20','Excellent',0),(3,10,9780062262264,6,'2021-03-15','2021-04-05','2021-03-20','Excellent',0),(4,23,9780316389709,46,'2021-04-03','2021-05-15','2021-05-23','Excellent',0.8),(5,15,9780316273831,2,'2021-04-08','2021-05-20','2021-05-23','Fair',0.3),(6,12,9780063081918,43,'2021-04-21','2021-06-02','2021-05-23','Excellent',0),(7,23,9780063070721,70,'2021-05-05','2021-05-26','2021-05-23','Fair',0),(8,10,9781421513805,66,'2021-05-19','2021-06-09','2021-05-23','Excellent',0),(9,10,9781421532325,101,'2021-05-02','2021-05-23','2021-05-23','Excellent',0),(10,14,9781421521619,57,'2021-03-02','2021-04-13',NULL,'Excellent',4);
/*!40000 ALTER TABLE `cus_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fee`
--

LOCK TABLES `fee` WRITE;
/*!40000 ALTER TABLE `fee` DISABLE KEYS */;
INSERT INTO `fee` VALUES (1,23,9780316389709,46,'2021-04-03','2021-05-15',0.8),(2,15,9780316273831,2,'2021-04-08','2021-05-20',0.3),(3,14,9781421521619,57,'2021-03-02','2021-04-13',4);
/*!40000 ALTER TABLE `fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hold`
--

LOCK TABLES `hold` WRITE;
/*!40000 ALTER TABLE `hold` DISABLE KEYS */;
INSERT INTO `hold` VALUES (9,9780062262264,159,'2021-05-23 16:17:27',1),(11,9780316273831,76,'2021-05-23 16:17:27',1),(13,9780316273831,155,'2021-05-23 16:17:27',1),(40,9780062262264,6,'2021-05-14 13:17:59',1);
/*!40000 ALTER TABLE `hold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (1,'Central Library','34 Main St','Camarillo','CA','93010'),(2,'Anacapa Library','193 W Pine Ln','Camarillo','CA','93011'),(3,'Santa Rosa Library','11 Mariposa Ave','Camarillo','CA','93012');
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `overdue_book`
--

LOCK TABLES `overdue_book` WRITE;
/*!40000 ALTER TABLE `overdue_book` DISABLE KEYS */;
INSERT INTO `overdue_book` VALUES (3,14,9781421521619,57,'2021-03-02','2021-04-13',0);
/*!40000 ALTER TABLE `overdue_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `patron`
--

LOCK TABLES `patron` WRITE;
/*!40000 ALTER TABLE `patron` DISABLE KEYS */;
INSERT INTO `patron` VALUES (1,'Darrin','Rodriguez','1994-12-29','973 Augusta Ave. Apt 39','Sandusky','OH','44870','3914507206','snunez@outlook.com',0,NULL,0,NULL),(2,'Val','Bover','1977-07-04','640 Monroe St.','Hummelstown','PA','17036','2123299864','doche@verizon.net',0,NULL,0,NULL),(3,'Edward','May','1984-12-29','391 East Virginia Ave.','Laurel','MD','20707','6588388960','mddallara@att.net',0,NULL,0,NULL),(4,'Krista','Gregory','1977-09-10','573 Longbranch St.','Rosedale','NY','11422','5327819131','bancboy@me.com',0,NULL,0,NULL),(5,'Courtney','Copeland','2003-08-18','7747 East Glendale St.','Lake Jackson','TX','77566','4499790413','marnanel@verizon.net',0,NULL,0,NULL),(6,'Larry','Flowers','2013-02-26','98 Atlantic Ave.','Appleton','WI','54911','4493507827','mhassel@yahoo.com',0,NULL,0,NULL),(7,'Amy','Bates','2010-01-12','72 Plumb Branch Court','Port Orange','FL','32127','2625990883','sagal@outlook.com',0,NULL,0,NULL),(8,'Annette','Rose','1990-06-07','567 Jockey Hollow Street','Collierville','TN','38017','6534689146','balchen@sbcglobal.net',0,NULL,0,NULL),(9,'Nadine','Brady','1992-11-09','636 South Nicolls Street','Sterling Heights','MI','48310','8876914790','preneel@live.com',0,NULL,0,NULL),(10,'Margarita','Townsend','2008-11-30','833 Greenrose Dr.','Princeton','NJ','8540','8745262723','houle@comcast.net',0,NULL,0,NULL),(11,'Cecil','Horton','1987-12-28','6 Harrison St.','Valrico','FL','33594','9139583232','sagal@outlook.com',0,NULL,0,NULL),(12,'Philip','Gill','1999-07-08','46 Smoky Hollow Lane','Davenport','IA','52804','9769010710','rhavyn@live.com',0,NULL,0,NULL),(13,'Marilyn','Delgado','1981-06-14','7609 O\'Dwyer Cir.','Cheney','KS','67025','7294005195','attwood@mac.com',0,NULL,0,NULL),(14,'Carlton','Phelps','2011-08-07','858 Pendleton Circle','Mc Allister','MT','59740','8369361637','daveed@comcast.net',0,NULL,0,NULL),(15,'Tabitha','Lynch','1986-11-19','3888 Rosebud Ln.','Illinois City','IL','61259','7265522636','ebassi@aol.com',0,NULL,0,NULL),(16,'Henrietta','Figueroa','1988-10-24','6297 Alder Way','Edgerton','WY','82635','4982383848','jonas@me.com',0,NULL,0,NULL),(17,'Leah','Ferguson','1982-04-13','7732 Gibbons Ln.','Fort Rock','OR','97735','6027838600','linuxhack@sbcglobal.net',0,NULL,0,NULL),(18,'Eva','Reynolds','1999-03-21','3997 Church Rd.','New Salem','ND','58563','3907880614','ngedmond@comcast.net',0,NULL,0,NULL),(19,'Adrian','Mccoy','1971-01-12','9239 Lambert Street','Comstock','NY','12821','7692329184','agolomsh@aol.com',0,NULL,0,NULL),(20,'Diana','Beck','1954-01-11','2576 River City Trl.','Atlanta','NY','14808','4149888510','noahb@msn.com',0,NULL,0,NULL),(21,'Jessica','Swanson','2012-02-15','6557 Starlight Boulevard','Grandville','MI','49468','2169705736','temmink@msn.com',0,NULL,0,NULL),(22,'Ellen','Hughes','1984-09-18','9765 East Summer Way','Richmond','VA','23221','2023487441','vlefevre@me.com',0,NULL,0,NULL),(23,'Shari','Ballard','1987-04-15','3714 Glenwood Cir','Charlotte','NC','28202','9445706311','janneh@hotmail.com',0,NULL,0,NULL),(24,'Dominic','Garrett','1988-12-04','9105 Greenwood Boulevard','Mount Berry','GA','30149','3376325297','yzheng@yahoo.com',0,NULL,0,NULL),(25,'Guadalupe','Harrington','1995-01-02','2589 Upland Rd.','Hobbs','NM','88242','9896841909','hllam@outlook.com',0,NULL,0,NULL),(26,'Caroline','Conner','1981-11-14','1366 Rider St','Lockport','KY','40036','3916737004','jbarta@comcast.net',0,NULL,0,NULL),(27,'Essie','Marshall','2010-07-22','4447 Willow Way','Akron','MI','48701','5486511867','qrczak@me.com',0,NULL,0,NULL),(28,'Ted','Barber','1991-10-24','5364 Walton Turnpike','North Bergen','NJ','7047','7874367544','animats@optonline.net',0,NULL,0,NULL),(29,'Jack','Padilla','1995-07-29','7047 Hardy Rd','Honolulu','HI','96805','8656624553','janusfury@yahoo.ca',0,NULL,0,NULL),(30,'Monique','Hogan','2010-08-11','5622 Outback Turnpike','Kimball','SD','57355','4483240655','shaffei@outlook.com',0,NULL,0,NULL),(31,'Rebecca','Mitchell','1991-01-02','881 Atlantic Road','Copalis Beach','WA','98535','4057800535','brickbat@me.com',0,NULL,0,NULL),(32,'Gertrude','Dunn','2003-11-11','6121 Tardiff Trail','Bellflower','CA','90707','3908597128','quantaman@icloud.com',0,NULL,0,NULL),(33,'Guillermo','George','2010-12-16','2554 Stevens Dr.','San Jose','CA','95120','6203828581','juliano@icloud.com',0,NULL,0,NULL),(34,'Aubrey','Schneider','1984-12-28','1610 Buckling Cir.','Hamilton','NC','27840','3408809823','mmccool@sbcglobal.net',0,NULL,0,NULL),(35,'Andre','Strickland','1957-12-28','5914 Liberty Boulevard','Sacramento','CA','94262','8837150320','multiplx@outlook.com',0,NULL,0,NULL),(36,'Derek','Houston','1986-09-26','1071 Carroll Street','Castroville','TX','78009','4433275200','warrior@att.net',0,NULL,0,NULL),(37,'Kristina','Nguyen','1997-04-30','9922 Eagle Ridge Blvd.','North Las Vegas','NV','89033','5904286294','mallanmba@mac.com',0,NULL,0,NULL),(38,'Anita','Gomez','1994-09-09','5971 Foley St','Beetown','WI','53802','8366260563','brickbat@optonline.net',0,NULL,0,NULL),(39,'Cristina','Payne','1955-09-29','9327 North Trl.','Pennsville','NJ','8070','5447429699','wainwrig@verizon.net',0,NULL,0,NULL),(40,'Sheri','Mcguire','1981-11-16','3047 Goodness Blvd.','Sacramento','CA','95818','2792970409','mnemonic@msn.com',0,NULL,0,NULL),(41,'Blanca','Campbell','1991-03-28','9232 Allen Street','Tucson','AZ','85704','2305302393','bcampbell@gmail.com',0,NULL,0,NULL);
/*!40000 ALTER TABLE `patron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Robert','Herzog','librarian','1985-10-02','31 Silver Spear St.','Stratford','CT','6614'),(2,'Sondra','Babineaux','librarian','2001-04-30','84 S. El Dorado St.','Westmont','IL','60559'),(3,'Devi','Laine','volunteer','1994-08-17','358 Pawnee St.','Westminster','MD','21157'),(4,'Tom','Rojo','volunteer','1997-05-14','14 Main Lane','Park Forest','IL','60466'),(5,'Eshe','Merckx','librarian','1963-12-26','56 Mammoth St.','Yuba City','CA','95993');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `waitlist`
--

LOCK TABLES `waitlist` WRITE;
/*!40000 ALTER TABLE `waitlist` DISABLE KEYS */;
INSERT INTO `waitlist` VALUES (3,9780316273831,'2021-05-14 11:30:10',1),(5,9780316273831,'2021-05-23 16:17:27',1),(14,9780316273831,'2021-05-01 17:21:30',1),(19,9780316273831,'2021-05-10 10:48:00',1),(24,9780062262264,'2021-05-23 20:12:02',1),(26,9780062262264,'2021-05-23 16:17:27',1),(28,9780316273831,'2021-05-10 10:08:00',1),(31,9780062262264,'2021-05-17 05:33:45',1),(34,9780316273831,'2021-05-08 19:00:00',1),(38,9780062262264,'2021-05-23 16:17:27',1);
/*!40000 ALTER TABLE `waitlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23 16:20:51
