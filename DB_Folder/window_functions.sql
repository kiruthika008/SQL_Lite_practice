
select product_name, sale_date, sum(amount) over (PARTITION BY product_name ORDER BY sale_date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) from sales GROUP BY product_name, sale_date;


select product_name, sale_date, sum(amount) over (PARTITION BY product_name ORDER BY sale_date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) from sales GROUP BY product_name, sale_date;


select product_name, sale_date, sum(amount) over (PARTITION BY product_name ORDER BY sale_date ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) from sales GROUP BY product_name, sale_date;