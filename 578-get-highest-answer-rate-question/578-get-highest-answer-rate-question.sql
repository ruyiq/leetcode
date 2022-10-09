with cte as (
    SELECT question_id, SUM(IF(action="answer",1,0))/SUM(IF(action="show",1,0)) as rate
    FROM SurveyLog
    GROUP BY question_id
)

SELECT question_id AS survey_log
FROM cte
ORDER BY rate DESC, question_id
LIMIT 1
