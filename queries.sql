-- ==========================================
-- Online Retail SQL Project
-- SQL Queries
-- ==========================================

-- 1. Display all customers
SELECT * FROM Customers;

-- 2. Display all products
SELECT * FROM Products;

-- 3. Display all orders
SELECT * FROM Orders;

-- 4. Display all payments
SELECT * FROM Payments;

-- 5. Products with price greater than 5000
SELECT *
FROM Products
WHERE price > 5000;

-- 6. Customers from Delhi
SELECT *
FROM Customers
WHERE city = 'Delhi';

-- 7. Completed payments
SELECT *
FROM Payments
WHERE payment_status = 'Completed';
-- 8. Products sorted by price (High to Low)
SELECT *
FROM Products
ORDER BY price DESC;

-- 9. Customers sorted alphabetically
SELECT *
FROM Customers
ORDER BY first_name;
-- 10. Total number of customers
SELECT COUNT(*) AS Total_Customers
FROM Customers;

-- 11. Average product price
SELECT AVG(price) AS Average_Price
FROM Products;

-- 12. Most expensive product
SELECT MAX(price) AS Highest_Price
FROM Products;

-- 13. Cheapest product
SELECT MIN(price) AS Lowest_Price
FROM Products;

-- 14. Total inventory value
SELECT SUM(price * stock) AS Inventory_Value
FROM Products;

-- 15. Number of products in each category
SELECT
    category_id,
    COUNT(*) AS Product_Count
FROM Products
GROUP BY category_id;

-- 16. Categories having more than one product
SELECT
    category_id,
    COUNT(*) AS Product_Count
FROM Products
GROUP BY category_id
HAVING COUNT(*) > 1;

-- 17. Display customer names with their orders

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;
-- 18. Display products with category names

SELECT
    p.product_name,
    c.category_name,
    p.price,
    p.stock
FROM Products p
INNER JOIN Categories c
ON p.category_id = c.category_id;

-- 19. Display products with supplier names

SELECT
    p.product_name,
    s.supplier_name,
    p.price
FROM Products p
INNER JOIN Suppliers s
ON p.supplier_id = s.supplier_id;
-- 20. Show all customers and their orders

SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.total_amount
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id;
-- 21. Show all orders with customer information

SELECT
    c.first_name,
    o.order_id,
    o.order_date
FROM Customers c
RIGHT JOIN Orders o
ON c.customer_id = o.customer_id;
-- 22. Customer order details

SELECT
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    o.order_id,
    p.product_name,
    od.quantity,
    od.price
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN OrderDetails od
ON o.order_id = od.order_id
JOIN Products p
ON od.product_id = p.product_id;
-- 23. Complete order report

SELECT
    o.order_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    p.product_name,
    od.quantity,
    pay.payment_mode,
    pay.payment_status
FROM Orders o
JOIN Customers c
ON o.customer_id = c.customer_id
JOIN OrderDetails od
ON o.order_id = od.order_id
JOIN Products p
ON od.product_id = p.product_id
JOIN Payments pay
ON o.order_id = pay.order_id;
-- 24. Total amount spent by each customer

SELECT
    c.first_name,
    SUM(o.total_amount) AS Total_Spent
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id;
-- 25. Customers spending more than 5000

SELECT
    c.first_name,
    SUM(o.total_amount) AS Total_Spent
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(o.total_amount) > 5000;
-- 26. Products costing more than the average price

SELECT *
FROM Products
WHERE price >
(
    SELECT AVG(price)
    FROM Products
);
