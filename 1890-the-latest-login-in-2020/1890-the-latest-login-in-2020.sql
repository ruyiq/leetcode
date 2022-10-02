SELECT user_id, time_stamp AS last_stamp
FROM (SELECT *,rank() over (PARTITION BY user_id ORDER BY time_stamp DESC) ranking FROM Logins WHERE LEFT(time_stamp,4)="2020") as s
WHERE s.ranking=1
