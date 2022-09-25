SELECT uni.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI uni
    USING(id)
    