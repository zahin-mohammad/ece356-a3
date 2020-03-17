use uni;

source q2.sql;

-- Should pass
call tryEnrollment('ECE356', 1, 2, 1191, 4, @errorCode);
-- should pass
call tryEnrollment('ECE356', 1, 2, 1191, 14, @errorCode);
-- should fail
call tryEnrollment('ECE356', 1, 2, 1191, 20, @errorCode);
-- should fail
call tryEnrollment('ECE356', 1, 2, 1191, 100, @errorCode);
-- should fail
call tryEnrollment('ECE356', 1, 2, 1191, 100, @errorCode);

