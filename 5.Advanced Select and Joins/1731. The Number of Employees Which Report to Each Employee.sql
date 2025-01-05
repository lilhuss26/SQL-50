WITH managers AS (
    SELECT * 
    FROM Employees
    WHERE employee_id IN (SELECT reports_to FROM Employees WHERE reports_to IS NOT NULL)
)
SELECT e.employee_id,e.name,COUNT(r.reports_to) AS reports_count, ROUND(AVG(r.age),0) AS average_age
FROM Employees e
JOIN Employees r
ON e.employee_id = r.reports_to
WHERE e.employee_id IN (SELECT employee_id FROM managers)
GROUP BY employee_id
ORDER BY employee_id ;