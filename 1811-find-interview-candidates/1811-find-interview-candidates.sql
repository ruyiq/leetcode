SELECT u.name, u.mail
FROM Contests c, Users u
WHERE c.gold_medal=u.user_id
GROUP BY gold_medal
HAVING COUNT(gold_medal)>=3

UNION

SELECT u.name, u.mail
FROM Users u, Contests c1, Contests c2, Contests c3
WHERE c1.contest_id + 1= c2.contest_id
    AND c2.contest_id + 1= c3.contest_id
    AND u.user_id IN (c1.gold_medal, c1.silver_medal, c1.bronze_medal)
    AND u.user_id IN (c2.gold_medal, c2.silver_medal, c2.bronze_medal)
    AND u.user_id IN (c3.gold_medal, c3.silver_medal, c3.bronze_medal)