SELECT event_day AS day, emp_id, SUM(out_time - in_time) AS total_time
FROM Employees e
GROUP BY emp_id, event_day;