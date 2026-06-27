-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: worldcupstats
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `jogadores`
--

DROP TABLE IF EXISTS `jogadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogadores` (
  `JogadorId` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Clube` varchar(100) NOT NULL,
  `ValorMercado` decimal(10,2) DEFAULT NULL,
  `Gols` int DEFAULT '0',
  `Assistencias` int DEFAULT '0',
  `SelecaoId` int NOT NULL,
  PRIMARY KEY (`JogadorId`),
  KEY `SelecaoId` (`SelecaoId`),
  CONSTRAINT `jogadores_ibfk_1` FOREIGN KEY (`SelecaoId`) REFERENCES `selecoes` (`SelecaoId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogadores`
--

LOCK TABLES `jogadores` WRITE;
/*!40000 ALTER TABLE `jogadores` DISABLE KEYS */;
INSERT INTO `jogadores` VALUES (1,'Vinicius Jr','Real Madrid',170.00,7,6,1),(2,'Raphinha','Barcelona',90.00,6,9,1),(3,'Rodrygo','Real Madrid',100.00,5,4,1),(4,'Kylian Mbappé','Real Madrid',180.00,12,5,2),(5,'Ousmane Dembélé','PSG',75.00,4,11,2),(6,'Eduardo Camavinga','Real Madrid',80.00,2,5,2),(7,'Lamine Yamal','Barcelona',200.00,8,13,3),(8,'Pedri','Barcelona',120.00,4,8,3),(9,'Nico Williams','Athletic Bilbao',70.00,5,7,3),(10,'Jude Bellingham','Real Madrid',180.00,9,8,4),(11,'Harry Kane','Bayern Munich',75.00,11,4,4),(12,'Bukayo Saka','Arsenal',150.00,8,10,4);
/*!40000 ALTER TABLE `jogadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidas`
--

DROP TABLE IF EXISTS `partidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidas` (
  `PartidaId` int NOT NULL AUTO_INCREMENT,
  `CasaId` int NOT NULL,
  `VisitanteId` int NOT NULL,
  `GolsCasa` int DEFAULT '0',
  `GolsVisitante` int DEFAULT '0',
  `DataPartida` date DEFAULT NULL,
  PRIMARY KEY (`PartidaId`),
  KEY `CasaId` (`CasaId`),
  KEY `VisitanteId` (`VisitanteId`),
  CONSTRAINT `partidas_ibfk_1` FOREIGN KEY (`CasaId`) REFERENCES `selecoes` (`SelecaoId`),
  CONSTRAINT `partidas_ibfk_2` FOREIGN KEY (`VisitanteId`) REFERENCES `selecoes` (`SelecaoId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidas`
--

LOCK TABLES `partidas` WRITE;
/*!40000 ALTER TABLE `partidas` DISABLE KEYS */;
INSERT INTO `partidas` VALUES (1,1,2,3,0,'2026-06-18'),(2,3,4,2,1,'2026-06-19'),(3,1,3,1,1,'2026-06-22'),(4,2,4,0,2,'2026-06-23');
/*!40000 ALTER TABLE `partidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selecoes`
--

DROP TABLE IF EXISTS `selecoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selecoes` (
  `SelecaoId` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Grupo` char(1) DEFAULT NULL,
  PRIMARY KEY (`SelecaoId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selecoes`
--

LOCK TABLES `selecoes` WRITE;
/*!40000 ALTER TABLE `selecoes` DISABLE KEYS */;
INSERT INTO `selecoes` VALUES (1,'Brasil','A'),(2,'França','B'),(3,'Espanha','C'),(4,'Inglaterra','D');
/*!40000 ALTER TABLE `selecoes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-26 21:55:20
