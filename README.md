<!-----
NEW: Your output is on the clipboard!

NEW: Check the "Suppress top comment" option to remove this info from the output.

Conversion time: 4.023 seconds.


Using this Markdown file:

1. Paste this output into your source file.
2. See the notes and action items below regarding this conversion run.
3. Check the rendered output (headings, lists, code blocks, tables) for proper
   formatting and use a linkchecker before you publish this page.

Conversion notes:

* Docs to Markdown version 1.0β24
* Thu May 14 2020 13:48:38 GMT-0700 (PDT)
* Source doc: ece356-a3
* This is a partial selection. Check to make sure intra-doc links work.
* Tables are currently converted to HTML tables.
----->



## ECE 356 - Assignment 3

Zahin Mohammad - 20669584 - [z5mohamm@uwaterloo.ca](mailto:z5mohamm@uwaterloo.ca)


```
List Of Tables
Table 1. Summary of outputs observed with changing isolation levels.
Table 2. Source code for instance 1.
Table 3. Source code for instance 2.
Table 4. Stored procedure switchSection.
Table 5. Test for stored procedure switchSection.
Table 6. Average time per query.
Table 7. Minimum time per query
Table 8. Maximum time per query.
Table 9. Script to remove foreign keys.
Table 10. Script to foreign primary keys.
Table 11. Script to add indexes.
Table 12. Performance testing script.
Table 13. Query 1.
Table 14. Query 2.
Table 15. Query 3.
Table 16. Query 4.
Table 17. Query 5.
Table 18. Fraction of games where White wins.
Table 19. SQL statement to find fraction of games where White wins.
Table 20. Average number of moves in games where White wins.
Table 21. SQL to find the average move in games where White wins.
Table 22. Average number of moves in games where Black wins.
Table 23. SQL to find the average move in games where Black wins.
Table 24. Fraction of games where the opening move was pawn.
Table 25. SQL to find the fraction of games where the opening move was pawn.
Table 26. Average number of moves before White moves a knight.
Table 27. SQL to find the average number of moves before White moves a knight.
Table 28. Average number of moves before White moves a bishop.
Table 29. SQL to find the average number of moves before White moves a bishop.
Table 30. Average number of moves before White moves a rook..
Table 31. SQL to find the average number of moves before White moves a rook.
Table 32. Average number of moves before Black moves a knight.
Table 33. SQL to find the average number of moves before Black moves a knight.
Table 34. Average number of moves before Black moves a bishop.
Table 35. SQL to find the average number of moves before Black moves a bishop.
Table 36. Average number of moves before Black moves a rook.
Table 37. SQL to find the average number of moves before Black moves a rook.
```



## Part 1

For this question, we refer to instance 1 as the mysql instance that performs the update transaction, and instance 2 as the mysql instance that performs the database read transaction. From the 4x4 permutation of the different isolation levels presented in table 1, it seems that the isolation level of instance 1 does not affect the output of instance 2’s database read. Instance 2’s results remain the same regardless of instance 1’s isolation level. From this we can say that an instance’s output is dependent on that instance’s isolation level, not the isolation level of other instances. The results 


<table>
  <tr>
   <td>Instance 1 (Update)
   </td>
   <td>Instance 2 (Select)
   </td>
   <td>Instance 2 Result
   </td>
  </tr>
  <tr>
   <td>Read-Uncommitted
   </td>
   <td>Read-Uncommitted
   </td>
   <td>+------------+
<p>
| Enrollment |
<p>
+------------+
<p>
|         64 |
<p>
|        103 |
<p>
+------------+
   </td>
  </tr>
  <tr>
   <td>Read-Uncommitted
   </td>
   <td>Read-Committed
   </td>
   <td>+------------+
<p>
| Enrollment |
<p>
+------------+
<p>
|         64 |
<p>
|        123 |
<p>
+------------+
   </td>
  </tr>
  <tr>
   <td>Read-Uncommitted
   </td>
   <td>Repeatable-Read
   </td>
   <td>+------------+
<p>
| Enrollment |
<p>
+------------+
<p>
|         64 |
<p>
|        123 |
<p>
+------------+
   </td>
  </tr>
  <tr>
   <td>Read-Uncommitted
   </td>
   <td>Serializeable
   </td>
   <td>Timeout
   </td>
  </tr>
  <tr>
   <td>Read-Committed
   </td>
   <td>Read-Uncommitted
   </td>
   <td>+------------+
