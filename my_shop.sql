-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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
-- Table structure for table `group_product`
--

DROP TABLE IF EXISTS `group_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_product`
--

LOCK TABLES `group_product` WRITE;
/*!40000 ALTER TABLE `group_product` DISABLE KEYS */;
INSERT INTO `group_product` VALUES (1,'name1'),(2,'name2'),(3,'name3'),(4,'name4');
/*!40000 ALTER TABLE `group_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_users`
--

DROP TABLE IF EXISTS `group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_users`
--

LOCK TABLES `group_users` WRITE;
/*!40000 ALTER TABLE `group_users` DISABLE KEYS */;
INSERT INTO `group_users` VALUES (1,'group1'),(2,'group2'),(3,'group3');
/*!40000 ALTER TABLE `group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `total_price` float NOT NULL,
  `id_order` bigint NOT NULL,
  `id_prod` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_FK` (`id_order`),
  CONSTRAINT `order_product_FK` FOREIGN KEY (`id_order`) REFERENCES `some_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,1,0.8,30,1),(2,2,1.2,31,1),(3,2,1.2,32,2),(4,3,6.2,33,3),(5,1,5.5,34,4),(6,3,0.2,35,5),(7,4,0.01,36,1),(8,1,4.6,37,2),(9,2,7.8,38,3);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_p` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `in_stock` int NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_FK` (`id_category`),
  CONSTRAINT `products_FK` FOREIGN KEY (`id_category`) REFERENCES `group_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'product1',5.23,1,1),(2,'new_name_product',100,0,2),(3,'product3',0.36,1,3),(4,'product4',0.55,1,4),(5,'product5',0.33,1,1),(6,'product6',14.5,1,2),(7,'product7',1.98,1,3),(8,'product8',12.3,1,4),(9,'product9',5.33,1,1),(10,'product10',4.33,1,2),(11,'product11',7.12,1,3),(12,'product12',11.3,1,4),(13,'product13',12.88,1,1),(14,'product14',0.2,1,2),(15,'product15',0.01,1,3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `some_order`
--

DROP TABLE IF EXISTS `some_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `some_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_user` bigint NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `summ_order` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `some_order_id_user_IDX` (`id_user`) USING BTREE,
  CONSTRAINT `order_FK` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `some_order`
--

LOCK TABLES `some_order` WRITE;
/*!40000 ALTER TABLE `some_order` DISABLE KEYS */;
INSERT INTO `some_order` VALUES (30,1,'2021-01-28 16:50:45',22.6),(31,4,'2021-01-28 16:50:45',17.1),(32,1,'2021-01-28 16:50:45',9.8),(33,6,'2021-01-28 16:50:45',4.02),(34,5,'2021-01-28 16:50:45',7.09),(35,4,'2021-01-28 16:50:45',0.1),(36,2,'2021-01-28 16:50:45',12.61),(37,3,'2021-01-28 16:50:45',6.65),(38,1,'2021-01-28 16:50:45',4.23),(39,1,'2021-01-16 16:50:45',1);
/*!40000 ALTER TABLE `some_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `second_name` varchar(100) NOT NULL,
  `group_id` bigint NOT NULL,
  UNIQUE KEY `users_UN` (`id`),
  KEY `users_FK` (`group_id`),
  KEY `users_id_IDX` (`id`,`group_id`) USING BTREE,
  CONSTRAINT `users_FK` FOREIGN KEY (`group_id`) REFERENCES `group_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Poll','Abrakham',2),(2,'Tom','Jonson',3),(3,'Fill','Gratham',1),(4,'Jack','Samiul',3),(5,'Jonny','Brely',2),(6,'Tim','Holpic',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-28 19:25:58
