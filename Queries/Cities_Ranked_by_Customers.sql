select g.geolocation_city || ', ' || g.geolocation_state || ', ' || 'Brasil' as geolocation, count(c.customer_city)
from customers c 
join geolocation g on c.customer_zip_code_prefix = g.geolocation_zip_code_prefix 
group by g.geolocation_city ,g.geolocation_state
order by count(c.customer_city) desc;