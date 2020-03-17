source lahman2016.sql;
use `baseball2016`;

-- Add Index
ALTER TABLE Master ADD INDEX (birthMonth);
ALTER TABLE Master ADD INDEX (birthYear);
ALTER TABLE Master ADD INDEX (birthDay);
ALTER TABLE Salaries ADD INDEX (yearID);
ALTER TABLE Appearances ADD INDEX (yearID);
ALTER TABLE Managers ADD INDEX (yearID);
ALTER TABLE Batting ADD INDEX (playerID);
ALTER TABLE Batting ADD INDEX (yearID);

INSERT INTO performance_schema.setup_objects VALUES ('EVENT','baseball2016','%','YES','YES');

source test.sql;