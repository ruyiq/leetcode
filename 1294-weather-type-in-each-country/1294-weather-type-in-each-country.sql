SELECT c.country_name, 
    CASE WHEN AVG(w.weather_state) <=15 THEN "Cold"
    WHEN AVG(w.weather_state) >=25 THEN "Hot"
    ELSE "Warm" END AS weather_type
FROM Countries c
JOIN Weather w
    USING(country_id)
WHERE YEAR(day)=2019 AND MONTH(day)=11
GROUP BY country_id 