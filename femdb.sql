-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: femdb
-- ------------------------------------------------------
-- Server version	5.5.35-1ubuntu1

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
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` smallint(6) NOT NULL DEFAULT '0',
  `n1` smallint(6) NOT NULL DEFAULT '0',
  `n2` smallint(6) NOT NULL DEFAULT '0',
  `n3` smallint(6) NOT NULL DEFAULT '0',
  `props` char(12) NOT NULL DEFAULT 'steel',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,2,3,5,'steel'),(2,1,2,4,'steel'),(3,2,5,4,'steel'),(4,5,6,4,'steel'),(5,5,7,6,'steel'),(6,5,8,7,'steel'),(7,8,9,7,'steel'),(8,8,10,9,'steel'),(9,10,11,9,'steel'),(10,10,12,11,'steel'),(11,12,13,11,'steel'),(12,12,14,13,'steel'),(13,12,15,14,'steel'),(14,14,18,13,'steel'),(15,15,16,14,'steel'),(16,16,17,14,'steel'),(17,14,17,18,'steel'),(18,16,20,17,'steel'),(19,17,19,18,'steel'),(20,20,19,17,'steel'),(21,20,21,19,'steel'),(22,19,21,23,'steel'),(23,20,22,21,'steel'),(24,22,24,21,'steel'),(25,21,24,23,'steel'),(26,28,27,22,'steel'),(27,27,29,26,'steel'),(28,27,26,22,'steel'),(29,24,26,25,'steel'),(30,24,25,23,'steel');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loadings`
--

DROP TABLE IF EXISTS `loadings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loadings` (
  `type` char(1) NOT NULL DEFAULT '',
  `direction` char(1) DEFAULT NULL,
  `node` smallint(6) NOT NULL DEFAULT '0',
  `value` float DEFAULT NULL,
  KEY `key_node` (`node`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loadings`
--

LOCK TABLES `loadings` WRITE;
/*!40000 ALTER TABLE `loadings` DISABLE KEYS */;
INSERT INTO `loadings` VALUES ('r','x',1,NULL),('r','x',2,NULL),('r','x',3,NULL),('h',NULL,14,NULL),('f','x',27,-10),('f','y',27,-50);
/*!40000 ALTER TABLE `loadings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materials` (
  `name` char(12) NOT NULL DEFAULT '',
  `density` float NOT NULL DEFAULT '0',
  `elastics` float NOT NULL DEFAULT '0',
  `poisson` float NOT NULL DEFAULT '0',
  `strength` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` VALUES ('aluminium',2.7,65,0.34,600),('brass',8.5,93,0.37,300),('concrete',5.6,25,0.12,300),('duraluminium',2.8,70,0.31,700),('steel',7.8,200,0.25,1000),('titanium',4.5,116,0.32,950);
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` smallint(6) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` VALUES (1,-95,20),(2,-87.5,20),(3,-80,20),(4,-95,10),(5,-80,15),(6,-85,-1),(7,-75,-3),(8,-65,15),(9,-55,-6),(10,-40,15),(11,-35,-10),(12,-15,15),(13,-15,-14),(14,0,0),(15,5,20),(16,20,8),(17,20,-10),(18,10,-20),(19,30,-27),(20,40,-3),(21,50,-25),(22,60,-15),(23,60,-39),(24,65,-25),(25,75,-35),(26,80,-20),(27,75,-7),(28,65,-5),(29,83,-9);
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-29 23:22:29
