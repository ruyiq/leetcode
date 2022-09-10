SELECT score, s.rank
FROM (SELECT dense_rank() over (ORDER BY score DESC) AS 'rank', score FROM Scores) as s;