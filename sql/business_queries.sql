-- MONTHLY REVENUE TREND --

SELECT 
DATE_FORMAT(order_purchase_timestamp,'%Y-%m') AS month,
SUM(payment_value) AS revenue
FROM orders t1
JOIN payments t2
ON t1.order_id = t2.order_id
GROUP BY month
ORDER BY month;

-- TOP 10 CUSTOMERS BY REVENUE --

SELECT 
T1.customer_id, 
SUM(t3.payment_value) AS total_spend
FROM customers t1
JOIN orders t2 
ON t1.customer_id = t2.customer_id
JOIN payments t3
ON t2.order_id = t3.order_id
GROUP BY t1.customer_id
ORDER BY total_spend DESC
LIMIT 10;

-- AVERAGE ORDER VALUE (AOV) --

SELECT 
SUM(payment_value)/COUNT(DISTINCT order_id) AS Aveage_order_value
FROM payments;

-- REVENUE BY PRODUCT CATAGORY --

SELECT
t1.product_category_name,
SUM(t2.price) AS Revenue
FROM products t1
JOIN order_items t2
ON t1.product_id = t2.product_id
GROUP BY product_category_name
ORDER BY Revenue DESC;

-- REPEAT VS ONE-TIME CUSTOMERS --

WITH customer_orders AS
     (SELECT
           customer_id,
		   COUNT(order_id) AS total_order
	  FROM orders
      GROUP BY customer_id)
SELECT 
  CASE
     WHEN total_order = 1 THEN 'one-time customer'
     ELSE 'repeated customer'
  END AS Customer_type,
  COUNT(*) AS customer_count
FROM customer_orders
GROUP BY customer_type;     

-- CUSTOMER LIFETIME VALUE --

SELECT 
t1.customer_id,
SUM(t3.payment_value) AS lifetime_value
FROM customers t1
JOIN orders t2
ON t1.customer_id = t2.customer_id
JOIN payments t3
ON t2.order_id = t3.order_id
GROUP BY t1.customer_id
ORDER BY lifetime_value DESC;

-- TOP PRODUCTS --

SELECT
product_id,
revenue,
RANK() OVER (ORDER BY REVENUE DESC) AS revenue_rank
FROM (SELECT
product_id,
SUM(price) AS revenue
FROM order_items
GROUP BY product_id) t1
LIMIT 10;

-- CUSTOMER RETENSION --

SELECT 
    customer_id,
    MIN(order_purchase_timestamp) AS first_order,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;
