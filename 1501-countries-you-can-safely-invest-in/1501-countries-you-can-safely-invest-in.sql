with cte as(
    SELECT caller_id,callee_id, duration FROM Calls
    
    UNION ALL
    
    SELECT callee_id, caller_id, duration
    FROM Calls

), average_call as (
    SELECT c.name, AVG(c.duration) as a
    FROM Person p
    JOIN Country c
        ON LEFT(p.phone_number,3)=c.country_code
    JOIN cte c
        ON c.caller_id=p.id
    GROUP BY c.name
)

SELECT a.name AS country  
FROM average_call a
WHERE a.a > (SELECT AVG(duration) FROM Calls);