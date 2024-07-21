SELECT ROUND(COUNT(DISTINCT player_id )/(SELECT COUNT(DISTINCT player_id) FROM activity),2) as fraction
FROM (SELECT *, 
      MIN(event_date) OVER(PARTITION BY player_id ORDER BY event_date) first_log 
      FROM Activity) s
WHERE datediff(event_date,first_log) = 1