# Write your MySQL query statement below
WITH lst_2015 AS (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(DISTINCT pid)>1
), 

distinct_location AS (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat,lon
    HAVING COUNT(*)=1
)

SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016 
FROM Insurance
WHERE tiv_2015 in (SELECT * FROM lst_2015) 
    AND (lat,lon) in (SELECT* FROM distinct_location)
