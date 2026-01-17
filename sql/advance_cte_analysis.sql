-- MONTHLY COHORT RETENSION --

WITH first_order AS 
     (SELECT customer_id,
      MIN(DATE_FORMAT(order_purchase_timestamp,'%Y-%m')) AS cohort_month
      FROM orders
      GROUP BY customer_id),
monthly_orders AS 
      (SELECT customer_id,
       DATE_FORMAT(order_purchase_timestamp,'%Y-%m') AS order_month
       FROM orders)
SELECT t1.cohort_month,
	   t2.order_month,
       COUNT(t2.customer_id) AS active_customers
FROM first_order t1
JOIN monthly_orders t2
ON t1.customer_id = t2.customer_id
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month;       
