WITH Turnordered AS (
    SELECT person_name,weight,turn,
    SUM(weight) OVER (ORDER BY turn) AS total_weight 
    FROM Queue
    ORDER BY turn
)

SELECT person_name
FROM Turnordered 
WHERE turn=(
    SELECT MAX(turn)
    FROM Turnordered
    WHERE total_weight <= 1000
)
LIMIT 1;