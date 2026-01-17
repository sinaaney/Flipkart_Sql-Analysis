CREATE TABLE customers (customer_id VARCHAR(50) PRIMARY KEY,
 customer_city VARCHAR(50),
 customer_state VARCHAR (10));
 
 CREATE TABLE orders (order_id VARCHAR(50) PRIMARY KEY,
 customer_id VARCHAR(50),
 order_status VARCHAR(20),
 order_purchase_timestamp DATETIME,
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id));
 
 CREATE TABLE order_items (order_id VARCHAR(50),
 product_id VARCHAR(50),
 price DECIMAL(10,2),
 fright_value DECIMAL(10,2));
 
 CREATE TABLE products (product_id VARCHAR(50) PRIMARY KEY,
 product_category_name VARCHAR(50));
 
CREATE TABLE payments (order_id VARCHAR(50),
payment_type VARCHAR(50),
payment_value DECIMAL(10,2));
