with cte as (
    SELECT Wimbledon 
    FROM Championships 
    
    UNION ALL
    
    SELECT Fr_open  
    FROM Championships 
    
    UNION ALL 
    
    SELECT US_open  
    FROM Championships 
    
    UNION ALL
    
    SELECT Au_open  
    FROM Championships 
)

SELECT Wimbledon AS player_id, 
    p.player_name, 
    COUNT(Wimbledon) AS grand_slams_count 
FROM cte c
JOIN Players p
    ON c.Wimbledon = p.player_id
GROUP BY Wimbledon;