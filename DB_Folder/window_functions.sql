
select product_name, sale_date, sum(amount) over (PARTITION BY product_name ORDER BY sale_date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) from sales GROUP BY product_name, sale_date;


select product_name, sale_date, sum(amount) over (PARTITION BY product_name ORDER BY sale_date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) from sales GROUP BY product_name, sale_date;


select product_name, sale_date, sum(amount) over (PARTITION BY product_name ORDER BY sale_date ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) from sales GROUP BY product_name, sale_date;


--sqllite year over year growth

SELECT strftime('%Y', sale_date) AS year, 
sum(amount) as revenue, 
sum(amount)-LAG(sum(amount)) over (order by strftime('%Y', sale_date) ) as yoy 
from sales 
group by strftime('%Y', sale_date) ;

--sqllite month over month growth

SELECT strftime('%m', sale_date) AS year, 
sum(amount) as revenue, 
sum(amount)-LAG(sum(amount)) over (order by strftime('%m', sale_date) ) as yoy 
from sales 
group by strftime('%m', sale_date) ;