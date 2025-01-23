WITH flt AS (
    SELECT 
        player_id, 
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
), flt_t AS (
    SELECT 
    a.player_id
FROM Activity a
JOIN flt f ON a.player_id = f.player_id
WHERE a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY)
)
SELECT ROUND(COUNT(DISTINCT flt_t.player_id)/COUNT(DISTINCT flt.player_id),2) AS fraction 
FROM flt
LEFT JOIN flt_t ON  flt.player_id = flt_t.player_id