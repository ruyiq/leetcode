with cte as (
    SELECT *
    FROM Project p
    JOIN Employee e
        USING(employee_id)
)

SELECT project_id, employee_id   
FROM (SELECT *, DENSE_RANK() OVER(PARTITION BY project_id ORDER BY experience_years DESC) ranking FROM cte) s
WHERE ranking=1;