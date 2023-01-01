-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: denzee
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `denzee`
--

DROP TABLE IF EXISTS `denzee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `denzee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datetime` timestamp NULL DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `flowId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_list` (`flowId`),
  KEY `userId` (`userId`),
  CONSTRAINT `denzee_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `denzee_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `fk_list` FOREIGN KEY (`flowId`) REFERENCES `workflowlist` (`flowId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denzee`
--

LOCK TABLES `denzee` WRITE;
/*!40000 ALTER TABLE `denzee` DISABLE KEYS */;
/*!40000 ALTER TABLE `denzee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medium`
--

DROP TABLE IF EXISTS `medium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medium` (
  `mediumId` int NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL,
  PRIMARY KEY (`mediumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medium`
--

LOCK TABLES `medium` WRITE;
/*!40000 ALTER TABLE `medium` DISABLE KEYS */;
/*!40000 ALTER TABLE `medium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `messageId` int NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Tarak','Das'),(2,'Tharun','V'),(3,'Chitransu','Wagh'),(4,'Anuroop','L Sabu'),(5,'Aman','Kumar'),(6,'Jayanth','K'),(7,'Yatharth','IDK'),(8,'Harsh','Trivedi'),(9,'Aditya','Kovid'),(10,'Shaunak','Majumder'),(11,'Atharva','Khandave'),(12,'Rithik','Radhan'),(13,'Aman','Kulwal'),(14,'Dipak','Das'),(15,'Siddhant','Waghmare'),(16,'Tirth','Patel'),(17,'Siddharth','Chauhan'),(18,'Siddartha','Tarra'),(19,'Anmol','Panda'),(20,'Dhruv','Aggarwal'),(21,'Akshat','Kumar'),(22,'Aman','Singh'),(23,'Arijit','Singh'),(24,'Sonu','Nigam'),(25,'Sunidhi','Chauhan'),(26,'Jainav','IDK'),(27,'Akshay','Legend'),(28,'Sameer','Deshpande'),(29,'Rishit','Pullagura'),(30,'Anish','Singh');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow`
--

DROP TABLE IF EXISTS `workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow` (
  `workflowId` int NOT NULL AUTO_INCREMENT,
  `interval` int DEFAULT NULL,
  `messageId` int DEFAULT NULL,
  `mediumId` int DEFAULT NULL,
  PRIMARY KEY (`workflowId`),
  KEY `fk_message` (`messageId`),
  KEY `fk_medium` (`mediumId`),
  CONSTRAINT `fk_medium` FOREIGN KEY (`mediumId`) REFERENCES `medium` (`mediumId`) ON DELETE CASCADE,
  CONSTRAINT `fk_message` FOREIGN KEY (`messageId`) REFERENCES `message` (`messageId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow`
--

LOCK TABLES `workflow` WRITE;
/*!40000 ALTER TABLE `workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowlist`
--

DROP TABLE IF EXISTS `workflowlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflowlist` (
  `flowId` int NOT NULL AUTO_INCREMENT,
  `workflowId` int NOT NULL,
  PRIMARY KEY (`flowId`),
  KEY `fk_workflow` (`workflowId`),
  CONSTRAINT `fk_workflow` FOREIGN KEY (`workflowId`) REFERENCES `workflow` (`workflowId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowlist`
--

LOCK TABLES `workflowlist` WRITE;
/*!40000 ALTER TABLE `workflowlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflowlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-01 21:33:30
