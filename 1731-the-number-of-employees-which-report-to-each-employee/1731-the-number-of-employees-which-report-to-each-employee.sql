SELECT DISTINCT m.employee_id, m.name, COUNT(DISTINCT e1.employee_id) AS reports_count, ROUND(AVG(e1.age),0) AS average_age
FROM Employees e1
JOIN Employees m
    WHERE e1.reports_to = m.employee_id
GROUP BY m.employee_id