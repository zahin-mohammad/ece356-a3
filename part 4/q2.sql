/* What is average number of moves per game when white wins? And if black wins? */

SELECT AVG(num_moves) FROM
    (SELECT max(move_num)-1 as num_moves
    FROM Games
    JOIN Moves 
    ON Games.game_id = Moves.game_id
    Where Games.Winner = 'White'
    GROUP BY Moves.game_id) AS q1;