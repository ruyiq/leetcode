SELECT
    C.customer_id,
    C.name
FROM
    Customers AS C
WHERE
    C.customer_id IN
        (SELECT
            O.customer_id
         FROM
            Orders AS O
         JOIN
            Product AS P
         USING
            (product_id)
         WHERE
            YEAR(order_date) = '2020'
         GROUP BY
            O.customer_id
         HAVING
            SUM(IF(MONTH(order_date) = '06',price,0)*quantity) >= 100
            AND
            SUM(IF(MONTH(order_date) = '07',price,0)*quantity) >= 100
        )