
create database sql_python;
use sql_python;
--find top 10 highest reveue generating products 
select * from df_orders;
select product_id,sum(sale) as sales from df_orders
group by product_id
order by sales desc limit 10;

--find top 5 highest selling products in each region
with cte as(
select region,product_id,sum(sale) as sales from df_orders
group by region,product_id)
select * from (
select *,
row_number() over(partition by region order by sales desc ) as roow
from cte)A
where roow<=5;

--find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023
with cte as(
select year(order_date) as order_year,month(order_date) as order_month,
sum(sale) as sales from df_orders
group by year(order_date),month(order_date))
select order_month
,sum(case when order_year = 2022 then sales else 0 end) as sal_2022
,sum(case when order_year = 2023 then sales else 0 end) as sal_2023
from cte
group by order_month
order by order_month;

--for each category which month had highest sales 
with cte as (
select category,DATE_FORMAT(order_date, '%Y%m')  as order_year_month
, sum(sale) as sales 
from df_orders
group by category,DATE_FORMAT(order_date, '%Y%m') 
)
select * from (
select *,
row_number() over(partition by category order by sales desc) as rn
from cte
) a
where rn=1


--which sub category had highest growth by profit in 2023 compare to 2022
--which sub category had highest growth by profit in 2023 compare to 2022
with cte AS (
    SELECT 
        sub_category,
        YEAR(order_date) AS order_year,
        SUM(profit) AS total_profit
    FROM df_orders
    GROUP BY sub_category, YEAR(order_date)
),
cte2 AS (
    SELECT 
        sub_category,
        SUM(CASE WHEN order_year = 2022 THEN total_profit ELSE 0 END) AS profit_2022,
        SUM(CASE WHEN order_year = 2023 THEN total_profit ELSE 0 END) AS profit_2023
    FROM cte 
    GROUP BY sub_category
)
SELECT 
    sub_category,
    (profit_2023 - profit_2022) AS profit_growth
FROM cte2
ORDER BY profit_growth DESC
LIMIT 1;


