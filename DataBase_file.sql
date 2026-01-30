-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: extraordinary_shop
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `line1` varchar(120) NOT NULL,
  `city` varchar(60) NOT NULL,
  `country` varchar(60) NOT NULL DEFAULT 'UK',
  `postcode` varchar(12) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'1 Example Street','London','UK','PC001'),(2,'2 Example Street','Manchester','UK','PC002'),(3,'3 Example Street','Birmingham','UK','PC003'),(4,'4 Example Street','Leeds','UK','PC004'),(5,'5 Example Street','Glasgow','UK','PC005'),(6,'6 Example Street','London','UK','PC006'),(7,'7 Example Street','Manchester','UK','PC007'),(8,'8 Example Street','Birmingham','UK','PC008'),(9,'9 Example Street','Leeds','UK','PC009'),(10,'10 Example Street','Glasgow','UK','PC010'),(11,'11 Example Street','London','UK','PC011'),(12,'12 Example Street','Manchester','UK','PC012'),(13,'13 Example Street','Birmingham','UK','PC013'),(14,'14 Example Street','Leeds','UK','PC014'),(15,'15 Example Street','Glasgow','UK','PC015'),(16,'16 Example Street','London','UK','PC016'),(17,'17 Example Street','Manchester','UK','PC017'),(18,'18 Example Street','Birmingham','UK','PC018'),(19,'19 Example Street','Leeds','UK','PC019'),(20,'20 Example Street','Glasgow','UK','PC020');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(80) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Category_1'),(10,'Category_10'),(11,'Category_11'),(12,'Category_12'),(13,'Category_13'),(14,'Category_14'),(15,'Category_15'),(16,'Category_16'),(17,'Category_17'),(18,'Category_18'),(19,'Category_19'),(2,'Category_2'),(20,'Category_20'),(3,'Category_3'),(4,'Category_4'),(5,'Category_5'),(6,'Category_6'),(7,'Category_7'),(8,'Category_8'),(9,'Category_9');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(120) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `idx_customer_status` (`status`),
  CONSTRAINT `chk_customer_status` CHECK ((`status` in (_utf8mb4'ACTIVE',_utf8mb4'SUSPENDED',_utf8mb4'CLOSED')))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'First1','Last1','user1@email.com','+447700900001','ACTIVE','2026-01-01 09:00:00'),(2,'First2','Last2','user2@email.com','+447700900002','ACTIVE','2026-01-02 09:00:00'),(3,'First3','Last3','user3@email.com','+447700900003','ACTIVE','2026-01-03 09:00:00'),(4,'First4','Last4','user4@email.com','+447700900004','ACTIVE','2026-01-04 09:00:00'),(5,'First5','Last5','user5@email.com','+447700900005','ACTIVE','2026-01-05 09:00:00'),(6,'First6','Last6','user6@email.com','+447700900006','ACTIVE','2026-01-06 09:00:00'),(7,'First7','Last7','user7@email.com','+447700900007','ACTIVE','2026-01-07 09:00:00'),(8,'First8','Last8','user8@email.com','+447700900008','ACTIVE','2026-01-08 09:00:00'),(9,'First9','Last9','user9@email.com','+447700900009','ACTIVE','2026-01-09 09:00:00'),(10,'First10','Last10','user10@email.com','+447700900010','SUSPENDED','2026-01-10 09:00:00'),(11,'First11','Last11','user11@email.com','+447700900011','ACTIVE','2026-01-11 09:00:00'),(12,'First12','Last12','user12@email.com','+447700900012','ACTIVE','2026-01-12 09:00:00'),(13,'First13','Last13','user13@email.com','+447700900013','ACTIVE','2026-01-13 09:00:00'),(14,'First14','Last14','user14@email.com','+447700900014','ACTIVE','2026-01-14 09:00:00'),(15,'First15','Last15','user15@email.com','+447700900015','ACTIVE','2026-01-15 09:00:00'),(16,'First16','Last16','user16@email.com','+447700900016','ACTIVE','2026-01-16 09:00:00'),(17,'First17','Last17','user17@email.com','+447700900017','ACTIVE','2026-01-17 09:00:00'),(18,'First18','Last18','user18@email.com','+447700900018','ACTIVE','2026-01-18 09:00:00'),(19,'First19','Last19','user19@email.com','+447700900019','ACTIVE','2026-01-19 09:00:00'),(20,'First20','Last20','user20@email.com','+447700900020','CLOSED','2026-01-20 09:00:00');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `customer_id` int NOT NULL,
  `address_id` int NOT NULL,
  `address_type` varchar(20) NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`,`address_id`,`address_type`),
  KEY `fk_ca_address` (`address_id`),
  CONSTRAINT `fk_ca_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `fk_ca_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `chk_address_type` CHECK ((`address_type` in (_utf8mb4'BILLING',_utf8mb4'SHIPPING')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` VALUES (1,1,'BILLING',1),(1,1,'SHIPPING',1),(2,2,'BILLING',1),(2,2,'SHIPPING',1),(3,3,'BILLING',1),(3,3,'SHIPPING',1),(4,4,'BILLING',1),(4,4,'SHIPPING',1),(5,5,'BILLING',1),(5,5,'SHIPPING',1),(6,6,'BILLING',1),(6,6,'SHIPPING',1),(7,7,'BILLING',1),(7,7,'SHIPPING',1),(8,8,'BILLING',1),(8,8,'SHIPPING',1),(9,9,'BILLING',1),(9,9,'SHIPPING',1),(10,10,'BILLING',1),(10,10,'SHIPPING',1),(11,11,'BILLING',1),(11,11,'SHIPPING',1),(12,12,'BILLING',1),(12,12,'SHIPPING',1),(13,13,'BILLING',1),(13,13,'SHIPPING',1),(14,14,'BILLING',1),(14,14,'SHIPPING',1),(15,15,'BILLING',1),(15,15,'SHIPPING',1),(16,16,'BILLING',1),(16,16,'SHIPPING',1),(17,17,'BILLING',1),(17,17,'SHIPPING',1),(18,18,'BILLING',1),(18,18,'SHIPPING',1),(19,19,'BILLING',1),(19,19,'SHIPPING',1),(20,20,'BILLING',1),(20,20,'SHIPPING',1);
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `warehouse_id` int NOT NULL,
  `product_id` int NOT NULL,
  `stock_qty` int NOT NULL DEFAULT '0',
  `reorder_level` int NOT NULL DEFAULT '10',
  PRIMARY KEY (`warehouse_id`,`product_id`),
  KEY `idx_inventory_product_stock` (`product_id`,`stock_qty`),
  CONSTRAINT `fk_inv_prod` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `fk_inv_wh` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`),
  CONSTRAINT `chk_reorder_level` CHECK ((`reorder_level` >= 0)),
  CONSTRAINT `chk_stock_qty` CHECK ((`stock_qty` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,80,20),(1,2,75,20),(1,3,70,20),(1,4,65,20),(1,5,60,20),(1,6,55,20),(1,7,50,20),(1,8,45,20),(1,9,40,20),(1,10,35,20),(1,11,90,20),(1,12,85,20),(1,13,78,20),(1,14,72,20),(1,15,68,20),(1,16,58,20),(1,17,52,20),(1,18,48,20),(1,19,43,20),(1,20,38,20),(2,1,60,20),(2,2,58,20),(2,3,55,20),(2,4,53,20),(2,5,50,20),(2,6,48,20),(2,7,45,20),(2,8,42,20),(2,9,40,20),(2,10,37,20),(2,11,70,20),(2,12,68,20),(2,13,63,20),(2,14,61,20),(2,15,59,20),(2,16,52,20),(2,17,49,20),(2,18,46,20),(2,19,44,20),(2,20,41,20),(3,1,45,20),(3,2,43,20),(3,3,42,20),(3,4,40,20),(3,5,38,20),(3,6,36,20),(3,7,35,20),(3,8,33,20),(3,9,31,20),(3,10,30,20),(3,11,55,20),(3,12,52,20),(3,13,50,20),(3,14,48,20),(3,15,46,20),(3,16,40,20),(3,17,38,20),(3,18,35,20),(3,19,33,20),(3,20,31,20),(4,1,35,20),(4,2,34,20),(4,3,33,20),(4,4,32,20),(4,5,31,20),(4,6,30,20),(4,7,28,20),(4,8,27,20),(4,9,26,20),(4,10,25,20),(4,11,45,20),(4,12,43,20),(4,13,41,20),(4,14,40,20),(4,15,38,20),(4,16,34,20),(4,17,32,20),(4,18,30,20),(4,19,28,20),(4,20,26,20),(5,1,25,20),(5,2,24,20),(5,3,23,20),(5,4,22,20),(5,5,21,20),(5,6,20,20),(5,7,19,20),(5,8,18,20),(5,9,17,20),(5,10,16,20),(5,11,30,20),(5,12,29,20),(5,13,28,20),(5,14,27,20),(5,15,26,20),(5,16,22,20),(5,17,21,20),(5,18,20,20),(5,19,19,20),(5,20,18,20);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyalty_account`
