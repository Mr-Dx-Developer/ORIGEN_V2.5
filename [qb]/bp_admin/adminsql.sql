-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.21-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- origenv1qb için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `origenv1qb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `origenv1qb`;

-- tablo yapısı dökülüyor origenv1qb.admin_bans
CREATE TABLE IF NOT EXISTS `admin_bans` (
  `playerid` varchar(70) DEFAULT NULL,
  `playername` varchar(50) DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `license` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- origenv1qb.admin_bans: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `admin_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_bans` ENABLE KEYS */;

-- tablo yapısı dökülüyor origenv1qb.admin_logs
CREATE TABLE IF NOT EXISTS `admin_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_message` longtext NOT NULL,
  `log_playerid` longtext DEFAULT NULL,
  `log_playername` longtext DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- origenv1qb.admin_logs: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `admin_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_logs` ENABLE KEYS */;

-- tablo yapısı dökülüyor origenv1qb.admin_objects
CREATE TABLE IF NOT EXISTS `admin_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectinfos` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- origenv1qb.admin_objects: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `admin_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_objects` ENABLE KEYS */;

-- tablo yapısı dökülüyor origenv1qb.admin_perms
CREATE TABLE IF NOT EXISTS `admin_perms` (
  `playerid` longtext DEFAULT NULL,
  `permlevel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- origenv1qb.admin_perms: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `admin_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_perms` ENABLE KEYS */;

-- tablo yapısı dökülüyor origenv1qb.admin_tickets
CREATE TABLE IF NOT EXISTS `admin_tickets` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_owner` longtext DEFAULT NULL,
  `ticket_ownername` longtext DEFAULT NULL,
  `ticket_time` longtext DEFAULT NULL,
  `ticket_msg` longtext DEFAULT '[]',
  `ticket_top` longtext DEFAULT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9778 DEFAULT CHARSET=utf8mb4;

-- origenv1qb.admin_tickets: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `admin_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_tickets` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
