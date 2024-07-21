# Write your MySQL query statement below
SELECT DISTINCT day2.id
FROM Weather day2
JOIN Weather day1 ON DATE_ADD(day1.recordDate, INTERVAL 1 DAY) = day2.recordDate
WHERE day2.temperature > day1.temperature
GROUP BY day2.id
