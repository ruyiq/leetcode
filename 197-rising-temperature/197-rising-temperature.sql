SELECT d2.id AS id
FROM Weather d1, Weather d2
WHERE date_add(d1.recordDate, interval 1 day)=d2.recordDate AND d2.temperature>d1.temperature;