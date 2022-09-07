# Write your MySQL query statement below
SELECT w2.id
FROM weather w1
JOIN weather w2
    ON w2.recordDate = date_add(w1.recordDate,interval 1 day) AND w2.temperature>w1.temperature;