-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           11.6.2-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour a3rp
DROP DATABASE IF EXISTS `a3rp`;
CREATE DATABASE IF NOT EXISTS `a3rp` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `a3rp`;

-- Listage de la structure de table a3rp. account
DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam_id` varchar(17) NOT NULL,
  `admin_level` int(11) NOT NULL DEFAULT 0,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `steam_id` (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table a3rp.account : ~0 rows (environ)

-- Listage de la structure de table a3rp. building_directory
DROP TABLE IF EXISTS `building_directory`;
CREATE TABLE IF NOT EXISTS `building_directory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(50) NOT NULL,
  `buyable` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `classname` (`classname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table a3rp.building_directory : ~57 rows (environ)
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
	(73, 'Land_Kiosk_redburger_F', 1);

-- Listage de la structure de table a3rp. building_key
DROP TABLE IF EXISTS `building_key`;
CREATE TABLE IF NOT EXISTS `building_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `house_id_player_id` (`building_id`,`player_id`),
  KEY `FK_building_key_player_id` (`player_id`),
  CONSTRAINT `FK_building_key_building_id` FOREIGN KEY (`building_id`) REFERENCES `building_owned` (`id`),
  CONSTRAINT `FK_building_key_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table a3rp.building_key : ~0 rows (environ)

-- Listage de la structure de table a3rp. building_owned
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table a3rp.building_owned : ~0 rows (environ)

-- Listage de la structure de table a3rp. player
DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(17) NOT NULL,
  `side_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `alive` int(1) NOT NULL DEFAULT 1,
  `state` varchar(5000) NOT NULL DEFAULT '{}',
  `cash` int(11) NOT NULL DEFAULT 0,
  `gear` varchar(5000) NOT NULL DEFAULT '[[],[],[],[],[],[],"","",[],["","","","","",""]]',
  `pos_atl_x` float NOT NULL DEFAULT 0,
  `pos_atl_y` float NOT NULL DEFAULT 0,
  `pos_atl_z` float NOT NULL DEFAULT 0,
  `dir` float NOT NULL DEFAULT 0,
  `first_login` int(1) NOT NULL DEFAULT 1,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique_account_side_name` (`side_id`,`account_id`,`name`) USING BTREE,
  KEY `FK_player_account_id` (`account_id`),
  CONSTRAINT `FK_player_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_player_side_id` FOREIGN KEY (`side_id`) REFERENCES `side` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table a3rp.player : ~0 rows (environ)

-- Listage de la structure de table a3rp. side
DROP TABLE IF EXISTS `side`;
CREATE TABLE IF NOT EXISTS `side` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table a3rp.side : ~4 rows (environ)
INSERT INTO `side` (`id`, `type`) VALUES
	(1, 'CIV'),
	(2, 'WEST'),
	(3, 'EAST'),
	(4, 'GUER');

-- Listage de la structure de table a3rp. vehicle
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table a3rp.vehicle : ~0 rows (environ)

-- Listage de la structure de table a3rp. vehicle_inventory
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
  CONSTRAINT `FK_vehicle_inventory_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table a3rp.vehicle_inventory : ~0 rows (environ)

-- Listage de la structure de table a3rp. vehicle_key
DROP TABLE IF EXISTS `vehicle_key`;
CREATE TABLE IF NOT EXISTS `vehicle_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehicle_id_player_id` (`vehicle_id`,`player_id`),
  KEY `FK_vehicle_key_player_id` (`player_id`),
  CONSTRAINT `FK_vehicle_key_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_vehicle_key_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table a3rp.vehicle_key : ~0 rows (environ)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
