USE pizza_dbms;
INSERT INTO address (add_id, delivery_address, delivery_city, state, postal_code, latitude, longitude) VALUES
('ADD-10000', '3000 Meadowbrook Rd', 'Jackson', 'MS', 39216, 32.34, -90.160),
('ADD-10001', '500 E Woodrow Wilson Ave', 'Jackson', 'MS', 39216, 32.33, -90.180),
('ADD-10002', '1500 University Blvd', 'Jackson', 'MS', 39204, 32.29, -90.214),
('ADD-10003', '1700 Terry Rd', 'Jackson', 'MS', 39204, 32.27, -90.214),
('ADD-10004', '350 W Woodrow Wilson Ave', 'Jackson', 'MS', 39213, 32.34, -90.204),
('ADD-10005', '1501 E County Line Rd', 'Jackson', 'MS', 39211, 32.39, -90.134),
('ADD-10006', '1070 John R. Lynch St', 'Jackson', 'MS', 39203, 32.30, -90.209),
('ADD-10007', '3906 Terry Rd', 'Jackson', 'MS', 39212, 32.25, -90.261),
('ADD-10008', '2000 E Overlook Dr', 'Jackson', 'MS', 39211, 32.38, -90.129),
('ADD-10009', '100 W Capitol St', 'Jackson', 'MS', 39269, 32.30, -90.188);


INSERT INTO customers (cust_id, cust_firstname, cust_lastname, age, total_price, city, gender) VALUES
('CUS-10000', 'Jane', 'Doe', 34, 15.75, 'Jackson', 'Female'),
('CUS-10001', 'John', 'Smith', 40, 22.00, 'Jackson', 'Male'),
('CUS-10002', 'Mary', 'Johnson', 28, 18.25, 'Jackson', 'Female'),
('CUS-10003', 'James', 'Brown', 45, 20.50, 'Jackson', 'Male'),
('CUS-10004', 'Patricia', 'Williams', 50, 19.75, 'Jackson', 'Female'),
('CUS-10005', 'Robert', 'Jones', 37, 21.00, 'Jackson', 'Male'),
('CUS-10006', 'Linda', 'Garcia', 42, 16.50, 'Jackson', 'Female'),
('CUS-10007', 'Michael', 'Miller', 33, 23.75, 'Jackson', 'Male'),
('CUS-10008', 'Barbara', 'Davis', 29, 14.00, 'Jackson', 'Female'),
('CUS-10009', 'William', 'Martinez', 60, 25.00, 'Jackson', 'Male');


INSERT INTO ingredient (ing_id, ing_name, ing_price, ing_weight, ing_units) VALUES
('in-0051', 'Sun-dried tomatoes', 12.00, 2000, 'grams'),
('in-0052', 'Truffle oil', 20.00, 1000, 'ml'),
('in-0053', 'Saffron', 30.00, 500, 'grams'),
('in-0054', 'Black garlic', 18.00, 1500, 'grams'),
('in-0055', 'Smoked paprika', 9.00, 2500, 'grams'),
('in-0056', 'Caperberries', 14.00, 3000, 'grams'),
('in-0057', 'White balsamic vinegar', 10.50, 2000, 'ml'),
('in-0058', 'Maple syrup', 13.00, 2500, 'ml'),
('in-0059', 'Lemongrass', 8.00, 3000, 'grams'),
('in-0060', 'Wasabi', 25.00, 1000, 'grams');

INSERT INTO shift (shift_id, day_of_week, start_time, end_time) VALUES
('sh1000', 'Wednesday', '07:30:00', '11:00:00'),
('sh1001', 'Thursday', '08:30:00', '12:00:00'),
('sh1002', 'Friday', '09:30:00', '13:00:00'),
('sh1003', 'Saturday', '10:30:00', '14:00:00'),
('sh1004', 'Sunday', '11:30:00', '15:00:00'),
('sh1005', 'Monday', '12:30:00', '16:00:00'),
('sh1006', 'Tuesday', '13:30:00', '17:00:00'),
('sh1007', 'Wednesday', '14:30:00', '18:00:00'),
('sh1008', 'Thursday', '15:30:00', '19:00:00'),
('sh1009', 'Friday', '16:30:00', '20:00:00');


INSERT INTO staff (staff_id, first_name, last_name, hourly_hours, position, MartialStatus, MonthlyIncome, Over18, OverTime, YearInCurrentRole) VALUES
('st1000', 'John', 'Doe', 10, 'Kitchen Assistant', 'Single', 2000, 1, 0, 2),
('st1001', 'Jane', 'Smith', 14, 'Shift Supervisor', 'Married', 3200, 1, 1, 5),
('st1002', 'Michael', 'Johnson', 12, 'Dishwasher', 'Single', 1800, 1, 0, 1),
('st1003', 'Emily', 'Davis', 11, 'Hostess', 'Single', 2300, 1, 0, 2),
('st1004', 'David', 'Martinez', 13, 'Bartender', 'Divorced', 2700, 1, 1, 4),
('st1005', 'Sophia', 'Lopez', 10, 'Waitress', 'Married', 1900, 1, 0, 1),
('st1006', 'James', 'Brown', 15, 'Head Chef', 'Married', 4000, 1, 1, 6),
('st1007', 'Linda', 'Garcia', 11, 'Sous Chef', 'Single', 2600, 1, 0, 3),
('st1008', 'Robert', 'Wilson', 12, 'Delivery Driver', 'Single', 2200, 1, 0, 2),
('st1009', 'Maria', 'Anderson', 14, 'Pastry Chef', 'Married', 3000, 1, 1, 4);


