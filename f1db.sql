CREATE DATABASE f1_db;
USE f1_db;
-- Table structure for table `circuits`
DROP TABLE IF EXISTS `circuits`;
CREATE TABLE `circuits` (
  `circuitId` int(11) NOT NULL AUTO_INCREMENT,
  `circuitRef` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `alt` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`circuitId`),
  UNIQUE KEY `url` (`url`)
);
-- Table structure for table `constructorResults`
DROP TABLE IF EXISTS `constructorResults`;
CREATE TABLE `constructorResults` (
  `constructorResultsId` int(11) NOT NULL AUTO_INCREMENT,
  `raceId` int(11) NOT NULL DEFAULT '0',
  `constructorId` int(11) NOT NULL DEFAULT '0',
  `points` float DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`constructorResultsId`)
);
-- Table structure for table `constructorStandings`
DROP TABLE IF EXISTS `constructorStandings`;
CREATE TABLE `constructorStandings` (
  `constructorStandingsId` int(11) NOT NULL AUTO_INCREMENT,
  `raceId` int(11) NOT NULL DEFAULT '0',
  `constructorId` int(11) NOT NULL DEFAULT '0',
  `points` float NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `positionText` varchar(255) DEFAULT NULL,
  `wins` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`constructorStandingsId`)
);
-- Table structure for table `constructors`
DROP TABLE IF EXISTS `constructors`;
CREATE TABLE `constructors` (
  `constructorId` int(11) NOT NULL AUTO_INCREMENT,
  `constructorRef` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `nationality` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`constructorId`),
  UNIQUE KEY `name` (`name`)
);
-- Table structure for table `driverStandings`
DROP TABLE IF EXISTS `driverStandings`;
CREATE TABLE `driverStandings` (
  `driverStandingsId` int(11) NOT NULL AUTO_INCREMENT,
  `raceId` int(11) NOT NULL DEFAULT '0',
  `driverId` int(11) NOT NULL DEFAULT '0',
  `points` float NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `positionText` varchar(255) DEFAULT NULL,
  `wins` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`driverStandingsId`)
);
-- Table structure for table `drivers`
DROP TABLE IF EXISTS `drivers`;
CREATE TABLE `drivers` (
  `driverId` int(11) NOT NULL AUTO_INCREMENT,
  `driverRef` varchar(255) NOT NULL DEFAULT '',
  `number` int(11) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  `forename` varchar(255) NOT NULL DEFAULT '',
  `surname` varchar(255) NOT NULL DEFAULT '',
  `dob` date DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`driverId`),
  UNIQUE KEY `url` (`url`)
);
-- Table structure for table `lapTimes`
DROP TABLE IF EXISTS `lapTimes`;
CREATE TABLE `lapTimes` (
  `raceId` int(11) NOT NULL,
  `driverId` int(11) NOT NULL,
  `lap` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `milliseconds` int(11) DEFAULT NULL,
  PRIMARY KEY (`raceId`,`driverId`,`lap`),
  KEY `raceId` (`raceId`),
  KEY `raceId_2` (`raceId`)
);
-- Table structure for table `pitStops`
DROP TABLE IF EXISTS `pitStops`;
CREATE TABLE `pitStops` (
  `raceId` int(11) NOT NULL,
  `driverId` int(11) NOT NULL,
  `stop` int(11) NOT NULL,
  `lap` int(11) NOT NULL,
  `time` time NOT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `milliseconds` int(11) DEFAULT NULL,
  PRIMARY KEY (`raceId`,`driverId`,`stop`),
  KEY `raceId` (`raceId`)
);
-- Table structure for table `qualifying`
DROP TABLE IF EXISTS `qualifying`;
CREATE TABLE `qualifying` (
  `qualifyId` int(11) NOT NULL AUTO_INCREMENT,
  `raceId` int(11) NOT NULL DEFAULT '0',
  `driverId` int(11) NOT NULL DEFAULT '0',
  `constructorId` int(11) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `q1` varchar(255) DEFAULT NULL,
  `q2` varchar(255) DEFAULT NULL,
  `q3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`qualifyId`)
);
-- Table structure for table `races`
DROP TABLE IF EXISTS `races`;
CREATE TABLE `races` (
  `raceId` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL DEFAULT '0',
  `round` int(11) NOT NULL DEFAULT '0',
  `circuitId` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `time` time DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `fp1_date` date DEFAULT NULL,
  `fp1_time` time DEFAULT NULL,
  `fp2_date` date DEFAULT NULL,
  `fp2_time` time DEFAULT NULL,
  `fp3_date` date DEFAULT NULL,
  `fp3_time` time DEFAULT NULL,
  `quali_date` date DEFAULT NULL,
  `quali_time` time DEFAULT NULL,
  `sprint_date` date DEFAULT NULL,
  `sprint_time` time DEFAULT NULL,
  PRIMARY KEY (`raceId`),
  UNIQUE KEY `url` (`url`)
);
-- Table structure for table `results`
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `resultId` int(11) NOT NULL AUTO_INCREMENT,
  `raceId` int(11) NOT NULL DEFAULT '0',
  `driverId` int(11) NOT NULL DEFAULT '0',
  `constructorId` int(11) NOT NULL DEFAULT '0',
  `number` int(11) DEFAULT NULL,
  `grid` int(11) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `positionText` varchar(255) NOT NULL DEFAULT '',
  `positionOrder` int(11) NOT NULL DEFAULT '0',
  `points` float NOT NULL DEFAULT '0',
  `laps` int(11) NOT NULL DEFAULT '0',
  `time` varchar(255) DEFAULT NULL,
  `milliseconds` int(11) DEFAULT NULL,
  `fastestLap` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT '0',
  `fastestLapTime` varchar(255) DEFAULT NULL,
  `fastestLapSpeed` varchar(255) DEFAULT NULL,
  `statusId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resultId`)
);
-- Table structure for table `seasons`
DROP TABLE IF EXISTS `seasons`;
CREATE TABLE `seasons` (
  `year` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`year`),
  UNIQUE KEY `url` (`url`)
);
-- Table structure for table `sprintResults`
DROP TABLE IF EXISTS `sprintResults`;
CREATE TABLE `sprintResults` (
  `sprintResultId` int(11) NOT NULL AUTO_INCREMENT,
  `raceId` int(11) NOT NULL DEFAULT '0',
  `driverId` int(11) NOT NULL DEFAULT '0',
  `constructorId` int(11) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '0',
  `grid` int(11) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `positionText` varchar(255) NOT NULL DEFAULT '',
  `positionOrder` int(11) NOT NULL DEFAULT '0',
  `points` float NOT NULL DEFAULT '0',
  `laps` int(11) NOT NULL DEFAULT '0',
  `time` varchar(255) DEFAULT NULL,
  `milliseconds` int(11) DEFAULT NULL,
  `fastestLap` int(11) DEFAULT NULL,
  `fastestLapTime` varchar(255) DEFAULT NULL,
  `statusId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sprintResultId`),
  KEY `raceId` (`raceId`)
);
-- Table structure for table `status`
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `statusId` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`statusId`)
);