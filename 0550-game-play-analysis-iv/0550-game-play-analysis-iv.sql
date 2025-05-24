# Write your MySQL query statement below
WITH first_date AS (
    SELECT player_id, MIN(event_date) AS first_day
    FROM Activity
    GROUP BY player_id
),

returned_players AS(
    SELECT DISTINCT a.player_id
    FROM Activity a
    JOIN first_date f USING(player_id)
    WHERE DATEDIFF(a.event_date, f.first_day)=1
),

all_players AS (
    SELECT COUNT(DISTINCT player_id) as cnt
    FROM Activity
)

SELECT ROUND((SELECT COUNT(*) FROM returned_players)/all_players.cnt,2) AS fraction  
FROM all_players