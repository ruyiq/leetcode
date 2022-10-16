SELECT s2.gender,
    s2.day,
    SUM(s1.score_points) AS total
FROM Scores s1, Scores s2
WHERE s1.day <= s2.day AND s1.gender=s2.gender
GROUP BY s2.gender, s2.day
ORDER BY s2.gender, s2.day;
