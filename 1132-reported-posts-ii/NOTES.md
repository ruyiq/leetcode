```
WITH spam AS
(
SELECT action_date, count(distinct a.post_id) AS spam_cnt
FROM Actions a
#LEFT JOIN Removals r ON a.post_id = r.post_id
WHERE action = "report" AND extra = "spam"
GROUP BY action_date
)
, remov AS
(
SELECT a.action_date, count(distinct r.post_id) AS remov_cnt
FROM Actions a
LEFT JOIN Removals r ON a.post_id = r.post_id
WHERE action = "report" AND extra = "spam"
GROUP BY action_date
)
, fraction AS
(SELECT s.action_date, (remov_cnt/spam_cnt)*100 AS pct
FROM spam s JOIN remov r
ON s.action_date = r.action_date
)
SELECT ROUND(AVG(pct),2) AS average_daily_percent
FROM fraction;
```