--

DROP TABLE IF EXISTS `loyalty_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalty_account` (
  `loyalty_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `points_balance` int NOT NULL DEFAULT '0',
  `tier` varchar(15) NOT NULL DEFAULT 'BRONZE',
  PRIMARY KEY (`loyalty_id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  CONSTRAINT `fk_loyalty_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `chk_points_balance` CHECK ((`points_balance` >= 0)),
  CONSTRAINT `chk_tier` CHECK ((`tier` in (_utf8mb4'BRONZE',_utf8mb4'SILVER',_utf8mb4'GOLD',_utf8mb4'PLATINUM')))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyalty_account`
--

LOCK TABLES `loyalty_account` WRITE;
/*!40000 ALTER TABLE `loyalty_account` DISABLE KEYS */;
INSERT INTO `loyalty_account` VALUES (1,1,120,'SILVER'),(2,2,40,'BRONZE'),(3,3,300,'GOLD'),(4,4,10,'BRONZE'),(5,5,0,'BRONZE'),(6,6,500,'PLATINUM'),(7,7,90,'SILVER'),(8,8,200,'GOLD'),(9,9,15,'BRONZE'),(10,10,60,'SILVER'),(11,11,5,'BRONZE'),(12,12,150,'GOLD'),(13,13,25,'BRONZE'),(14,14,70,'SILVER'),(15,15,320,'GOLD'),(16,16,8,'BRONZE'),(17,17,110,'SILVER'),(18,18,45,'BRONZE'),(19,19,210,'GOLD'),(20,20,30,'BRONZE');
/*!40000 ALTER TABLE `loyalty_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyalty_txn`
--

DROP TABLE IF EXISTS `loyalty_txn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalty_txn` (
  `txn_id` int NOT NULL AUTO_INCREMENT,
  `loyalty_id` int NOT NULL,
  `txn_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `points_change` int NOT NULL,
  `reason` varchar(60) NOT NULL,
  PRIMARY KEY (`txn_id`),
  KEY `fk_txn_loyalty` (`loyalty_id`),
  CONSTRAINT `fk_txn_loyalty` FOREIGN KEY (`loyalty_id`) REFERENCES `loyalty_account` (`loyalty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyalty_txn`
--

LOCK TABLES `loyalty_txn` WRITE;
/*!40000 ALTER TABLE `loyalty_txn` DISABLE KEYS */;
INSERT INTO `loyalty_txn` VALUES (1,1,'2026-01-02 09:00:00',20,'Order reward'),(2,2,'2026-01-03 09:00:00',10,'Order reward'),(3,3,'2026-01-04 09:00:00',50,'Order reward'),(4,4,'2026-01-05 09:00:00',5,'Order reward'),(5,5,'2026-01-06 09:00:00',0,'No points'),(6,6,'2026-01-07 09:00:00',100,'VIP reward'),(7,7,'2026-01-08 09:00:00',15,'Order reward'),(8,8,'2026-01-09 09:00:00',40,'Order reward'),(9,9,'2026-01-10 09:00:00',5,'Order reward'),(10,10,'2026-01-11 09:00:00',10,'Order reward'),(11,11,'2026-01-12 09:00:00',2,'Order reward'),(12,12,'2026-01-13 09:00:00',30,'Order reward'),(13,13,'2026-01-14 09:00:00',5,'Order reward'),(14,14,'2026-01-15 09:00:00',12,'Order reward'),(15,15,'2026-01-16 09:00:00',60,'Order reward'),(16,16,'2026-01-17 09:00:00',2,'Order reward'),(17,17,'2026-01-18 09:00:00',18,'Order reward'),(18,18,'2026-01-19 09:00:00',8,'Order reward'),(19,19,'2026-01-20 09:00:00',35,'Order reward'),(20,20,'2026-01-21 09:00:00',10,'Order reward');
/*!40000 ALTER TABLE `loyalty_txn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_oi_product` (`product_id`),
  KEY `idx_order_item_order_product` (`order_id`,`product_id`),
  CONSTRAINT `fk_oi_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_oi_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `chk_oi_price` CHECK ((`unit_price` >= 0)),
  CONSTRAINT `chk_oi_qty` CHECK ((`quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,2,12.99),(2,1,5,1,25.00),(3,2,2,1,15.49),(4,2,6,2,29.50),(5,3,3,3,18.00),(6,3,7,1,34.99),(7,4,4,1,21.99),(8,4,8,1,39.99),(9,5,5,2,25.00),(10,5,9,1,44.00),(11,6,6,1,29.50),(12,6,10,1,49.99),(13,7,7,2,34.99),(14,7,11,1,55.00),(15,8,8,1,39.99),(16,8,12,2,60.00),(17,9,9,2,44.00),(18,9,13,1,65.99),(19,10,10,1,49.99),(20,10,14,1,70.00),(21,11,11,2,55.00),(22,11,15,1,75.49),(23,12,12,1,60.00),(24,12,16,1,80.00),(25,13,13,2,65.99),(26,13,17,1,85.99),(27,14,14,1,70.00),(28,14,18,1,90.00),(29,15,15,2,75.49),(30,15,19,1,95.50),(31,16,16,1,80.00),(32,16,20,1,99.99),(33,17,17,2,85.99),(34,17,1,1,12.99),(35,18,18,1,90.00),(36,18,2,1,15.49),(37,19,19,2,95.50),(38,19,3,1,18.00),(39,20,20,1,99.99),(40,20,4,1,21.99),(41,21,1,1,12.99),(42,21,6,1,29.50),(43,22,2,2,15.49),(44,22,7,1,34.99),(45,23,3,1,18.00),(46,23,8,1,39.99),(47,24,4,2,21.99),(48,24,9,1,44.00),(49,25,5,1,25.00),(50,25,10,1,49.99),(51,26,6,2,29.50),(52,26,11,1,55.00),(53,27,7,1,34.99),(54,27,12,1,60.00),(55,28,8,2,39.99),(56,28,13,1,65.99),(57,29,9,1,44.00),(58,29,14,1,70.00),(59,30,10,2,49.99),(60,30,15,1,75.49),(61,31,11,1,55.00),(62,31,16,1,80.00),(63,32,12,2,60.00),(64,32,17,1,85.99),(65,33,13,1,65.99),(66,33,18,1,90.00),(67,34,14,2,70.00),(68,34,19,1,95.50),(69,35,15,1,75.49),(70,35,20,1,99.99),(71,36,16,2,80.00),(72,36,1,1,12.99),(73,37,17,1,85.99),(74,37,2,1,15.49),(75,38,18,2,90.00),(76,38,3,1,18.00),(77,39,19,1,95.50),(78,39,4,1,21.99),(79,40,20,2,99.99),(80,40,5,1,25.00);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_promotion`
--

DROP TABLE IF EXISTS `order_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_promotion` (
  `order_id` int NOT NULL,
  `promo_id` int NOT NULL,
  `applied_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`,`promo_id`),
  KEY `fk_op_promo` (`promo_id`),
  CONSTRAINT `fk_op_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_op_promo` FOREIGN KEY (`promo_id`) REFERENCES `promotion` (`promo_id`),
  CONSTRAINT `chk_applied_amount` CHECK ((`applied_amount` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_promotion`
--

LOCK TABLES `order_promotion` WRITE;
/*!40000 ALTER TABLE `order_promotion` DISABLE KEYS */;
INSERT INTO `order_promotion` VALUES (1,1,10.00),(2,2,5.00),(3,3,15.00),(4,4,8.00),(5,5,15.00),(6,6,3.00),(7,7,12.00),(8,8,6.00),(9,9,18.00),(10,10,4.00),(11,11,9.00),(12,12,7.00),(13,13,14.00),(14,14,10.00),(15,15,20.00),(16,16,2.00),(17,17,11.00),(18,18,9.00),(19,19,17.00),(20,20,12.00),(21,1,0.00),(22,2,10.00),(23,3,5.00),(24,4,0.00),(25,5,5.00),(26,6,3.00),(27,7,0.00),(28,8,18.00),(29,9,5.00),(30,10,0.00),(31,11,10.00),(32,12,0.00),(33,13,8.00),(34,14,5.00),(35,15,20.00),(36,16,2.00),(37,17,10.00),(38,18,0.00),(39,19,0.00),(40,20,15.00);
/*!40000 ALTER TABLE `order_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL DEFAULT 'PENDING',
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `expected_delivery_date` date DEFAULT NULL,
  `is_overdue` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `idx_orders_customer_date` (`customer_id`,`order_date`),
  KEY `idx_orders_status_delivery` (`status`,`expected_delivery_date`),
  CONSTRAINT `fk_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `chk_order_money` CHECK (((`subtotal` >= 0) and (`discount_total` >= 0) and (`total_amount` >= 0))),
  CONSTRAINT `chk_order_status` CHECK ((`status` in (_utf8mb4'PENDING',_utf8mb4'CONFIRMED',_utf8mb4'SHIPPED',_utf8mb4'DELIVERED',_utf8mb4'CANCELLED')))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2026-01-01 10:00:00','DELIVERED',120.00,10.00,110.00,'2026-01-06',0),(2,2,'2026-01-02 10:00:00','SHIPPED',95.00,5.00,90.00,'2026-01-07',0),(3,3,'2026-01-03 10:00:00','CONFIRMED',60.00,0.00,60.00,'2026-01-08',0),(4,4,'2026-01-04 10:00:00','PENDING',40.00,0.00,40.00,'2026-01-09',0),(5,5,'2026-01-05 10:00:00','CONFIRMED',150.00,15.00,135.00,'2026-01-10',0),(6,6,'2026-01-06 10:00:00','DELIVERED',80.00,8.00,72.00,'2026-01-11',0),(7,7,'2026-01-07 10:00:00','SHIPPED',55.00,5.00,50.00,'2026-01-12',0),(8,8,'2026-01-08 10:00:00','CONFIRMED',200.00,20.00,180.00,'2026-01-13',0),(9,9,'2026-01-09 10:00:00','PENDING',70.00,0.00,70.00,'2026-01-14',0),(10,10,'2026-01-10 10:00:00','CONFIRMED',110.00,10.00,100.00,'2026-01-15',0),(11,11,'2026-01-11 10:00:00','DELIVERED',90.00,0.00,90.00,'2026-01-16',0),(12,12,'2026-01-12 10:00:00','SHIPPED',130.00,12.00,118.00,'2026-01-17',0),(13,13,'2026-01-13 10:00:00','CONFIRMED',75.00,5.00,70.00,'2026-01-18',0),(14,14,'2026-01-14 10:00:00','PENDING',45.00,0.00,45.00,'2026-01-19',0),(15,15,'2026-01-15 10:00:00','CONFIRMED',160.00,20.00,140.00,'2026-01-20',0),(16,16,'2026-01-16 10:00:00','DELIVERED',85.00,0.00,85.00,'2026-01-21',0),(17,17,'2026-01-17 10:00:00','SHIPPED',65.00,5.00,60.00,'2026-01-22',0),(18,18,'2026-01-18 10:00:00','CONFIRMED',210.00,10.00,200.00,'2026-01-23',0),(19,19,'2026-01-19 10:00:00','PENDING',50.00,0.00,50.00,'2026-01-24',0),(20,20,'2026-01-20 10:00:00','CONFIRMED',140.00,15.00,125.00,'2026-01-25',0),(21,1,'2026-01-21 10:00:00','DELIVERED',60.00,0.00,60.00,'2026-01-26',0),(22,2,'2026-01-22 10:00:00','SHIPPED',105.00,10.00,95.00,'2026-01-27',0),(23,3,'2026-01-23 10:00:00','CONFIRMED',90.00,5.00,85.00,'2026-01-28',0),(24,4,'2026-01-24 10:00:00','PENDING',35.00,0.00,35.00,'2026-01-29',0),(25,5,'2026-01-25 10:00:00','CONFIRMED',155.00,5.00,150.00,'2026-01-30',0),(26,6,'2026-01-26 10:00:00','DELIVERED',75.00,3.00,72.00,'2026-01-31',0),(27,7,'2026-01-27 10:00:00','SHIPPED',95.00,0.00,95.00,'2026-02-01',0),(28,8,'2026-01-28 10:00:00','CONFIRMED',180.00,18.00,162.00,'2026-02-02',0),(29,9,'2026-01-29 10:00:00','PENDING',65.00,5.00,60.00,'2026-02-03',0),(30,10,'2026-01-30 10:00:00','CONFIRMED',100.00,0.00,100.00,'2026-02-04',0),(31,11,'2026-01-31 10:00:00','DELIVERED',120.00,10.00,110.00,'2026-02-05',0),(32,12,'2026-02-01 10:00:00','SHIPPED',150.00,0.00,150.00,'2026-02-06',0),(33,13,'2026-02-02 10:00:00','CONFIRMED',85.00,8.00,77.00,'2026-02-07',0),(34,14,'2026-02-03 10:00:00','PENDING',55.00,5.00,50.00,'2026-02-08',0),(35,15,'2026-02-04 10:00:00','CONFIRMED',200.00,20.00,180.00,'2026-02-09',0),(36,16,'2026-02-05 10:00:00','DELIVERED',90.00,0.00,90.00,'2026-02-10',0),(37,17,'2026-02-06 10:00:00','SHIPPED',110.00,10.00,100.00,'2026-02-11',0),(38,18,'2026-02-07 10:00:00','CONFIRMED',70.00,0.00,70.00,'2026-02-12',0),(39,19,'2026-02-08 10:00:00','PENDING',45.00,0.00,45.00,'2026-02-13',0),(40,20,'2026-02-09 10:00:00','CONFIRMED',160.00,15.00,145.00,'2026-02-14',0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `paid_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(10,2) NOT NULL,
  `method` varchar(20) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `idx_payment_order` (`order_id`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `chk_payment_amount` CHECK ((`amount` > 0)),
  CONSTRAINT `chk_payment_method` CHECK ((`method` in (_utf8mb4'CARD',_utf8mb4'BANK_TRANSFER',_utf8mb4'PAYPAL')))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'2026-01-01 12:00:00',110.00,'CARD'),(2,2,'2026-01-02 12:00:00',90.00,'PAYPAL'),(3,3,'2026-01-03 12:00:00',60.00,'CARD'),(4,4,'2026-01-04 12:00:00',40.00,'BANK_TRANSFER'),(5,5,'2026-01-05 12:00:00',135.00,'CARD'),(6,6,'2026-01-06 12:00:00',72.00,'PAYPAL'),(7,7,'2026-01-07 12:00:00',50.00,'CARD'),(8,8,'2026-01-08 12:00:00',180.00,'CARD'),(9,9,'2026-01-09 12:00:00',70.00,'BANK_TRANSFER'),(10,10,'2026-01-10 12:00:00',100.00,'CARD'),(11,11,'2026-01-11 12:00:00',90.00,'PAYPAL'),(12,12,'2026-01-12 12:00:00',118.00,'CARD'),(13,13,'2026-01-13 12:00:00',70.00,'CARD'),(14,14,'2026-01-14 12:00:00',45.00,'BANK_TRANSFER'),(15,15,'2026-01-15 12:00:00',140.00,'CARD'),(16,16,'2026-01-16 12:00:00',85.00,'PAYPAL'),(17,17,'2026-01-17 12:00:00',60.00,'CARD'),(18,18,'2026-01-18 12:00:00',200.00,'CARD'),(19,19,'2026-01-19 12:00:00',50.00,'BANK_TRANSFER'),(20,20,'2026-01-20 12:00:00',125.00,'CARD'),(21,21,'2026-01-21 12:00:00',60.00,'CARD'),(22,22,'2026-01-22 12:00:00',95.00,'PAYPAL'),(23,23,'2026-01-23 12:00:00',85.00,'CARD'),(24,24,'2026-01-24 12:00:00',35.00,'BANK_TRANSFER'),(25,25,'2026-01-25 12:00:00',150.00,'CARD'),(26,26,'2026-01-26 12:00:00',72.00,'PAYPAL'),(27,27,'2026-01-27 12:00:00',95.00,'CARD'),(28,28,'2026-01-28 12:00:00',162.00,'CARD'),(29,29,'2026-01-29 12:00:00',60.00,'BANK_TRANSFER'),(30,30,'2026-01-30 12:00:00',100.00,'CARD'),(31,31,'2026-01-31 12:00:00',110.00,'PAYPAL'),(32,32,'2026-02-01 12:00:00',150.00,'CARD'),(33,33,'2026-02-02 12:00:00',77.00,'CARD'),(34,34,'2026-02-03 12:00:00',50.00,'BANK_TRANSFER'),(35,35,'2026-02-04 12:00:00',180.00,'CARD'),(36,36,'2026-02-05 12:00:00',90.00,'PAYPAL'),(37,37,'2026-02-06 12:00:00',100.00,'CARD'),(38,38,'2026-02-07 12:00:00',70.00,'CARD'),(39,39,'2026-02-08 12:00:00',45.00,'BANK_TRANSFER'),(40,40,'2026-02-09 12:00:00',145.00,'CARD');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(120) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`product_id`),
  CONSTRAINT `chk_price` CHECK ((`price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Product_1','Description 1',12.99,1),(2,'Product_2','Description 2',15.49,1),(3,'Product_3','Description 3',18.00,1),(4,'Product_4','Description 4',21.99,1),(5,'Product_5','Description 5',25.00,1),(6,'Product_6','Description 6',29.50,1),(7,'Product_7','Description 7',34.99,1),(8,'Product_8','Description 8',39.99,1),(9,'Product_9','Description 9',44.00,1),(10,'Product_10','Description 10',49.99,1),(11,'Product_11','Description 11',55.00,1),(12,'Product_12','Description 12',60.00,1),(13,'Product_13','Description 13',65.99,1),(14,'Product_14','Description 14',70.00,1),(15,'Product_15','Description 15',75.49,1),(16,'Product_16','Description 16',80.00,1),(17,'Product_17','Description 17',85.99,1),(18,'Product_18','Description 18',90.00,1),(19,'Product_19','Description 19',95.50,1),(20,'Product_20','Description 20',99.99,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `fk_pc_category` (`category_id`),
  CONSTRAINT `fk_pc_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `fk_pc_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,1),(16,1),(2,2),(17,2),(3,3),(18,3),(4,4),(19,4),(5,5),(20,5),(1,6),(6,6),(2,7),(7,7),(3,8),(8,8),(4,9),(9,9),(5,10),(10,10),(6,11),(11,11),(7,12),(12,12),(8,13),(13,13),(9,14),(14,14),(10,15),(15,15),(11,16),(16,16),(12,17),(17,17),(13,18),(18,18),(14,19),(19,19),(15,20),(20,20);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_supplier`
--

DROP TABLE IF EXISTS `product_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_supplier` (
  `product_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `supply_cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`product_id`,`supplier_id`),
  KEY `fk_ps_supplier` (`supplier_id`),
  KEY `idx_product_supplier_product` (`product_id`),
  CONSTRAINT `fk_ps_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `fk_ps_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  CONSTRAINT `chk_supply_cost` CHECK ((`supply_cost` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_supplier`
--

LOCK TABLES `product_supplier` WRITE;
/*!40000 ALTER TABLE `product_supplier` DISABLE KEYS */;
INSERT INTO `product_supplier` VALUES (1,1,7.50),(1,8,8.10),(2,2,8.00),(2,9,8.60),(3,3,8.50),(3,10,9.10),(4,4,9.00),(4,11,9.60),(5,5,9.50),(5,12,10.10),(6,6,10.00),(6,13,10.60),(7,7,10.50),(7,14,11.10),(8,8,11.00),(8,15,11.60),(9,9,11.50),(9,16,12.10),(10,10,12.00),(10,17,12.60),(11,11,12.50),(11,18,13.10),(12,12,13.00),(12,19,13.60),(13,13,13.50),(13,20,14.10),(14,1,14.60),(14,14,14.00),(15,2,15.10),(15,15,14.50),(16,3,15.60),(16,16,15.00),(17,4,16.10),(17,17,15.50),(18,5,16.60),(18,18,16.00),(19,6,17.10),(19,19,16.50),(20,7,17.60),(20,20,17.00);
/*!40000 ALTER TABLE `product_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `promo_id` int NOT NULL AUTO_INCREMENT,
  `promo_code` varchar(30) NOT NULL,
  `promo_type` varchar(20) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`promo_id`),
  UNIQUE KEY `promo_code` (`promo_code`),
  CONSTRAINT `chk_promo_dates` CHECK ((`end_date` >= `start_date`)),
  CONSTRAINT `chk_promo_type` CHECK ((`promo_type` in (_utf8mb4'PERCENT',_utf8mb4'FIXED'))),
  CONSTRAINT `chk_promo_value` CHECK ((`value` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'PROMO001','PERCENT',10.00,'2026-01-01','2026-12-31'),(2,'PROMO002','FIXED',5.00,'2026-01-01','2026-12-31'),(3,'PROMO003','PERCENT',15.00,'2026-01-01','2026-12-31'),(4,'PROMO004','FIXED',8.00,'2026-01-01','2026-12-31'),(5,'PROMO005','PERCENT',20.00,'2026-01-01','2026-12-31'),(6,'PROMO006','FIXED',3.00,'2026-01-01','2026-12-31'),(7,'PROMO007','PERCENT',12.00,'2026-01-01','2026-12-31'),(8,'PROMO008','FIXED',6.00,'2026-01-01','2026-12-31'),(9,'PROMO009','PERCENT',18.00,'2026-01-01','2026-12-31'),(10,'PROMO010','FIXED',4.00,'2026-01-01','2026-12-31'),(11,'PROMO011','PERCENT',9.00,'2026-01-01','2026-12-31'),(12,'PROMO012','FIXED',7.00,'2026-01-01','2026-12-31'),(13,'PROMO013','PERCENT',14.00,'2026-01-01','2026-12-31'),(14,'PROMO014','FIXED',10.00,'2026-01-01','2026-12-31'),(15,'PROMO015','PERCENT',25.00,'2026-01-01','2026-12-31'),(16,'PROMO016','FIXED',2.00,'2026-01-01','2026-12-31'),(17,'PROMO017','PERCENT',11.00,'2026-01-01','2026-12-31'),(18,'PROMO018','FIXED',9.00,'2026-01-01','2026-12-31'),(19,'PROMO019','PERCENT',17.00,'2026-01-01','2026-12-31'),(20,'PROMO020','FIXED',12.00,'2026-01-01','2026-12-31');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `shipment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `shipped_on` date DEFAULT NULL,
  `delivered_on` date DEFAULT NULL,
  `carrier` varchar(40) DEFAULT NULL,
  `tracking_number` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`shipment_id`),
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `tracking_number` (`tracking_number`),
  KEY `fk_ship_wh` (`warehouse_id`),
  CONSTRAINT `fk_ship_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_ship_wh` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`),
  CONSTRAINT `chk_ship_dates` CHECK (((`delivered_on` is null) or (`shipped_on` is null) or (`delivered_on` >= `shipped_on`)))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,1,1,'2026-01-02','2026-01-05','DHL','TRK00001'),(2,2,2,'2026-01-03',NULL,'DPD','TRK00002'),(3,3,3,NULL,NULL,NULL,NULL),(4,4,4,NULL,NULL,NULL,NULL),(5,5,5,'2026-01-06',NULL,'RoyalMail','TRK00005'),(6,6,1,'2026-01-07','2026-01-10','DHL','TRK00006'),(7,7,2,'2026-01-08',NULL,'DPD','TRK00007'),(8,8,3,'2026-01-09',NULL,'DHL','TRK00008'),(9,9,4,NULL,NULL,NULL,NULL),(10,10,5,'2026-01-11',NULL,'RoyalMail','TRK00010'),(11,11,1,'2026-01-12','2026-01-15','DHL','TRK00011'),(12,12,2,'2026-01-13',NULL,'DPD','TRK00012'),(13,13,3,'2026-01-14',NULL,'DHL','TRK00013'),(14,14,4,NULL,NULL,NULL,NULL),(15,15,5,'2026-01-16',NULL,'RoyalMail','TRK00015'),(16,16,1,'2026-01-17','2026-01-20','DHL','TRK00016'),(17,17,2,'2026-01-18',NULL,'DPD','TRK00017'),(18,18,3,'2026-01-19',NULL,'DHL','TRK00018'),(19,19,4,NULL,NULL,NULL,NULL),(20,20,5,'2026-01-21',NULL,'RoyalMail','TRK00020'),(21,21,1,'2026-01-22','2026-01-25','DHL','TRK00021'),(22,22,2,'2026-01-23',NULL,'DPD','TRK00022'),(23,23,3,'2026-01-24',NULL,'DHL','TRK00023'),(24,24,4,NULL,NULL,NULL,NULL),(25,25,5,'2026-01-26',NULL,'RoyalMail','TRK00025'),(26,26,1,'2026-01-27','2026-01-30','DHL','TRK00026'),(27,27,2,'2026-01-28',NULL,'DPD','TRK00027'),(28,28,3,'2026-01-29',NULL,'DHL','TRK00028'),(29,29,4,NULL,NULL,NULL,NULL),(30,30,5,'2026-01-31',NULL,'RoyalMail','TRK00030'),(31,31,1,'2026-02-01','2026-02-04','DHL','TRK00031'),(32,32,2,'2026-02-02',NULL,'DPD','TRK00032'),(33,33,3,'2026-02-03',NULL,'DHL','TRK00033'),(34,34,4,NULL,NULL,NULL,NULL),(35,35,5,'2026-02-05',NULL,'RoyalMail','TRK00035'),(36,36,1,'2026-02-06','2026-02-09','DHL','TRK00036'),(37,37,2,'2026-02-07',NULL,'DPD','TRK00037'),(38,38,3,'2026-02-08',NULL,'DHL','TRK00038'),(39,39,4,NULL,NULL,NULL,NULL),(40,40,5,'2026-02-10',NULL,'RoyalMail','TRK00040');
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(120) NOT NULL,
  `contact_phone` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `supplier_name` (`supplier_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Supplier_1','+44123000001'),(2,'Supplier_2','+44123000002'),(3,'Supplier_3','+44123000003'),(4,'Supplier_4','+44123000004'),(5,'Supplier_5','+44123000005'),(6,'Supplier_6','+44123000006'),(7,'Supplier_7','+44123000007'),(8,'Supplier_8','+44123000008'),(9,'Supplier_9','+44123000009'),(10,'Supplier_10','+44123000010'),(11,'Supplier_11','+44123000011'),(12,'Supplier_12','+44123000012'),(13,'Supplier_13','+44123000013'),(14,'Supplier_14','+44123000014'),(15,'Supplier_15','+44123000015'),(16,'Supplier_16','+44123000016'),(17,'Supplier_17','+44123000017'),(18,'Supplier_18','+44123000018'),(19,'Supplier_19','+44123000019'),(20,'Supplier_20','+44123000020');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `warehouse_id` int NOT NULL AUTO_INCREMENT,
  `warehouse_name` varchar(80) NOT NULL,
  `city` varchar(60) NOT NULL,
  PRIMARY KEY (`warehouse_id`),
  UNIQUE KEY `warehouse_name` (`warehouse_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Warehouse_North','Manchester'),(2,'Warehouse_South','London'),(3,'Warehouse_Mid','Birmingham'),(4,'Warehouse_East','Leeds'),(5,'Warehouse_West','Glasgow');
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

-- Dump completed on 2026-01-30 22:34:10
