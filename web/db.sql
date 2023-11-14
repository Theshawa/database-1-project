-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: pharmalink
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `condition_report`
--

DROP TABLE IF EXISTS `condition_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condition_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `details` varchar(1024) DEFAULT NULL,
  `date_time` datetime NOT NULL,
  `pharmacist` int NOT NULL,
  `patient` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkConditionEmployee` (`pharmacist`),
  KEY `fkConditionPatient` (`patient`),
  CONSTRAINT `fkConditionEmployee` FOREIGN KEY (`pharmacist`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkConditionPatient` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condition_report`
--

LOCK TABLES `condition_report` WRITE;
/*!40000 ALTER TABLE `condition_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `condition_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient` int NOT NULL,
  `date_time` datetime NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkDeliveryPatient` (`patient`),
  CONSTRAINT `fkDeliveryPatient` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_medication`
--

DROP TABLE IF EXISTS `delivery_medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_medication` (
  `delivery` int NOT NULL,
  `medication` int NOT NULL,
  `qty` float NOT NULL,
  PRIMARY KEY (`delivery`,`medication`),
  KEY `fkDeliveryMedicationMedication` (`medication`),
  CONSTRAINT `fkDeliveryMedicationDelivery` FOREIGN KEY (`delivery`) REFERENCES `delivery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkDeliveryMedicationMedication` FOREIGN KEY (`medication`) REFERENCES `medication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_medication`
--

LOCK TABLES `delivery_medication` WRITE;
/*!40000 ALTER TABLE `delivery_medication` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis_report`
--

DROP TABLE IF EXISTS `diagnosis_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis_report` (
  `code` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `details` varchar(1024) DEFAULT NULL,
  `date_time` datetime NOT NULL,
  `pharmacist` int NOT NULL,
  PRIMARY KEY (`code`),
  KEY `fkDiagnosisReportEmployee` (`pharmacist`),
  CONSTRAINT `fkDiagnosisReportEmployee` FOREIGN KEY (`pharmacist`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis_report`
--

LOCK TABLES `diagnosis_report` WRITE;
/*!40000 ALTER TABLE `diagnosis_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnosis_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis_report_condition`
--

DROP TABLE IF EXISTS `diagnosis_report_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis_report_condition` (
  `diagnosis_report` varchar(100) NOT NULL,
  `condition_report` int NOT NULL,
  PRIMARY KEY (`diagnosis_report`,`condition_report`),
  KEY `fkDiagnosisReportConditionCondition` (`condition_report`),
  CONSTRAINT `fkDiagnosisReportConditionCondition` FOREIGN KEY (`condition_report`) REFERENCES `condition_report` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkDiagnosisReportConditionReport` FOREIGN KEY (`diagnosis_report`) REFERENCES `diagnosis_report` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis_report_condition`
--

LOCK TABLES `diagnosis_report_condition` WRITE;
/*!40000 ALTER TABLE `diagnosis_report_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnosis_report_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direct_purchase`
--

DROP TABLE IF EXISTS `direct_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direct_purchase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medication` int NOT NULL,
  `patient` int NOT NULL,
  `qty` float NOT NULL,
  `date_time` datetime NOT NULL,
  `total_cost` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkDirectPurchasePatient` (`patient`),
  KEY `fkDirectPurchaseMedication` (`medication`),
  CONSTRAINT `fkDirectPurchaseMedication` FOREIGN KEY (`medication`) REFERENCES `medication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkDirectPurchasePatient` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direct_purchase`
--

LOCK TABLES `direct_purchase` WRITE;
/*!40000 ALTER TABLE `direct_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `direct_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispense`
--

DROP TABLE IF EXISTS `dispense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispense` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medication` int NOT NULL,
  `patient` int NOT NULL,
  `qty` float NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkDispensePatient` (`patient`),
  KEY `fkDispenseMedication` (`medication`),
  CONSTRAINT `fkDispenseMedication` FOREIGN KEY (`medication`) REFERENCES `medication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkDispensePatient` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispense`
--

LOCK TABLES `dispense` WRITE;
/*!40000 ALTER TABLE `dispense` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `reg_no` varchar(255) DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `hire_date` date NOT NULL,
  `department` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkEmployeeDepartment` (`department`),
  CONSTRAINT `fkEmployeeDepartment` FOREIGN KEY (`department`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` int NOT NULL,
  `shelf` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkMedicationMedicationCategory` (`category`),
  KEY `fkMedicationShelf` (`shelf`),
  CONSTRAINT `fkMedicationMedicationCategory` FOREIGN KEY (`category`) REFERENCES `medication_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkMedicationShelf` FOREIGN KEY (`shelf`) REFERENCES `shelf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication_category`
--

DROP TABLE IF EXISTS `medication_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_category`
--

LOCK TABLES `medication_category` WRITE;
/*!40000 ALTER TABLE `medication_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `medication_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pharmacist` int NOT NULL,
  `diagnosis` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkPrescriptionEmployee` (`pharmacist`),
  KEY `fkPrescriptionDiagnosisReport` (`diagnosis`),
  CONSTRAINT `fkPrescriptionDiagnosis` FOREIGN KEY (`diagnosis`) REFERENCES `diagnosis_report` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkPrescriptionEmployee` FOREIGN KEY (`pharmacist`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription_medication`
--

DROP TABLE IF EXISTS `prescription_medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_medication` (
  `prescription` int NOT NULL,
  `medication` int NOT NULL,
  KEY `fkPrescriptionMedicationPrescription` (`prescription`),
  KEY `fkPrescriptionMedicationMedication` (`medication`),
  CONSTRAINT `fkPrescriptionMedicationMedication` FOREIGN KEY (`medication`) REFERENCES `medication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkPrescriptionMedicationPrescription` FOREIGN KEY (`prescription`) REFERENCES `prescription` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_medication`
--

LOCK TABLES `prescription_medication` WRITE;
/*!40000 ALTER TABLE `prescription_medication` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription_medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shelf`
--

DROP TABLE IF EXISTS `shelf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shelf` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelf`
--

LOCK TABLES `shelf` WRITE;
/*!40000 ALTER TABLE `shelf` DISABLE KEYS */;
/*!40000 ALTER TABLE `shelf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `reg_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply` (
  `medication` int NOT NULL,
  `supplier` int NOT NULL,
  `qty` float NOT NULL,
  `unit_cost` float NOT NULL,
  `total_cost` float NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`medication`,`supplier`),
  KEY `fkSupplySupplier` (`supplier`),
  CONSTRAINT `fkSupplyMedication` FOREIGN KEY (`medication`) REFERENCES `medication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkSupplySupplier` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply`
--

LOCK TABLES `supply` WRITE;
/*!40000 ALTER TABLE `supply` DISABLE KEYS */;
/*!40000 ALTER TABLE `supply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-14 22:51:40
