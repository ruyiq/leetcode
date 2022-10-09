with cte as(
    SELECT candidateId, COUNT(DISTINCT id) as c
    FROM Vote
    GROUP BY candidateId
    ORDER BY c DESC
    LIMIT 1
)

SELECT c1.name
FROM Candidate c1
JOIN cte c2
    ON c2.candidateId = c1.id;