<p>
| Enrollment |
<p>
+------------+
<p>
|         64 |
<p>
|        103 |
<p>
+------------+
   </td>
  </tr>
  <tr>
   <td>Read-Committed
   </td>
   <td>Read-Committed
   </td>
   <td>+------------+
<p>
| Enrollment |
<p>
+------------+
<p>
|         64 |
<p>
|        123 |
<p>
+------------+
   </td>
  </tr>
  <tr>
   <td>Read-Committed
   </td>
   <td>Repeatable-Read
   </td>
   <td>+------------+
<p>
| Enrollment |
<p>
+------------+
<p>
|         64 |
<p>
|        123 |
<p>
+------------+
   </td>
  </tr>
  <tr>
   <td>Read-Committed
   </td>
   <td>Serializeable
   </td>
   <td>Timeout
   </td>
  </tr>
  <tr>
   <td>Repeatable-Read
   </td>
   <td>Read-Uncommitted
   </td>
   <td>+------------+
<p>
| Enrollment |
<p>
+------------+
<p>
|         64 |
<p>
|        103 |
<p>
+------------+
   </td>
  </tr>
  <tr>
   <td>Repeatable-Read
   </td>
   <td>Read-Committed
   </td>
   <td>+------------+
<p>
| Enrollment |
<p>
+------------+
<p>
|         64 |
<p>
|        123 |
<p>
+------------+
   </td>
  </tr>
  <tr>
   <td>Repeatable-Read
   </td>
   <td>Repeatable-Read
   </td>
   <td>+------------+
<p>
| Enrollment |
<p>
+------------+
<p>
|         64 |
<p>
|        123 |
<p>
+------------+
   </td>
  </tr>
  <tr>
   <td>Repeatable-Read
   </td>
   <td>Serializeable
   </td>
   <td>Timeout
   </td>
  </tr>
  <tr>
   <td>Serializeable
   </td>
   <td>Read-Uncommitted
   </td>
   <td>+------------+
<p>
| Enrollment |
<p>
+------------+
<p>
|         64 |
<p>
|        103 |
<p>
+------------+
   </td>
  </tr>
  <tr>
   <td>Serializeable
   </td>
   <td>Read-Committed
   </td>
   <td>+------------+
<p>
| Enrollment |
<p>
+------------+
<p>
|         64 |
<p>
|        123 |
<p>
+------------+
   </td>
  </tr>
  <tr>
   <td>Serializeable
   </td>
   <td>Repeatable-Read
   </td>
   <td>+------------+
<p>
| Enrollment |
<p>
+------------+
<p>
|         64 |
<p>
|        123 |
<p>
+------------+
   </td>
  </tr>
  <tr>
   <td>Serializeable
   </td>
   <td>Serializeable
   </td>
   <td>Timeout
   </td>
  </tr>
</table>


_Table 1. Summary of outputs observed with changing isolation levels._


```
SET autocommit = 0;

SET SESSION TRANSACTION ISOLATION LEVEL [Level];

BEGIN;
update Offering set Enrollment = Enrollment - 20 where courseID="ECE356" and section=2 and termCode=1191;
update Offering set Enrollment = Enrollment + 20 where courseID="ECE356" and section=2 and termCode=1191;
COMMIT;
```


_Table 2. Source code for instance 1._


```
SET autocommit = 0;

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN;select Enrollment from Offering where courseID='ECE356';COMMIT;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN;select Enrollment from Offering where courseID='ECE356';COMMIT;
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN;select Enrollment from Offering where courseID='ECE356';COMMIT;
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN;select Enrollment from Offering where courseID='ECE356';COMMIT;
```


_Table 3. Source code for instance 2._


## Part 2

The sql for the stored procedure is provided in table 4. The test suite for this stored procedure is provided in table 5.

It is not possible to get equivalent functionality as the stored procedure from checks and triggers. This is because checks and triggers are independent of each other. 

An example of bad state that can be caused by using checks and triggers opposed to a stored procedure:



*   Current state 
    *   Offering ('ECE356'  , 1 , 1191 , 'E74417' , 1 , 64 )
    *   Offering ('ECE356'  , 2 , 1191 , 'E74417' , 3 , 123 )
    *   Classroom ('E74417', 'E7', 4417, 1000)
