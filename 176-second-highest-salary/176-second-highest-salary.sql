SELECT CASE WHEN COUNT(*)>0 THEN s.salary
            ELSE null END AS SecondHighestSalary  
FROM (SELECT dense_rank() over (ORDER BY salary DESC) AS ranking, salary FROM Employee) s
WHERE s.ranking = 2;