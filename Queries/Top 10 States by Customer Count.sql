select g.geolocation_state, count(c.customer_state) 
from customers c join geolocation g on c.customer_zip_code_prefix = g.geolocation_zip_code_prefix 
group by g.geolocation_state
order by count(c.customer_state) desc
limit 10;