*   Try and remove 70 people from section 1, this should fail the check/trigger as 64-70 &lt; 0
    *   Offering ('ECE356'  , 1 , 1191 , 'E74417' , 1 , 64 )
    *   Offering ('ECE356'  , 2 , 1191 , 'E74417' , 3 , 123 )
    *   Classroom ('E74417', 'E7', 4417, 1000)
*   Try and add 70 people to section 2, this passes the check/trigger as 64+70 &lt; 1000
    *   Offering ('ECE356'  , 1 , 1191 , 'E74417' , 1 , 64 )
    *   Offering ('ECE356'  , 2 , 1191 , 'E74417' , 3 , 193 )
    *   Classroom ('E74417', 'E7', 4417, 1000)

Since the checks/triggers are independant, we cannot stop an update after a previous check/trigger has failed. This is why we need a stored procedure.


```
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
    
        -- attempt to reduce the enrollment in section1 by "quantity"; 
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

        -- attempt to increase the enrollment in section2 by "quantity"; 
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
```


_Table 4. Stored procedure switchSection._


```
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
```


_Table 5. Test for stored procedure switchSection._

_ _


##  Part 3

Using the example queries shown in tables 13-17, average timings were recorded after changing the keys on tables. 

It can be seen that the greatest performance improvement can be seen with Primary Key, Foreign Keys and Indexes all enabled, and the worst performance was observed when all these keys were turned off or removed. 

Interestingly it can be seen that Foreign keys provide marginal performance improvement when we look at the case of Primary Key on, Foreign Key on, Index on vs Primary key on, Foreign key off, and Index on. All these results are summarized in tables 6-8.


<table>
  <tr>
   <td><strong>Average TIme in mS</strong>
   </td>
   <td>PK: ON
<p>
FK: ON
<p>
IND: ON
   </td>
   <td>PK: ON
<p>
FK: ON
<p>
IND: OFF
   </td>
   <td>PK: ON
<p>
FK: OFF
<p>
IND: ON
   </td>
   <td>PK: ON
<p>
FK: OFF
<p>
IND: OFF
   </td>
   <td>PK:OFF
<p>
FK: OFF
<p>
IND: OFF
   </td>
  </tr>
  <tr>
   <td>Query 1
   </td>
   <td><p style="text-align: right">
5837.7248</p>

   </td>
   <td><p style="text-align: right">
9634.21020000</p>

   </td>
   <td><p style="text-align: right">
5864.4370</p>

   </td>
   <td><p style="text-align: right">
7802.2104      </p>

   </td>
   <td><p style="text-align: right">
17251.97480</p>

   </td>
  </tr>
  <tr>
   <td>Query 2
   </td>
   <td><p style="text-align: right">
132840.5008</p>

   </td>
   <td><p style="text-align: right">
157434.7098    </p>

   </td>
   <td><p style="text-align: right">
135214.6006</p>

   </td>
   <td><p style="text-align: right">
135979.1682   </p>

   </td>
   <td><p style="text-align: right">
76949746.87100</p>

   </td>
  </tr>
  <tr>
   <td>Query 3
   </td>
   <td><p style="text-align: right">
4357.3764</p>

   </td>
   <td><p style="text-align: right">
7996.3006     </p>

   </td>
   <td><p style="text-align: right">
5123.2024</p>

   </td>
   <td><p style="text-align: right">
6987.5210 </p>

   </td>
   <td><p style="text-align: right">
9742.52280</p>

   </td>
  </tr>
  <tr>
   <td>Query 4
   </td>
   <td><p style="text-align: right">
132869.5422</p>

   </td>
   <td><p style="text-align: right">
180253.7926</p>

   </td>
   <td>129635.9020
   </td>
   <td><p style="text-align: right">
127548.8456</p>

   </td>
   <td><p style="text-align: right">
72416305.83740000</p>

   </td>
  </tr>
  <tr>
   <td>Query 5
   </td>
   <td><p style="text-align: right">
165408.6374</p>

   </td>
   <td><p style="text-align: right">
178687.5120    </p>

   </td>
   <td><p style="text-align: right">
170509.2602</p>

   </td>
   <td><p style="text-align: right">
163197.7116</p>

   </td>
   <td><p style="text-align: right">
137500.66940000</p>

   </td>
  </tr>
