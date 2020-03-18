-- How many moves, on average, does black make before moving one of his/her Knights?  Bishops? Rooks (Castles)?

SELECT AVG(movesBeforeMovingKnight) 
FROM 
(
    SELECT (min(move_num)-1)/2 as movesBeforeMovingKnight
    FROM Moves
    WHERE LEFT(move,1) = "n"
    AND move_num%2 = 1
    GROUP BY game_id
) AS q1;

/* 
+------------------------------+
| AVG(movesBeforeMovingKnight) |
+------------------------------+
|                   2.53557708 |
+------------------------------+
*/

SELECT AVG(movesBeforeMovingBishop) 
FROM 
(
    SELECT (min(move_num)-1)/2 as movesBeforeMovingBishop
    FROM Moves
    WHERE LEFT(move,1) = "b"
    AND move_num%2 = 1
    GROUP BY game_id
) AS q1;

/* 
+------------------------------+
| AVG(movesBeforeMovingBishop) |
+------------------------------+
|                   4.22974308 |
+------------------------------+
*/

SELECT AVG(movesBeforeMovingRook) 
FROM 
(
    SELECT (min(move_num)-1)/2 as movesBeforeMovingRook
    FROM Moves
    WHERE LEFT(move,1) = "r"
    AND move_num%2 = 1
    GROUP BY game_id
) AS q1;

/* 
+----------------------------+
| AVG(movesBeforeMovingRook) |
+----------------------------+
|                15.53814666 |
+----------------------------+
*/

