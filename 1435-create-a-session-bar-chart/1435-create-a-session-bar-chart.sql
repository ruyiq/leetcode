
select
'[0-5>' as bin, count(duration /60) total
from sessions where duration /60 <5

union all
select
'[5-10>' as bin, count(duration /60) total
from sessions where duration /60 >= 5 and duration /60 <10

union all
select
'[10-15>' as bin, ifnull(count(duration /60),0) total
from sessions where duration /60 >=10 and duration /60 <15

union all
select
'15 or more' as bin, count(duration /60) total
from sessions where duration /60 >=15