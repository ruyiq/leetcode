SELECT seat_id 
FROM Cinema 
WHERE free=1 AND (seat_id+1 IN (SELECT seat_id 
    FROM Cinema 
    WHERE free=1 
    ORDER BY seat_id )OR seat_id-1 IN (SELECT seat_id 
    FROM Cinema 
    WHERE free=1 
    ORDER BY seat_id ))
ORDER BY seat_id 