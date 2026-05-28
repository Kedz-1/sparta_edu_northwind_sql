\c northwind

-- 1. Customers and their Orders

\echo '\nCustomer and orders joined\n'

SELECT o.order_id, c.contact_name, p.product_name 
FROM orders o
INNER JOIN customers c
ON c.customer_id = o.customer_id
INNER JOIN order_details od
ON od.order_id = o.order_id
INNER JOIN products p
ON p.product_id = od.product_id;


-- 2. Orders with Product Names

SELECT od.order_id, p.product_name
FROM order_details od
INNER JOIN products p 
ON p.product_id = od.product_id;

-- 3. Order Total Value

SELECT od.order_id, 
ROUND(SUM(od.unit_price * (1-od.discount) * od.quantity)::numeric, 2) AS total_value
FROM order_details od
GROUP BY od.order_id;


-- 4. Total Spend and Number of Orders

SELECT c.contact_name, 
    COUNT(DISTINCT(o.order_id)), 
    ROUND(SUM(od.unit_price * (1-od.discount) * od.quantity)::numeric, 2) AS total_spend
FROM orders o
INNER JOIN order_details od
ON o.order_id = od.order_id
INNER JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.contact_name;

-- 5. Top 5 customers by Spend

SELECT c.contact_name, 
    ROUND(SUM(od.unit_price * (1-od.discount) * od.quantity)::numeric, 2) AS total_spend
FROM order_details od
INNER JOIN orders o 
ON od.order_id = o.order_id
INNER JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_spend DESC
LIMIT 5;


-- 6. Customers with no orders?

SELECT c.contact_name, o.order_id
FROM customers c
LEFT JOIN orders o
ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

-- 7. Orders with customer and employee info

SELECT o.order_id, c.contact_name, e.first_name, e.last_name, e.title
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN employees e 
ON e.employee_id = o.employee_id;


-- 8. Product sales by category

SELECT c.category_name,
ROUND(SUM(od.unit_price * (1- od.discount) * od.quantity)::numeric, 2) AS total_category_sales
FROM products p 
INNER JOIN categories c
ON p.category_id = c.category_id
INNER JOIN order_details od
ON od.product_id = p.product_id
GROUP BY c.category_name
ORDER BY total_category_sales DESC;