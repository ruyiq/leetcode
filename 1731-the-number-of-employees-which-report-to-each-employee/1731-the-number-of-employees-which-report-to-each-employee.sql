SELECT receiever.employee_id,
    receiever.name,
    COUNT(receiever.employee_id) AS reports_count,
    ROUND(AVG(reporter.age)) AS average_age 
FROM Employees reporter
JOIN Employees receiever
    ON reporter.reports_to = receiever.employee_id
GROUP BY employee_id
ORDER BY employee_id;