</table>


_Table 6. Average time per query._


<table>
  <tr>
   <td><strong>Minimum TIme in mS</strong>
   </td>
   <td>PK: ON
<p>
FK: ON
<p>
IND: ON
   </td>
   <td>PK: ON
<p>
FK: ON
<p>
IND: OFF
   </td>
   <td>PK: ON
<p>
FK: OFF
<p>
IND: ON
   </td>
   <td>PK: ON
<p>
FK: OFF
<p>
IND: OFF
   </td>
   <td>PK:OFF
<p>
FK: OFF
<p>
IND: OFF
   </td>
  </tr>
  <tr>
   <td>Query 1
   </td>
   <td><p style="text-align: right">
 3888.9400</p>

   </td>
   <td><p style="text-align: right">
7350.6160</p>

   </td>
   <td><p style="text-align: right">
4041.3180</p>

   </td>
   <td><p style="text-align: right">
6418.2580</p>

   </td>
   <td><p style="text-align: right">
12801.0580</p>

   </td>
  </tr>
  <tr>
   <td>Query 2
   </td>
   <td><p style="text-align: right">
 130588.3830</p>

   </td>
   <td><p style="text-align: right">
142179.4510</p>

   </td>
   <td><p style="text-align: right">
131798.0490</p>

   </td>
   <td><p style="text-align: right">
129679.0120</p>

   </td>
   <td><p style="text-align: right">
72252366.2330</p>

   </td>
  </tr>
  <tr>
   <td>Query 3
   </td>
   <td><p style="text-align: right">
 3865.5630</p>

   </td>
   <td><p style="text-align: right">
6750.6140</p>

   </td>
   <td><p style="text-align: right">
3634.6020</p>

   </td>
   <td><p style="text-align: right">
6440.6150</p>

   </td>
   <td><p style="text-align: right">
8967.3420</p>

   </td>
  </tr>
  <tr>
   <td>Query 4
   </td>
   <td><p style="text-align: right">
127363.5520</p>

   </td>
   <td><p style="text-align: right">
127472.2020</p>

   </td>
   <td><p style="text-align: right">
125534.5060</p>

   </td>
   <td><p style="text-align: right">
125903.9000 </p>

   </td>
   <td><p style="text-align: right">
71536399.8190</p>

   </td>
  </tr>
  <tr>
   <td>Query 5
   </td>
   <td><p style="text-align: right">
 164000.1590</p>

   </td>
   <td><p style="text-align: right">
167207.6690 </p>

   </td>
   <td><p style="text-align: right">
165014.5090</p>

   </td>
   <td><p style="text-align: right">
147579.5810</p>

   </td>
   <td><p style="text-align: right">
134340.1550</p>

   </td>
  </tr>
</table>


_Table 7. Minimum time per query_


<table>
  <tr>
   <td><strong>Maximum TIme in mS</strong>
   </td>
   <td>PK: ON
<p>
FK: ON
<p>
IND: ON
   </td>
   <td>PK: ON
<p>
FK: ON
<p>
IND: OFF
   </td>
   <td>PK: ON
<p>
FK: OFF
<p>
IND: ON
   </td>
   <td>PK: ON
<p>
FK: OFF
<p>
IND: OFF
   </td>
   <td>PK:OFF
<p>
FK: OFF
<p>
IND: OFF
   </td>
  </tr>
  <tr>
   <td>Query 1
   </td>
   <td><p style="text-align: right">
 8459.5880</p>

   </td>
   <td><p style="text-align: right">
12200.1410</p>

   </td>
   <td><p style="text-align: right">
7569.2080</p>

   </td>
   <td><p style="text-align: right">
9368.9760</p>

   </td>
   <td><p style="text-align: right">
22298.1850</p>

   </td>
  </tr>
  <tr>
   <td>Query 2
   </td>
   <td><p style="text-align: right">
 138985.8450</p>

   </td>
   <td><p style="text-align: right">
202323.9340</p>

   </td>
   <td><p style="text-align: right">
138894.3070</p>

   </td>
   <td><p style="text-align: right">
139568.0170</p>

   </td>
   <td><p style="text-align: right">
88240290.8620</p>

   </td>
  </tr>
  <tr>
   <td>Query 3
   </td>
   <td><p style="text-align: right">
 5211.4210 </p>

   </td>
   <td><p style="text-align: right">
