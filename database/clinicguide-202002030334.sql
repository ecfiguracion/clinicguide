-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: clinicguide
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clinic`
--

DROP TABLE IF EXISTS `clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic` (
  `clinic` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `maplatitude` decimal(12,9) DEFAULT NULL,
  `maplongitude` decimal(12,9) DEFAULT NULL,
  `officehours` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`clinic`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic`
--

LOCK TABLES `clinic` WRITE;
/*!40000 ALTER TABLE `clinic` DISABLE KEYS */;
INSERT INTO `clinic` VALUES (1,'Sacred Heart Clinic','114 Peñaranda St., Legazpi City',13.149717000,123.753085000,'MON,WED, FRI : 4:00-6:00, SAT: 8:00-12:00',1,'clinic1.jpg'),(2,'Washington Medical Clinic','Capt. Aquende St., Legazpi City',13.141017000,123.734464300,'MON to SAT: 8:00AM to 5PM',1,'clinic2.jpg'),(3,'Polymedica Clinic','Bonot, Legazpi City',13.299181000,123.790125100,'TUE & THU: 9:00-10:00',2,NULL),(5,'Albay Medical Specialist Clinic','Legazpi, Old Albay District, Legazpi City, Albay',13.138844000,123.737261000,'MON, TUE, FRI:  8:00AM to 5PM',2,'clinic4.jpg'),(6,'Bethany Clinic','1 First Park, Daraga, Albay',13.146169000,123.720006000,'MON to SAT: 8:00AM to 5PM',2,'clinic5.jpg'),(7,'Servants of Jesus Charity Clinic','Aeroville Court, Legazpi City',13.143932000,123.730212000,'MON, TUE, FRI & SAT: 8:00AM to 5PM',3,NULL);
/*!40000 ALTER TABLE `clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinicdoctor`
--

DROP TABLE IF EXISTS `clinicdoctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinicdoctor` (
  `clinicdoctor` int(11) NOT NULL AUTO_INCREMENT,
  `doctor` varchar(100) NOT NULL,
  `schedule` varchar(1000) DEFAULT NULL,
  `clinic` int(11) NOT NULL,
  PRIMARY KEY (`clinicdoctor`),
  KEY `clinicdoctor_fk` (`clinic`),
  CONSTRAINT `clinicdoctor_fk` FOREIGN KEY (`clinic`) REFERENCES `clinic` (`clinic`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinicdoctor`
--

LOCK TABLES `clinicdoctor` WRITE;
/*!40000 ALTER TABLE `clinicdoctor` DISABLE KEYS */;
INSERT INTO `clinicdoctor` VALUES (1,'1','8:00AM - 5:00PM',1),(2,'2','8:00AM - 5:00PM',1),(3,'3','8:00AM - 5:00PM',1),(4,'4','8:00AM - 5:00PM',1),(5,'5','8:00AM - 5:00PM',1),(6,'2','8:00AM - 5:00PM',2),(7,'3','8:00AM - 5:00PM',2),(8,'4','8:00AM - 5:00PM',2);
/*!40000 ALTER TABLE `clinicdoctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinicservices`
--

DROP TABLE IF EXISTS `clinicservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinicservices` (
  `clinicservices` int(11) NOT NULL AUTO_INCREMENT,
  `clinic` int(11) NOT NULL,
  `servicetype` int(11) NOT NULL,
  PRIMARY KEY (`clinicservices`),
  KEY `clinicservices_fk` (`clinic`),
  CONSTRAINT `clinicservices_fk` FOREIGN KEY (`clinic`) REFERENCES `clinic` (`clinic`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinicservices`
--

LOCK TABLES `clinicservices` WRITE;
/*!40000 ALTER TABLE `clinicservices` DISABLE KEYS */;
INSERT INTO `clinicservices` VALUES (1,1,2),(2,1,6),(3,1,7),(4,2,2),(5,2,6),(6,3,4),(7,3,5),(8,5,1),(9,5,6),(10,5,7),(11,6,1),(12,7,1),(13,7,6),(14,7,7);
/*!40000 ALTER TABLE `clinicservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `specialization` varchar(1000) NOT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`doctor`),
  CONSTRAINT `doctor_fk` FOREIGN KEY (`doctor`) REFERENCES `clinicdoctor` (`clinicdoctor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Ben Skywalker','Pediatrician','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','avatar-ben.png'),(2,'Finn Xo','Pediatrician','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','avatar-finn.png'),(3,'Han Solo','Internal Medicine','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','avatar-han.png'),(4,'Princes Leila','Radiologist','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','avatar-leia.png'),(5,'Luke Skywalker','General Surgeon','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','avatar-luke.png');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicetype`
--

DROP TABLE IF EXISTS `servicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicetype` (
  `servicetype` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`servicetype`),
  CONSTRAINT `servicetype_fk` FOREIGN KEY (`servicetype`) REFERENCES `clinicservices` (`clinicservices`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicetype`
--

LOCK TABLES `servicetype` WRITE;
/*!40000 ALTER TABLE `servicetype` DISABLE KEYS */;
INSERT INTO `servicetype` VALUES (1,'Dental'),(2,'Prenatal'),(3,'Mental'),(4,'Skin Care'),(5,'Beauty Care'),(6,'Obygnie'),(7,'General');
/*!40000 ALTER TABLE `servicetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useraccount` (
  `useraccount` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `isadmin` tinyint(1) NOT NULL,
  `clinic` int(11) DEFAULT NULL,
  PRIMARY KEY (`useraccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'clinicguide'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-03  3:34:34
