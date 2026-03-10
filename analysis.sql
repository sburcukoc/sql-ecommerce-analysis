-- total spending per customer
SELECT customers.name,
SUM(orders.amount) AS total_spent
FROM customers
JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.name;

-- top spending customer
SELECT customers.name,
SUM(orders.amount) AS total_spent
FROM customers
JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.name
ORDER BY total_spent DESC
LIMIT 1;

-- average order value
SELECT AVG(amount) AS average_order
FROM orders;
