# Write your MySQL query statement below

WITH CTE AS
(
        SELECT
            seller_id,
            DENSE_RANK() OVER(ORDER BY SUM(unit_price*quantity) DESC) as rnk
        FROM Sales S
        JOIN Product P
        ON S.product_id = P.product_id
        GROUP BY 1
)
SELECT seller_id
FROM CTE
where rnk = 1