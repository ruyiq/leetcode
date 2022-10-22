with cte as (
    SELECT *
    FROM Employees 
    GROUP BY salary 
    HAVING COUNT(salary)=1
)

SELECT *, dense_rank() over (ORDER BY salary) team_id 
FROM Employees 
WHERE salary NOT IN (SELECT salary FROM cte)
ORDER BY team_id, employee_id;