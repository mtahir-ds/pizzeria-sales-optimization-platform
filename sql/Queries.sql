USE pizza_dbms;

-- Query 1
SELECT 
o.order_id, 
i.total_price, 
o.quantity, 
i.pizza_category,
i.pizza_name, 
o.order_time, 
a.delivery_address,
a.state,
a.delivery_city, 
a.postal_code, 
a.latitude,
a.longitude
FROM orders o 
LEFT JOIN item i ON o.item_id = i.item_id 
LEFT JOIN address a ON o.add_id = a.add_id;


-- Query 2
select
 s1.pizza_name, 
    s1.id,  
    s1.ing_names, 
    s1.weight_of_ing,  
    s1.price_of_ing,  
    s1.units_of_ing,
    s1.order_quantity,  -- Include order_quantity from subquery s1
    s1.recipe_quantity,  
    s1.order_quantity * s1.recipe_quantity as ordered_weight, 
    s1.price_of_ing / s1.weight_of_ing as unit_cost, 
    (s1.order_quantity * s1.recipe_quantity) * (s1.price_of_ing / s1.weight_of_ing) as ingredient_cost 
FROM 
(SELECT distinct
                  
                   o.pizza_id,
             r1.ing_id AS id,
             i1.ing_name AS ing_names,
             i1.ing_price AS price_of_ing,
             i1.ing_units AS units_of_ing,
            o.pizza_name,
            r1.quantity as recipe_quantity,
            sum(o.quantity) as order_quantity,
             i1.ing_weight	as weight_of_ing
         FROM 
             recipe r1
          JOIN 
             ingredient i1 ON r1.ing_id = i1.ing_id
	      left join orders o on o.pizza_id=r1.recipe_id
          where o.order_id is not null
          group by 
             o.pizza_id,
             id,
             ing_names,
             price_of_ing,
             units_of_ing,
            o.pizza_name,
            recipe_quantity,
              weight_of_ing
)s1;


-- Query 3
select r.Date,
 s.first_name,
 s.last_name,
 s.hourly_hours  ,
 sh.start_time,
 sh.end_time,
round(((hour(timediff(sh.end_time,sh.start_time)) * 60 ) + (minute(timediff(sh.end_time,sh.start_time)))) / 60,2)as hours_in_shift,
round(((hour(timediff(sh.end_time,sh.start_time)) * 60 ) +  (minute(timediff(sh.end_time,sh.start_time)))) / 60 * s.hourly_hours,2) as staff_cost
from rota as r
left join staff as s 
on r.staff_id = s.staff_id
left join shift as sh
on r.shift_id = sh.shift_id
where s.staff_id is not NULL;

-- Query 4
/*SALES OVER TIME*/ 
SELECT 
    YEAR(o.Date) AS sales_year,
    WEEK(o.Date) AS sales_week,
     MONTH(o.Date) AS sales_month,
    SUM(o.quantity * i.unit_price) AS total_sales
FROM 
    orders o
JOIN 
    item i ON o.item_id = i.item_id
GROUP BY 
   sales_year, sales_week,sales_month
ORDER BY 
     sales_year,total_sales;


-- Query 5
 -- Find the Top-Selling Pizzas by Quantity and Revenue with Pizza Details:
SELECT 
    i.pizza_name as top_selling_pizzas,
    SUM(o.quantity) AS total_quantity,
    SUM(o.quantity * i.unit_price) AS total_revenue
FROM 
    orders o
JOIN 
    item i ON o.item_id = i.item_id
GROUP BY 
    i.pizza_name
ORDER BY 
    total_quantity DESC, total_revenue DESC;
    
    
-- Query 6
-- Identify the Least Popular Pizzas to Consider Removing from the Menu with Pizza Details
  
    SELECT 
    i.pizza_name as Least_popular_pizzas ,
    SUM(o.quantity) AS total_quantity,
        SUM(o.quantity * i.unit_price) AS total_revenue

FROM 
    orders o
JOIN 
    item i ON o.item_id = i.item_id
GROUP BY 
    i.pizza_name
ORDER BY 
    total_quantity ASC,total_revenue asc;
    
    
----------------------------------------------
/* Menu Optimization */

-- Query 7
 -- Determine the Profitability of Each Pizza Item
SELECT 
    i.pizza_name,
    SUM(o.quantity * i.unit_price) AS total_revenue,
    SUM(o.quantity * i.unit_price) AS total_profit
FROM 
    orders o
JOIN 
    item i ON o.item_id = i.item_id
GROUP BY 
    i.pizza_name
ORDER BY 
    total_profit DESC;
    
-- Query 8
 --   Calculate the Profit Margin for Each Pizza Size
 SELECT 
    i.pizza_size,
    SUM(o.quantity * i.unit_price) AS total_revenue,
    SUM(o.quantity * i.unit_price) AS total_profit,
    1.0 AS profit_margin
FROM 
    orders o
JOIN 
    item i ON o.item_id = i.item_id
GROUP BY 
    i.pizza_size
ORDER BY 
    profit_margin DESC;
    
    
    -- Query 9
    -- Analyze the Sales Performance of Different Pizza Categories
    SELECT 
    i.pizza_category,
    SUM(o.quantity * i.unit_price) AS total_revenue
FROM 
    orders o
JOIN 
    item i ON o.item_id = i.item_id
GROUP BY 
    i.pizza_category
ORDER BY 
    total_revenue DESC;

-- Query 10
-- Total orders of different pizzas
SELECT 
    i.pizza_name,
    COUNT(*) AS total_orders
FROM 
    orders o
JOIN 
    item i ON o.item_id = i.item_id
GROUP BY 
    i.pizza_name
ORDER BY 
    total_orders DESC;