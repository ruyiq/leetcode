WITH cte AS (
    SELECT *, rank() over (PARTITION BY company ORDER BY salary,id) ranking, COUNT(*) over(partition by company) AS counts FROM Employee
)

SELECT id, company, salary 
FROM cte 
WHERE CASE
    when mod(counts,2) = 0 then (cte.ranking = counts/2 or cte.ranking = counts/2 + 1)
    else (cte.ranking = floor(counts/2) + 1 ) END;