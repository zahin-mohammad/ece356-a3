DELIMITER //

DROP PROCEDURE IF EXISTS switchSection;
CREATE PROCEDURE switchSection(
    IN courseID CHAR(8),
    IN section1 int,
    IN section2 int,
    IN termCode decimal(4),
    IN quantity int,
    OUT errorCode int
)
proc_label:BEGIN

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
            THEN 
                    set errorCode = -1;
                    ROLLBACK;
                    LEAVE proc_label; 
        END IF;

        IF (
            SELECT count(*) 
            FROM Offering 
            WHERE courseID = Offering.courseID 
            AND section2 = Offering.section 
            AND termCode = Offering.termCode) = 0
            THEN 
                    set errorCode = -1;
                    ROLLBACK;
                    LEAVE proc_label; 
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
            THEN 
                    set errorCode = -2;
                    ROLLBACK;
                    LEAVE proc_label; 
        END IF;

        -- attempt to increase the enrollment in section2 by “quantity”; 
        UPDATE Offering 
        SET enrollment =  enrollment + quantity 
        WHERE courseID = Offering.courseID 
        AND termCode = Offering.termCode
        AND section2 = Offering.section;

        -- if the result is that enrollment in section2 exceeds room capacity, then set the error code to -3.
        IF (
            SELECT capacity 
            FROM Offering JOIN Classroom 
            ON Offering.roomID = Classroom.roomID
            WHERE courseID = Offering.courseID 
            AND termCode = Offering.termCode 
            AND section2 = Offering.section
            ) < 
            (
            SELECT enrollment
            FROM Offering JOIN Classroom 
            ON Offering.roomID = Classroom.roomID
            WHERE courseID = Offering.courseID 
            AND termCode = Offering.termCode 
            AND section2 = Offering.section
            ) 
            THEN 
                    set errorCode = -3;
                    ROLLBACK;
                    LEAVE proc_label; 
        END IF;
    COMMIT;

END//

DELIMITER ;