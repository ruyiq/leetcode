WITH cte AS (
    SELECT machine_id, process_id, (MAX(timestamp)-MIN(timestamp)) AS diff
    FROM Activity
    GROUP BY machine_id, process_id  
    )

SELECT machine_id,
    ROUND(AVG(diff),3) processing_time 
FROM cte
GROUP BY machine_id;