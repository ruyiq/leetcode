SELECT w2.id
FROM Weather w1, Weather w2
WHERE w2.recordDate=date_add(w1.recordDate , interval 1 day) AND w2.temperature>w1.temperature;