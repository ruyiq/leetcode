SELECT IF(COUNT(*)=0, null, salary) AS SecondHighestSalary
FROM (SELECT *,dense_rank() over (ORDER BY salary DESC) ranking FROM Employee) s
WHERE s.ranking=2;