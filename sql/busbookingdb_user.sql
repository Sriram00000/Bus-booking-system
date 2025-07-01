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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `approved` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','CONDUCTOR','PASSENGER') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,_binary '','pass1@ex.com','pass1','$2a$10$fmQzm71KISinJiIcvkFx1O7UKt3qQDxdfxrKWRdv0OEvbkiJyHcp2','PASSENGER'),(5,_binary '','pass2@ex.com','pass2','$2a$10$0iGtkpdXtkTH8N4E4hf22ukCD7sALmXjUv8m2Y/J4niIZ3bBkUJMu','PASSENGER'),(6,_binary '','admin@bus.com','Admin','$2a$10$wUkijrmgsSZ1uu7XSQS5FuP0mCLjuJLML470ux3hqW5pSauPv9er6','ADMIN'),(7,_binary '','pass0@ex.com','pass0','$2a$10$VQP2mCotaxyh8pyZpPuFMOByJtQ5V2m/lF2hSYeIaXRLhAs3sV46.','PASSENGER'),(8,_binary '','pass000@ex.com','pass000','$2a$10$E613EUvHapslNg3mSEB1SuF4YuVwrBt6W6AMWtaGpbdAu7pZWZHXW','PASSENGER'),(9,_binary '\0','cond000@ex.com','cond000','$2a$10$tUo2uqdSWkSXECqce3eNbeS1XWJOVPBVJBV7CG1/o3w7fLx0zb5HW','CONDUCTOR'),(10,_binary '\0','cond003@ex.com','cond003','$2a$10$I/3DT8UeUpfQ91kiA9jgHuID.uKmTwM4.7Ux/pnfiYIQBgqnuXtke','CONDUCTOR'),(11,_binary '\0','cond111@ex.com','Ravi Kumar','$2a$10$qIPm9kioquQJByfdaqUpS.R2stv3Pb7VDSLq0qYNLFKbLaJldtfMa','CONDUCTOR'),(12,_binary '\0','cond101@ex.com','Ravi Kumar','$2a$10$vrA7J.GwV8Yp4EhUb9C17.70dNGr6v4xwPmfIFrbjmb6AzA2SBIJ2','CONDUCTOR'),(13,_binary '\0','cond201@ex.com','Ravi Kumar','$2a$10$QJV0Kulj5pGkUAGArmPjwuhfoJHJg43jP2CPhI/5/9/baLjpL2l/e','CONDUCTOR'),(14,_binary '\0','cond202@ex.com','Ravi Kumar','$2a$10$uC/Jt5E9YkLnZvReBCjXYuRXnVLK/IL/2gpylA0kbg7XdqN85bCDG','CONDUCTOR'),(15,_binary '\0','cond203@ex.com','Arjun Kumar','$2a$10$Aj6bzlY2ju4Pr2mOyaf9Ru8YMKQs0Zm/uY/zn8vnLl210o62N2hdW','CONDUCTOR'),(16,_binary '\0','cond333@ex.com','Arjun Kumar','$2a$10$q9eTwvHp649xjBqrWXic1.bDloyE9ta76t5xfc3YqQY5.YtQei91K','CONDUCTOR'),(17,_binary '\0','cond444@ex.com','Arjun Kumar','$2a$10$.uE5yG4kExN3LrwJlOyXHe8cFc3KPuCmuCTzb2gPnlO8Ezqfza42y','CONDUCTOR'),(18,_binary '\0','cond999@ex.com','Arjun Kumar','$2a$10$p1fsFExLowDh71gG.W6aeekNQVwcJ9/1AL22NwPNM84zt/GoK510e','CONDUCTOR'),(19,_binary '\0','cond808@ex.com','Arjun Kumar','$2a$10$unUWY1aT9wxC.LP2wNhv7edPylsIrbXQwIVNZnNQJOEJITa7gSyly','CONDUCTOR'),(20,_binary '\0','cond888@ex.com','Arjun Kumar','$2a$10$nzrjoPLyDqYPPKetXZKoHOubER.AnFCAovgGsFXgjIDnEnlraTRM.','CONDUCTOR'),(21,_binary '\0','cond400@ex.com','Arjun Kumar','$2a$10$lYWvt2Mi/jRaj4dxRvDspOcO636MREfRPhF32z6JDz.Ec9h.h5G6q','CONDUCTOR');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
