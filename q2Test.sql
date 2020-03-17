use uni;

source q2.sql;

-- Should pass
call tryEnrollment('ECE356', 1, 2, 1191, 4, @errorCode);
SELECT @errorCode;
-- should pass
call tryEnrollment('ECE356', 1, 2, 1191, 14, @errorCode);
SELECT @errorCode;
-- should fail
call tryEnrollment('ECE356', 1, 2, 1191, 20, @errorCode);
SELECT @errorCode;
-- should fail
call tryEnrollment('ECE356', 1, 2, 1191, 100, @errorCode);
SELECT @errorCode;
-- should fail
call tryEnrollment('ECE356', 1, 2, 1191, 100, @errorCode);
SELECT @errorCode;

