-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               5.1.46-community - MySQL Community Server (GPL)
-- Server Betriebssystem:        Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Exportiere Datenbank Struktur für pizzeria
CREATE DATABASE IF NOT EXISTS `pizzeria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pizzeria`;


-- Exportiere Struktur von Tabelle pizzeria.bestellung
CREATE TABLE IF NOT EXISTS `bestellung` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `kundendaten_ID` int(11) NOT NULL DEFAULT '0',
  `datum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `erledigt` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Bestellungen, welche Positionen aufführen';

-- Exportiere Daten aus Tabelle pizzeria.bestellung: ~3 rows (ungefähr)
/*!40000 ALTER TABLE `bestellung` DISABLE KEYS */;
INSERT INTO `bestellung` (`ID`, `kundendaten_ID`, `datum`, `erledigt`) VALUES
	(1, 2, '2015-05-08 08:05:35', 0),
	(2, 2, '2015-05-08 08:05:35', 0),
	(3, 1, '2015-05-08 08:05:35', 0);
/*!40000 ALTER TABLE `bestellung` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle pizzeria.extra-zutaten
CREATE TABLE IF NOT EXISTS `extra-zutaten` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT 'DEFAULT_NAME',
  `preis` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='Auflistung der zusätzlich buchbaren Zutaten';

-- Exportiere Daten aus Tabelle pizzeria.extra-zutaten: ~25 rows (ungefähr)
/*!40000 ALTER TABLE `extra-zutaten` DISABLE KEYS */;
INSERT INTO `extra-zutaten` (`ID`, `name`, `preis`) VALUES
	(1, 'Käse', 0.9),
	(2, 'Schinken', 1),
	(3, 'Salami', 1),
	(4, 'Champignon', 0.5),
	(5, 'Bacon', 1.5),
	(6, 'Meeresfrüchte', 2),
	(7, 'Jalapenos', 1),
	(8, 'Ananas', 0.5),
	(9, 'Artischocken', 0.5),
	(10, 'Auberginen', 0.5),
	(11, 'Brokoli', 0.5),
	(12, 'Zwiebeln', 0.5),
	(13, 'Peperoni', 0.7),
	(14, 'Paprika', 0.5),
	(15, 'Mais', 0.5),
	(16, 'Hirtenkäse', 1),
	(17, 'Kapern', 0.5),
	(18, 'Mozarella', 0.7),
	(19, 'Oliven', 0.5),
	(20, 'Spiegelei', 0.8),
	(21, 'Spinat', 0.7),
	(22, 'Thunfisch', 1),
	(23, 'Sardellen', 1),
	(24, 'Hähnchenbrust', 1.2),
	(25, 'Rucola', 0.7);
/*!40000 ALTER TABLE `extra-zutaten` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle pizzeria.kundendaten
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
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='speichert alle Kundendaten';

-- Exportiere Daten aus Tabelle pizzeria.kundendaten: ~3 rows (ungefähr)
/*!40000 ALTER TABLE `kundendaten` DISABLE KEYS */;
INSERT INTO `kundendaten` (`ID`, `login`, `passwort`, `strasse`, `hausnummer`, `plz`, `ort`, `name`, `vorname`, `punktekonto`, `admin`) VALUES
	(1, 'user1', 'cisco', 'straße', '4', '88088', 'Klausingen', 'Hans', 'Peter', 20, 0),
	(2, 'user2', 'cisco', 'street', 'DEFAULT_STREET', '00000', 'DEFAULT_CITY', 'DEFAULT_CUST_NAME', 'DEFAULT_CUST_FIRSTNAME', 0, 0),
	(3, 'admin', 'admin', 'DEFAULT_STREET', 'DEFAULT_STREET', '00000', 'DEFAULT_CITY', 'DEFAULT_CUST_NAME', 'DEFAULT_CUST_FIRSTNAME', 0, 1);
/*!40000 ALTER TABLE `kundendaten` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle pizzeria.pizza
CREATE TABLE IF NOT EXISTS `pizza` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT 'DEFAULT_NAME',
  `beschreibung` varchar(250) NOT NULL DEFAULT 'DEFAULT_DESC',
  `zutaten` varchar(250) NOT NULL DEFAULT 'DEFAULT_INGREDIENT',
  `preis_s` double NOT NULL DEFAULT '0',
  `preis_m` double NOT NULL DEFAULT '0',
  `preis_l` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Speichert die Standard-Pizzen mit Zutaten und Preisen';

-- Exportiere Daten aus Tabelle pizzeria.pizza: ~14 rows (ungefähr)
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` (`ID`, `name`, `beschreibung`, `zutaten`, `preis_s`, `preis_m`, `preis_l`) VALUES
	(1, 'Magherita', 'Pizza mit Tomate und Käse', 'Käse, Tomate', 4, 5.5, 7),
	(2, 'Salami', 'Pizza mit Salami', 'Käse, Tomaten, Salami', 5, 6.5, 9),
	(3, 'Schinken', 'Pizza mit Schinken', 'DEFAULT_INGREDIENT', 5.5, 7, 9.5),
	(4, 'Thunfisch', 'Pizza mit Thunfisch', 'DEFAULT_INGREDIENT', 6, 7.5, 10),
	(5, 'Spezial', 'Pizza mit Schinken, Salami und Champignons', 'DEFAULT_INGREDIENT', 6.5, 8, 11),
	(6, 'Hawaii', 'Pizza mit Ananas und Schinken', 'DEFAULT_INGREDIENT', 5.5, 7.5, 9.5),
	(7, 'Vier Käse', 'Pizza mit Mozarella, Hirtenkäse, Gorgonzola und Parmesan', 'DEFAULT_INGREDIENT', 5.5, 7, 9),
	(8, 'Diabolo', 'Scharfe Pizza mit Salami, Peperoni und Jalapenos', 'DEFAULT_INGREDIENT', 6.5, 8, 10.5),
	(9, 'Panna', 'Pizza mit Sahnesoße und Schinken', 'DEFAULT_INGREDIENT', 5, 6.5, 8),
	(10, 'Fungi', 'Pizza mit Champignons', 'DEFAULT_INGREDIENT', 5, 6.5, 7.5),
	(11, 'Frutti Di Mare', 'Pizza mit Meeresfrüchten', 'DEFAULT_INGREDIENT', 6.5, 8.5, 11),
	(12, 'Calzone', 'Pizza gefüllt mit Mozarella, Champignons, Schinken und Salami', 'DEFAULT_INGREDIENT', 7, 9, 11.5),
	(13, 'Boss', 'Pizza mit Rucola, Schinken, Salami, Champignons, Mozarella, Zwiebeln, Jalapenos und Ei', 'DEFAULT_INGREDIENT', 8, 10, 13),
	(14, 'Americano', 'Dicke Pizza mit Bacon, BBQ-Sauce, Hänchenbrust und Jalapenos', 'DEFAULT_INGREDIENT', 7.5, 9.5, 12);
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle pizzeria.pizza_extra
CREATE TABLE IF NOT EXISTS `pizza_extra` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `poisition_ID` int(11) NOT NULL DEFAULT '0',
  `extra_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle pizzeria.pizza_extra: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `pizza_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza_extra` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle pizzeria.position
CREATE TABLE IF NOT EXISTS `position` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `bestellung_ID` int(11) DEFAULT '0',
  `pizza_ID` int(11) DEFAULT '0',
  `menge` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle pizzeria.position: ~3 rows (ungefähr)
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` (`ID`, `bestellung_ID`, `pizza_ID`, `menge`) VALUES
	(1, 1, 1, 3),
	(2, 1, 2, 2),
	(3, 2, 1, 1);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
