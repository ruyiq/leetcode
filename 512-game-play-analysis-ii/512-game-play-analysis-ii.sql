SELECT s.player_id, s.device_id 
FROM (SELECT rank() over(PARTITION BY player_id ORDER BY event_date) ranking, player_id, device_id FROM Activity) s 
WHERE s.ranking=1;