8786.9650</p>

   </td>
   <td><p style="text-align: right">
7360.8280</p>

   </td>
   <td><p style="text-align: right">
7264.0210</p>

   </td>
   <td><p style="text-align: right">
10724.1090</p>

   </td>
  </tr>
  <tr>
   <td>Query 4
   </td>
   <td><p style="text-align: right">
143089.1090 </p>

   </td>
   <td><p style="text-align: right">
280593.2990</p>

   </td>
   <td><p style="text-align: right">
134201.0880</p>

   </td>
   <td><p style="text-align: right">
129632.7520</p>

   </td>
   <td><p style="text-align: right">
73066133.2820</p>

   </td>
  </tr>
  <tr>
   <td>Query 5
   </td>
   <td><p style="text-align: right">
168839.3960</p>

   </td>
   <td><p style="text-align: right">
192524.9700</p>

   </td>
   <td><p style="text-align: right">
176335.5830</p>

   </td>
   <td><p style="text-align: right">
170099.7250</p>

   </td>
   <td><p style="text-align: right">
145392.8270</p>

   </td>
  </tr>
</table>


_Table 8. Maximum time per query._


```
alter table baseball2016.Teams DROP FOREIGN KEY Teams_ibfk_1;                              
alter table baseball2016.AllstarFull DROP FOREIGN KEY AllstarFull_ibfk_1;                  
alter table baseball2016.AllstarFull DROP FOREIGN KEY AllstarFull_ibfk_2;                  
alter table baseball2016.Appearances DROP FOREIGN KEY Appearances_ibfk_1;                  
alter table baseball2016.Appearances DROP FOREIGN KEY Appearances_ibfk_2;                  
alter table baseball2016.AwardsManagers DROP FOREIGN KEY AwardsManagers_ibfk_1;            
alter table baseball2016.AwardsPlayers DROP FOREIGN KEY AwardsPlayers_ibfk_1;              
alter table baseball2016.AwardsShareManagers DROP FOREIGN KEY AwardsShareManagers_ibfk_1;  
alter table baseball2016.AwardsSharePlayers DROP FOREIGN KEY AwardsSharePlayers_ibfk_1;    
alter table baseball2016.Batting DROP FOREIGN KEY Batting_ibfk_1;                          
alter table baseball2016.Batting DROP FOREIGN KEY Batting_ibfk_2;                          
alter table baseball2016.BattingPost DROP FOREIGN KEY BattingPost_ibfk_1;                  
alter table baseball2016.BattingPost DROP FOREIGN KEY BattingPost_ibfk_2;                  
alter table baseball2016.CollegePlaying DROP FOREIGN KEY CollegePlaying_ibfk_1;            
alter table baseball2016.CollegePlaying DROP FOREIGN KEY CollegePlaying_ibfk_2;            
alter table baseball2016.Fielding DROP FOREIGN KEY Fielding_ibfk_1;                        
alter table baseball2016.Fielding DROP FOREIGN KEY Fielding_ibfk_2;                        
alter table baseball2016.FieldingOF DROP FOREIGN KEY FieldingOF_ibfk_1;                    
alter table baseball2016.FieldingOFsplit DROP FOREIGN KEY FieldingOFsplit_ibfk_1;          
alter table baseball2016.FieldingOFsplit DROP FOREIGN KEY FieldingOFsplit_ibfk_2;          
alter table baseball2016.FieldingPost DROP FOREIGN KEY FieldingPost_ibfk_1;                
alter table baseball2016.FieldingPost DROP FOREIGN KEY FieldingPost_ibfk_2;                
alter table baseball2016.HallOfFame DROP FOREIGN KEY HallOfFame_ibfk_1;                    
alter table baseball2016.HomeGames DROP FOREIGN KEY HomeGames_ibfk_1;                      
alter table baseball2016.Managers DROP FOREIGN KEY Managers_ibfk_1;                        
alter table baseball2016.Managers DROP FOREIGN KEY Managers_ibfk_2;                        
alter table baseball2016.ManagersHalf DROP FOREIGN KEY ManagersHalf_ibfk_1;                
alter table baseball2016.ManagersHalf DROP FOREIGN KEY ManagersHalf_ibfk_2;                
alter table baseball2016.Pitching DROP FOREIGN KEY Pitching_ibfk_1;                        
alter table baseball2016.Pitching DROP FOREIGN KEY Pitching_ibfk_2;                        
alter table baseball2016.PitchingPost DROP FOREIGN KEY PitchingPost_ibfk_1;                
alter table baseball2016.PitchingPost DROP FOREIGN KEY PitchingPost_ibfk_2;                
alter table baseball2016.Salaries DROP FOREIGN KEY Salaries_ibfk_1;                        
alter table baseball2016.Salaries DROP FOREIGN KEY Salaries_ibfk_2;                        
alter table baseball2016.SeriesPost DROP FOREIGN KEY SeriesPost_ibfk_1;                    
alter table baseball2016.SeriesPost DROP FOREIGN KEY SeriesPost_ibfk_2;                    
alter table baseball2016.TeamsHalf DROP FOREIGN KEY TeamsHalf_ibfk_1; 
```


