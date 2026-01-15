with daily_revenue as (
	select sum(oi.price) as revenue, o.order_approved_at::date as p_date
	from orders o join order_items oi on o.order_id = oi.order_id
	group by p_date
)
select p_date, revenue,
ROUND(AVG(revenue) over (order by p_date rows between 6 PRECEDING and current row)::numeric, 2) as weekly_avg
from daily_revenue;