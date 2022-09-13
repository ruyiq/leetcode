SELECT p.session_id
FROM Playback p
LEFT JOIN Ads a
    ON a.customer_id=p.customer_id AND timestamp>=start_time AND timestamp<=end_time
WHERE a.ad_id IS NULL;