_Table 9. Script to remove foreign keys._


```
alter table baseball2016.Master DROP PRIMARY KEY;                       
alter table baseball2016.TeamsFranchises DROP PRIMARY KEY;              
alter table baseball2016.Schools DROP PRIMARY KEY;                      
alter table baseball2016.Teams DROP PRIMARY KEY;                        
alter table baseball2016.Parks DROP PRIMARY KEY;                        
alter table baseball2016.AllstarFull DROP PRIMARY KEY;                  
alter table baseball2016.Appearances DROP PRIMARY KEY;                  
alter table baseball2016.AwardsManagers DROP PRIMARY KEY;               
alter table baseball2016.AwardsPlayers DROP PRIMARY KEY;                
alter table baseball2016.AwardsShareManagers DROP PRIMARY KEY;          
alter table baseball2016.AwardsSharePlayers DROP PRIMARY KEY;           
alter table baseball2016.Batting DROP PRIMARY KEY;                      
alter table baseball2016.BattingPost DROP PRIMARY KEY;                  
alter table baseball2016.CollegePlaying DROP PRIMARY KEY;               
alter table baseball2016.Fielding DROP PRIMARY KEY;                     
alter table baseball2016.FieldingOF DROP PRIMARY KEY;                   
alter table baseball2016.FieldingOFsplit DROP PRIMARY KEY;              
alter table baseball2016.FieldingPost DROP PRIMARY KEY;                 
alter table baseball2016.HallOfFame DROP PRIMARY KEY;                   
alter table baseball2016.HomeGames DROP PRIMARY KEY;                    
alter table baseball2016.Managers DROP PRIMARY KEY;                     
alter table baseball2016.ManagersHalf DROP PRIMARY KEY;                 
alter table baseball2016.Pitching DROP PRIMARY KEY;                     
alter table baseball2016.PitchingPost DROP PRIMARY KEY;                 
alter table baseball2016.Salaries DROP PRIMARY KEY;                     
alter table baseball2016.SeriesPost DROP PRIMARY KEY;                   
alter table baseball2016.TeamsHalf DROP PRIMARY KEY;
```


_Table 10. Script to foreign primary keys._


```
ALTER TABLE Master ADD INDEX (birthMonth);
ALTER TABLE Master ADD INDEX (birthYear);
ALTER TABLE Master ADD INDEX (birthDay);
ALTER TABLE Salaries ADD INDEX (yearID);
ALTER TABLE Appearances ADD INDEX (yearID);
ALTER TABLE Managers ADD INDEX (yearID);
ALTER TABLE Batting ADD INDEX (playerID);
ALTER TABLE Batting ADD INDEX (yearID);
```


_Table 11. Script to add indexes._


