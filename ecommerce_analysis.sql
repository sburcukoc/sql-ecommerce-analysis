-- Create customers table
CREATE TABLE customers (
id INTEGER PRIMARY KEY,
name TEXT,
country TEXT
);

-- Create orders table
CREATE TABLE orders (
order_id INTEGER PRIMARY KEY,
customer_id INTEGER,
amount INTEGER
);

-- Insert customers
INSERT INTO customers VALUES (1,'Burcu','USA');
INSERT INTO customers VALUES (2,'Ali','Turkey');
INSERT INTO customers VALUES (3,'John','USA');

-- Insert orders
INSERT INTO orders VALUES (1,1,200);
INSERT INTO orders VALUES (2,1,150);
INSERT INTO orders VALUES (3,2,300);
INSERT INTO orders VALUES (4,3,100);

-- Average order value
SELECT AVG(amount) AS average_order
FROM orders;

-- Total sales
SELECT SUM(amount) AS total_sales
FROM orders;

-- Customer spending
SELECT customers.name,
SUM(orders.amount) AS total_spent
FROM customers
JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.name;

-- Top spending customer
SELECT customers.name,
SUM(orders.amount) AS total_spent
FROM customers
JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.name
ORDER BY total_spent DESC
LIMIT 1;