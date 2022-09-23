SELECT player_id, event_date AS first_login 
FROM (SELECT *, rank() over (PARTITION BY player_id ORDER BY event_date) ranking FROM Activity) s
WHERE s.ranking=1;