```
CALL sys.ps_truncate_all_tables(FALSE);
source query1x5.sql;

SELECT 
    AVG(TIMER_WAIT)/1000000 as 'AverageRunTime',
    min(TIMER_WAIT)/1000000 as 'SmallestRunTime',
    max(TIMER_WAIT)/1000000 as 'LargestRunTime'
FROM performance_schema.events_transactions_history;

CALL sys.ps_truncate_all_tables(FALSE);
source query2x5.sql;

SELECT 
    AVG(TIMER_WAIT)/1000000 as 'AverageRunTime',
    min(TIMER_WAIT)/1000000 as 'SmallestRunTime',
    max(TIMER_WAIT)/1000000 as 'LargestRunTime'
FROM performance_schema.events_transactions_history;

CALL sys.ps_truncate_all_tables(FALSE);
source query3x5.sql;

SELECT 
    AVG(TIMER_WAIT)/1000000 as 'AverageRunTime',
    min(TIMER_WAIT)/1000000 as 'SmallestRunTime',
    max(TIMER_WAIT)/1000000 as 'LargestRunTime'
FROM performance_schema.events_transactions_history;

CALL sys.ps_truncate_all_tables(FALSE);
source query4x5.sql;

SELECT 
    AVG(TIMER_WAIT)/1000000 as 'AverageRunTime',
    min(TIMER_WAIT)/1000000 as 'SmallestRunTime',
    max(TIMER_WAIT)/1000000 as 'LargestRunTime'
FROM performance_schema.events_transactions_history;

CALL sys.ps_truncate_all_tables(FALSE);
source query5x5.sql;

SELECT 
    AVG(TIMER_WAIT)/1000000 as 'AverageRunTime',
    min(TIMER_WAIT)/1000000 as 'SmallestRunTime',
    max(TIMER_WAIT)/1000000 as 'LargestRunTime'
FROM performance_schema.events_transactions_history;
```


_Table 12. Performance testing script._


```
select count(playerID) 
from Master
where birthYear is null
or birthYear = ""      
or birthMonth is null
or birthMonth = ""        
or birthDay is null
or birthDay = "";
```


_Table 13. Query 1._


```
select
playerID,sum(salary) as totalPay 
from Salaries
left outer join Appearances using (playerID,yearID,teamID)
left outer join Managers using (playerID,yearID,teamID)
where G is null 
and G_all is null
group by playerID
order by totalPay desc
limit 3;
```


_Table 14. Query 2._


```
select count(playerID) 
from Master 
where birthYear is null 
or birthYear = ""
or birthMonth is null or birthMonth = ""
or birthDay is null or birthDay = "";
```


_Table 15. Query 3._


```
select playerID,sum(salary) as totalPay 
from Salaries
left outer join Appearances using (playerID,yearID,teamID)
left outer join Managers using (playerID,yearID,teamID)
where G is null and
G_all is null
group by playerID
order by totalPay desc
limit 3;
```


_Table 16. Query 4._


```
select nameFirst,nameLast,max(RBI) 
from Batting
inner join Master using (playerID)
where HR = 0
group by nameLast, nameFirst
limit 1;
```


_Table 17. Query 5._


## Part 4

The following questions are answered using the output of the SQL queries.



1. What fraction of games does white win?

    ```
+-------------------+
| FractionWhiteWins |
+-------------------+
|            0.4994 |
+-------------------+ 
```



_Table 18. Fraction of games where White wins._


```
SELECT COUNT(*)/(SELECT COUNT(*) from Games) AS FractionWhiteWins
FROM Games WHERE Winner = 'White';
```


_Table 19. SQL statement to find fraction of games where White wins._



2. 
    1. What is the average number of moves per game when white wins? 

        ```
+----------------+
| AVG(num_moves) |
+----------------+
|        57.7785 |
+----------------+
```



_Table 20. Average number of moves in games where White wins._


```
SELECT AVG(num_moves) FROM
    (SELECT COUNT(Games.game_id) as num_moves
    FROM Games
    JOIN Moves 
    ON Games.game_id = Moves.game_id
    Where Games.Winner = 'White'
    GROUP BY Moves.game_id) AS q1;
```


_Table 21. SQL to find the average move in games where White wins._



    2. And if black wins?

        ```
+----------------+
| AVG(num_moves) |
+----------------+
|        60.7959 |
+----------------+ 
```



_Table 22. Average number of moves in games where Black wins._


```
SELECT AVG(num_moves) FROM
    (SELECT COUNT(Games.game_id) as num_moves
    FROM Games
    JOIN Moves 
    ON Games.game_id = Moves.game_id
    Where Games.Winner = 'Black'
    GROUP BY Moves.game_id) AS q1;
```


_Table 23. SQL to find the average move in games where Black wins._



3. What fraction of games start with a pawn move?

    ```
+------------------+
| FractionPawnMove |
+------------------+
|           0.9599 |
+------------------+ 
```



_Table 24. Fraction of games where the opening move was pawn._


