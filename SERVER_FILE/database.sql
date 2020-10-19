-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for db_notes
CREATE DATABASE IF NOT EXISTS `db_notes` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_notes`;

-- Dumping structure for table db_notes.tb_notes
CREATE TABLE IF NOT EXISTS `tb_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '0',
  `note` longtext NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_notes.tb_notes: ~2 rows (approximately)
/*!40000 ALTER TABLE `tb_notes` DISABLE KEYS */;
REPLACE INTO `tb_notes` (`id`, `title`, `note`) VALUES
	(1, 'a', 's'),
	(6, 'test 2', 'test test test');
/*!40000 ALTER TABLE `tb_notes` ENABLE KEYS */;

-- Dumping structure for table db_notes.tb_user
CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_notes.tb_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
REPLACE INTO `tb_user` (`id`, `email`, `name`, `password`, `alamat`) VALUES
	(1, 'irpan@gmail.com', 'irpan', 'bb54b21dbf827fca3f19947b1b6acaea', 'samarinda'),
	(2, 'irpan2@gmail.com', 'irpan2', 'd26bb26e0ba457e7e91571f5b7ca969c', 'samarinda'),
	(3, 'flutter@gmai.com', 'Flutter', '5acebc4cb70ddbb074b0ac76aab176ae', 'samarinda');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
