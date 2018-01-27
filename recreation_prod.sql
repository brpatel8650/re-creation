-- MySQL dump 10.13  Distrib 5.7.10, for Win32 (AMD64)
--
-- Host: localhost    Database: recreation
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role`
--

LOCK TABLES `admin_role` WRITE;
/*!40000 ALTER TABLE `admin_role` DISABLE KEYS */;
INSERT INTO `admin_role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_active` bit(1) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1vcrxs1ndfa6rvkhh1vp3cb14` (`created_by`),
  CONSTRAINT `FK1vcrxs1ndfa6rvkhh1vp3cb14` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'GRP0000001','2017-11-16 14:56:45','','Personal Expenses',2),(2,'GRP0000002','2018-01-15 13:25:04','','Kunj Services',2),(3,'GRP0000003','2018-01-26 22:52:21','','Personal',3);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_balance_sheet`
--

DROP TABLE IF EXISTS `group_balance_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_balance_sheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(8,2) NOT NULL,
  `credited_on` datetime NOT NULL,
  `remarks` varchar(150) DEFAULT NULL,
  `user_group_mapping_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1kn3lgnr8wvyjuilltxhu4fhw` (`user_group_mapping_id`),
  CONSTRAINT `FK1kn3lgnr8wvyjuilltxhu4fhw` FOREIGN KEY (`user_group_mapping_id`) REFERENCES `user_group_mapping` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_balance_sheet`
--

LOCK TABLES `group_balance_sheet` WRITE;
/*!40000 ALTER TABLE `group_balance_sheet` DISABLE KEYS */;
INSERT INTO `group_balance_sheet` VALUES (1,100.00,'2018-01-18 22:39:23','Credited by Bhavesh Patel',2);
/*!40000 ALTER TABLE `group_balance_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_expense`
--

DROP TABLE IF EXISTS `group_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(8,2) NOT NULL,
  `description` varchar(150) NOT NULL,
  `expensed_on` datetime NOT NULL,
  `user_group_mapping_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoja7imqecf1xx6wjrst8u2v6m` (`user_group_mapping_id`),
  CONSTRAINT `FKoja7imqecf1xx6wjrst8u2v6m` FOREIGN KEY (`user_group_mapping_id`) REFERENCES `user_group_mapping` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_expense`
--

LOCK TABLES `group_expense` WRITE;
/*!40000 ALTER TABLE `group_expense` DISABLE KEYS */;
INSERT INTO `group_expense` VALUES (1,50.00,'Lunch','2018-01-07 13:31:27',1),(2,25.00,'Vadapav','2018-01-07 13:31:27',1),(3,60.00,'Sandwich','2018-01-07 13:31:27',1),(4,20.00,'Jamfal','2018-01-17 10:13:23',2),(5,15.00,'Vadapav','2018-01-17 10:18:01',2);
/*!40000 ALTER TABLE `group_expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_balance_sheet`
--

DROP TABLE IF EXISTS `personal_balance_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_balance_sheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(8,0) NOT NULL,
  `credited_on` datetime NOT NULL,
  `remarks` varchar(150) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK92p12tgmeluyoib58mb008tev` (`user_id`),
  CONSTRAINT `FK92p12tgmeluyoib58mb008tev` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_balance_sheet`
--

LOCK TABLES `personal_balance_sheet` WRITE;
/*!40000 ALTER TABLE `personal_balance_sheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_balance_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_expense`
--

DROP TABLE IF EXISTS `personal_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(8,0) NOT NULL,
  `description` varchar(150) NOT NULL,
  `expensed_on` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfiqfurdle9mm3stpkwyv2awo5` (`user_id`),
  CONSTRAINT `FKfiqfurdle9mm3stpkwyv2awo5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_expense`
--

LOCK TABLES `personal_expense` WRITE;
/*!40000 ALTER TABLE `personal_expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `email_id` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin_role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnxppvtnqxfeu4r8kwb2wttcgj` (`admin_role_id`),
  CONSTRAINT `FKnxppvtnqxfeu4r8kwb2wttcgj` FOREIGN KEY (`admin_role_id`) REFERENCES `admin_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'USR0001','bhavesh@gmail.com','Bhavesh','Patel','PoulHxPSKQZdlgqvXiGHkpKdLKSjzZyham53rSevDcrGUu+JNstpyjurCbUDNldc',1),(2,'USR0002','bhaveshpatel2767@gmail.com','Bhavesh','Patel','sHdnZElqAf9dvxqhCWCD+XkvhNkht5deQqSvBIiF/JNg8Nq1fXi63DvtYdpRghxS',2),(3,'USR0000003','nidhi@gmail.com','nidhi','naik','OkcyfIvBkxbB4UD9qFhEh5pW9Ia/G7UxntPvTanhbzlDB/gdGPaZAz0Md5aShzbY',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_mapping`
--

DROP TABLE IF EXISTS `user_group_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` decimal(8,2) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `is_admin` bit(1) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKon7mp77kupgqif36vnoftm65l` (`group_id`),
  KEY `FKbbkr0tkh1eecp8vicelfbuvqw` (`user_id`),
  CONSTRAINT `FKbbkr0tkh1eecp8vicelfbuvqw` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKon7mp77kupgqif36vnoftm65l` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_mapping`
--

LOCK TABLES `user_group_mapping` WRITE;
/*!40000 ALTER TABLE `user_group_mapping` DISABLE KEYS */;
INSERT INTO `user_group_mapping` VALUES (1,0.00,'','',1,2),(2,65.00,'','',2,2),(3,0.00,'','\0',2,1),(4,0.00,'','',3,3);
/*!40000 ALTER TABLE `user_group_mapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-27 10:32:03
