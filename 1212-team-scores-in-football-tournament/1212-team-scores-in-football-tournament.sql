with cte as (
    SELECT * FROM Matches
    
    UNION ALL
    
    SELECT match_id, guest_team, host_team, guest_goals, host_goals
    FROM Matches
), cte2 as (
    SELECT *, SUM(CASE 
                  WHEN host_goals>guest_goals THEN 3
                  WHEN host_goals=guest_goals THEN 1
                  ELSE 0 
                  END) as num_points
    FROM cte
    GROUP BY host_team
)

SELECT t.team_id, t.team_name, IFNULL(c.num_points,0) AS num_points
FROM Teams t
LEFT JOIN cte2 c
    ON t.team_id=c.host_team
ORDER BY num_points DESC, team_id;
