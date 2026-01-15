with income_pct as (
select t.product_category_name_english , round(((sum(oi.price) / sum(sum(oi.price)) over())::numeric * 100),2) as pct
from order_items oi 
join products p on oi.product_id = p.product_id 
join "translation" t on p.product_category_name = t.product_category_name 
group by t.product_category_name_english)

select * from income_pct
where pct > 0.1
order by pct desc;