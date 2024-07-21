SELECT e1.name
FROM Employee e1
-- e1 is e2's manager
LEFT JOIN Employee e2 ON e2.managerId = e1.id
GROUP BY e1.id
HAVING COUNT(DISTINCT e2.id)>=5
