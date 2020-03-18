/* What fraction of games start with a pawn move? */
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
/* 
+------------------+
| FractionPawnMove |
+------------------+
|           0.9599 |
+------------------+ 
*/
