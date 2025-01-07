WITH flt AS (
SELECT accepter_id AS id,COUNT(accepter_id) AS num
FROM RequestAccepted  
GROUP BY accepter_id
UNION ALL 
SELECT requester_id AS id,COUNT(requester_id) AS num
FROM RequestAccepted
GROUP BY requester_id
),
Aggall AS (
SELECT id,SUM(num) AS num 
FROM flt 
GROUP BY id
)

SELECT id,num 
FROM Aggall 
ORDER BY num DESC 
LIMIT 1;