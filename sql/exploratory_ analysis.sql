-- TOTAL REVENUE AND TOTAL ORDERS --

SELECT COUNT(DISTINCT order_id) AS Total_orders,
SUM(payment_value) AS Total_revenue
FROM flipcart_like_db.payments;

-- ORDER BY SATATUS --

SELECT order_status,
COUNT(*) AS orders
FROM orders
GROUP BY order_status;

-- REVENUE BY PAYMENT TYPE --

SELECT payment_type,
SUM(payment_value) AS revenue
FROM payments
GROUP BY payment_type
ORDER BY revenue DESC;
