SELECT m.name
FROM Employee e1, Employee m
WHERE e1.managerId=m.id
GROUP BY m.id
HAVING COUNT(DISTINCT e1.id)>=5;
