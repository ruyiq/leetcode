with cte as(
select player_id, event_date,
first_value(event_date) over(partition by player_Id order by player_id, event_date) as first_event
from Activity
)

select
round(
(select count(distinct player_id) from cte where datediff(event_date,first_event) = 1)/
(select count(distinct player_id) from cte)
,2) as fraction