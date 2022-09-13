with cte as (
    SELECT candidateId, COUNT(candidateId) as count_c
    FROM Vote
    GROUP BY candidateId
    ORDER BY count_c DESC 
    LIMIT 1
)

SELECT c.name 
FROM Candidate c,cte
WHERE c.id=cte.candidateId;