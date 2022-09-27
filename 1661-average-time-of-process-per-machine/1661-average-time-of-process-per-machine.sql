with cte as (
    SELECT machine_id,process_id, SUM(IF(activity_type="end",timestamp,0)-IF(activity_type="start",timestamp,0)) AS diff 
    FROM Activity 
    GROUP BY machine_id, process_id
)

SELECT machine_id,
    ROUND(AVG(diff),3) processing_time 
FROM cte
GROUP BY machine_id;