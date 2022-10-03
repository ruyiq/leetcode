CREATE PROCEDURE getUserIDs(startDate DATE, endDate DATE, minAmount INT)
BEGIN
	# Write your MySQL query statement below.
	SELECT DISTINCT user_id
    FROM Purchases 
    WHERE startDate<=time_stamp   
        AND time_stamp<=endDate
        AND amount>=minAmount
    ORDER BY user_id;
END