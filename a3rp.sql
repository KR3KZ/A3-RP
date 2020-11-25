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

-- Listage de la structure de la table a3rp. building_directory
DROP TABLE IF EXISTS `building_directory`;
CREATE TABLE IF NOT EXISTS `building_directory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(50) NOT NULL,
  `buyable` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `classname` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.building_directory : ~56 rows (environ)
/*!40000 ALTER TABLE `building_directory` DISABLE KEYS */;
INSERT INTO `building_directory` (`id`, `classname`, `buyable`) VALUES
	(4, 'Land_Offices_01_V1_F', 1),
	(5, 'Land_u_Addon_02_V1_F', 1),
	(6, 'Land_i_Addon_02_V1_F', 1),
	(7, 'Land_i_Garage_V1_F', 1),
	(8, 'Land_i_Garage_V2_F', 1),
	(9, 'Land_Metal_Shed_F', 1),
	(10, 'Land_i_House_Big_01_V1_F', 1),
	(11, 'Land_i_House_Big_01_V2_F', 1),
	(12, 'Land_i_House_Big_01_V3_F', 1),
	(13, 'Land_u_House_Big_01_V1_F', 1),
	(14, 'Land_i_House_Big_02_V1_F', 1),
	(15, 'Land_i_House_Big_02_V2_F', 1),
	(16, 'Land_i_House_Big_02_V3_F', 1),
	(17, 'Land_u_House_Big_02_V1_F', 1),
	(18, 'Land_i_Shop_01_V1_F', 1),
	(19, 'Land_i_Shop_01_V2_F', 1),
	(20, 'Land_i_Shop_01_V3_F', 1),
	(21, 'Land_u_Shop_01_V1_F', 1),
	(22, 'Land_i_Shop_02_V1_F', 1),
	(23, 'Land_i_Shop_02_V2_F', 1),
	(24, 'Land_i_Shop_02_V3_F', 1),
	(25, 'Land_u_Shop_02_V1_F', 1),
	(26, 'Land_i_House_Small_01_V1_F', 1),
	(27, 'Land_i_House_Small_01_V2_F', 1),
	(28, 'Land_i_House_Small_01_V3_F', 1),
	(29, 'Land_u_House_Small_01_V1_F', 1),
	(30, 'Land_i_House_Small_02_V1_F', 1),
	(31, 'Land_i_House_Small_02_V2_F', 1),
	(32, 'Land_i_House_Small_02_V3_F', 1),
	(33, 'Land_u_House_Small_02_V1_F', 1),
	(34, 'Land_i_House_Small_03_V1_F', 1),
	(35, 'Land_Slum_House01_F', 1),
	(36, 'Land_Slum_House02_F', 1),
	(37, 'Land_Slum_House03_F', 1),
	(38, 'Land_i_Stone_HouseBig_V1_F', 1),
	(39, 'Land_i_Stone_HouseBig_V2_F', 1),
	(40, 'Land_i_Stone_HouseBig_V3_F', 1),
	(41, 'Land_d_Stone_HouseBig_V1_F', 1),
	(42, 'Land_i_Stone_Shed_V1_F', 1),
	(43, 'Land_i_Stone_Shed_V2_F', 1),
	(44, 'Land_i_Stone_Shed_V3_F', 1),
	(45, 'Land_i_Stone_HouseSmall_V1_F', 1),
	(46, 'Land_i_Stone_HouseSmall_V2_F', 1),
	(47, 'Land_i_Stone_HouseSmall_V3_F', 1),
	(48, 'Land_Hangar_F', 1),
	(49, 'Land_i_Shed_Ind_F', 1),
	(50, 'Land_i_Barracks_V1_F', 1),
	(51, 'Land_i_Barracks_V2_F', 1),
	(52, 'Land_u_Barracks_V2_F', 1),
	(53, 'Land_Cargo_House_V1_F', 1),
	(54, 'Land_Cargo_House_V2_F', 1),
	(55, 'Land_Cargo_House_V3_F', 1),
	(56, 'Land_MilOffices_V1_F', 1),
	(57, 'Land_TentHangar_V1_F', 1),
	(58, 'Land_GH_House_1_F', 1),
	(59, 'Land_GH_House_2_F', 1),
	(73, 'Land_Kiosk_redburger_F', 0);
/*!40000 ALTER TABLE `building_directory` ENABLE KEYS */;

-- Listage de la structure de la table a3rp. building_key
DROP TABLE IF EXISTS `building_key`;
CREATE TABLE IF NOT EXISTS `building_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `house_id_player_id` (`building_id`,`player_id`),
  KEY `FK_building_key_player_id` (`player_id`),
  CONSTRAINT `FK_building_key_building_id` FOREIGN KEY (`building_id`) REFERENCES `building_owned` (`id`),
  CONSTRAINT `FK_building_key_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.building_key : ~9 rows (environ)
/*!40000 ALTER TABLE `building_key` DISABLE KEYS */;
INSERT INTO `building_key` (`id`, `building_id`, `player_id`) VALUES
	(18, 24, 79),
	(19, 25, 79),
	(20, 26, 79),
	(21, 27, 79),
	(22, 28, 79),
	(23, 29, 79),
	(24, 30, 79),
	(25, 31, 79),
	(26, 32, 79),
	(27, 33, 79),
	(28, 34, 79);
/*!40000 ALTER TABLE `building_key` ENABLE KEYS */;

-- Listage de la structure de la table a3rp. building_owned
DROP TABLE IF EXISTS `building_owned`;
CREATE TABLE IF NOT EXISTS `building_owned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_directory_id` int(11) NOT NULL,
  `pos_atl_x` float NOT NULL,
  `pos_atl_y` float NOT NULL,
  `pos_atl_z` float NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `classname_pos_atl_x_pos_atl_y_pos_atl_z` (`building_directory_id`,`pos_atl_x`,`pos_atl_y`,`pos_atl_z`),
  CONSTRAINT `FK_building_owned_building_id` FOREIGN KEY (`building_directory_id`) REFERENCES `building_directory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.building_owned : ~9 rows (environ)
