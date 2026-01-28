USE pizza_dbms;
-- DDL Commands
-- Create
CREATE TABLE payment (
    payment_id varchar(200) NOT NULL,
    cust_id varchar(200) NOT NULL,
    amount decimal(10,2) NOT NULL,
    payment_date date NOT NULL,
    PRIMARY KEY (payment_id)
);

CREATE TABLE supplier (
    supplier_id varchar(200) NOT NULL,
    supplier_name varchar(200) NOT NULL,
    contact_info varchar(200) NOT NULL,
    PRIMARY KEY (supplier_id)
);

CREATE TABLE delivery (
    delivery_id varchar(200) NOT NULL,
    order_id int NOT NULL,
    delivery_date date NOT NULL,
    delivery_status varchar(50) NOT NULL,
    PRIMARY KEY (delivery_id)
);

-- RENAME
RENAME TABLE payment TO payments;
RENAME TABLE supplier TO suppliers;
RENAME TABLE delivery TO deliveries;

-- INSERT
 -- Insert Rows into `delivery` Table

INSERT INTO deliveries (delivery_id, order_id, delivery_date, delivery_status) 
VALUES 
('DEL001', 1, '2024-06-20', 'Pending'),
('DEL002', 2, '2024-06-21', 'Delivered'),
('DEL003', 3, '2024-06-22', 'In Transit'),
('DEL004', 4, '2024-06-23', 'Pending'),
('DEL005', 5, '2024-06-24', 'Delivered');


-- Insert Rows into `payment` Table

INSERT INTO payments (payment_id, cust_id, amount, payment_date) 
VALUES 
('PAY001', 'CUST001', 100.50, '2024-06-20'),
('PAY002', 'CUST002', 75.75, '2024-06-21'),
('PAY003', 'CUST003', 150.00, '2024-06-22'),
('PAY004', 'CUST004', 200.25, '2024-06-23'),
('PAY005', 'CUST005', 50.00, '2024-06-24');


-- Insert Rows into `supplier` Table

INSERT INTO suppliers (supplier_id, supplier_name, contact_info) 
VALUES 
('SUP001', 'ABC Supplies', '123-456-7890'),
('SUP002', 'XYZ Distributors', '098-765-4321'),
('SUP003', 'PQR Wholesale', '111-222-3333'), 
('SUP004', 'LMN Traders', '444-555-6666'),
('SUP005', 'OPQ Goods', '777-888-9999');


-- ALTER
-- Alter the payment table to add a new column 'payment_method'
ALTER TABLE payments ADD COLUMN transaction_id varchar(200);

-- Alter the supplier table to add a new column 'supplier_rating'
ALTER TABLE suppliers ADD COLUMN contact_email varchar(100);

-- Alter the delivery table to add a new column 'delivery_time'
ALTER TABLE deliveries ADD COLUMN delivery_fee decimal(5,2);

-- DELETE
DELETE FROM deliveries WHERE delivery_id = 'DEL001';
DELETE FROM suppliers WHERE supplier_id = 'SUP001';
DELETE FROM payments WHERE payment_id = 'PAY001';


-- TRUNCATE (removes all rows present in a database)
TRUNCATE TABLE payments;
TRUNCATE TABLE suppliers;
TRUNCATE TABLE deliveries;

SELECT * from deliveries;

-- DROP
DROP TABLE payments;
DROP TABLE suppliers;
DROP TABLE deliveries;
 
 
 -- SELECT
SELECT * FROM orders;
SELECT cust_id, cust_firstname, cust_lastname FROM customers;
SELECT add_id, delivery_city, state FROM address;

-- SET SQL_SAFE_UPDATES = 1; -- This statment is used to turn on the safe mode(it won't allow changes to database)
SET SQL_SAFE_UPDATES = 0; -- This statment is used to turn off the safe mode(it will allow changes to database) so on this before running the UPDATE command


-- UPDATE
UPDATE customers 
SET 
    city = 'New York',
    total_price = 150.50,
    age = 30
WHERE cust_id = 'CUS-001';

SELECT * from customers where cust_id = 'CUS-001';

UPDATE item 
SET 
    unit_price = 15.99,
    pizza_name = 'Margherita Special',
    pizza_size = 'Large'
WHERE item_id = 'ITEM001';

UPDATE orders 
SET 
    quantity = 3,
    order_time = '12:30:00',
    pizza_size = 'Medium'
WHERE order_id = 1;