```
SELECT 
(
    SELECT COUNT(*)
    FROM Games
    INNER JOIN Moves
    ON Games.game_id = Moves.game_id
    WHERE CHAR_LENGTH(move) = 3
    AND move_num = 0
)/
(
    SELECT COUNT(distinct game_id) 
    FROM Moves
) As FractionPawnMove;
```


_Table 25. SQL to find the fraction of games where the opening move was pawn._



4. 
    3. How many moves, on average, does white make before moving one of his/her Knights?

        ```
+------------------------------+
| AVG(movesBeforeMovingKnight) |
+------------------------------+
|                   2.42403799 |
+------------------------------+ 
```



_Table 26. Average number of moves before White moves a knight._


```
SELECT AVG(movesBeforeMovingKnight) 
FROM 
(
    SELECT min(move_num)/2 as movesBeforeMovingKnight
    FROM Moves
    WHERE LEFT(move,1) = "n"
    AND move_num%2 = 0
    GROUP BY game_id
) AS q1;
```


_Table 27. SQL to find the average number of moves before White moves a knight._



    4. How many moves, on average, does white make before moving one of his/her Bishops?

        ```
+------------------------------+
| AVG(movesBeforeMovingBishop) |
+------------------------------+
|                   3.90142447 |
+------------------------------+ 
```



_Table 28. Average number of moves before White moves a bishop._


```
SELECT AVG(movesBeforeMovingBishop) 
FROM 
(
    SELECT min(move_num)/2 as movesBeforeMovingBishop
    FROM Moves
    WHERE LEFT(move,1) = "b"
    AND move_num%2 = 0
    GROUP BY game_id
) AS q1;
```


_Table 29. SQL to find the average number of moves before White moves a bishop._



    5. How many moves, on average, does white make before moving one of his/her Rooks (Castles)?

        ```
+----------------------------+
| AVG(movesBeforeMovingRook) |
+----------------------------+
|                15.29929480 |
+----------------------------+ 
```



_Table 30. Average number of moves before White moves a rook.._


```
SELECT AVG(movesBeforeMovingRook) 
FROM 
(
    SELECT min(move_num)/2 as movesBeforeMovingRook
    FROM Moves
    WHERE LEFT(move,1) = "r"
    AND move_num%2 = 0
    GROUP BY game_id
) AS q1;
```


_Table 31. SQL to find the average number of moves before White moves a rook._



5. 
    6.  How many moves, on average, does black make before moving one of his/her Knights?

        ```
+------------------------------+
| AVG(movesBeforeMovingKnight) |
+------------------------------+
|                   2.53557708 |
+------------------------------+
```



_Table 32. Average number of moves before Black moves a knight._


```
SELECT AVG(movesBeforeMovingKnight) 
FROM 
(
    SELECT (min(move_num)-1)/2 as movesBeforeMovingKnight
    FROM Moves
    WHERE LEFT(move,1) = "n"
    AND move_num%2 = 1
    GROUP BY game_id
) AS q1;
```


_Table 33. SQL to find the average number of moves before Black moves a knight._



    7. How many moves, on average, does black make before moving one of his/her  Bishops?

        ```
+------------------------------+
| AVG(movesBeforeMovingBishop) |
+------------------------------+
|                   4.22974308 |
+------------------------------+
```



_Table 34. Average number of moves before Black moves a bishop._


```
SELECT AVG(movesBeforeMovingBishop) 
FROM 
(
    SELECT (min(move_num)-1)/2 as movesBeforeMovingBishop
    FROM Moves
    WHERE LEFT(move,1) = "b"
    AND move_num%2 = 1
    GROUP BY game_id
) AS q1;
```


_Table 35. SQL to find the average number of moves before Black moves a bishop._



    8. How many moves, on average, does black make before moving one of his/her Rooks (Castles)?

        ```
+----------------------------+
| AVG(movesBeforeMovingRook) |
+----------------------------+
|                15.53814666 |
+----------------------------+
```



_Table 36. Average number of moves before Black moves a rook._


```
SELECT AVG(movesBeforeMovingRook) 
FROM 
(
    SELECT (min(move_num)-1)/2 as movesBeforeMovingRook
    FROM Moves
    WHERE LEFT(move,1) = "r"
    AND move_num%2 = 1
    GROUP BY game_id
) AS q1;
```


_Table 37. SQL to find the average number of moves before Black moves a rook._
