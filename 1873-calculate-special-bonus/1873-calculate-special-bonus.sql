# Write your MySQL query statement below
SELECT employee_id, CASE
WHEN name NOT LIKE 'M%' AND employee_id%2 = 1 OR employee_id = 0 THEN salary
ELSE salary = 0
END AS bonus
FROM Employees
ORDER BY employee_id