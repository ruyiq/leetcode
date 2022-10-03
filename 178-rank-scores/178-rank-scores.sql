SELECT score, ranking AS "rank"
FROM (SELECT *, dense_rank() over (ORDER BY score DESC) ranking FROM Scores) s;