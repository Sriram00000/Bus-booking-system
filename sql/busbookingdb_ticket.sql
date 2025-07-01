-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: busbookingdb
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_date` datetime(6) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `fare` int NOT NULL,
  `passenger_count` int NOT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `used` bit(1) NOT NULL,
  `bus_route_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2ns1hntuiw2m98ys5v0uwh9xn` (`bus_route_id`),
  KEY `FKdvt57mcco3ogsosi97odw563o` (`user_id`),
  CONSTRAINT `FK2ns1hntuiw2m98ys5v0uwh9xn` FOREIGN KEY (`bus_route_id`) REFERENCES `bus_route` (`id`),
  CONSTRAINT `FKdvt57mcco3ogsosi97odw563o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'2025-06-25 14:37:04.420000','Koti',103,1,'null_pass000@ex.com_127K','Kondapur',_binary '\0',28,8),(2,'2025-06-26 10:38:53.068000','Koti',103,1,'null_pass000@ex.com_127K','Kondapur',_binary '\0',28,8),(3,'2025-06-26 10:55:07.839000','Koti',103,1,'3_pass000@ex.com_127K','Kondapur',_binary '\0',28,8),(4,'2025-06-26 10:55:49.531000','Koti',103,1,'4_pass000@ex.com_127K','Kondapur',_binary '\0',28,8),(5,'2025-06-26 10:56:06.478000','Koti',103,1,'5_pass000@ex.com_127K','Kondapur',_binary '\0',28,8),(6,'2025-06-27 09:39:47.886000','Ameerpet',70,1,'6_pass000@ex.com_10H','Kondapur',_binary '',29,8),(7,'2025-06-27 10:06:22.434000','MLA colony',58,1,'7_pass000@ex.com_127K','Kondapur',_binary '',28,8),(8,'2025-06-27 10:37:07.535000','MLA colony',58,1,'8_pass000@ex.com_127K','Kondapur',_binary '\0',28,8),(9,'2025-06-27 10:40:24.626000','MLA colony',58,1,'9_pass000@ex.com_127K','Kondapur',_binary '\0',28,8),(10,'2025-06-27 10:43:29.831000','MLA colony',58,1,'10_pass000@ex.com_127K','Kondapur',_binary '\0',28,8),(11,'2025-06-27 11:03:50.737000','MLA colony',58,1,'11_pass000@ex.com_127K','Kondapur',_binary '\0',28,8),(12,'2025-06-27 11:31:43.454000','MLA colony',58,1,'12_pass000@ex.com_127K','Kondapur',_binary '\0',28,8),(13,'2025-06-27 12:25:25.766000','MLA colony',58,1,'Ticket ID: 13\nEmail: pass000@ex.com\nRoute: 127K\nSource: Kondapur\nDestination: MLA colony\nFare: ₹58\nDate: Fri Jun 27 12:25:25 IST 2025','Kondapur',_binary '\0',28,8),(14,'2025-06-27 12:28:31.092000','MLA colony',58,1,'Ticket ID: 14\nEmail: pass000@ex.com\nRoute: 127K\nSource: Kondapur\nDestination: MLA colony\nFare: ₹58\nDate: Fri Jun 27 12:28:31 IST 2025','Kondapur',_binary '\0',28,8),(15,'2025-06-27 12:37:15.054000','MLA colony',58,1,'Ticket ID: 15\nEmail: pass000@ex.com\nRoute: 127K\nSource: Kondapur\nDestination: MLA colony\nFare: ₹58\nDate: Fri Jun 27 12:37:15 IST 2025','Kondapur',_binary '\0',28,8),(16,'2025-06-27 13:01:45.666000','MLA colony',58,1,'Ticket ID: 16\nEmail: pass000@ex.com\nRoute: 127K\nSource: Kondapur\nDestination: MLA colony\nFare: ₹58\nDate: Fri Jun 27 13:01:45 IST 2025','Kondapur',_binary '\0',28,8),(17,'2025-06-27 13:08:05.522000','MLA colony',58,1,'Ticket ID: 17\nEmail: pass000@ex.com\nRoute: 127K\nSource: Kondapur\nDestination: MLA colony\nFare: ₹58\nDate: Fri Jun 27 13:08:05 IST 2025','Kondapur',_binary '\0',28,8),(18,'2025-06-27 13:09:13.231000','MLA colony',58,1,'Ticket ID: 18\nEmail: pass000@ex.com\nRoute: 127K\nSource: Kondapur\nDestination: MLA colony\nFare: ₹58\nDate: Fri Jun 27 13:09:13 IST 2025','Kondapur',_binary '\0',28,8),(19,'2025-06-27 13:19:32.637000','MLA colony',58,1,'Ticket ID: 19\nEmail: pass000@ex.com\nRoute: 127K\nSource: Kondapur\nDestination: MLA colony\nFare: ₹58\nDate: Fri Jun 27 13:19:32 IST 2025','Kondapur',_binary '\0',28,8),(20,'2025-06-27 13:41:40.528000','MLA colony',58,1,'Ticket ID: 20\nEmail: pass000@ex.com\nRoute: 127K\nSource: Kondapur\nDestination: MLA colony\nFare: ₹58\nDate: Fri Jun 27 13:41:40 IST 2025','Kondapur',_binary '\0',28,8),(21,'2025-06-27 13:47:53.364000','MLA colony',58,1,'Ticket ID: 21\nEmail: pass000@ex.com\nRoute: 127K\nSource: Kondapur\nDestination: MLA colony\nFare: ₹58\nDate: Fri Jun 27 13:47:53 IST 2025','Kondapur',_binary '\0',28,8),(22,'2025-06-27 15:00:50.275000','MLA colony',58,1,'Ticket ID: 22\nEmail: pass000@ex.com\nRoute: 127K\nSource: Kondapur\nDestination: MLA colony\nFare: ₹58\nDate: Fri Jun 27 15:00:50 IST 2025','Kondapur',_binary '\0',28,8);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-01 11:35:40
