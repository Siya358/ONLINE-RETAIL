CREATE DATABASE OnlineRetailDB;

USE OnlineRetailDB;
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15)
);
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2),
    stock INT,
    category_id INT,
    supplier_id INT,

    FOREIGN KEY (category_id)
        REFERENCES Categories(category_id),

    FOREIGN KEY (supplier_id)
        REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);
CREATE TABLE OrderDetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_mode VARCHAR(30),
    payment_date DATE,
    payment_status VARCHAR(20),

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id)
);
