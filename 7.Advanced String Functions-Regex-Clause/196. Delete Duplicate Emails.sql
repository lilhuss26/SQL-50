delete from Person
 where id not in
 (select min(id) as id 
    from Person group by email)
---------------------------------------------
---------------------------------------------
DELETE p1 FROM person p1,person p2
WHERE p2.email = p1.email AND p1.id>p2.id;
---------------------------------------------
---------------------------------------------
WITH Uniquemails AS (
    SELECT 
        id,
        email,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id ASC) AS row_num
    FROM Person
)
SELECT id, email
FROM Uniquemails
WHERE row_num = 1;