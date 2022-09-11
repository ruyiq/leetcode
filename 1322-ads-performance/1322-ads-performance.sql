with cte as (
select ad_id, 
       sum(case when action = 'Clicked' then 1 else 0 end) as "Clicked",
       sum(case when action = 'Viewed' then 1 else 0 end) as "Viewed"
from ads
group by ad_id 
)

select ad_id,
      round(ifnull((Clicked / (Clicked + Viewed))*100,0.00),2) as ctr
from cte
group by ad_id
order by ctr desc, ad_id