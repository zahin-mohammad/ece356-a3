use uni;
set autocommit=0;
source q2.sql;

-- Should pass
START TRANSACTION;
call tryEnrollment('ECE356', 1, 2, 1191, 0, @errorCode);
SELECT @errorCode;
ROLLBACK;
COMMIT;

-- should pass
START TRANSACTION;
call tryEnrollment('ECE356', 1, 2, 1191, 14, @errorCode);
SELECT @errorCode;
ROLLBACK;
COMMIT;

-- -- should fail
-- call tryEnrollment('ECE356', 1, 2, 1191, 20, @errorCode);
-- SELECT @errorCode;

-- -- should fail
-- call tryEnrollment('ECE356', 1, 2, 1191, 100, @errorCode);
-- SELECT @errorCode;

-- -- should fail
-- call tryEnrollment('ECE356', 1, 2, 1191, 100, @errorCode);
-- SELECT @errorCode;

set autocommit=1;
