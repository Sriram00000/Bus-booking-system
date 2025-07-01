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
-- Table structure for table `stop`
--

DROP TABLE IF EXISTS `stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `stop_order` int NOT NULL,
  `bus_route_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo51lev9m1caw08ql19gj9ej8c` (`bus_route_id`),
  CONSTRAINT `FKo51lev9m1caw08ql19gj9ej8c` FOREIGN KEY (`bus_route_id`) REFERENCES `bus_route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=897 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stop`
--

LOCK TABLES `stop` WRITE;
/*!40000 ALTER TABLE `stop` DISABLE KEYS */;
INSERT INTO `stop` VALUES (673,'Kondapur Bus Depot',1,28),(674,'Kondapur X Road',2,28),(675,'Paulo Travels',3,28),(676,'Kothaguda Bus Stop',4,28),(677,'Kondapur',5,28),(678,'Hitex Kaman',6,28),(679,'Shilparamam',7,28),(680,'Hitech City',8,28),(681,'Image Garden Bus Stop',9,28),(682,'Madhapur Petrol Pump',10,28),(683,'Madhapur Police Station',11,28),(684,'Live Life Hospital',12,28),(685,'Rainbow Park',13,28),(686,'Peddamma Temple',14,28),(687,'Usha Kiran Movies',15,28),(688,'Jubilee Check Post',16,28),(689,'Venkatagiri (Road No–37 Check Post)',17,28),(690,'Journalist Colony',18,28),(691,'Apollo Hospital',19,28),(692,'Banjara Hills Bus Stop',20,28),(693,'MLA Colony',21,28),(694,'ACB Office',22,28),(695,'Durga Enclave',23,28),(696,'Banjara Hills Kaman',24,28),(697,'Familia Hospital',25,28),(698,'Bhola Nagar',26,28),(699,'Chintal Basti',27,28),(700,'Ambedkar Nagar',28,28),(701,'Masab Tank Bus Stop',29,28),(702,'A.C. Guards',30,28),(703,'Lakdikapul Metro Station',31,28),(704,'Assembly',32,28),(705,'Nizam College',33,28),(706,'Abids (Big Bazaar)',34,28),(707,'Bank Street Koti',35,28),(708,'Koti',36,28),(709,'Koti Bus Terminal',37,28),(710,'Kondapur Bus Depot',1,29),(711,'Kondapur X Road',2,29),(712,'Paulo Travels',3,29),(713,'Kothaguda Bus Stop',4,29),(714,'Kondapur',5,29),(715,'Hitex Kaman',6,29),(716,'Shilparamam Bus Stop',7,29),(717,'Hitech City',8,29),(718,'Image Garden',9,29),(719,'Madhapur Petrol Pump',10,29),(720,'Madhapur Police Station',11,29),(721,'Live Life Hospital',12,29),(722,'Rainbow Park',13,29),(723,'Peddamma Temple',14,29),(724,'Usha Kiran Movies',15,29),(725,'Jubilee Check Post',16,29),(726,'Venkatagiri',17,29),(727,'Srinagar X Road',18,29),(728,'Yousufguda Checkpost',19,29),(729,'Krishnakanth Park',20,29),(730,'Vengal Rao Nagar',21,29),(731,'S.R. Nagar',22,29),(732,'Mythrivanam',23,29),(733,'Ameerpet Metro Station',24,29),(734,'Ameerpet',25,29),(735,'Sheeshmahal',26,29),(736,'Lal Bungalow Ameerpet',27,29),(737,'Greenlands',28,29),(738,'Begumpet Railway Station North',29,29),(739,'Begumpet Bus Stop',30,29),(740,'Shamlal North',31,29),(741,'Begumpet',32,29),(742,'Prakash Nagar',33,29),(743,'Begumpet Police Lines',34,29),(744,'Anand Theatre',35,29),(745,'Paradise Metro Station',36,29),(746,'SD Road',37,29),(747,'Swapnalok Complex',38,29),(748,'Patny Center',39,29),(749,'Clock Tower',40,29),(750,'Gurudwara (Secunderabad Bus Station)',41,29),(751,'Chandrayangutta X Road',1,30),(752,'Falaknuma Railway Bridge',2,30),(753,'Engine Bowli',3,30),(754,'Shamsheergunj',4,30),(755,'Aliyabad',5,30),(756,'Sayed Ali Chabutra',6,30),(757,'Lal Dharwaza Mode',7,30),(758,'Shah Ali Banda X Road',8,30),(759,'Himmathpura / Shah Ali Banda',9,30),(760,'Chowmahalla Palace',10,30),(761,'Khilwat',11,30),(762,'Lah Bazar',12,30),(763,'Moosa Bowli',13,30),(764,'City College',14,30),(765,'High Court',15,30),(766,'Nayapul',16,30),(767,'Afzalgunj',17,30),(768,'Osmangunj',18,30),(769,'Mozamjahi Market',19,30),(770,'Abids (G.P.O.)',20,30),(771,'Latha Talkies',21,30),(772,'Nampally Railway Station',22,30),(773,'Nampally Public Garden',23,30),(774,'LB Stadium',24,30),(775,'Basheerbagh',25,30),(776,'Liberty',26,30),(777,'Liberty – GHMC',27,30),(778,'Mini Tankbund',28,30),(779,'Tank Bund',29,30),(780,'Boats Club',30,30),(781,'Bible House',31,30),(782,'Bata',32,30),(783,'Patny Center',33,30),(784,'Clock Tower',34,30),(785,'Sangeeth',35,30),(786,'Keys High School',36,30),(787,'Secunderabad Railway Station',37,30),(788,'Uppal Bus Station',1,31),(789,'Uppal Gandhi Statue',2,31),(790,'Uppal Sub Station',3,31),(791,'Uppal X Roads',4,31),(792,'Ramanthapur Church',5,31),(793,'HPS Bus Stop',6,31),(794,'Ramanthapur Colony',7,31),(795,'Ramanthapur',8,31),(796,'Polytechnic College',9,31),(797,'Irani Hotel Bus Stop',10,31),(798,'Che Number Bus Stop',11,31),(799,'Tilak Nagar',12,31),(800,'Fever Hospital',13,31),(801,'Barkatpura',14,31),(802,'Baghlingampally',15,31),(803,'Chikkadpally',16,31),(804,'Narayanaguda',17,31),(805,'Urdu Hall Bus Stop',18,31),(806,'Liberty',19,31),(807,'Telephone Bhavan',20,31),(808,'A.C. Guards',21,31),(809,'Masab Tank',22,31),(810,'N.M.D.C.',23,31),(811,'Sarojini Devi Eye Hospital',24,31),(812,'Mehdipatnam Bus Station',25,31),(813,'L.B. Nagar',1,32),(814,'Kothapet',2,32),(815,'Dilsukhnagar',3,32),(816,'Chaitanyapuri',4,32),(817,'Kothapet Fruit Market',5,32),(818,'Moosarambagh',6,32),(819,'Malakpet',7,32),(820,'Nalgonda X Roads',8,32),(821,'Koti',9,32),(822,'Abids',10,32),(823,'Nampally',11,32),(824,'Lakdikapul',12,32),(825,'Masab Tank',13,32),(826,'Mehdipatnam',14,32),(827,'Rethibowli',15,32),(828,'Toli Chowki',16,32),(829,'Shaikpet',17,32),(830,'Raidurg',18,32),(831,'Gachibowli',19,32),(832,'Wipro Circle',20,32),(833,'Miyapur X Roads',21,32),(834,'Miyapur',22,32),(835,'Secunderabad',1,33),(836,'Rasoolpura',2,33),(837,'Begumpet',3,33),(838,'Greenlands',4,33),(839,'Punjagutta',5,33),(840,'Ameerpet',6,33),(841,'S.R. Nagar',7,33),(842,'Erragadda',8,33),(843,'E.S.I. Hospital',9,33),(844,'Bharat Nagar',10,33),(845,'Moosapet',11,33),(846,'Kukatpally',12,33),(847,'KPHB',13,33),(848,'Miyapur',14,33),(849,'Bachupally',15,33),(850,'Nizampet',16,33),(851,'Koti',1,34),(852,'Kachiguda',2,34),(853,'Chikkadpally',3,34),(854,'RTC X Roads',4,34),(855,'Vidyut Soudha',5,34),(856,'Musheerabad',6,34),(857,'Ashok Nagar',7,34),(858,'Ramnagar',8,34),(859,'Adikmet',9,34),(860,'Osmania University',10,34),(861,'Tarnaka',11,34),(862,'Habsiguda',12,34),(863,'Nacharam',13,34),(864,'Mallapur',14,34),(865,'H.M.T. Nagar',15,34),(866,'Mehdipatnam',1,35),(867,'Humayun Nagar',2,35),(868,'Masab Tank',3,35),(869,'Lakdikapul',4,35),(870,'Nampally',5,35),(871,'Abids',6,35),(872,'Koti',7,35),(873,'M.J. Market',8,35),(874,'Chaderghat',9,35),(875,'Dabeerpura',10,35),(876,'Yakutpura',11,35),(877,'Saidabad',12,35),(878,'Chanchalguda',13,35),(879,'IS Sadan',14,35),(880,'Santoshnagar',15,35),(881,'DRDL',16,35),(882,'Kanchanbagh',17,35),(883,'ECIL',1,36),(884,'Kushaiguda',2,36),(885,'Malkajgiri',3,36),(886,'Lalaguda',4,36),(887,'Tarnaka',5,36),(888,'Osmania University',6,36),(889,'Adikmet',7,36),(890,'Ramnagar',8,36),(891,'Chikkadpally',9,36),(892,'RTC X Roads',10,36),(893,'Himayatnagar',11,36),(894,'Narayanaguda',12,36),(895,'Kachiguda',13,36),(896,'Koti',14,36);
/*!40000 ALTER TABLE `stop` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-01 11:35:41
