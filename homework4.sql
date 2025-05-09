CREATE DATABASE ticket_db;
USE ticket_db;

CREATE TABLE ticket_orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    ticket_type VARCHAR(50),
    child_count INT,
    adult_count INT,
    price_total INT,
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
