# Write your MySQL query statement below
SELECT e.name, SUM(b.bonus) AS bonus 
FROM Employee e
LEFT JOIN Bonus b USING(empId)
GROUP BY empId
HAVING SUM(b.bonus)<1000 OR SUM(b.bonus) IS NULL