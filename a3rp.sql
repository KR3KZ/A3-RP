-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.4.11-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour a3rp
DROP DATABASE IF EXISTS `a3rp`;
CREATE DATABASE IF NOT EXISTS `a3rp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `a3rp`;

-- Listage de la structure de la table a3rp. account
DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam_id` varchar(17) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `steam_id` (`steam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.account : ~1 rows (environ)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `steam_id`) VALUES
	(41, '76561198108858505');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- Listage de la structure de la table a3rp. bank
DROP TABLE IF EXISTS `bank`;
CREATE TABLE IF NOT EXISTS `bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bank_player_id` (`player_id`),
  CONSTRAINT `FK_bank_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.bank : ~0 rows (environ)
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;

-- Listage de la structure de la table a3rp. player
DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(17) NOT NULL,
  `side_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cash` int(11) NOT NULL,
  `gear` varchar(5000) NOT NULL,
  `pos_atl_x` float NOT NULL DEFAULT 0,
  `pos_atl_y` float NOT NULL DEFAULT 0,
  `pos_atl_z` float NOT NULL DEFAULT 0,
  `dir` float NOT NULL DEFAULT 0,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique_account_side_name` (`side_id`,`name`,`account_id`),
  KEY `FK_player_account_id` (`account_id`),
  CONSTRAINT `FK_player_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FK_player_side_id` FOREIGN KEY (`side_id`) REFERENCES `side` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.player : ~2 rows (environ)
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` (`id`, `account_id`, `side_id`, `name`, `cash`, `gear`, `pos_atl_x`, `pos_atl_y`, `pos_atl_z`, `dir`, `creation_date`) VALUES
	(75, 41, 1, 'Joe Clarks', 0, '[["arifle_AKM_F","","","",["30Rnd_762x39_Mag_F",30],[],""],[],[],["U_C_Uniform_Farmer_01_F",[]],[],["B_FieldPack_blk",[["30Rnd_762x39_Mag_F",2,30]]],"H_Cap_blu","",[],["","","","","",""]]', 10669.6, 12269.2, 0.00144386, 126.314, '2020-10-28 21:22:54');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;

-- Listage de la structure de la table a3rp. side
DROP TABLE IF EXISTS `side`;
CREATE TABLE IF NOT EXISTS `side` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.side : ~4 rows (environ)
/*!40000 ALTER TABLE `side` DISABLE KEYS */;
INSERT INTO `side` (`id`, `type`) VALUES
	(1, 'CIV'),
	(2, 'WEST'),
	(3, 'GUER'),
	(4, 'EAST');
/*!40000 ALTER TABLE `side` ENABLE KEYS */;

-- Listage de la structure de la table a3rp. vehicle
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE IF NOT EXISTS `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(50) NOT NULL,
  `damage` varchar(5000) NOT NULL,
  `pos_atl_x` float NOT NULL DEFAULT 0,
  `pos_atl_y` float NOT NULL DEFAULT 0,
  `pos_atl_z` float NOT NULL DEFAULT 0,
  `dir` float NOT NULL DEFAULT 0,
  `alive` int(1) NOT NULL DEFAULT 1,
  `stored` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.vehicle : ~1 rows (environ)
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` (`id`, `classname`, `damage`, `pos_atl_x`, `pos_atl_y`, `pos_atl_z`, `dir`, `alive`, `stored`) VALUES
	(54, 'C_Offroad_01_F', '[0,0,0,0,0,0.0847449,0.388384,0.56715,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 3715.88, 12972.7, 0.00930786, 356.853, 1, 0),
	(55, 'B_G_Offroad_01_F', '[0.0778753,1,0,0,0.0324283,0,0.100965,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 3729.62, 12980.9, 0.105398, 177.417, 1, 0),
	(56, 'B_Truck_01_ammo_F', '[0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 3705.21, 13000.1, -0.170521, 111.321, 1, 0),
	(57, 'B_Heli_Light_01_F', '[0,0,0,0,0.92619,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 3714.57, 13004.8, 0.0130405, 12.1619, 1, 0);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;

-- Listage de la structure de la table a3rp. vehicle_key
DROP TABLE IF EXISTS `vehicle_key`;
CREATE TABLE IF NOT EXISTS `vehicle_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vehicle_owner_vehicle_id` (`vehicle_id`),
  KEY `FK_vehicle_owner_player_id` (`player_id`),
  CONSTRAINT `FK_vehicle_owner_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`),
  CONSTRAINT `FK_vehicle_owner_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.vehicle_key : ~1 rows (environ)
/*!40000 ALTER TABLE `vehicle_key` DISABLE KEYS */;
INSERT INTO `vehicle_key` (`id`, `vehicle_id`, `player_id`) VALUES
	(30, 54, 75),
	(31, 55, 75),
	(32, 56, 75),
	(33, 57, 75);
/*!40000 ALTER TABLE `vehicle_key` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
