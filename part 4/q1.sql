/* What fraction of games does white win? */

SELECT COUNT(*)/(SELECT COUNT(*) from Games) AS FractionWhiteWins
FROM Games WHERE Winner = 'White';

/* 
+-------------------+
| FractionWhiteWins |
+-------------------+
|            0.4994 |
+-------------------+ 
*/
