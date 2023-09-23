-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.7.3-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour a3rp
DROP DATABASE IF EXISTS `a3rp`;
CREATE DATABASE IF NOT EXISTS `a3rp` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `a3rp`;

-- Listage de la structure de la table a3rp. account
DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam_id` varchar(17) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `steam_id` (`steam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table a3rp. building_directory
DROP TABLE IF EXISTS `building_directory`;
CREATE TABLE IF NOT EXISTS `building_directory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(50) NOT NULL,
  `buyable` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `classname` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;

-- Les données exportées n'étaient pas sélectionnées.

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
  CONSTRAINT `FK_building_key_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table a3rp. player
DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(17) NOT NULL,
  `side_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `alive` int(1) NOT NULL DEFAULT 1,
  `state` varchar(5000) NOT NULL DEFAULT '{}',
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
  CONSTRAINT `FK_player_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_player_side_id` FOREIGN KEY (`side_id`) REFERENCES `side` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table a3rp. side
DROP TABLE IF EXISTS `side`;
CREATE TABLE IF NOT EXISTS `side` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
INSERT INTO `a3rp`.`side` (`type`) VALUES ('CIV');
INSERT INTO `a3rp`.`side` (`type`) VALUES ('WEST');
INSERT INTO `a3rp`.`side` (`type`) VALUES ('EAST');
INSERT INTO `a3rp`.`side` (`type`) VALUES ('GUER');

-- Les données exportées n'étaient pas sélectionnées.

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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;

-- Les données exportées n'étaient pas sélectionnées.

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
  CONSTRAINT `FK_vehicle_inventory_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table a3rp. vehicle_key
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;

-- Les données exportées n'étaient pas sélectionnées.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
