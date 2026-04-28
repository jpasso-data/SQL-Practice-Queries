-- ==========================================
-- COUNT and COUNT DISTINCT - Warehouse Orders
-- Dataset: project-54c8fc5a-f6ff-479d-b1e.warehouse_orders
-- Tables: warehouse (contains order data), orders (contains warehouse data)
-- Author: Joe Passo | jpasso-data
-- Course: Google Data Analytics Certificate - Course 5
-- Date: April 2026
-- Note: CSV files were uploaded with table names swapped during import.
--       'warehouse' table contains order data; 'orders' table contains warehouse data.
-- ==========================================

-- ==========================================
-- STEP 2: Examine the warehouse_orders.warehouse table
-- ==========================================

-- Query 1: Explore the warehouse table (order data)
-- Purpose: Return all columns to examine the structure of the orders data
-- Returns 5 columns: order_id, customer_id, warehouse_id, order_date, shipper_date
SELECT
  *
FROM
  `project-54c8fc5a-f6ff-479d-b1e.warehouse_orders.warehouse`;

-- ==========================================
-- STEP 3: Examine the warehouse_orders.orders table
-- ==========================================

-- Query 2: Explore the orders table (warehouse data) with LIMIT
-- Purpose: Return first 100 rows to examine warehouse location data
-- Returns 5 columns: warehouse_id, warehouse_alias, maximum_capacity, employee_total, state
SELECT
  *
FROM
  `project-54c8fc5a-f6ff-479d-b1e.warehouse_orders.orders`
LIMIT 100;

-- ==========================================
-- STEP 4: Create Aliases and JOIN the Tables
-- ==========================================

-- Query 3: JOIN both tables using aliases
-- Purpose: Combine order data with warehouse location data on warehouse_id
-- Returns all columns from both tables joined together
SELECT
  orders.*,
  warehouse.warehouse_alias,
  warehouse.state
FROM
  `project-54c8fc5a-f6ff-479d-b1e.warehouse_orders.warehouse` AS orders
JOIN
  `project-54c8fc5a-f6ff-479d-b1e.warehouse_orders.orders` AS warehouse
  ON orders.warehouse_id = warehouse.warehouse_id;

-- ==========================================
-- STEP 5: COUNT vs COUNT DISTINCT
-- ==========================================

-- Query 4: COUNT - Total number of state records (includes duplicates)
-- Purpose: Demonstrate that COUNT counts every row including duplicates
-- Returns 9,999 - one count per row regardless of duplicate state values
SELECT
  COUNT(warehouse.state) AS num_states
FROM
  `project-54c8fc5a-f6ff-479d-b1e.warehouse_orders.warehouse` AS orders
JOIN
  `project-54c8fc5a-f6ff-479d-b1e.warehouse_orders.orders` AS warehouse
  ON orders.warehouse_id = warehouse.warehouse_id;

-- Query 5: COUNT DISTINCT - Number of unique states
-- Purpose: Demonstrate that COUNT DISTINCT removes duplicates
-- Returns 3 - the number of unique states in the dataset (MI, KY, TN)
SELECT
  COUNT(DISTINCT warehouse.state) AS num_states
FROM
  `project-54c8fc5a-f6ff-479d-b1e.warehouse_orders.warehouse` AS orders
JOIN
  `project-54c8fc5a-f6ff-479d-b1e.warehouse_orders.orders` AS warehouse
  ON orders.warehouse_id = warehouse.warehouse_id;

-- ==========================================
-- STEP 6: GROUP BY to Count Orders by State
-- ==========================================

-- Query 6: Number of distinct orders grouped by state
-- Purpose: Find how many orders were shipped from warehouses in each state
-- Results: MI = 6,205 | TN = 2,746 | KY = 1,048 (total = 9,999)
SELECT
  warehouse.state,
  COUNT(DISTINCT orders.order_id) AS num_orders
FROM
  `project-54c8fc5a-f6ff-479d-b1e.warehouse_orders.warehouse` AS orders
JOIN
  `project-54c8fc5a-f6ff-479d-b1e.warehouse_orders.orders` AS warehouse
  ON orders.warehouse_id = warehouse.warehouse_id
GROUP BY
  warehouse.state;
