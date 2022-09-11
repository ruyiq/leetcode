WITH cte AS (
    SELECT employee_id, team_id, COUNT(team_id) AS team_size  
    FROM Employee 
    GROUP BY team_id  
)

SELECT e.employee_id, cte.team_size  
FROM Employee e
JOIN cte 
    USING(team_id);