# Write your MySQL query statement below
WITH show_cnt AS (
    SELECT id, question_id, COUNT(timestamp) AS cnt
    FROM (
        SELECT *
        FROM SurveyLog
        WHERE action = "show"
    ) temp
    GROUP BY id, question_id
),

answer_cnt AS (
    SELECT id, question_id, COUNT(timestamp) AS cnt 
    FROM (
        SELECT *
        FROM SurveyLog
        WHERE action = "answer"
    ) temp
    GROUP BY id, question_id
),

rate AS (
    SELECT s.question_id, SUM(a.cnt)/SUM(s.cnt) AS rate
    FROM show_cnt s
    JOIN answer_cnt a ON a.id = s.id AND a.question_id = s.question_id
    GROUP BY s.question_id
)

SELECT question_id AS survey_log 
FROM rate
GROUP BY question_id
ORDER BY rate DESC, question_id
LIMIT 1;