INSERT INTO rota (row_id, rota_id, Date, shift_id, staff_id) VALUES
(1000, 'ro1000', '2024-06-21', 'sh1000', 'st1000'),
(1001, 'ro1001', '2024-06-21', 'sh1001', 'st1001'),
(1002, 'ro1002', '2024-06-21', 'sh1002', 'st1002'),
(1003, 'ro1003', '2024-06-21', 'sh1003', 'st1003'),
(1004, 'ro1004', '2024-06-22', 'sh1004', 'st1004'),
(1005, 'ro1005', '2024-06-22', 'sh1005', 'st1005'),
(1006, 'ro1006', '2024-06-22', 'sh1006', 'st1006'),
(1007, 'ro1007', '2024-06-22', 'sh1007', 'st1007'),
(1008, 'ro1008', '2024-06-23', 'sh1008', 'st1008'),
(1009, 'ro1009', '2024-06-23', 'sh1009', 'st1009');


INSERT INTO recipe (row_id, recipe_id, ing_id, quantity, item_id) VALUES
(497, 'veggie_veg_s', 'in-0002', 150, 'IT-497'),
(498, 'veggie_veg_s', 'in-0003', 100, 'IT-498'),
(499, 'veggie_veg_m', 'in-0005', 200, 'IT-499'),
(500, 'veggie_veg_m', 'in-0046', 50, 'IT-500'),
(501, 'veggie_veg_m', 'in-0047', 75, 'IT-501'),
(502, 'veggie_veg_l', 'in-0008', 300, 'IT-502'),
(503, 'veggie_veg_l', 'in-0009', 200, 'IT-503'),
(504, 'veggie_veg_l', 'in-0010', 250, 'IT-504'),
(505, 'veggie_veg_l', 'in-0011', 100, 'IT-505'),
(506, 'veggie_veg_xl', 'in-0012', 400, 'IT-506');


INSERT INTO orders (order_id, pizza_id, quantity, order_time, Date, pizza_size, pizza_category, pizza_name, Ordered_at, cust_address, Extra_Cheeze, Extra_Spicy, cust_id, item_id, add_id, recipe_id, ing_id) VALUES
(1000, 'veggie_veg_s', 2, '12:00:00', '2024-06-21', 'S', 'Vegetarian', 'Veggie Small', 'Restaurant', '1220 E Northside Dr', 'Yes', 'No', 'CUS-10000', 'IT-497', 'ADD-10000', 'veggie_veg_s', 'in-0051'),
(1001, 'veggie_veg_s', 1, '13:00:00', '2024-06-21', 'S', 'Vegetarian', 'Veggie Small', 'Restaurant', '2106 Raymond Rd', 'No', 'Yes', 'CUS-10001', 'IT-498', 'ADD-10001', 'veggie_veg_s', 'in-0052'),
(1002, 'veggie_veg_m', 3, '14:00:00', '2024-06-21', 'M', 'Vegetarian', 'Veggie Medium', 'Restaurant', '2440 Bailey Ave', 'Yes', 'Yes', 'CUS-10002', 'IT-499', 'ADD-10002', 'veggie_veg_m', 'in-0053'),
(1003, 'veggie_veg_m', 2, '15:00:00', '2024-06-21', 'M', 'Vegetarian', 'Veggie Medium', 'Restaurant', '2601 Highway 80 W', 'No', 'No', 'CUS-10003', 'IT-500', 'ADD-10003', 'veggie_veg_m', 'in-0054'),
(1004, 'veggie_veg_m', 1, '16:00:00', '2024-06-21', 'M', 'Vegetarian', 'Veggie Medium', 'Restaurant', '1220 E Northside Dr', 'Yes', 'No', 'CUS-10004', 'IT-501', 'ADD-10004', 'veggie_veg_m', 'in-0055'),
(1005, 'veggie_veg_l', 2, '17:00:00', '2024-06-21', 'L', 'Vegetarian', 'Veggie Large', 'Restaurant', '2106 Raymond Rd', 'No', 'Yes', 'CUS-10005', 'IT-502', 'ADD-10005', 'veggie_veg_l', 'in-0056'),
(1006, 'veggie_veg_l', 3, '18:00:00', '2024-06-21', 'L', 'Vegetarian', 'Veggie Large', 'Restaurant', '2440 Bailey Ave', 'Yes', 'Yes', 'CUS-10006', 'IT-503', 'ADD-10006', 'veggie_veg_l', 'in-0057'),
(1007, 'veggie_veg_l', 1, '19:00:00', '2024-06-21', 'L', 'Vegetarian', 'Veggie Large', 'Restaurant', '2601 Highway 80 W', 'No', 'No', 'CUS-10007', 'IT-504', 'ADD-10007', 'veggie_veg_l', 'in-0058'),
(1008, 'veggie_veg_l', 2, '20:00:00', '2024-06-21', 'L', 'Vegetarian', 'Veggie Large', 'Restaurant', '1220 E Northside Dr', 'Yes', 'No', 'CUS-10008', 'IT-505', 'ADD-10008', 'veggie_veg_l', 'in-0059'),
(1009, 'veggie_veg_xl', 4, '21:00:00', '2024-06-21', 'XL', 'Vegetarian', 'Veggie Extra Large', 'Restaurant', '2106 Raymond Rd', 'No', 'Yes', 'CUS-10009', 'IT-506', 'ADD-10009', 'veggie_veg_xl', 'in-0060');
