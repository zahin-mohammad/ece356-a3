SET autocommit = 0;

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN;select Enrollment from Offering where courseID='ECE356';COMMIT;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN;select Enrollment from Offering where courseID='ECE356';COMMIT;
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN;select Enrollment from Offering where courseID='ECE356';COMMIT;
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN;select Enrollment from Offering where courseID='ECE356';COMMIT;

-- show variables like 'transaction_isolation';
