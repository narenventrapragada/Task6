select *
from customer_shopping_data ;

-- 1. Sales & Revenue

-- Total revenue across all transactions

select round(sum(quantity*price),2) as total_revenue
from customer_shopping_data ;

-- Average revenue per invoice (Average Order Value).

select invoice_no,round(avg(quantity*price),2) as Average_Order_Value
from customer_shopping_data
group by 1
order by 2 ;

-- Revenue per shopping mall.

select shopping_mall,round(sum(quantity*price),2)
from customer_shopping_data
group by 1 
order by 2 desc;

-- Top 5 highest revenue-generating categories. 

select category,round(sum(quantity*price),2)
from customer_shopping_data
group by 1 
order by 2 desc;

-- Most popular payment method by revenue.

select payment_method,round(sum(quantity*price),2)
from customer_shopping_data
group by 1 
order by 2 desc;

-- Highest selling month (based on revenue).

select extract(month from invoice_date),round(sum(quantity*price),2)
from customer_shopping_data
group by 1 
order by 1 asc
limit 1;

-- Total quantity sold per category. 

select category,sum(quantity)
from customer_shopping_data
group by 1 
order by 2 desc;

-- 2. Customer Insights

-- Number of unique customers. 

select count(distinct customer_id)
from customer_shopping_data ;

-- Average age of customers overall and by category.

select round(avg(age),2)
from customer_shopping_data ;

-- Gender-wise spending comparison.

select gender,round(sum(quantity*price),2)
from customer_shopping_data
group by 1; 

-- Top 10 customers by total revenue.

select customer_id, round(sum(quantity*price),2)
from customer_shopping_data
group by 1
order by 2 desc
limit 10 ;

-- Category preference by gender.

select gender,category,round(sum(quantity*price),2)
from customer_shopping_data
group by 1,2
order by 3 desc,1 asc
limit 2 ;

-- Payment method preference by gender.

SELECT gender, payment_method, COUNT(*) AS txn_count
FROM customer_shopping_data
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

-- 3. Time Trends

-- Monthly revenue trend.


select extract(month from invoice_date),round(sum(quantity*price),2)
from customer_shopping_data
group by 1 
order by 1 asc ;

-- Daily revenue trend.

select invoice_date,round(sum(quantity*price),2)
from customer_shopping_data
group by 1 
order by 1 asc ;

-- Weekend vs weekday sales comparison

select 
	case when extract(DOW from invoice_date) in (0,6) then 'weekend' else 'weekday' end as Day_of_week,
	round(sum(quantity*price),2) as sales
from customer_shopping_data 
group by 1;

-- Peak shopping month for each mall

with cte as (
	select shopping_mall,extract(month from invoice_date) as month,sum(quantity*price) as revenue
	from customer_shopping_data
	group by 1,2
	order by 1,2
),
	cte2 as (
		select *,row_number() over(partition by shopping_mall order by revenue desc) as rnk
		from cte
)

select shopping_mall,month,revenue
from cte2
where rnk=1 ;

-- Seasonal trends

SELECT 
    CASE 
        WHEN extract(MONTH from invoice_date) IN (12,1,2) THEN 'Winter'
        WHEN extract(MONTH from invoice_date) IN (3,4,5) THEN 'Summer'
        WHEN extract(MONTH from invoice_date) in (6,7,8)THEN 'Monsoon'
        ELSE 'Autumn'
    END AS season,
    ROUND(SUM(quantity * price), 2) AS revenue
FROM customer_shopping_data
GROUP BY 1;

-- 4. Advanced / Business-Focused

-- Top revenue contributors (Top 20% customers)

WITH ranked_customers AS (
    SELECT customer_id, SUM(quantity * price) AS revenue
    FROM customer_shopping_data
    GROUP BY 1
),
total AS (
    SELECT SUM(revenue) AS total_rev FROM ranked_customers
)

SELECT 
    customer_id, revenue,
    ROUND((revenue / total_rev) * 100, 5) AS pct_contribution
FROM ranked_customers, total
ORDER BY 3 desc
LIMIT (SELECT ROUND(COUNT(*)*0.2) FROM ranked_customers);

-- Age group-wise category preference

SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+'
    END AS age_group,
    category,
    SUM(quantity) AS units_sold
FROM customer_shopping_data
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

-- Mall-wise category performance

SELECT shopping_mall, category, ROUND(SUM(quantity * price), 2) AS revenue
FROM customer_shopping_data
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

-- High-value transactions (above average)

WITH avg_rev AS (
    SELECT AVG(quantity * price) AS avg_invoice_value
    FROM customer_shopping_data
)

SELECT invoice_no, customer_id, SUM(quantity * price) AS total_value
FROM customer_shopping_data, avg_rev
GROUP BY 1, 2, avg_invoice_value
HAVING SUM(quantity * price) > avg_invoice_value;

-- Category with highest average price per unit

SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM customer_shopping_data
GROUP BY 1
ORDER BY 2 DESC





























