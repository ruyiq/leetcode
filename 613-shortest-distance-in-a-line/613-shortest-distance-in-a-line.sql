# Write your MySQL query statement below
SELECT MIN(abs(x1.x-x2.x)) AS shortest
FROM Point x1, Point x2
WHERE x1.x != x2.x;
