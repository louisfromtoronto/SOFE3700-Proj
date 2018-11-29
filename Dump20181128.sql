-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: nodemysql
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Carts`
--

DROP TABLE IF EXISTS `Carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Carts` (
  `Cart_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cart_ID`),
  KEY `Order_ID` (`Order_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `products` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carts`
--

LOCK TABLES `Carts` WRITE;
/*!40000 ALTER TABLE `Carts` DISABLE KEYS */;
INSERT INTO `Carts` VALUES (1,100,0,2),(2,200,7,1),(3,300,24,1),(4,400,19,2),(5,500,13,3),(6,600,7,1);
/*!40000 ALTER TABLE `Carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Categories` (
  `Category_ID` int(11) NOT NULL,
  `Description` varchar(100) NOT NULL,
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (1,'CPU'),(2,'Motherboard'),(3,'Memory'),(4,'Storage'),(5,'Video Card'),(6,'Case');
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customers` (
  `Customer_ID` int(11) NOT NULL,
  `CustomerName` varchar(55) NOT NULL,
  `CustomerPhone` varchar(55) NOT NULL,
  `CustomerAddress` varchar(100) NOT NULL,
  `BillingAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Smith John','(492) 416-8135','Clippers Quay-Manchester-UK','Clippers Quay-Manchester-UK'),(2,'Mark Wiliams','(405) 445-7951','1 Goodman Yard-London-UK','1 Goodman Yard-London-UK'),(3,'Harsh Gorge','(971) 387-4124','10 Drury Ln-London-UK','10 Drury Ln-London-UK'),(4,'Wiliam Peter','(656) 796-2267','372 Strand-London-UK','372 Strand-London-UK'),(5,'Mark Smith','(808) 512-9463','1 Goodman Yard-Hamilton-UK','1 Goodman Yard-Hamilton-UK'),(6,'Ibrahim Abdo','289-600-1565','21-155 Glovers Rd','21-155 Glovers Rd');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Orders` (
  `Order_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `OrderTotal` float DEFAULT NULL,
  `OrderDate` varchar(55) NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (100,1,997.5,'11/5/2018'),(200,2,209,'10/26/2018'),(300,3,59.99,'9/29/2018'),(400,4,679.98,'11/2/2018'),(500,5,143.97,'11/3/2018'),(600,6,209,'10/28/2018');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Products` (
  `Product_ID` int(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL,
  `Category_ID` int(11) NOT NULL,
  `ProductName` varchar(55) NOT NULL,
  `Price` float DEFAULT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `Supplier_ID` (`Supplier_ID`),
  KEY `Category_ID` (`Category_ID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `suppliers` (`supplier_id`) ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`Category_ID`) REFERENCES `categories` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (0,1,1,'Intel Core i5-8600K',498.75),(1,1,1,'iPhone X',1000),(4,1,2,'Asus ROG STRIX Z370-E GAMING',264),(7,1,1,'Google Pixel XL',500),(10,1,3,'G.Skill Trident Z RGB ',204.99),(12,1,3,'G.Skill Aegis ',160.99),(13,1,1,'Galaxy Note 8',1000),(14,1,4,'Seagate ST2000DM006',73.75),(17,1,5,'Asus STRIX-GTX1080TI-11G-GAMING',1067.99),(19,1,5,'MSI GeForce GTX 1060 6GT OCV1',339.99),(21,1,6,'NZXT H500 (Black)',99.49),(23,1,6,'NZXT H500 (White)',98.99),(24,1,1,'OnePlus Two',200);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shipping`
--

DROP TABLE IF EXISTS `Shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Shipping` (
  `Shipping_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `ShipDate` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`Shipping_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipping`
--

LOCK TABLES `Shipping` WRITE;
/*!40000 ALTER TABLE `Shipping` DISABLE KEYS */;
INSERT INTO `Shipping` VALUES (1,100,'11/6/2018'),(2,200,'10/27/2018'),(3,300,'9/30/2018'),(4,400,'11/3/2018'),(5,500,'11/4/2018'),(6,600,'10/29/2018');
/*!40000 ALTER TABLE `Shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suppliers`
--

DROP TABLE IF EXISTS `Suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Suppliers` (
  `Supplier_ID` int(11) NOT NULL,
  `SupplierName` varchar(55) NOT NULL,
  `SupplierContact` varchar(55) NOT NULL,
  PRIMARY KEY (`Supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suppliers`
--

LOCK TABLES `Suppliers` WRITE;
/*!40000 ALTER TABLE `Suppliers` DISABLE KEYS */;
INSERT INTO `Suppliers` VALUES (1,'Apple','apple.ca'),(2,'Canada Computers','905-240-7266'),(3,'Amazon','1-877-586-3230'),(4,'Alibaba','2242335233'),(5,'Tiger Direct','13054152201'),(6,'AliExpress','416-555-0147');
/*!40000 ALTER TABLE `Suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symbols`
--

DROP TABLE IF EXISTS `symbols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `symbols` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symbols`
--

LOCK TABLES `symbols` WRITE;
/*!40000 ALTER TABLE `symbols` DISABLE KEYS */;
INSERT INTO `symbols` VALUES (21,'AAPL'),(22,'GOOG'),(23,'TSLA'),(24,'BBY'),(25,'BBY');
/*!40000 ALTER TABLE `symbols` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-28 21:37:27
