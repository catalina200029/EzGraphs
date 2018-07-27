-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 27, 2018 at 09:57 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ezgraphs`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `classID` int(10) NOT NULL AUTO_INCREMENT,
  `profID` int(10) NOT NULL,
  `classPASS` varchar(10) DEFAULT NULL,
  `classNAME` varchar(10) NOT NULL,
  PRIMARY KEY (`classID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`classID`, `profID`, `classPASS`, `classNAME`) VALUES
(5, 8, '11M3isLove', '11M3'),
(6, 8, 'parola123', '10M2'),
(7, 8, 'parola123', '9N'),
(8, 20, '123123', '8Mate');

-- --------------------------------------------------------

--
-- Table structure for table `comentarii`
--

DROP TABLE IF EXISTS `comentarii`;
CREATE TABLE IF NOT EXISTS `comentarii` (
  `commID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `commData` text NOT NULL,
  `nota` int(1) NOT NULL,
  PRIMARY KEY (`commID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comentarii`
--

INSERT INTO `comentarii` (`commID`, `userID`, `userName`, `commData`, `nota`) VALUES
(1, 9, 'Teodor', 'E really nice! I like it! Am invatat multe notiuni noi despre graf!', 5),
(2, 4, 'Olteanu', 'Minunata aplicatie! I like it, imma improve it!', 5);

-- --------------------------------------------------------

--
-- Table structure for table `gamescores`
--

DROP TABLE IF EXISTS `gamescores`;
CREATE TABLE IF NOT EXISTS `gamescores` (
  `gameID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`gameID`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gamescores`
--

INSERT INTO `gamescores` (`gameID`, `userID`, `score`) VALUES
(3, 9, 134),
(3, 10, 530),
(3, 18, 320),
(4, 4, 132),
(4, 18, 1000),
(4, 19, 1320),
(5, 4, 80),
(5, 9, 70448),
(5, 10, 70),
(6, 19, 10);

-- --------------------------------------------------------

--
-- Table structure for table `lectiedata`
--

DROP TABLE IF EXISTS `lectiedata`;
CREATE TABLE IF NOT EXISTS `lectiedata` (
  `lectieID` int(11) NOT NULL AUTO_INCREMENT,
  `profID` int(11) NOT NULL,
  `lectieData` text NOT NULL,
  `lectieName` varchar(50) NOT NULL,
  `scor` float NOT NULL,
  `nrVotes` int(11) NOT NULL,
  PRIMARY KEY (`lectieID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lectiedata`
--

INSERT INTO `lectiedata` (`lectieID`, `profID`, `lectieData`, `lectieName`, `scor`, `nrVotes`) VALUES
(1, 8, 'Text Dataaaa', 'Numeee1', 4, 1),
(2, 8, 'w12eqe', 'fggg', 3, 1),
(4, 8, 'asdasd', 'sadasd', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `temadata`
--

DROP TABLE IF EXISTS `temadata`;
CREATE TABLE IF NOT EXISTS `temadata` (
  `temaID` int(11) NOT NULL AUTO_INCREMENT,
  `profID` int(11) NOT NULL,
  `classID` int(11) DEFAULT NULL,
  `tema` text NOT NULL,
  `temaName` varchar(40) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`temaID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temadata`
--

INSERT INTO `temadata` (`temaID`, `profID`, `classID`, `tema`, `temaName`, `date`) VALUES
(1, 8, 5, 'Tema surpriza+++sf+++sf1+++sfCe graf este+++sf3+++sf1+++sf4+++sf942 398 1+++sf1108 670 1+++sf1226 404 1+++sf872 667 1+++sf3+++sf1 3 1+++sf2 1 1+++sf1 4 1+++sfDe ce sunt aici?+++sfOrientat+++sfNeorientat+++sf0+++sf+++sf3+++sfIntrebare de teorie la care nu stii sa raspunzi+++sf1+++sfAdevar graiesti+++sf+++sf1+++sfGhiceste+++sf1+++sf2+++sf4+++sf992 454 1+++sf766 385 1+++sf1237 343 1+++sf924 653 1+++sf4+++sf2 3 1+++sf3 4 1+++sf2 4 1+++sf1 4 1+++sfNu ai ghicit+++sf+++sf3+++sfIntrebare de teorie la care nu stii sa raspunzi 2+++sf3+++sfO sa iau 4+++sf2+++sf1+++sf1+++sf+++sf1+++sfBipartit?+++sf1+++sf1+++sf6+++sf893 349 1+++sf1159 340 1+++sf891 524 1+++sf1182 522 1+++sf908 676 1+++sf1181 657 1+++sf5+++sf1 4 1+++sf2 5 1+++sf3 2 1+++sf1 6 1+++sf5 6 1+++sfNu stiu+++sf+++sf', 'Tema surpriza', '2018-07-26'),
(2, 8, 5, 'Tema test name+++sf+++sf1+++sfGraf Neorientat+++sf1+++sf1+++sf3+++sf1047 502 1+++sf1210 423 1+++sf813 598 1+++sf2+++sf2 1 1+++sf3 1 1+++sf1+++sf+++sf3+++sfGraf 2+++sf3+++sf1+++sf2+++sf3+++sf1+++sf+++sf1+++sfOrientat+++sf1+++sf2+++sf3+++sf929 608 1+++sf1205 655 1+++sf1217 435 1+++sf2+++sf3 1 1+++sf2 3 1+++sf3+++sf+++sf3+++sf2312123+++sf1+++sf123123+++sf+++sf3+++sf123+++sf1+++sf123+++sf+++sf', 'Tema test name', '2018-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `temascores`
--

DROP TABLE IF EXISTS `temascores`;
CREATE TABLE IF NOT EXISTS `temascores` (
  `temaID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`temaID`,`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temascores`
--

INSERT INTO `temascores` (`temaID`, `userID`, `score`, `date`) VALUES
(1, 9, 2, '2018-07-24'),
(1, 4, 4, '2018-07-26'),
(2, 9, 2, '2018-07-26'),
(1, 10, 4, '2018-07-26'),
(2, 10, 4, '2018-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `testdata`
--

DROP TABLE IF EXISTS `testdata`;
CREATE TABLE IF NOT EXISTS `testdata` (
  `testID` int(11) NOT NULL AUTO_INCREMENT,
  `profID` int(11) NOT NULL,
  `classID` int(11) DEFAULT NULL,
  `test` text NOT NULL,
  `testName` varchar(50) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`testID`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testdata`
--

INSERT INTO `testdata` (`testID`, `profID`, `classID`, `test`, `testName`, `date`) VALUES
(1, 8, 5, '5555+++sf???????123+++sf123+++sf123+++sf123+++sf2+++sf+++sf234+++sf234+++sf234+++sf234+++sf2+++sf+++sf345+++sf345+++sf345+++sf345+++sf2+++sf+++sf456+++sf456+++sf456+++sf456+++sf2+++sf+++sf5675+++sf67+++sf567+++sf567+++sf2+++sf+++sf678+++sf678+++sf678+++sf678+++sf2+++sf+++sf321+++sf321+++sf321+++sf321+++sf1+++sf+++sf321+++sf312+++sf321+++sf321+++sf0+++sf+++sf432+++sf432+++sf432+++sf432+++sf1+++sf+++sf432+++sf432+++sf432+++sf432+++sf2+++sf+++sf', '5555', '2018-07-21'),
(2, 8, 5, 'Testare 2+++sf1+++sf1+++sf1+++sf1+++sf1+++sf+++sfA doua intrebare?+++sfrasp!+++sf23+++sf233+++sf2+++sf+++sf123 123 +++sf 3+++sf23 +++sf23 23 12+++sf2+++sf+++sf3 213 +++sf3 23 +++sf3 23+++sf 23 12 3+++sf2+++sf+++sf32 3+++sf1 23+++sf 23+++sf 21 23+++sf2+++sf+++sf3 23 1+++sf2 +++sf32 3+++sf23 12 31+++sf2+++sf+++sf231+++sf32+++sf3 23 23+++sf32 32+++sf1+++sf+++sf sg ds+++sffd f+++sf df df+++sf sdf sdf+++sf0+++sf+++sfdfs dfs d+++sff sdf+++sf sdf sdf+++sf  gdhth dt+++sf1+++sf+++sftdhd th+++sf dth +++sf dth+++sfdth dth +++sf1+++sf+++sf', 'Testare 2', '2018-07-21'),
(3, 8, -1, 'NoNameTest+++sfIntr 1+++sf1+++sf2+++sf2+++sf0+++sf+++sfPAsad+++sf123+++sf123+++sf123+++sf1+++sf+++sfgaethtsh+++sfagr+++sfahth+++sffasef?3+++sf2+++sf+++sfqwda+++sfawdas+++sfawda+++sf4+++sf2+++sf+++sfjuk+++sfkugk+++sfguu+++sf5+++sf2+++sf+++sfsss+++sfsss+++sfss+++sfssssss+++sf2+++sf+++sfssdad+++sfasda+++sfsdasd+++sfasdasd+++sf2+++sf+++sfsdasd+++sfasdasd+++sfasdas+++sf8+++sf2+++sf+++sfasdas+++sf9+++sfasd+++sfsad+++sf0+++sf+++sfqwe+++sfqwe+++sf123+++sf123+++sf2+++sf+++sf', 'NoNAmeTest', '2018-07-26'),
(4, 8, 5, 'Naaaameee+++sf2+++sf2+++sf2+++sf2+++sf0+++sf+++sf2+++sf2+++sf2+++sf2+++sf2+++sf+++sf2+++sf2+++sf2+++sf2+++sf2+++sf+++sf2+++sf2+++sf2+++sf2+++sf2+++sf+++sf2+++sf2+++sf2+++sf+++sf2+++sf+++sf2+++sf2+++sf2+++sf2+++sf2+++sf+++sf2+++sf2+++sf2+++sf2+++sf2+++sf+++sf2+++sf2+++sf2+++sf2+++sf2+++sf+++sf2+++sf2+++sf2+++sf2+++sf2+++sf+++sf2+++sf2+++sf2+++sf2+++sf2+++sf+++sf', 'Naaaameee', '2018-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `testscores`
--

DROP TABLE IF EXISTS `testscores`;
CREATE TABLE IF NOT EXISTS `testscores` (
  `testID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `score` int(3) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`testID`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testscores`
--

INSERT INTO `testscores` (`testID`, `userID`, `score`, `date`) VALUES
(1, 9, 1, '2018-07-24'),
(1, 10, 5, '2018-07-26'),
(2, 9, 4, '2018-07-24'),
(2, 10, 5, '2018-07-26'),
(3, 9, 7, '2018-07-26'),
(3, 10, 7, '2018-07-26'),
(4, 9, 4, '2018-07-26'),
(4, 10, 6, '2018-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `surname` varchar(15) NOT NULL,
  `nickname` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pass` varchar(15) NOT NULL,
  `isProfessor` tinyint(1) NOT NULL DEFAULT '0',
  `classID` int(10) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `name`, `surname`, `nickname`, `email`, `pass`, `isProfessor`, `classID`) VALUES
(4, 'Olteanu', 'Catalina', 'catalina200029', 'catalina200029@yahoo.com', 'cata', 0, 5),
(8, 'Lincan', 'Iulia', 'Prof', 'teo.virghi@yahoo.ro', '123', 1, 5),
(9, 'Teodor', 'Virghileanu', 'Elev', 'meandsonic@yahoo.ro', '123', 0, 5),
(10, 'Eugen', 'Brown', 'Ciulululu', 't@index.ru', 'PWD99', 0, 5),
(11, 'Marcel', 'Cristelnita', 'Bisi', 'b@yandex.ro', 'ParolParol99', 0, 5),
(12, 'Costel', 'Emanuel', 'Magher', 'tt@index.ru', 'PWD99', 0, 5),
(13, 'Mircea', 'Portaru`', 'NoLife', 'bb@yandex.ro', 'ParolParol99', 0, 5),
(14, 'Matei', 'Strungarul', 'Pateu', 'pat@yahoo.ro', '9991122', 0, 5),
(15, 'Razvi', 'Nebyn', 'Mandarina', 'teodoro@yahoro.ro', '123passpass', 0, 5),
(16, 'Matei', 'Nebulos', 'PeticNebun', 'peticel@gmail.ro', '9991122', 0, 5),
(17, 'Varhau', 'Nebyn', 'Blana', 'baeit@yahoro.ro', '123passpass', 0, 5),
(18, 'Carmenul', 'Briceag', 'Pistruiatu`', 'pistrui@yahoo.ro', 'Matei2008', 0, 6),
(19, 'Alberta', 'Minea', 'Epopee', '1@1.1', '111', 0, 6),
(20, 'Teooooo', 'Viviviiviv', 'Prof2', '123123@yahoo.ro', '123123', 1, 8);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
