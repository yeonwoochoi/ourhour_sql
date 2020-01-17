-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `auth_friend`
--

DROP TABLE IF EXISTS `auth_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_friend` (
  `user_index` int(11) NOT NULL,
  `friend_index` int(11) NOT NULL,
  `message` varchar(100) NOT NULL,
  PRIMARY KEY (`user_index`,`friend_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_friend`
--

LOCK TABLES `auth_friend` WRITE;
/*!40000 ALTER TABLE `auth_friend` DISABLE KEYS */;
INSERT INTO `auth_friend` VALUES (9,1,'testID01 sent you ( rud527 ) a friend request');
/*!40000 ALTER TABLE `auth_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend` (
  `user_index` int(100) NOT NULL,
  `friend_index` int(100) NOT NULL,
  PRIMARY KEY (`user_index`,`friend_index`),
  KEY `fk_Users_friends_User_idx` (`friend_index`),
  CONSTRAINT `fk_Users_friends_User1` FOREIGN KEY (`friend_index`) REFERENCES `user` (`user_index`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Users_friends_User2` FOREIGN KEY (`user_index`) REFERENCES `user` (`user_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` VALUES (1,2),(3,4),(2,5),(2,6),(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(2,8);
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_board`
--

DROP TABLE IF EXISTS `group_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_board` (
  `gb_index` int(11) NOT NULL,
  `gb_title` varchar(50) NOT NULL,
  `gb_content` varchar(1000) DEFAULT NULL,
  `gb_importance` tinyint(1) DEFAULT '0',
  `gb_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `gb_updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gb_author` varchar(45) NOT NULL,
  `group_index` int(11) NOT NULL,
  PRIMARY KEY (`gb_index`),
  KEY `fk_Group_board_Group1_idx` (`group_index`),
  CONSTRAINT `fk_Group_board_Group1` FOREIGN KEY (`group_index`) REFERENCES `group_table` (`gb_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_board`
--

LOCK TABLES `group_board` WRITE;
/*!40000 ALTER TABLE `group_board` DISABLE KEYS */;
INSERT INTO `group_board` VALUES (4,'title01','content01',NULL,'2019-09-27 00:00:00',NULL,'chlxodyd33',1),(5,'title02','content02',NULL,'2019-09-27 00:00:00',NULL,'rud527',1);
/*!40000 ALTER TABLE `group_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_table`
--

DROP TABLE IF EXISTS `group_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_table` (
  `gb_index` int(11) NOT NULL AUTO_INCREMENT,
  `gb_name` varchar(45) NOT NULL,
  `gb_start` varchar(45) DEFAULT NULL,
  `gb_end` varchar(45) DEFAULT NULL,
  `gb_access` tinyint(1) DEFAULT '0',
  `gb_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `gb_updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `owner_index` int(11) NOT NULL,
  PRIMARY KEY (`gb_index`,`gb_name`),
  UNIQUE KEY `group_name_UNIQUE` (`gb_name`),
  KEY `fk_Groups_User1_idx` (`owner_index`),
  CONSTRAINT `fk_Group_Table_Group1` FOREIGN KEY (`owner_index`) REFERENCES `user` (`user_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_table`
--

LOCK TABLES `group_table` WRITE;
/*!40000 ALTER TABLE `group_table` DISABLE KEYS */;
INSERT INTO `group_table` VALUES (1,'name01','2019-08-29',NULL,0,'2019-08-29 00:00:00',NULL,1),(2,'name02','2019-08-29',NULL,0,'2019-08-29 00:00:00',NULL,1),(3,'gbName01','2019-10-20 00:00:00','2019-12-12 23:59:59',0,'2020-01-06 06:55:10','2020-01-06 07:29:39',2),(4,'gbName03','2019-10-20 00:00:00','2019-12-12 23:59:59',0,'2020-01-06 07:30:51','2020-01-06 08:01:43',2),(5,'gbName06','2019-10-20 00:00:00','2019-12-12 23:59:59',0,'2020-01-06 07:30:58','2020-01-06 08:01:43',2),(6,'gbName09','2019-10-20 00:00:00','2019-12-12 23:59:59',0,'2020-01-06 07:44:48','2020-01-06 08:01:43',2),(7,'gbName02','2019-10-20 00:00:00','2019-12-12 23:59:59',0,'2020-01-06 07:46:44','2020-01-06 08:01:43',2),(8,'gbName04','2019-10-20 00:00:00','2019-12-12 23:59:59',0,'2020-01-06 08:01:43','2020-01-06 08:01:43',2),(9,'gbName05','2019-10-20 00:00:00','2019-12-12 23:59:59',0,'2020-01-06 08:03:16','2020-01-06 08:03:16',2),(10,'group01','2019-02-04 10:30:00','2019-08-15 12:30:00',1,'2020-01-07 13:56:43','2020-01-08 15:39:16',5),(37,'gbName07','2019-10-20 00:00:00','2019-12-12 23:59:59',1,'2020-01-10 22:20:52','2020-01-10 22:20:52',2);
/*!40000 ALTER TABLE `group_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `groupview`
--

DROP TABLE IF EXISTS `groupview`;
/*!50001 DROP VIEW IF EXISTS `groupview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `groupview` AS SELECT 
 1 AS `gb_index`,
 1 AS `gb_name`,
 1 AS `gb_start`,
 1 AS `gb_end`,
 1 AS `gb_access`,
 1 AS `owner_index`,
 1 AS `member_index`,
 1 AS `member_access`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `index` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`index`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('rud527','$2b$10$Sfb3mIt8zqq86ALxRgHW..huJgDOCY/.MXCw8Ji9CxxUPuMpn6pyW',1),('abc1','$2b$10$EDdmyVA0NuRAIgVUVeQ6uO6gKmM4sMGdrQqDb3dCBJmx4E/SxNnyO',2),('chldusdn20','$2b$10$jaL5dBpWeoYZBNwgTzGJxugKsxsCXoM.0Tp7e89ESHJsZs08gThr2',3),('tengo','$2b$10$IQQvCruOjiOtSVJX2mrCtunPCLGIHhAIal5b1ZWDbp/dvsyzAkR0q',4),('chltprud20','$2b$10$XsaOdtoT3J48MTT/r0k0huNo4sfSC1GUEiPTBfeDfSkJb/kLjXGpa',5),('tprud527','$2b$10$BJMA1xleACVrd8sECey1nu66J92B0TBqp1CLboPHoSZ0vhtf84gDu',6),('abcdefg1234','$2b$10$Um5lfpb3W0Tvm09noR/U9.mVauX/MpePxOyr4fykTB5ROrY9BdHYC',7),('testId','$2b$10$iyLGzOZkQIS5W67YGp73yOBtmAffAL.GEIiQSQUbSERBs37Gss.JK',8),('testID01','$2b$10$DWjouzD8TWiuV2YfstqJg.lP2Ycmzn8fOEbUpcwnJzOlROU40rnTu',9);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_table`
--

DROP TABLE IF EXISTS `member_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_table` (
  `member_index` int(11) NOT NULL,
  `member_access` tinyint(1) DEFAULT '0',
  `gb_index` int(11) NOT NULL,
  PRIMARY KEY (`gb_index`,`member_index`),
  KEY `fk_Group_members_Group1_idx` (`gb_index`),
  CONSTRAINT `fk_Group_members_groupcode` FOREIGN KEY (`gb_index`) REFERENCES `group_table` (`gb_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_table`
--

LOCK TABLES `member_table` WRITE;
/*!40000 ALTER TABLE `member_table` DISABLE KEYS */;
INSERT INTO `member_table` VALUES (1,1,1),(2,1,3),(6,0,3),(7,0,3),(9,0,3),(2,1,4),(2,1,5),(2,1,6),(2,1,7),(2,1,8),(2,1,9),(5,1,10),(1,1,37),(2,1,37);
/*!40000 ALTER TABLE `member_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `routine1view`
--

DROP TABLE IF EXISTS `routine1view`;
/*!50001 DROP VIEW IF EXISTS `routine1view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `routine1view` AS SELECT 
 1 AS `user_index`,
 1 AS `schedule_index`,
 1 AS `schedule_routine`,
 1 AS `schedule_title`,
 1 AS `schedule_content`,
 1 AS `schedule_importance`,
 1 AS `schedule_access`,
 1 AS `schedule_done`,
 1 AS `schedule_start`,
 1 AS `schedule_end`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `routine2view`
--

DROP TABLE IF EXISTS `routine2view`;
/*!50001 DROP VIEW IF EXISTS `routine2view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `routine2view` AS SELECT 
 1 AS `user_index`,
 1 AS `schedule_index`,
 1 AS `schedule_routine`,
 1 AS `schedule_title`,
 1 AS `schedule_content`,
 1 AS `schedule_importance`,
 1 AS `schedule_access`,
 1 AS `schedule_done`,
 1 AS `schedule_start`,
 1 AS `schedule_end`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `routinescheduleview`
--

DROP TABLE IF EXISTS `routinescheduleview`;
/*!50001 DROP VIEW IF EXISTS `routinescheduleview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `routinescheduleview` AS SELECT 
 1 AS `user_index`,
 1 AS `schedule_index`,
 1 AS `sch_routine_type`,
 1 AS `schedule_title`,
 1 AS `schedule_content`,
 1 AS `schedule_importance`,
 1 AS `schedule_access`,
 1 AS `schedule_done`,
 1 AS `sch_time2_start`,
 1 AS `sch_time2_end`,
 1 AS `sch_time2_routine_day`,
 1 AS `sch_time2_routine_start`,
 1 AS `sch_time2_routine_end`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `schedule_main`
--

DROP TABLE IF EXISTS `schedule_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_main` (
  `schedule_index` int(100) NOT NULL AUTO_INCREMENT,
  `schedule_title` varchar(20) NOT NULL,
  `schedule_content` varchar(100) DEFAULT NULL,
  `schedule_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `schedule_updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `schedule_importance` tinyint(1) DEFAULT '0',
  `schedule_done` tinyint(1) DEFAULT '0',
  `schedule_access` tinyint(1) DEFAULT '0',
  `user_index` int(11) NOT NULL,
  PRIMARY KEY (`schedule_index`),
  KEY `fk_Schedule_User1_idx` (`user_index`),
  CONSTRAINT `fk_ScheduleMain_User1` FOREIGN KEY (`user_index`) REFERENCES `user` (`user_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_main`
--

LOCK TABLES `schedule_main` WRITE;
/*!40000 ALTER TABLE `schedule_main` DISABLE KEYS */;
INSERT INTO `schedule_main` VALUES (118,'s','s','2020-01-08 16:14:16','2020-01-08 16:14:16',0,0,0,2),(120,'d','d','2020-01-08 17:08:32','2020-01-08 17:08:32',0,0,0,2),(121,'jiran','family','2020-01-08 17:09:46','2020-01-08 17:09:46',NULL,NULL,NULL,1),(122,'test01','content01','2020-01-13 15:29:59','2020-01-13 15:29:59',0,0,0,3);
/*!40000 ALTER TABLE `schedule_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_routine`
--

DROP TABLE IF EXISTS `schedule_routine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_routine` (
  `sch_routine_type` int(3) NOT NULL,
  `schedule_index` int(100) NOT NULL,
  PRIMARY KEY (`schedule_index`),
  UNIQUE KEY `schedule_index_UNIQUE` (`schedule_index`),
  KEY `fk_routine_main_idx` (`schedule_index`),
  CONSTRAINT `fk_routine_main` FOREIGN KEY (`schedule_index`) REFERENCES `schedule_main` (`schedule_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_routine`
--

LOCK TABLES `schedule_routine` WRITE;
/*!40000 ALTER TABLE `schedule_routine` DISABLE KEYS */;
INSERT INTO `schedule_routine` VALUES (3,118),(2,120),(2,121),(0,122);
/*!40000 ALTER TABLE `schedule_routine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_time1`
--

DROP TABLE IF EXISTS `schedule_time1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_time1` (
  `sch_time1_index` int(100) NOT NULL AUTO_INCREMENT,
  `sch_time1_start` datetime NOT NULL,
  `sch_time1_end` datetime NOT NULL,
  `sch_time1_endtime` datetime NOT NULL,
  `sch_time1_pending` tinyint(4) DEFAULT '1',
  `schedule_index` int(100) NOT NULL,
  PRIMARY KEY (`sch_time1_index`),
  UNIQUE KEY `schedule_index_UNIQUE` (`schedule_index`),
  KEY `fk_time1_routine_idx` (`schedule_index`),
  CONSTRAINT `fk_time1_main` FOREIGN KEY (`schedule_index`) REFERENCES `schedule_main` (`schedule_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_time1`
--

LOCK TABLES `schedule_time1` WRITE;
/*!40000 ALTER TABLE `schedule_time1` DISABLE KEYS */;
INSERT INTO `schedule_time1` VALUES (87,'2019-01-08 12:30:00','2019-01-08 13:30:00','2020-01-08 13:30:00',0,118),(88,'2020-01-13 10:00:00','2020-01-13 12:00:00','2020-01-13 13:00:00',0,122);
/*!40000 ALTER TABLE `schedule_time1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_time1_data`
--

DROP TABLE IF EXISTS `schedule_time1_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_time1_data` (
  `sch_time1_data_index` int(11) NOT NULL AUTO_INCREMENT,
  `sch_time1_data_start` datetime NOT NULL,
  `sch_time1_data_end` datetime NOT NULL,
  `sch_time1_index` int(11) NOT NULL,
  PRIMARY KEY (`sch_time1_data_index`),
  KEY `fk_time1_data_time1_idx` (`sch_time1_index`),
  CONSTRAINT `fk_time1_data_time1` FOREIGN KEY (`sch_time1_index`) REFERENCES `schedule_time1` (`sch_time1_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_time1_data`
--

LOCK TABLES `schedule_time1_data` WRITE;
/*!40000 ALTER TABLE `schedule_time1_data` DISABLE KEYS */;
INSERT INTO `schedule_time1_data` VALUES (7,'2019-01-08 12:30:00','2019-01-08 13:30:00',87),(8,'2019-02-08 12:30:00','2019-02-08 13:30:00',87),(9,'2019-03-08 12:30:00','2019-03-08 13:30:00',87),(10,'2019-04-08 12:30:00','2019-04-08 13:30:00',87),(11,'2019-05-08 12:30:00','2019-05-08 13:30:00',87),(12,'2019-06-08 12:30:00','2019-06-08 13:30:00',87),(13,'2019-07-08 12:30:00','2019-07-08 13:30:00',87),(14,'2019-08-08 12:30:00','2019-08-08 13:30:00',87),(15,'2019-09-08 12:30:00','2019-09-08 13:30:00',87),(16,'2019-10-08 12:30:00','2019-10-08 13:30:00',87),(17,'2019-11-08 12:30:00','2019-11-08 13:30:00',87),(18,'2019-12-08 12:30:00','2019-12-08 13:30:00',87),(19,'2020-01-08 12:30:00','2020-01-08 13:30:00',87),(20,'2020-01-13 10:00:00','2020-01-13 12:00:00',88);
/*!40000 ALTER TABLE `schedule_time1_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_time2`
--

DROP TABLE IF EXISTS `schedule_time2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_time2` (
  `sch_time2_index` int(100) NOT NULL AUTO_INCREMENT,
  `sch_time2_start` datetime NOT NULL,
  `sch_time2_end` datetime NOT NULL,
  `schedule_index` int(100) NOT NULL,
  PRIMARY KEY (`sch_time2_index`),
  UNIQUE KEY `schedule_index_UNIQUE` (`schedule_index`),
  KEY `fk_time1_routine_idx` (`schedule_index`),
  CONSTRAINT `fk_time2_main` FOREIGN KEY (`schedule_index`) REFERENCES `schedule_main` (`schedule_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_time2`
--

LOCK TABLES `schedule_time2` WRITE;
/*!40000 ALTER TABLE `schedule_time2` DISABLE KEYS */;
INSERT INTO `schedule_time2` VALUES (81,'2019-01-08 12:30:00','2020-01-08 13:30:00',120),(82,'2019-01-02 00:00:00','2020-03-23 00:00:00',121);
/*!40000 ALTER TABLE `schedule_time2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_time2_data`
--

DROP TABLE IF EXISTS `schedule_time2_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_time2_data` (
  `sch_time2_data_index` int(11) NOT NULL AUTO_INCREMENT,
  `sch_time2_data_start` datetime NOT NULL,
  `sch_time2_data_end` datetime NOT NULL,
  `sch_time2_index` int(11) NOT NULL,
  PRIMARY KEY (`sch_time2_data_index`),
  KEY `fk_time2_data_time2_idx` (`sch_time2_index`),
  CONSTRAINT `fk_time2_data_time2` FOREIGN KEY (`sch_time2_index`) REFERENCES `schedule_time2` (`sch_time2_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_time2_data`
--

LOCK TABLES `schedule_time2_data` WRITE;
/*!40000 ALTER TABLE `schedule_time2_data` DISABLE KEYS */;
INSERT INTO `schedule_time2_data` VALUES (35,'2019-01-08 13:30:00','2019-01-08 14:30:00',81),(36,'2019-01-15 13:30:00','2019-01-15 14:30:00',81),(37,'2019-01-22 13:30:00','2019-01-22 14:30:00',81),(38,'2019-01-29 13:30:00','2019-01-29 14:30:00',81),(39,'2019-02-05 13:30:00','2019-02-05 14:30:00',81),(40,'2019-02-12 13:30:00','2019-02-12 14:30:00',81),(41,'2019-02-19 13:30:00','2019-02-19 14:30:00',81),(42,'2019-02-26 13:30:00','2019-02-26 14:30:00',81),(43,'2019-03-05 13:30:00','2019-03-05 14:30:00',81),(44,'2019-03-12 13:30:00','2019-03-12 14:30:00',81),(45,'2019-03-19 13:30:00','2019-03-19 14:30:00',81),(46,'2019-03-26 13:30:00','2019-03-26 14:30:00',81),(47,'2019-04-02 13:30:00','2019-04-02 14:30:00',81),(48,'2019-04-09 13:30:00','2019-04-09 14:30:00',81),(49,'2019-04-16 13:30:00','2019-04-16 14:30:00',81),(50,'2019-04-23 13:30:00','2019-04-23 14:30:00',81),(51,'2019-04-30 13:30:00','2019-04-30 14:30:00',81),(52,'2019-05-07 13:30:00','2019-05-07 14:30:00',81),(53,'2019-05-14 13:30:00','2019-05-14 14:30:00',81),(54,'2019-05-21 13:30:00','2019-05-21 14:30:00',81),(55,'2019-05-28 13:30:00','2019-05-28 14:30:00',81),(56,'2019-06-04 13:30:00','2019-06-04 14:30:00',81),(57,'2019-06-11 13:30:00','2019-06-11 14:30:00',81),(58,'2019-06-18 13:30:00','2019-06-18 14:30:00',81),(59,'2019-06-25 13:30:00','2019-06-25 14:30:00',81),(60,'2019-07-02 13:30:00','2019-07-02 14:30:00',81),(61,'2019-07-09 13:30:00','2019-07-09 14:30:00',81),(62,'2019-07-16 13:30:00','2019-07-16 14:30:00',81),(63,'2019-07-23 13:30:00','2019-07-23 14:30:00',81),(64,'2019-07-30 13:30:00','2019-07-30 14:30:00',81),(65,'2019-08-06 13:30:00','2019-08-06 14:30:00',81),(66,'2019-08-13 13:30:00','2019-08-13 14:30:00',81),(67,'2019-08-20 13:30:00','2019-08-20 14:30:00',81),(68,'2019-08-27 13:30:00','2019-08-27 14:30:00',81),(69,'2019-09-03 13:30:00','2019-09-03 14:30:00',81),(70,'2019-09-10 13:30:00','2019-09-10 14:30:00',81),(71,'2019-09-17 13:30:00','2019-09-17 14:30:00',81),(72,'2019-09-24 13:30:00','2019-09-24 14:30:00',81),(73,'2019-10-01 13:30:00','2019-10-01 14:30:00',81),(74,'2019-10-08 13:30:00','2019-10-08 14:30:00',81),(75,'2019-10-15 13:30:00','2019-10-15 14:30:00',81),(76,'2019-10-22 13:30:00','2019-10-22 14:30:00',81),(77,'2019-10-29 13:30:00','2019-10-29 14:30:00',81),(78,'2019-11-05 13:30:00','2019-11-05 14:30:00',81),(79,'2019-11-12 13:30:00','2019-11-12 14:30:00',81),(80,'2019-11-19 13:30:00','2019-11-19 14:30:00',81),(81,'2019-11-26 13:30:00','2019-11-26 14:30:00',81),(82,'2019-12-03 13:30:00','2019-12-03 14:30:00',81),(83,'2019-12-10 13:30:00','2019-12-10 14:30:00',81),(84,'2019-12-17 13:30:00','2019-12-17 14:30:00',81),(85,'2019-12-24 13:30:00','2019-12-24 14:30:00',81),(86,'2019-12-31 13:30:00','2019-12-31 14:30:00',81),(87,'2020-01-07 13:30:00','2020-01-07 14:30:00',81),(88,'2019-01-02 18:09:29','2019-01-02 19:09:29',82),(89,'2019-01-09 18:09:29','2019-01-09 19:09:29',82),(90,'2019-01-16 18:09:29','2019-01-16 19:09:29',82),(91,'2019-01-23 18:09:29','2019-01-23 19:09:29',82),(92,'2019-01-30 18:09:29','2019-01-30 19:09:29',82),(93,'2019-02-06 18:09:29','2019-02-06 19:09:29',82),(94,'2019-02-13 18:09:29','2019-02-13 19:09:29',82),(95,'2019-02-20 18:09:29','2019-02-20 19:09:29',82),(96,'2019-02-27 18:09:29','2019-02-27 19:09:29',82),(97,'2019-03-06 18:09:29','2019-03-06 19:09:29',82),(98,'2019-03-13 18:09:29','2019-03-13 19:09:29',82),(99,'2019-03-20 18:09:29','2019-03-20 19:09:29',82),(100,'2019-03-27 18:09:29','2019-03-27 19:09:29',82),(101,'2019-04-03 18:09:29','2019-04-03 19:09:29',82),(102,'2019-04-10 18:09:29','2019-04-10 19:09:29',82),(103,'2019-04-17 18:09:29','2019-04-17 19:09:29',82),(104,'2019-04-24 18:09:29','2019-04-24 19:09:29',82),(105,'2019-05-01 18:09:29','2019-05-01 19:09:29',82),(106,'2019-05-08 18:09:29','2019-05-08 19:09:29',82),(107,'2019-05-15 18:09:29','2019-05-15 19:09:29',82),(108,'2019-05-22 18:09:29','2019-05-22 19:09:29',82),(109,'2019-05-29 18:09:29','2019-05-29 19:09:29',82),(110,'2019-06-05 18:09:29','2019-06-05 19:09:29',82),(111,'2019-06-12 18:09:29','2019-06-12 19:09:29',82),(112,'2019-06-19 18:09:29','2019-06-19 19:09:29',82),(113,'2019-06-26 18:09:29','2019-06-26 19:09:29',82),(114,'2019-07-03 18:09:29','2019-07-03 19:09:29',82),(115,'2019-07-10 18:09:29','2019-07-10 19:09:29',82),(116,'2019-07-17 18:09:29','2019-07-17 19:09:29',82),(117,'2019-07-24 18:09:29','2019-07-24 19:09:29',82),(118,'2019-07-31 18:09:29','2019-07-31 19:09:29',82),(119,'2019-08-07 18:09:29','2019-08-07 19:09:29',82),(120,'2019-08-14 18:09:29','2019-08-14 19:09:29',82),(121,'2019-08-21 18:09:29','2019-08-21 19:09:29',82),(122,'2019-08-28 18:09:29','2019-08-28 19:09:29',82),(123,'2019-09-04 18:09:29','2019-09-04 19:09:29',82),(124,'2019-09-11 18:09:29','2019-09-11 19:09:29',82),(125,'2019-09-18 18:09:29','2019-09-18 19:09:29',82),(126,'2019-09-25 18:09:29','2019-09-25 19:09:29',82),(127,'2019-10-02 18:09:29','2019-10-02 19:09:29',82),(128,'2019-10-09 18:09:29','2019-10-09 19:09:29',82),(129,'2019-10-16 18:09:29','2019-10-16 19:09:29',82),(130,'2019-10-23 18:09:29','2019-10-23 19:09:29',82),(131,'2019-10-30 18:09:29','2019-10-30 19:09:29',82),(132,'2019-11-06 18:09:29','2019-11-06 19:09:29',82),(133,'2019-11-13 18:09:29','2019-11-13 19:09:29',82),(134,'2019-11-20 18:09:29','2019-11-20 19:09:29',82),(135,'2019-11-27 18:09:29','2019-11-27 19:09:29',82),(136,'2019-12-04 18:09:29','2019-12-04 19:09:29',82),(137,'2019-12-11 18:09:29','2019-12-11 19:09:29',82),(138,'2019-12-18 18:09:29','2019-12-18 19:09:29',82),(139,'2019-12-25 18:09:29','2019-12-25 19:09:29',82),(140,'2020-01-01 18:09:29','2020-01-01 19:09:29',82),(141,'2020-01-08 18:09:29','2020-01-08 19:09:29',82),(142,'2020-01-15 18:09:29','2020-01-15 19:09:29',82),(143,'2020-01-22 18:09:29','2020-01-22 19:09:29',82),(144,'2020-01-29 18:09:29','2020-01-29 19:09:29',82),(145,'2020-02-05 18:09:29','2020-02-05 19:09:29',82),(146,'2020-02-12 18:09:29','2020-02-12 19:09:29',82),(147,'2020-02-19 18:09:29','2020-02-19 19:09:29',82),(148,'2020-02-26 18:09:29','2020-02-26 19:09:29',82),(149,'2020-03-04 18:09:29','2020-03-04 19:09:29',82),(150,'2020-03-11 18:09:29','2020-03-11 19:09:29',82),(151,'2020-03-18 18:09:29','2020-03-18 19:09:29',82);
/*!40000 ALTER TABLE `schedule_time2_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_time2_routine`
--

DROP TABLE IF EXISTS `schedule_time2_routine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_time2_routine` (
  `sch_time2_routine_index` int(100) NOT NULL AUTO_INCREMENT,
  `sch_time2_routine_day` tinyint(6) NOT NULL,
  `sch_time2_routine_start` datetime NOT NULL,
  `sch_time2_routine_end` datetime NOT NULL,
  `sch_time2_routine_pending` tinyint(4) DEFAULT '1',
  `sch_time2_index` int(100) NOT NULL,
  PRIMARY KEY (`sch_time2_routine_index`),
  KEY `fk_time2Routine_time2_idx` (`sch_time2_index`),
  CONSTRAINT `fk_time2Routine_time2` FOREIGN KEY (`sch_time2_index`) REFERENCES `schedule_time2` (`sch_time2_index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_time2_routine`
--

LOCK TABLES `schedule_time2_routine` WRITE;
/*!40000 ALTER TABLE `schedule_time2_routine` DISABLE KEYS */;
INSERT INTO `schedule_time2_routine` VALUES (120,2,'2019-01-08 13:30:00','2019-01-08 14:30:00',0,81),(121,3,'2019-01-02 18:09:29','2019-01-02 19:09:29',0,82);
/*!40000 ALTER TABLE `schedule_time2_routine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('HfahSMhsuCFyrP2fLAexV4TesGpRhnOz',1570705546,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"count\":1}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_index` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_gender` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_birth` varchar(45) DEFAULT NULL,
  `user_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login_id` varchar(45) NOT NULL,
  PRIMARY KEY (`user_index`),
  UNIQUE KEY `user_id_UNIQUE` (`login_id`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`),
  CONSTRAINT `fk_User_Login_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=889183557 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'kim','male','rud527@naver.com','1996-06-07','2019-08-24 00:00:00','2019-10-10 20:33:34','rud527'),(2,'user3','female','sdfjklsdjf@naver.com','1996-09-13','2019-08-27 00:00:00','2019-11-25 20:54:14','abc1'),(3,'df','female','sdjlf@google.com','1993-05-23','2019-09-04 00:00:00','2019-11-25 20:54:14','chldusdn20'),(4,'choi','male','djskf@naver.com','2000-05-27','2019-10-10 20:16:08','2020-01-06 08:27:56','chltprud20'),(5,'choiyeonwoo','male','tprud527@naver.com','1996-06-07','2019-11-18 15:29:31','2020-01-06 08:27:56','tprud527'),(6,'hwang','male','abc1233333@naver.com','1999-03-12','2019-12-23 16:55:39','2020-01-06 08:27:56','abcdefg1234'),(7,'leejuwon',NULL,NULL,NULL,'2019-12-27 12:12:57','2020-01-06 08:27:56','tengo'),(8,'testName','male','sjdflksj@naver.com','1997-02-28','2019-12-30 23:42:57','2020-01-06 08:27:56','testId'),(9,'testttt',NULL,NULL,NULL,'2020-01-06 08:36:45','2020-01-06 08:36:45','testID01');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `groupview`
--

/*!50001 DROP VIEW IF EXISTS `groupview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `groupview` AS select `group_table`.`gb_index` AS `gb_index`,`group_table`.`gb_name` AS `gb_name`,`group_table`.`gb_start` AS `gb_start`,`group_table`.`gb_end` AS `gb_end`,`group_table`.`gb_access` AS `gb_access`,`group_table`.`owner_index` AS `owner_index`,`member_table`.`member_index` AS `member_index`,`member_table`.`member_access` AS `member_access` from (`group_table` join `member_table`) where (`group_table`.`gb_index` = `member_table`.`gb_index`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `routine1view`
--

/*!50001 DROP VIEW IF EXISTS `routine1view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `routine1view` AS select `schedule_main`.`user_index` AS `user_index`,`schedule_main`.`schedule_index` AS `schedule_index`,`schedule_routine`.`sch_routine_type` AS `schedule_routine`,`schedule_main`.`schedule_title` AS `schedule_title`,`schedule_main`.`schedule_content` AS `schedule_content`,`schedule_main`.`schedule_importance` AS `schedule_importance`,`schedule_main`.`schedule_access` AS `schedule_access`,`schedule_main`.`schedule_done` AS `schedule_done`,`schedule_time1_data`.`sch_time1_data_start` AS `schedule_start`,`schedule_time1_data`.`sch_time1_data_end` AS `schedule_end` from (((`schedule_main` join `schedule_routine`) join `schedule_time1`) join `schedule_time1_data`) where ((`schedule_main`.`schedule_index` = `schedule_time1`.`schedule_index`) and (`schedule_routine`.`schedule_index` = `schedule_main`.`schedule_index`) and (`schedule_time1`.`sch_time1_index` = `schedule_time1_data`.`sch_time1_index`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `routine2view`
--

/*!50001 DROP VIEW IF EXISTS `routine2view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `routine2view` AS select `schedule_main`.`user_index` AS `user_index`,`schedule_main`.`schedule_index` AS `schedule_index`,`schedule_routine`.`sch_routine_type` AS `schedule_routine`,`schedule_main`.`schedule_title` AS `schedule_title`,`schedule_main`.`schedule_content` AS `schedule_content`,`schedule_main`.`schedule_importance` AS `schedule_importance`,`schedule_main`.`schedule_access` AS `schedule_access`,`schedule_main`.`schedule_done` AS `schedule_done`,`schedule_time2_data`.`sch_time2_data_start` AS `schedule_start`,`schedule_time2_data`.`sch_time2_data_end` AS `schedule_end` from ((((`schedule_main` join `schedule_routine`) join `schedule_time2`) join `schedule_time2_data`) join `schedule_time2_routine`) where ((`schedule_main`.`schedule_index` = `schedule_time2`.`schedule_index`) and (`schedule_routine`.`schedule_index` = `schedule_main`.`schedule_index`) and (`schedule_time2`.`sch_time2_index` = `schedule_time2_data`.`sch_time2_index`) and (`schedule_time2`.`sch_time2_index` = `schedule_time2_routine`.`sch_time2_index`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `routinescheduleview`
--

/*!50001 DROP VIEW IF EXISTS `routinescheduleview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `routinescheduleview` AS select `schedule_main`.`user_index` AS `user_index`,`schedule_main`.`schedule_index` AS `schedule_index`,`schedule_routine`.`sch_routine_type` AS `sch_routine_type`,`schedule_main`.`schedule_title` AS `schedule_title`,`schedule_main`.`schedule_content` AS `schedule_content`,`schedule_main`.`schedule_importance` AS `schedule_importance`,`schedule_main`.`schedule_access` AS `schedule_access`,`schedule_main`.`schedule_done` AS `schedule_done`,`schedule_time2`.`sch_time2_start` AS `sch_time2_start`,`schedule_time2`.`sch_time2_end` AS `sch_time2_end`,`schedule_time2_routine`.`sch_time2_routine_day` AS `sch_time2_routine_day`,`schedule_time2_routine`.`sch_time2_routine_start` AS `sch_time2_routine_start`,`schedule_time2_routine`.`sch_time2_routine_end` AS `sch_time2_routine_end` from (((`schedule_main` join `schedule_routine`) join `schedule_time2`) join `schedule_time2_routine`) where ((`schedule_main`.`schedule_index` = `schedule_time2`.`schedule_index`) and (`schedule_time2`.`sch_time2_index` = `schedule_time2_routine`.`sch_time2_index`) and (`schedule_routine`.`schedule_index` = `schedule_main`.`schedule_index`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-17  1:09:01
