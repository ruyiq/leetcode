WITH cte AS
(
SELECT
    requester_id AS user,
    accepter_id  AS friend
FROM RequestAccepted
    UNION ALL
SELECT
    accepter_id AS user,
    requester_id  AS friend
FROM RequestAccepted
)

SELECT user AS id, COUNT(friend) AS num
FROM cte
GROUP BY id
ORDER BY num DESC
LIMIT 1;