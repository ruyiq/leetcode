SELECT session_id
FROM Playback p
LEFT JOIN Ads a
    ON p.customer_id=a.customer_id
        AND p.start_time <= a.timestamp
        AND p.end_time >= a.timestamp
WHERE ad_id IS NULL