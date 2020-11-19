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
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `steam_id` (`steam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.account : ~1 rows (environ)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `steam_id`, `creation_date`) VALUES
	(42, '76561198108858505', '2020-11-14 15:03:56');
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

-- Listage de la structure de la table a3rp. house
DROP TABLE IF EXISTS `house`;
CREATE TABLE IF NOT EXISTS `house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(50) NOT NULL,
  `pos_atl_x` float NOT NULL,
  `pos_atl_y` float NOT NULL,
  `pos_atl_z` float NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `classname_pos_atl_x_pos_atl_y_pos_atl_z` (`classname`,`pos_atl_x`,`pos_atl_y`,`pos_atl_z`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.house : ~0 rows (environ)
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` (`id`, `classname`, `pos_atl_x`, `pos_atl_y`, `pos_atl_z`, `creation_date`) VALUES
	(2, 'Land_i_House_Big_02_V2_F', 14035.9, 18707.5, -0.0140629, '2020-11-19 22:01:12');
/*!40000 ALTER TABLE `house` ENABLE KEYS */;

-- Listage de la structure de la table a3rp. house_key
DROP TABLE IF EXISTS `house_key`;
CREATE TABLE IF NOT EXISTS `house_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `house_id_player_id` (`house_id`,`player_id`),
  KEY `FK_house_key_player_id` (`player_id`),
  CONSTRAINT `FK_house_key_house_id` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
  CONSTRAINT `FK_house_key_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.house_key : ~0 rows (environ)
/*!40000 ALTER TABLE `house_key` DISABLE KEYS */;
INSERT INTO `house_key` (`id`, `house_id`, `player_id`) VALUES
	(3, 2, 79);
/*!40000 ALTER TABLE `house_key` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.player : ~0 rows (environ)
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` (`id`, `account_id`, `side_id`, `name`, `cash`, `gear`, `pos_atl_x`, `pos_atl_y`, `pos_atl_z`, `dir`, `creation_date`) VALUES
	(79, 42, 1, 'Joe Clarks', 0, '[["arifle_AKM_F","","","",["30Rnd_762x39_Mag_F",0],[],""],[],[],[],[],[],"","",[],["","","","","",""]]', 14039.1, 18717.2, 0.148638, 193.648, '2020-11-14 15:03:56');
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
  `fuel` float NOT NULL DEFAULT 1,
  `pos_atl_x` float NOT NULL DEFAULT 0,
  `pos_atl_y` float NOT NULL DEFAULT 0,
  `pos_atl_z` float NOT NULL DEFAULT 0,
  `dir` float NOT NULL DEFAULT 0,
  `alive` int(1) NOT NULL DEFAULT 1,
  `stored` int(1) NOT NULL DEFAULT 0,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.vehicle : ~2 rows (environ)
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` (`id`, `classname`, `damage`, `fuel`, `pos_atl_x`, `pos_atl_y`, `pos_atl_z`, `dir`, `alive`, `stored`, `creation_date`) VALUES
	(64, 'C_Offroad_01_F', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0.82455, 14051.5, 18703.3, 0.0131435, 325.765, 1, 0, '2020-11-19 21:12:07'),
	(65, 'C_Offroad_01_F', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 1, 14049.7, 18714.6, 0.0121346, 11.9422, 1, 0, '2020-11-19 21:12:07');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;

-- Listage de la structure de la table a3rp. vehicle_inventory
DROP TABLE IF EXISTS `vehicle_inventory`;
CREATE TABLE IF NOT EXISTS `vehicle_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `backpacks` varchar(5000) NOT NULL,
  `items` varchar(5000) NOT NULL,
  `magazines` varchar(5000) NOT NULL,
  `weapons` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vehicle_inventory_vehicle_id` (`vehicle_id`),
  CONSTRAINT `FK_vehicle_inventory_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.vehicle_inventory : ~2 rows (environ)
/*!40000 ALTER TABLE `vehicle_inventory` DISABLE KEYS */;
INSERT INTO `vehicle_inventory` (`id`, `vehicle_id`, `backpacks`, `items`, `magazines`, `weapons`) VALUES
	(2, 64, '[["B_FieldPack_blk"],[1]]', '[[],[]]', '[["30Rnd_762x39_Mag_F"],[2]]', '[["arifle_AKM_F"],[1]]'),
	(3, 65, '[[],[]]', '[["H_Cap_blu"],[1]]', '[[],[]]', '[[],[]]');
/*!40000 ALTER TABLE `vehicle_inventory` ENABLE KEYS */;

-- Listage de la structure de la table a3rp. vehicle_key
DROP TABLE IF EXISTS `vehicle_key`;
CREATE TABLE IF NOT EXISTS `vehicle_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehicle_id_player_id` (`vehicle_id`,`player_id`),
  KEY `FK_vehicle_key_player_id` (`player_id`),
  CONSTRAINT `FK_vehicle_key_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`),
  CONSTRAINT `FK_vehicle_key_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.vehicle_key : ~1 rows (environ)
/*!40000 ALTER TABLE `vehicle_key` DISABLE KEYS */;
INSERT INTO `vehicle_key` (`id`, `vehicle_id`, `player_id`) VALUES
	(41, 64, 79),
	(42, 65, 79);
/*!40000 ALTER TABLE `vehicle_key` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
