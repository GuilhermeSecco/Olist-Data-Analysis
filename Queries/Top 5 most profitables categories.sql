select t.product_category_name_english , round(SUM(oi.price * oi.order_item_id)) as income
from products p 
join order_items oi on p.product_id = oi.product_id 
join translation t on p.product_category_name = t.product_category_name 
group by t.product_category_name_english 
order by income desc
limit 5;