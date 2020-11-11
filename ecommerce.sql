-- Summary
-- Let's simulate an e-commerce site. 
--We're going to need users, products, and orders.

-- users need a name and an email.
-- products need a name and a price
-- orders need a ref to product.
-- All 3 need primary keys.



CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(100),
    user_email VARCHAR(100)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    product_price INTEGER
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT REFERENCES products(product_id)
);

INSERT INTO users 
(user_name, user_email)
VALUES
('janie', 'janieemail'),
('alan', 'alanemail'),
('dummy', 'dummyemail');

INSERT INTO products
(product_name, product_price)
VALUES
('lambo', 10),
('rover', 5),
('porsche', 20);

INSERT INTO orders
(user_id, product_id)
VALUES
(1,3),
(2,1),
(3,2);

--Get all products for the first order.
SELECT * FROM products
WHERE product_id = 1;

--Get the total cost of an order ( sum the price of all products on an order).
SELECT SUM(product_price)
FROM products p
JOIN orders o
ON o.product_id = p.product_id
WHERE o.order_id = 1;

--Get all orders for a user.
SELECT * 
FROM users u
JOIN orders o 
ON o.user_id = u.user_id
WHERE u.user_id = 1;

--Get how many orders each user has.
SELECT COUNT(*), u.user_id
FROM orders o
JOIN users u
ON o.user_id = u.user_id
GROUP BY u.user_id;

--Black Diamond
--Get the total amount on all orders for each user.
SELECT SUM(p.product_price), u.user_id
FROM products p
JOIN orders o
ON o.product_id = p.product_id
JOIN users u
ON u.user_id = o.user_id
GROUP BY u.user_id;