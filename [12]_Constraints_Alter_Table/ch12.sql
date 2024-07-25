-- Connect to the database and select all records from the 'companies' table
-- Active: 1720861686632@@127.0.0.1@3306
SELECT
    *
FROM
    companies;

-- Add a new column 'city' to the 'companies' table
ALTER TABLE
    companies
ADD
    city VARCHAR(15);

-- Verify the addition of the new column
SELECT
    *
FROM
    companies;

-- Drop the 'city' column from the 'companies' table
ALTER TABLE
    companies DROP city;

-- Add the 'city' column again, but this time with a NOT NULL constraint
ALTER TABLE
    companies
ADD
    COLUMN city VARCHAR(15) NOT NULL;

-- Verify the column addition
SELECT
    *
FROM
    companies;

-- Drop the 'city' column again
ALTER TABLE
    companies DROP COLUMN city;

-- Add the 'city' column with a NOT NULL constraint and a default value of 'unknown'
ALTER TABLE
    companies
ADD
    COLUMN city VARCHAR(15) NOT NULL DEFAULT 'unknown';

-- Verify the column addition with the default value
SELECT
    *
FROM
    companies;

-- Show the table structure of 'companies'
DESC companies;

-- Drop multiple columns 'city' and 'address' from the 'companies' table
ALTER TABLE
    companies DROP COLUMN city,
    DROP COLUMN address;

-- Verify the column removals
SELECT
    *
FROM
    companies;

-- Rename the 'companies' table to 'com'
RENAME TABLE companies TO com;

-- Show all tables to verify the renaming
SHOW TABLES;

-- Select all records from the renamed table 'com'
SELECT
    *
FROM
    com;

-- Rename the 'com' table back to 'companies'
ALTER TABLE
    com RENAME TO companies;

-- Rename the 'companies' table to 'com'
ALTER TABLE
    companies RENAME TO com;

-- Rename the 'com' table back to 'companies'
ALTER TABLE
    com RENAME TO companies;

-- Select all records from the 'companies' table to verify the renaming
SELECT
    *
FROM
    companies;

-- Rename the column 'supplier_id' to 'company_id' in the 'companies' table
ALTER TABLE
    companies RENAME COLUMN supplier_id TO company_id;

-- Verify the column renaming
SELECT
    *
FROM
    companies;

-- -- 215 -- Section: Modifying Columns
-- Show the table structure of 'companies'
DESC companies;

-- Modify the 'name' column to have a default value of 'unknown'
ALTER TABLE
    companies
MODIFY
    name VARCHAR(100) DEFAULT 'unknown';

-- Verify the column modification
SELECT
    *
FROM
    companies;

-- Show the table structure of 'companies' again to confirm changes
DESC companies;

-- Insert a record into the 'companies' table with only the 'phone' column specified
INSERT INTO
    companies (phone)
VALUES
    ('12313');

-- Verify the insertion
SELECT
    *
FROM
    companies;

-- Show all tables to verify table names
SHOW TABLES;

-- Show the structure of the 'contacts' table
DESC contacts;

-- Change the 'phone' column in the 'contacts' table to 'company_phone' with type VARCHAR(20)
ALTER TABLE
    contacts CHANGE phone company_phone VARCHAR(20);

-- Show the updated table structure
DESC contacts;

-- Select all records from the 'contacts' table to verify the column change
SELECT
    *
FROM
    contacts;

-- -- 217 -- Section: Constraints
-- Show the structure of the 'houes' table
DESC houes;

-- Select all records from the 'houes' table
SELECT
    *
FROM
    houes;

-- Add a CHECK constraint 'p_price' to ensure 'purchase_price' is non-negative
ALTER TABLE
    houes
ADD
    CONSTRAINT p_price CHECK (purchase_price >= 0);

-- Verify the constraint addition
SELECT
    *
FROM
    houes;

-- Insert a record into the 'houes' table
INSERT INTO
    houes (purchase_price, sale_price)
VALUES
    (10000, 100);

-- Verify the insertion
SELECT
    *
FROM
    houes;

-- Drop the constraint 'sale_gt_pur' from the 'houes' table
ALTER TABLE
    houes DROP CONSTRAINT sale_gt_pur;