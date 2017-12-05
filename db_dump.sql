-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: supplytracker
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `model_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`),
  KEY `category_id` (`category_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `itemmodel` (`id`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `itemcategory` (`id`),
  CONSTRAINT `item_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Claritin 24 Hour Non-Drowsy Allergy Tablets','Powerful, 24-hour, non-drowsy indoor and outdoor allergy relief',21.99,1,1,1),(2,'Premium Saltine Crackers, Original','Premium Saltine Crackers topped with coarse sea salt',2.56,2,2,1),(3,'AmazonBasics Balance Ball with Hand Pump','Small balance ball promotes strength, agility, and balance',13.99,3,4,3),(4,'Harry Potter and the Sorcerer\'s Stone: The Illustrated Edition','The beloved first book of the Harry Potter series, now fully illustrated by award-winning artist Jim Kay.',23.99,4,5,2),(5,'Milk and Vine: Inspirational Quotes From Classic Vines','Parodying the popular poetry book Milk and Honey, Milk and Vine offers a beautifully designed reflection of the thought-provoking ideas that spread through this amazing platform.',4.88,5,5,2),(6,'Wonder Woman','When a pilot crashes and tells of conflict in the outside world, Diana, an Amazonian warrior in training, leaves home to fight a war, discovering her full powers and true destiny.',19.97,6,6,1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemcategory`
--

DROP TABLE IF EXISTS `itemcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemcategory` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemcategory`
--

LOCK TABLES `itemcategory` WRITE;
/*!40000 ALTER TABLE `itemcategory` DISABLE KEYS */;
INSERT INTO `itemcategory` VALUES (1,'Health',101),(2,'Food',102),(3,'Tools',103),(4,'Sports',104),(5,'Books',105),(6,'Movies',106);
/*!40000 ALTER TABLE `itemcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemmodel`
--

DROP TABLE IF EXISTS `itemmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemmodel` (
  `id` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `brand_name` varchar(64) NOT NULL,
  `manufacturer_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemmodel`
--

LOCK TABLES `itemmodel` WRITE;
/*!40000 ALTER TABLE `itemmodel` DISABLE KEYS */;
INSERT INTO `itemmodel` VALUES (1,'2017-11-20','Claritin','Bayer HealthCare LLC'),(2,'2017-11-20','Nabisco','Nabisco'),(3,'2017-11-20','AmazonBasics','Amazon'),(4,'2015-10-06','Arthur A. Levine Books','Arthur A. Levine Books'),(5,'2017-10-22','Independently published','Independently published'),(6,'2017-09-19','Warner Bros.','Warner Bros.');
/*!40000 ALTER TABLE `itemmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `location` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Warehouse 1','Seattle'),(2,'Warehouse 2','Tacoma'),(3,'Warehouse 3','Bellevue'),(4,'Warehouse 4','Kent'),(5,'Warehouse 5','Everett'),(6,'Warehouse 6','Renton');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-04 20:25:27
