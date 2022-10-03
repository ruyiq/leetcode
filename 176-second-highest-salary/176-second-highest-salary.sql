SELECT CASE WHEN COUNT(salary)=0 THEN null
    ELSE salary END AS SecondHighestSalary 
FROM (SELECT *,dense_rank() over (ORDER BY salary DESC) ranking FROM Employee)s
WHERE ranking=2;