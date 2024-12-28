select s.year, s.price, p.product_name from Sales s
left join Product p on s.product_id = P.product_id