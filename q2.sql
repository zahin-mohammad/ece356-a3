DELIMITER //

DROP PROCEDURE IF EXISTS tryEnrollment;
CREATE PROCEDURE tryEnrollment(
    IN courseID CHAR(8),
    IN section1 int,
    IN section2 int,
    IN termCode decimal(4),
    IN quantity int,
    OUT errorCode int
)
BEGIN
    -- if there are any errors, rollback the transaction.
    -- if there are no errors, set the error code to 0 and commit the transaction.
    

    DECLARE invalid_params CONDITION FOR SQLSTATE '02100';
    DECLARE section1EnrollmentError CONDITION FOR SQLSTATE '02200';
    DECLARE section2CapacityError CONDITION FOR SQLSTATE '02300';
    
    DECLARE EXIT HANDLER FOR invalid_params 
    BEGIN
        set errorCode = -1;
        ROLLBACK;
    END;

    DECLARE EXIT HANDLER FOR section1EnrollmentError
    BEGIN
        set errorCode = -2;
        ROLLBACK;
    END;

    DECLARE EXIT HANDLER FOR section2CapacityError
    BEGIN
        set errorCode = -2;
        ROLLBACK;
    END;

    set errorCode = 0;

    START TRANSACTION;
        -- if (courseID,section1,termCode) or (courseID,section2,termCode) do not exist in Offering, 
        -- or quantity is 0 or less or section1 = section2, set the error code to -1.
        IF (
            SELECT count(*) 
            FROM Offering 
            WHERE courseID = Offering.courseID 
            AND section1 = Offering.section 
            AND termCode = Offering.termCode) = 0
            THEN SIGNAL invalid_params;
        END IF;

        IF (
            SELECT count(*) 
            FROM Offering 
            WHERE courseID = Offering.courseID 
            AND section2 = Offering.section 
            AND termCode = Offering.termCode) = 0
            THEN SIGNAL invalid_params;
        END IF;
    
        -- attempt to reduce the enrollment in section1 by “quantity”; 
        UPDATE Offering 
        SET enrollment =  enrollment - quantity 
        WHERE courseID = Offering.courseID 
        AND termCode = Offering.termCode 
        AND section1 = Offering.section;
        
        -- if the result is a negative enrollment, set the error code to -2
        IF (
            SELECT enrollment 
            FROM Offering 
            WHERE courseID = Offering.courseID 
            AND termCode = Offering.termCode
            AND section1 = Offering.section) < 0 
            THEN SIGNAL section1EnrollmentError;
        END IF;

        -- attempt to increase the enrollment in section2 by “quantity”; 
        UPDATE Offering 
        SET enrollment =  enrollment + quantity 
        WHERE courseID = Offering.courseID 
        AND termCode = Offering.termCode
        AND section2 = Offering.section;

        -- if the result is that enrollment in sec-tion2 exceeds room capacity, then set the error code to -3.
        IF (
            SELECT capacity - enrollment
            FROM Offering JOIN Classroom 
            ON Offering.roomID = Classroom.roomID
            WHERE courseID = Offering.courseID 
            AND termCode = Offering.termCode 
            AND section2 = Offering.section) < 0 
            THEN SIGNAL section2CapacityError;
        END IF;
    COMMIT;

END//

DELIMITER ;