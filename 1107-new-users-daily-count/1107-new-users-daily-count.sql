with base as
(
    select
        user_id,
        activity_date,
        rank() over (partition by user_id order by activity_date) as rk
    from Traffic
    where activity = 'login'
)

select
    activity_date as login_date,
    count(distinct user_id) as user_count
from base
where rk = 1 and activity_date between date_sub('2019-06-30', interval 90 day) and '2019-06-30'
group by activity_date