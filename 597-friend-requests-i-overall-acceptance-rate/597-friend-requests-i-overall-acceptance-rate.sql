SELECT IFNULL(ROUND(COUNT(DISTINCT b.requester_id, b.accepter_id  )/COUNT(DISTINCT a.sender_id, a.send_to_id ),2),0) AS accept_rate 
FROM FriendRequest a, RequestAccepted b;