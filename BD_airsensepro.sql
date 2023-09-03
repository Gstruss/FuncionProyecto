-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: airsensepro
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `agentesc`
--

DROP TABLE IF EXISTS `agentesc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agentesc` (
  `idagentesC` int NOT NULL,
  `nombreac` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idagentesC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agentesc`
--

LOCK TABLES `agentesc` WRITE;
/*!40000 ALTER TABLE `agentesc` DISABLE KEYS */;
/*!40000 ALTER TABLE `agentesc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencia`
--

DROP TABLE IF EXISTS `dependencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependencia` (
  `iddepe` int NOT NULL,
  `nombredepe` varchar(50) DEFAULT NULL,
  `idempresa` int DEFAULT NULL,
  PRIMARY KEY (`iddepe`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `dependencia_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencia`
--

LOCK TABLES `dependencia` WRITE;
/*!40000 ALTER TABLE `dependencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `idempresa` int NOT NULL,
  `nombreEmp` varchar(50) DEFAULT NULL,
  `Nitempresa` int DEFAULT NULL,
  `DireccionE` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento`
--

DROP TABLE IF EXISTS `mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento` (
  `idmant` int NOT NULL,
  `Tipomant` varchar(50) DEFAULT NULL,
  `Responsable` varchar(20) DEFAULT NULL,
  `fechamant` date DEFAULT NULL,
  `Obser` varchar(50) DEFAULT NULL,
  `idsensor` int DEFAULT NULL,
  PRIMARY KEY (`idmant`),
  KEY `idsensor` (`idsensor`),
  CONSTRAINT `mantenimiento_ibfk_1` FOREIGN KEY (`idsensor`) REFERENCES `sensores` (`idsensor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento`
--

LOCK TABLES `mantenimiento` WRITE;
/*!40000 ALTER TABLE `mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteoro`
--

DROP TABLE IF EXISTS `meteoro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meteoro` (
  `idmeteoro` int NOT NULL,
  `tipoMeteoro` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idmeteoro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteoro`
--

LOCK TABLES `meteoro` WRITE;
/*!40000 ALTER TABLE `meteoro` DISABLE KEYS */;
/*!40000 ALTER TABLE `meteoro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensores`
--

DROP TABLE IF EXISTS `sensores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensores` (
  `idsensor` int NOT NULL,
  `iddepe` int DEFAULT NULL,
  PRIMARY KEY (`idsensor`),
  KEY `iddepe` (`iddepe`),
  CONSTRAINT `sensores_ibfk_1` FOREIGN KEY (`iddepe`) REFERENCES `dependencia` (`iddepe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensores`
--

LOCK TABLES `sensores` WRITE;
/*!40000 ALTER TABLE `sensores` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tomainfo`
--

DROP TABLE IF EXISTS `tomainfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tomainfo` (
  `idtoma` int NOT NULL,
  `tomaA` float DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `idagentesC` int DEFAULT NULL,
  `idsensor` int DEFAULT NULL,
  PRIMARY KEY (`idtoma`),
  KEY `idagentesC` (`idagentesC`),
  KEY `idsensor` (`idsensor`),
  CONSTRAINT `tomainfo_ibfk_1` FOREIGN KEY (`idagentesC`) REFERENCES `agentesc` (`idagentesC`),
  CONSTRAINT `tomainfo_ibfk_2` FOREIGN KEY (`idsensor`) REFERENCES `sensores` (`idsensor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tomainfo`
--

LOCK TABLES `tomainfo` WRITE;
/*!40000 ALTER TABLE `tomainfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tomainfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tomameteoro`
--

DROP TABLE IF EXISTS `tomameteoro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tomameteoro` (
  `idtomameteoro` int NOT NULL,
  `tomaM` float DEFAULT NULL,
  `fechaM` datetime DEFAULT NULL,
  `idmeteoro` int DEFAULT NULL,
  `idsensor` int DEFAULT NULL,
  PRIMARY KEY (`idtomameteoro`),
  KEY `idmeteoro` (`idmeteoro`),
  KEY `idsensor` (`idsensor`),
  CONSTRAINT `tomameteoro_ibfk_1` FOREIGN KEY (`idmeteoro`) REFERENCES `meteoro` (`idmeteoro`),
  CONSTRAINT `tomameteoro_ibfk_2` FOREIGN KEY (`idsensor`) REFERENCES `sensores` (`idsensor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tomameteoro`
--

LOCK TABLES `tomameteoro` WRITE;
/*!40000 ALTER TABLE `tomameteoro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tomameteoro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL,
  `nombreU` varchar(20) DEFAULT NULL,
  `correo` varchar(70) DEFAULT NULL,
  `contraseña` varchar(20) DEFAULT NULL,
  `idempresa` int DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `idempresa` (`idempresa`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-02 22:56:15
