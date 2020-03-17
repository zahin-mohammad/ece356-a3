DROP DATABASE IF EXISTS unitest;
CREATE DATABASE unitest;
use unitest;
source createUni.sql;
set autocommit=0;
source q2.sql;
-- Should pass
call switchSection('ECE356', 1, 2, 1191, 0, @errorCode);
SELECT CONCAT('EXPECTED 0 GOT ', @errorCode) AS 'result';

DROP DATABASE IF EXISTS unitest;
CREATE DATABASE unitest;
use unitest;
source createUni.sql;
set autocommit=0;
source q2.sql;
-- should pass
call switchSection('ECE356', 1, 2, 1191, 14, @errorCode);
SELECT CONCAT('EXPECTED 0 GOT ', @errorCode) AS 'result';

DROP DATABASE IF EXISTS unitest;
CREATE DATABASE unitest;
use unitest;
source createUni.sql;
set autocommit=0;
source q2.sql;
-- should fail
call switchSection('ECE356', 1, 2, 1191, 20, @errorCode);
SELECT CONCAT('EXPECTED -3 GOT ', @errorCode) AS 'result';

DROP DATABASE IF EXISTS unitest;
CREATE DATABASE unitest;
use unitest;
source createUni.sql;
set autocommit=0;
source q2.sql;
-- should fail
call switchSection('ECE356', 1, 2, 1191, 100, @errorCode);
SELECT CONCAT('EXPECTED -2 GOT ', @errorCode) AS 'result';

set autocommit=1;
