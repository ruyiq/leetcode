# Write your MySQL query statement below
WITH number_row AS(
    SELECT id,
        num,
        ROW_NUMBER() OVER (Order BY id) AS row_num
    FROM Logs
)

SELECT DISTINCT n1.num AS ConsecutiveNums 
FROM number_row n1
JOIN number_row n2 ON n1.row_num+1 = n2.row_num AND n1.num = n2.num
JOIN number_row n3 ON n2.row_num+1 = n3.row_num AND n2.num = n3.num 