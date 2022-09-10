# Rank the dates by each user
with cte as
(select 
 player_id,event_date,
rank() over (partition by player_id order by event_date ) as rnk
from activity
)
# select first 2 dates that is the first logged in date and the second date
# Bring first date and second date in one row using lead
, alpha as 
(select player_id, 
 event_date,
 lead(event_Date) over (partition by player_id order by event_date) as lad
from cte where rnk <3
)
# take the difference of the dates
, beta as 
(select player_id,
 datediff(lad,event_date)  diff
from alpha
where lad is not null)
# Now we want the users who logged in on the very next day from the data of there first login so the date difference between two dates should be 1. We will take count of all such records
#take fraction
select 
round((select count(*) from beta where diff =1)/
(select count(distinct player_id) from activity),2)fraction