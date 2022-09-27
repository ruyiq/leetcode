SELECT p.name,
    IFNULL(SUM(rest),0) AS rest,
    IFNULL(SUM(paid),0) AS paid,
    IFNULL(SUM(canceled),0) AS canceled,
    IFNULL(SUM(refunded),0) AS refunded
FROM Product p
LEFT JOIN Invoice i
    USING(product_id)
GROUP BY product_id
ORDER BY p.name