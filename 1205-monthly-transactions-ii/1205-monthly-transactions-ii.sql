with cte as
    (
    select id, country, state, amount, date_format(trans_date, '%Y-%m') as `month`
    from Transactions
    where state = 'approved'
    union all
    select trans_id as id, country, 'chargeback' as state, amount, date_format(c.trans_date, '%Y-%m') as `month`
    from Chargebacks c
    left join Transactions t on c.trans_id = t.id
    )
select
    `month`, country,
    sum(if(state = 'approved', 1, 0)) as approved_count,
    sum(if(state = 'approved', amount, 0)) as approved_amount,
    sum(if(state = 'chargeback', 1, 0)) as chargeback_count,
    sum(if(state = 'chargeback', amount, 0)) as chargeback_amount
from cte
group by 1, 2
order by 1, 2;