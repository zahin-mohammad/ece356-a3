use uni;

source q2.sql;

-- Should pass
call tryEnrollment('ECE356', 1, 2, 1191, 4);
-- should pass
call tryEnrollment('ECE356', 1, 2, 14);
-- should fail
call tryEnrollment('ECE356', 1, 2, 20)
-- should fail
call tryEnrollment('ECE356', 1, 2, 1191, 100);
-- should fail
call tryEnrollment('ECE356', 1, 2, 1191, 100);

