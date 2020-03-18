/* What is average number of moves per game when white wins? And if black wins? */

SELECT AVG(num_moves) FROM
    (SELECT COUNT(Games.game_id) as num_moves
    FROM Games
    JOIN Moves 
    ON Games.game_id = Moves.game_id
    Where Games.Winner = 'White'
    GROUP BY Moves.game_id) AS q1;
/* 
+----------------+
| AVG(num_moves) |
+----------------+
|        57.7785 |
+----------------+ 
*/

SELECT AVG(num_moves) FROM
    (SELECT COUNT(Games.game_id) as num_moves
    FROM Games
    JOIN Moves 
    ON Games.game_id = Moves.game_id
    Where Games.Winner = 'Black'
    GROUP BY Moves.game_id) AS q1;
/* 
+----------------+
| AVG(num_moves) |
+----------------+
|        60.7959 |
+----------------+ 
*/
