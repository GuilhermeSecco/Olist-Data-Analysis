select distinct  p.product_id, t.product_category_name_english, oi.price,
dense_rank() over (partition by p.product_category_name order by oi.price desc) as Ranking
FROM products p 
JOIN order_items oi ON p.product_id = oi.product_id 
join "translation" t on p.product_category_name = t.product_category_name
order by ranking asc, t.product_category_name_english;