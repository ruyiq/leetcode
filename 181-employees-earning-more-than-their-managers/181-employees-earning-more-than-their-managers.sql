SELECT e.name AS Employee
FROM Employee e, Employee m
WHERE e.salary>m.salary AND m.id=e.managerId;