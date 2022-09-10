SELECT u.user_id AS buyer_id, u.join_date, ifnull(count(o.order_date),0) AS orders_in_2019 
FROM Users u
LEFT JOIN Orders o
    ON o.buyer_id=u.user_id AND YEAR(o.order_date)=2019
GROUP BY u.user_id;