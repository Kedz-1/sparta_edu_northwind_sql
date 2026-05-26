\c northwind

--1. List all customers from Germany

\echo '\nAll customers from Germany\n'

-- \echo
-- \echo 'All customers from Germany'
-- \echo

SELECT contact_name FROM customers 
WHERE country = 'Germany';

--2. Show all products that cost more than 20.

\echo '\nAll products that are more than 20\n'

SELECT product_name FROM products
where unit_price > 20;

--3. Display the first name, last name and city of all employees.

\echo '\nFirst name, last name and city of all employees\n'
SELECT first_name, last_name, city FROM employees;

--4. List all products that are out of stock.

\echo '\nProducts out of stock\n'

SELECT * FROM products 
WHERE units_in_stock = 0;

--5. Show all orders shipped to France.

\echo '\nAll orders shipped to France'
SELECT * FROM orders
WHERE ship_country = 'France';

--6. List all customers whose city starts with the letter 'B'.

\echo '\nAll customers whose city starts with a "B"'

SELECT contact_name, city FROM customers
WHERE city LIKE 'B%';


--7. Display all products stored in jars or bottles.

\echo '\nAll products stored in jars or bottles'

SELECT * FROM products
WHERE quantity_per_unit LIKE '%jars%' 
OR quantity_per_unit LIKE '%bottles%';

--8. Show all employees born after 1960.

\echo '\nAll employees born after 1960'

SELECT first_name, last_name, birth_date FROM employees
WHERE birth_date => '1960-01-01';
--9. List all products ordered by UnitPrice from highest to lowest.

\echo '\nAll products ordered by unit price, high to low'

SELECT * FROM products
ORDER BY unit_price DESC;

--10. Show the company name and contact name for customers in London or Madrid.

\echo '\nCompany and contact name for customers in London or Madrid'

SELECT company_name, contact_name, city FROM customers 
WHERE city = 'London' or city = 'Madrid';
