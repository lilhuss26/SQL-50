SELECT email 
FROM Person 
GROUP BY email
Having COUNT(email) > 1;