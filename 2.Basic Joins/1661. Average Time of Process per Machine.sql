-- case
SELECT 
    machine_id,
    ROUND(SUM(CASE 
              WHEN activity_type = 'end' THEN timestamp 
              WHEN activity_type = 'start' THEN -timestamp 
              ELSE 0 END) / COUNT(DISTINCT process_id), 3) AS processing_time
FROM 
    Activity
GROUP BY 
    machine_id;
-- self join
SELECT s.machine_id,
ROUND(AVG(e.timestamp - s.timestamp),3) AS processing_time
FROM Activity s, Activity e
WHERE 
s.machine_id = e.machine_id 
AND
s.process_id = e.process_id 
AND
s.activity_type = 'start'
AND
e.activity_type = 'end'
GROUP BY machine_id;