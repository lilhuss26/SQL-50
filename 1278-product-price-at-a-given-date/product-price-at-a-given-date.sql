SELECT 
    p.product_id,
    COALESCE(
        -- Get the price on '2019-08-16' if it exists
        (SELECT new_price FROM Products WHERE product_id = p.product_id AND change_date = '2019-08-16'),
        -- Otherwise, get the most recent price before '2019-08-16'
        (SELECT new_price FROM Products WHERE product_id = p.product_id AND change_date < '2019-08-16' ORDER BY change_date DESC LIMIT 1),
        -- Default to 10 if no price exists
        10
    ) AS price
FROM (SELECT DISTINCT product_id FROM Products) p;