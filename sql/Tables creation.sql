DROP DATABASE IF EXISTS pizza_dbms;
CREATE DATABASE pizza_dbms;
USE pizza_dbms;

CREATE TABLE orders (
    order_id int NOT NULL,
    pizza_id varchar(100) NOT NULL,
    quantity int NOT NULL,
    order_time time NOT NULL,
    Date date NOT NULL,
    pizza_size varchar(10) NOT NULL,
    pizza_category varchar(50) NOT NULL,
    pizza_name varchar(150) NOT NULL,
    Ordered_at varchar(100) NOT NULL,
    cust_address varchar(200) NOT NULL,
    Extra_Cheeze varchar(10) NOT NULL,
    Extra_Spicy varchar(10) NOT NULL,
    cust_id varchar(200) NOT NULL,
    item_id varchar(200) NOT NULL,
    add_id varchar(200) NOT NULL,
    recipe_id varchar(200) NOT NULL,
    ing_id varchar(200) NOT NULL,
    PRIMARY KEY (cust_id, add_id, item_id)
);

CREATE TABLE customers (
    cust_id varchar(200) NOT NULL,
    cust_firstname varchar(50) NOT NULL,
    cust_lastname varchar(50) NOT NULL,
    age int NOT NULL,
    total_price decimal(5,2) NOT NULL,
    city varchar(100) NOT NULL,
    gender varchar(10) NOT NULL,
    PRIMARY KEY (cust_id)
);

CREATE TABLE address (
    add_id varchar(200) NOT NULL,
    delivery_address varchar(200) NOT NULL,
    delivery_city varchar(100) NOT NULL,
    state varchar(50) NOT NULL,
    postal_code int NOT NULL,
    latitude decimal(10,2) NOT NULL,
    longitude decimal(10,3) NOT NULL,
    PRIMARY KEY (add_id)
);

CREATE TABLE item (
    item_id varchar(200) NOT NULL,
    pizza_id varchar(100) NOT NULL,
    recipe_id varchar(200) NOT NULL,
    pizza_size varchar(10) NOT NULL,
    pizza_category varchar(50) NOT NULL,
    pizza_name varchar(150) NOT NULL,
    unit_price decimal(10,2) NOT NULL,
    total_price decimal(10,2) NOT NULL,
    PRIMARY KEY (item_id)
);

CREATE TABLE ingredient (
    ing_id varchar(200) NOT NULL,
    ing_name varchar(200) NOT NULL,
    ing_price decimal(8,2) NOT NULL,
    ing_weight int NOT NULL,
    ing_units varchar(50) NOT NULL,
    PRIMARY KEY (ing_id)
);

CREATE TABLE recipe (
    row_id int NOT NULL,
    recipe_id varchar(200) NOT NULL,
    ing_id varchar(200) NOT NULL,
    quantity int NOT NULL,
    item_id varchar(200) NOT NULL,
    PRIMARY KEY (recipe_id, item_id)
);

CREATE TABLE inventory (
    inv_id varchar(200) NOT NULL,
    item_id varchar(200) NOT NULL,
    quantity int NOT NULL,
    PRIMARY KEY (inv_id)
);

CREATE TABLE shift (
    shift_id varchar(200) NOT NULL,
    day_of_week varchar(20) NOT NULL,
    start_time time NOT NULL,
    end_time time NOT NULL,
    PRIMARY KEY (shift_id)
);

CREATE TABLE staff (
    staff_id varchar(200) NOT NULL,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    hourly_hours int NOT NULL,
    position varchar(100) NOT NULL,
    MartialStatus varchar(50) NOT NULL,
    MonthlyIncome int NOT NULL,
    Over18 boolean NOT NULL,
    OverTime boolean NOT NULL,
    YearInCurrentRole int NOT NULL,
    PRIMARY KEY (staff_id)
);

CREATE TABLE rota (
    row_id int NOT NULL,
    rota_id varchar(200) NOT NULL,
    Date date NOT NULL,
    shift_id varchar(200) NOT NULL,
    staff_id varchar(200) NOT NULL,
    PRIMARY KEY (row_id, shift_id, staff_id)
);

-- Foreign Key Constraints and Indexes

ALTER TABLE orders ADD CONSTRAINT fk_orders_cust_id FOREIGN KEY (cust_id) REFERENCES customers (cust_id);
ALTER TABLE orders ADD CONSTRAINT fk_orders_add_id FOREIGN KEY (add_id) REFERENCES address (add_id);
ALTER TABLE orders ADD CONSTRAINT fk_orders_item_id FOREIGN KEY (item_id) REFERENCES item (item_id);

ALTER TABLE item ADD CONSTRAINT fk_item_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipe (recipe_id);

ALTER TABLE recipe ADD CONSTRAINT fk_recipe_ing_id FOREIGN KEY (ing_id) REFERENCES ingredient (ing_id);

-- Step 1: Add an index on the item_id column in the recipe table
CREATE INDEX idx_recipe_item_id ON recipe(item_id);

-- Step 2: Add the foreign key constraint in the inventory table
ALTER TABLE inventory ADD CONSTRAINT fk_inventory_item_id FOREIGN KEY (item_id) REFERENCES recipe (item_id);


ALTER TABLE rota ADD CONSTRAINT fk_rota_shift_id FOREIGN KEY (shift_id) REFERENCES shift (shift_id);
ALTER TABLE rota ADD CONSTRAINT fk_rota_staff_id FOREIGN KEY (staff_id) REFERENCES staff (staff_id);

-- Indexes

CREATE INDEX idx_orders_add_id ON orders(add_id);
CREATE INDEX idx_orders_item_id ON orders(item_id);
CREATE INDEX idx_recipe_ing_id ON recipe(ing_id);
-- CREATE INDEX idx_recipe_item_id ON recipe(item_id);- 
CREATE INDEX idx_rota_shift_id ON rota(shift_id);
-- CREATE INDEX idx_rota_staff_id ON rota(staff_id);
CREATE INDEX idx_orders_Date ON orders(Date);

-- Remove redundant index if exists
-- DROP INDEX IF EXISTS idx_rota_staff_id_new ON rota;

-- Ensure primary keys are unique and indexed
ALTER TABLE rota ADD CONSTRAINT fk_rota_Date FOREIGN KEY (Date) REFERENCES orders (Date);
