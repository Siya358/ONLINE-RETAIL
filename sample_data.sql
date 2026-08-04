INSERT INTO Customers
(first_name,last_name,email,phone,city,state)

VALUES

('Rahul','Sharma','rahul@gmail.com','9876543210','Delhi','Delhi'),

('Priya','Singh','priya@gmail.com','9876543211','Lucknow','UP'),

('Aman','Verma','aman@gmail.com','9876543212','Noida','UP'),

('Sneha','Gupta','sneha@gmail.com','9876543213','Jaipur','Rajasthan'),

('Rohit','Patel','rohit@gmail.com','9876543214','Ahmedabad','Gujarat');

INSERT INTO Categories (category_name)
VALUES
('Electronics'),
('Fashion'),
('Home & Kitchen'),
('Books'),
('Sports');

INSERT INTO Suppliers (supplier_name, contact_number)
VALUES
('Tech Distributors', '9876500001'),
('Fashion Hub', '9876500002'),
('Home Essentials', '9876500003'),
('Book World', '9876500004'),
('Sports Arena', '9876500005');

INSERT INTO Products
(product_name, price, stock, category_id, supplier_id)
VALUES
('Laptop', 65000, 20, 1, 1),
('Smartphone', 30000, 35, 1, 1),
('Headphones', 2500, 50, 1, 1),
('T-Shirt', 999, 100, 2, 2),
('Jeans', 1999, 60, 2, 2),
('Mixer Grinder', 4500, 25, 3, 3),
('Novel', 399, 80, 4, 4),
('Football', 899, 40, 5, 5),
('Cricket Bat', 2499, 30, 5, 5),
('Microwave Oven', 12000, 15, 3, 3);

INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
(1, '2026-08-01', 67500.00),
(2, '2026-08-02', 999.00),
(3, '2026-08-02', 33999.00),
(4, '2026-08-03', 4899.00),
(5, '2026-08-03', 12999.00),
(1, '2026-08-04', 2500.00),
(2, '2026-08-04', 1999.00),
(3, '2026-08-05', 899.00);

INSERT INTO OrderDetails (order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 65000.00),
(1, 3, 1, 2500.00),

(2, 4, 1, 999.00),

(3, 2, 1, 30000.00),
(3, 3, 2, 2500.00),

(4, 6, 1, 4500.00),
(4, 7, 1, 399.00),

(5, 10, 1, 12000.00),
(5, 8, 1, 899.00),

(6, 3, 1, 2500.00),

(7, 5, 1, 1999.00),

(8, 8, 1, 899.00);

INSERT INTO Payments
(order_id,payment_mode,payment_date,payment_status)

VALUES
(1,'Credit Card','2026-08-01','Completed'),
(2,'UPI','2026-08-02','Completed'),
(3,'Debit Card','2026-08-02','Completed'),
(4,'Cash on Delivery','2026-08-03','Pending'),
(5,'Net Banking','2026-08-03','Completed'),
(6,'UPI','2026-08-04','Completed'),
(7,'Credit Card','2026-08-04','Completed'),
(8,'UPI','2026-08-05','Completed');
