with 
cte1 as (select count(distinct requester_id, accepter_id) as cnt1 from RequestAccepted),
cte2 as (select count(distinct sender_id, send_to_id) as cnt2 from FriendRequest)

select if(cnt2 = 0, 0.00, round(cnt1/cnt2, 2)) as accept_rate from cte1, cte2;