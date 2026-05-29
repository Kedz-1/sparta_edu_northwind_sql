\c northwind
-- Improve the performance of the below queries!

-- 1. Basic Filter

-- SELECT *
-- FROM Orders
-- WHERE CustomerID = 'ALFKI';

CREATE INDEX idx_customer_id
ON orders(customer_id);

SELECT order_id, customer_id
FROM orders
WHERE customer_id= 'ALFKI';

-- Solution hint - add index and remove wildcard:

-- 2. Function Issue
-- SELECT *
-- FROM Orders
-- WHERE YEAR(OrderDate) = 1997;

-- remove function year() as functions mean it will likely not use index

CREATE INDEX idx_order_date
ON orders(order_date);

SELECT order_date
FROM orders
WHERE order_date = '1997-01-01';

-- Solution hint - Tighten the filter

-- 3. Sorting Bottleneck
-- SELECT *
-- FROM Orders
-- WHERE CustomerID = 'ALFKI'
-- ORDER BY OrderDate;

CREATE INDEX idx_customer_id
ON orders(customer_id);

SELECT customer_id
FROM orders
WHERE customer_id = 'ALFKI'
ORDER BY order_date;

-- Solution hint - Create an Index to avoid table scan:

-- 4. JOIN Performance
-- SELECT *
-- FROM Orders o
-- JOIN Customers c
-- ON o.CustomerID = c.CustomerID;

CREATE INDEX idx_orders_customer_id
ON orders(customer_id);

CREATE INDEX idx_customers_customer_id
ON customers(customer_id)

SELECT c.customer_id, o.order_id
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

-- Solution hint - Make Indexes to help with Index Seek

-- 5. Covering Index:
-- SELECT CustomerID, OrderDate
-- FROM Orders
-- WHERE CustomerID = 'ALFKI';

-- Solution hint - Avoid Key Lookups, create a covering index, using the INCLUDE key ord

-- 6. Aggregation
-- SELECT CustomerID, COUNT(*)
-- FROM Orders
-- GROUP BY CustomerID;

-- Solution hint - Create Index to remove need for GROUP BY in SELECT statement:

-- 7. Broken Search Pattern
-- SELECT *
-- FROM Customers
-- WHERE CompanyName LIKE '%market%';

-- Solution hint - Remove wildcard as it prevents Index use