/*!40000 ALTER TABLE `building_owned` DISABLE KEYS */;
INSERT INTO `building_owned` (`id`, `building_directory_id`, `pos_atl_x`, `pos_atl_y`, `pos_atl_z`, `name`, `creation_date`) VALUES
	(24, 11, 3919.51, 13853.5, 0.90424, '', '2020-11-23 16:30:32'),
	(25, 24, 3914.37, 13864.8, 0.468246, 'Mon habitation', '2020-11-23 17:35:10'),
	(26, 17, 3941.68, 13825.9, 0.0488014, '', '2020-11-23 17:38:42'),
	(27, 12, 3972.77, 13813.7, 0.774662, '', '2020-11-23 17:39:03'),
	(28, 17, 3952.38, 13796.1, 0.849594, '', '2020-11-23 17:45:10'),
	(29, 21, 3948.76, 13787, 0.48497, '', '2020-11-23 17:45:28'),
	(30, 33, 3942.07, 13782.1, 0.191868, '', '2020-11-23 17:45:39'),
	(31, 73, 10664, 12228.9, 0.114006, 'Ma maison', '2020-11-24 12:21:53'),
	(32, 16, 10692.8, 12229.9, 0.0747967, '', '2020-11-24 12:28:16'),
	(33, 11, 10732.6, 12214, 0.00162125, '', '2020-11-24 17:39:29'),
	(34, 5, 10774, 12257.4, 0.375071, '', '2020-11-24 17:40:29');
/*!40000 ALTER TABLE `building_owned` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- Listage des données de la table a3rp.player : ~0 rows (environ)
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` (`id`, `account_id`, `side_id`, `name`, `cash`, `gear`, `pos_atl_x`, `pos_atl_y`, `pos_atl_z`, `dir`, `creation_date`) VALUES
	(79, 42, 1, 'Joe Clarks', 0, '[[],[],[],["U_C_Uniform_Farmer_01_F",[]],[],[],"H_Cap_blu","",[],["ItemMap","","","ItemCompass","",""]]', 10690.6, 12231.8, 0.463398, 321.595, '2020-11-14 15:03:56');
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
	(64, 'C_Offroad_01_F', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0.646122, 13107.1, 16350.1, 0.0223255, 74.2137, 1, 0, '2020-11-19 21:12:07'),
	(65, 'C_Offroad_01_F', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 1, 14054.7, 18720.7, 0.096899, 10.3766, 1, 0, '2020-11-19 21:12:07');
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
