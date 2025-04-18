SELECT s.user_id, 
ROUND(AVG(IF(c.action='confirmed',1,0)),2) AS confirmation_rate
FROM Signups s 
LEFT JOIN Confirmations c 
ON c.user_id = s.user_id
GROUP BY user_id;