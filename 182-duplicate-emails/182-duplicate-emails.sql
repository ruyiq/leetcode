# Write your MySQL query statement below
SELECT DISTINCT a.email
FROM person a, person b
WHERE a.email=b.email AND a.id<>b.id;
