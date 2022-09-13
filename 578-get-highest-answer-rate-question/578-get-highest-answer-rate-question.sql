WITH cte AS (
    SELECT question_id, count(case when action='answer' then question_id end)/count(case when action='show' then question_id end) as answerrate
FROM SurveyLog 
    GROUP BY question_id
    ORDER BY answerrate DESC, question_id
    LIMIT 1
)

SELECT question_id AS survey_log 
FROM cte;