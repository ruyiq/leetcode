WITH minDates(p_id, min_date) AS (
    SELECT player_id, MIN(event_date)
    FROM Activity
    GROUP BY player_id
)
SELECT player_id, device_id
FROM Activity
JOIN minDates
ON player_id = p_id AND event_date = min_date