# Write your MySQL query statement below

WITH EmployeeCount AS (
    SELECT project_id, COUNT(DISTINCT employee_id) AS counts
    FROM Project    
    GROUP BY project_id
    ORDER BY counts DESC
)
SELECT project_id
FROM EmployeeCount
WHERE counts = (
    SELECT MAX(counts)
    FROM EmployeeCount
)