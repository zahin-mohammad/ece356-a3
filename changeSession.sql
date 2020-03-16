SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
select Enrollment from Offering where courseID='ECE356';
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
select Enrollment from Offering where courseID='ECE356';
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
select Enrollment from Offering where courseID='ECE356';
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
select Enrollment from Offering where courseID='ECE356';

-- show variables like 'transaction_isolation';
