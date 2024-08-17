-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



-- Dumping structure for table qbcore.mdt_config
CREATE TABLE IF NOT EXISTS `mdt_config` (
  `citizenid` VARCHAR(10) NOT NULL,
  `theme` int(11) NOT NULL,
  `sidebar` int(11) NOT NULL,
  UNIQUE KEY `citizenid` (`citizenid`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table qbcore.mdt_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_config` ENABLE KEYS */;

-- Dumping structure for table qbcore.mdt_evidences
CREATE TABLE IF NOT EXISTS `mdt_evidences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgurl` text NOT NULL,
  `description` text NOT NULL,
  `type` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcore.mdt_evidences: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_evidences` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_evidences` ENABLE KEYS */;

-- Dumping structure for table qbcore.mdt_incidents
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `persons` text NOT NULL,
  `officers` text NOT NULL,
  `evidences` text NOT NULL,
  `vehicles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`vehicles`)),
  `criminals` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcore.mdt_incidents: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_incidents` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_incidents` ENABLE KEYS */;

-- Dumping structure for table qbcore.mdt_profiles
CREATE TABLE IF NOT EXISTS `mdt_profiles` (
  `citizenid` VARCHAR(10) NOT NULL,
  `notes` text NOT NULL,
  `image` text NOT NULL,
  UNIQUE KEY `citizenid` (`citizenid`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table qbcore.mdt_profiles: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_profiles` ENABLE KEYS */;

-- Dumping structure for table qbcore.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `persons` text NOT NULL,
  `officers` text NOT NULL,
  `vehicles` text NOT NULL,
  `evidences` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcore.mdt_reports: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_reports` ENABLE KEYS */;

-- Dumping structure for table qbcore.mdt_vehicles
CREATE TABLE IF NOT EXISTS `mdt_vehicles` (
  `plate` VARCHAR(10) NOT NULL,
  `image` text NOT NULL,
  `notes` text NOT NULL,
  UNIQUE KEY `plate` (`plate`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table qbcore.mdt_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_vehicles` ENABLE KEYS */;

-- Dumping structure for table qbcore.mdt_warrants
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incident` int(11) NOT NULL,
  `citizenid` text NOT NULL,
  `date` text NOT NULL,
  `approved` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table qbcore.mdt_warrants: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_warrants` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_warrants` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
