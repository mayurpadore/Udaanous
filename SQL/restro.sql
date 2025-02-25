
												/* 			NEXT ASSIGNMENT				*/ 									-- 25/02/25
                                                
                                                
CREATE DATABASE Restro ;

USE Restro ;

SELECT * FROM order_details ;
SELECT * FROM orders ;
SELECT * FROM pizza_types ;
SELECT * FROM pizzas ;


-- Q1) Retrieve the total number of orders placed. 

SELECT TABLE_NAME, TABLE_ROWS 
FROM information_schema.tables 
WHERE table_schema = 'Restro'
AND TABLE_TYPE = 'BASE TABLE';

SELECT COUNT(DISTINCT order_id) AS total_orders  
FROM orders;

-- Q2) Calculate the total revenue generated from pizza sales. 

SELECT SUM(price) AS 'Total Revenue' FROM pizzas ;

SELECT ROUND(SUM(p.price * od.quantity), 0) AS 'Total Revenue' FROM pizzas P
JOIN order_details od ON p.pizza_id = od.pizza_id ;



-- Q3) Identify the highest-priced pizza. 

SELECT pizza_type_id, price AS 'Highest Price' FROM pizzas 
ORDER BY price DESC LIMIT 1 ;



-- Q4) Identify the most common pizza size ordered. 

SELECT size, count(size) FROM pizzas 
GROUP BY size ;

SELECT p.size, COUNT(*) AS order_count  
FROM order_details od  
JOIN pizzas p ON od.pizza_id = p.pizza_id  
GROUP BY p.size  
ORDER BY order_count DESC   LIMIT 1;

-- Q5) List the top 5 most ordered pizza types along with their quantities. 

SELECT p.pizza_type_id, SUM(od.quantity) AS total_quantity
FROM pizzas p
INNER JOIN order_details od ON p.pizza_id = od.pizza_id
GROUP BY p.pizza_type_id
ORDER BY total_quantity DESC
LIMIT 5;

SELECT pt.name, SUM(od.quantity) AS total_quantity  
FROM order_details od  
JOIN pizzas p ON od.pizza_id = p.pizza_id  
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id  
GROUP BY pt.name  
ORDER BY total_quantity DESC  
LIMIT 5;

-- Q6) Join the necessary tables to find the total quantity of each pizza category ordered. 

SELECT category, SUM(od.quantity) AS 'Total Quantity' FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id 
GROUP BY category ;




-- Q7) Determine the distribution of orders by hour of the day. 

SELECT HOUR(time) AS order_hour, COUNT(order_id) AS order_count
FROM orders
GROUP BY order_hour
ORDER BY order_hour;





-- Q8) Join relevant tables to find the category-wise distribution of pizzas. 
SELECT pt.category, COUNT(p.pizza_id) AS pizza_count
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY pizza_count DESC;






-- Q9) Group the orders by date and calculate the average number of pizzas ordered per day. 

SELECT o.date, ROUND(AVG(od.quantity),2) AS avg_pizzas_per_day
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.date
ORDER BY o.date;






-- Q10) Determine the top 3 most ordered pizza types based on revenue. 

SELECT p.pizza_type_id, SUM(p.price * od.quantity) AS Revenue
FROM pizzas p
JOIN order_details od ON p.pizza_id = od.pizza_id
GROUP BY p.pizza_type_id
order by Revenue desc LIMIT 3;