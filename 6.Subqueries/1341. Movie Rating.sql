(SELECT u.name AS results
FROM users u
JOIN MovieRating mr 
ON u.user_id = mr.user_id
GROUP BY u.name
ORDER BY COUNT(mr.user_id) DESC, u.name
LIMIT 1)
UNION ALL
(SELECT m.title AS results
FROM Movies m
JOIN MovieRating mr 
ON m.movie_id = mr.movie_id
WHERE MONTH(mr.created_at) = '02' AND YEAR(mr.created_at) = '2020'
GROUP BY m.title
ORDER BY AVG(mr.rating) DESC,m.title 
LIMIT 1);