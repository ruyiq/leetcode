SELECT DISTINCT e.employee_id 
FROM Employees e, Employees m1, Employees m2, Employees m3
WHERE e.manager_id  = m1.employee_id  
    AND m1.manager_id = m2.employee_id
    AND m2.manager_id = m3.employee_id
    AND m3.employee_id = 1
    AND e.employee_id != 1;