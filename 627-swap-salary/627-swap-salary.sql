# Write your MySQL query statement below
Update salary
SET sex = CASE
    WHEN sex='m' THEN 'f'
    ELSE 'm' END;
