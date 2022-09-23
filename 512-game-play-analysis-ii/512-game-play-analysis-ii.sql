SELECT player_id, device_id 
FROM (SELECT *, rank() over (PARTITION BY player_id ORDER BY event_date) ranking FROM Activity) s
WHERE ranking=1;
