-- How many moves, on average, does white make before moving one of his/her Knights?  Bishops? Rooks (Castles)?

SELECT AVG(movesBeforeMovingKnight) 
FROM 
(
    SELECT min(move_num)/2 as movesBeforeMovingKnight
    FROM Moves
    WHERE LEFT(move,1) = "n"
    AND move_num%2 = 0
    GROUP BY game_id
) AS q1;

/* 
+------------------------------+
| AVG(movesBeforeMovingKnight) |
+------------------------------+
|                   2.42403799 |
+------------------------------+ 
*/

SELECT AVG(movesBeforeMovingBishop) 
FROM 
(
    SELECT min(move_num)/2 as movesBeforeMovingBishop
    FROM Moves
    WHERE LEFT(move,1) = "b"
    AND move_num%2 = 0
    GROUP BY game_id
) AS q1;

/* 
+------------------------------+
| AVG(movesBeforeMovingBishop) |
+------------------------------+
|                   3.90142447 |
+------------------------------+ 
*/

SELECT AVG(movesBeforeMovingRook) 
FROM 
(
    SELECT min(move_num)/2 as movesBeforeMovingRook
    FROM Moves
    WHERE LEFT(move,1) = "r"
    AND move_num%2 = 0
    GROUP BY game_id
) AS q1;

/* 
+----------------------------+
| AVG(movesBeforeMovingRook) |
+----------------------------+
|                15.29929480 |
+----------------------------+ 
*/

