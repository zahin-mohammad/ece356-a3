DROP DATABASE IF EXISTS `baseball2016`;
CREATE DATABASE `baseball2016`;
use `baseball2016`;

SET FOREIGN_KEY_CHECKS=0;

source lahman2016-tables.sql;
source lahman2016-data.sql;
source lahman2016-batting.sql;

INSERT INTO Schools (schoolid) (SELECT DISTINCT schoolid FROM CollegePlaying WHERE schoolid NOT IN (SELECT schoolid FROM Schools));
INSERT INTO Master (playerid) (SELECT DISTINCT playerid FROM HallOfFame WHERE playerid NOT IN (SELECT playerid from Master));
INSERT INTO Master (playerid) (SELECT DISTINCT playerid FROM Salaries WHERE playerid NOT IN (SELECT playerid from Master));

SET FOREIGN_KEY_CHECKS=1;

