-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               5.6.22-log - MySQL Community Server (GPL)
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             9.1.0.4919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Exportiere Datenbank Struktur für pizzaria
CREATE DATABASE IF NOT EXISTS `pizzaria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pizzaria`;


-- Exportiere Struktur von Tabelle pizzaria.bestellung
CREATE TABLE IF NOT EXISTS `bestellung` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `kundendaten_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bestellungen, welche Positionen aufführen';

-- Exportiere Daten aus Tabelle pizzaria.bestellung: ~0 rows (ungefähr)
DELETE FROM `bestellung`;
/*!40000 ALTER TABLE `bestellung` DISABLE KEYS */;
/*!40000 ALTER TABLE `bestellung` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle pizzaria.extra-zutaten
CREATE TABLE IF NOT EXISTS `extra-zutaten` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT 'DEFAULT_NAME',
  `preis` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Auflistung der zusätzlich buchbaren Zutaten';

-- Exportiere Daten aus Tabelle pizzaria.extra-zutaten: ~0 rows (ungefähr)
DELETE FROM `extra-zutaten`;
/*!40000 ALTER TABLE `extra-zutaten` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra-zutaten` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle pizzaria.kundendaten
CREATE TABLE IF NOT EXISTS `kundendaten` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL DEFAULT 'DEFAULT_LOGIN',
  `passwort` varchar(50) NOT NULL DEFAULT 'DEFAULT_PW',
  `strasse` varchar(100) NOT NULL DEFAULT 'DEFAULT_STREET',
  `hausnummer` varchar(100) NOT NULL DEFAULT 'DEFAULT_STREET',
  `plz` char(5) NOT NULL DEFAULT '00000',
  `ort` varchar(50) NOT NULL DEFAULT 'DEFAULT_CITY',
  `name` varchar(50) NOT NULL DEFAULT 'DEFAULT_CUST_NAME',
  `vorname` varchar(50) NOT NULL DEFAULT 'DEFAULT_CUST_FIRSTNAME',
  `punktekonto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='speichert alle Kundendaten';

-- Exportiere Daten aus Tabelle pizzaria.kundendaten: ~0 rows (ungefähr)
DELETE FROM `kundendaten`;
/*!40000 ALTER TABLE `kundendaten` DISABLE KEYS */;
/*!40000 ALTER TABLE `kundendaten` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle pizzaria.pizza
CREATE TABLE IF NOT EXISTS `pizza` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT 'DEFAULT_NAME',
  `beschreibung` varchar(250) NOT NULL DEFAULT 'DEFAULT_DESC',
  `zutaten` varchar(250) NOT NULL DEFAULT 'DEFAULT_INGREDIENT',
  `preis` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Speichert die Standard-Pizzen mit Zutaten und Preisen';

-- Exportiere Daten aus Tabelle pizzaria.pizza: ~0 rows (ungefähr)
DELETE FROM `pizza`;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle pizzaria.pizza_extra
CREATE TABLE IF NOT EXISTS `pizza_extra` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `poisition_ID` int(11) NOT NULL DEFAULT '0',
  `extra_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle pizzaria.pizza_extra: ~0 rows (ungefähr)
DELETE FROM `pizza_extra`;
/*!40000 ALTER TABLE `pizza_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza_extra` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle pizzaria.position
CREATE TABLE IF NOT EXISTS `position` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `bestellung_ID` int(11) DEFAULT '0',
  `pizza_ID` int(11) DEFAULT '0',
  `menge` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle pizzaria.position: ~0 rows (ungefähr)
DELETE FROM `position`;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
