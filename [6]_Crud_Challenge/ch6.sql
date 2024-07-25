-- Active: 1720861686632@@127.0.0.1@3306
-- Create the database and switch to it
CREATE DATABASE shirts_db;
USE shirts_db;

-- Create the shirts table with necessary columns
CREATE TABLE shirts (
    shirt_id INT PRIMARY KEY AUTO_INCREMENT, 
    article VARCHAR(50),
    color VARCHAR(50), 
    shirt_size VARCHAR(20),
    last_worn INT
);

-- Insert initial 20 shirts with specific last_worn days
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES 
    ('T-shirt', 'Blue', 'M', 1),
    ('Polo', 'Red', 'M', 2),
    ('Button-down', 'White', 'S', 3),
    ('Tank top', 'Black', 'XL', 4),
    ('Hoodie', 'Gray', 'L', 5),
    ('Sweater', 'Green', 'M', 6),
    ('Dress shirt', 'Blue', 'L', 7),
    ('Flannel', 'Red', 'M', 8),
    ('V-neck', 'White', 'S', 9),
    ('Long sleeve', 'Black', 'XL', 10),
    ('Henley', 'Gray', 'M', 11),
    ('Sleeveless', 'Green', 'S', 12),
    ('Plaid', 'Blue', 'L', 13),
    ('Pullover', 'Red', 'M', 14),
    ('Striped', 'White', 'XL', 15),
    ('Oxford', 'Gray', 'L', 16),
    ('Tunic', 'Green', 'M', 17),
    ('Crewneck', 'Blue', 'S', 18),
    ('Sweatshirt', 'Red', 'XL', 19),
    ('Turtleneck', 'White', 'L', 20);

-- Display all shirts
SELECT * FROM shirts;

-- Show databases to confirm shirts_db exists
SHOW DATABASES;

-- Describe the structure of the shirts table
DESC shirts;

-- Insert additional shirt with specific last_worn days
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('Sweatshirt', 'Purple', 'M', 50);

-- Insert 20 shirts with random last_worn days between 50 and 200
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES 
    ('T-shirt', 'Blue', 'M', ROUND(RAND() * (200 - 50) + 50)),
    ('Polo', 'Red', 'L', ROUND(RAND() * (200 - 50) + 50)),
    ('Button-down', 'White', 'S', ROUND(RAND() * (200 - 50) + 50)),
    ('Tank top', 'Black', 'XL', ROUND(RAND() * (200 - 50) + 50)),
    ('Hoodie', 'Gray', 'L', ROUND(RAND() * (200 - 50) + 50)),
    ('Sweater', 'Green', 'M', ROUND(RAND() * (200 - 50) + 50)),
    ('Dress shirt', 'Blue', 'L', ROUND(RAND() * (200 - 50) + 50)),
    ('Flannel', 'Red', 'M', ROUND(RAND() * (200 - 50) + 50)),
    ('V-neck', 'White', 'S', ROUND(RAND() * (200 - 50) + 50)),
    ('Long sleeve', 'Black', 'XL', ROUND(RAND() * (200 - 50) + 50)),
    ('Henley', 'Gray', 'M', ROUND(RAND() * (200 - 50) + 50)),
    ('Sleeveless', 'Green', 'S', ROUND(RAND() * (200 - 50) + 50)),
    ('Plaid', 'Blue', 'L', ROUND(RAND() * (200 - 50) + 50)),
    ('Pullover', 'Red', 'M', ROUND(RAND() * (200 - 50) + 50)),
    ('Striped', 'White', 'XL', ROUND(RAND() * (200 - 50) + 50)),
    ('Oxford', 'Gray', 'L', ROUND(RAND() * (200 - 50) + 50)),
    ('Tunic', 'Green', 'M', ROUND(RAND() * (200 - 50) + 50)),
    ('Crewneck', 'Blue', 'S', ROUND(RAND() * (200 - 50) + 50)),
    ('Sweatshirt', 'Red', 'XL', ROUND(RAND() * (200 - 50) + 50)),
    ('Turtleneck', 'White', 'L', ROUND(RAND() * (200 - 50) + 50));

-- Display all shirts
SELECT * FROM shirts;

-- Select specific columns from shirts
SELECT article, color FROM shirts;

-- Select specific columns and filter by shirt_size
SELECT article, color, shirt_size, last_worn
FROM shirts
WHERE shirt_size = 'M';

-- Update shirt_size for Polo to 'L'
UPDATE shirts
SET shirt_size = 'L'
WHERE article = 'Polo';

-- Display all shirts after update
SELECT * FROM shirts;

-- Update last_worn to 0 for shirts where last_worn is less than or equal to 15
UPDATE shirts
SET last_worn = 0
WHERE last_worn <= 15;

-- Update shirt_size and color for shirts where color is 'White'
UPDATE shirts
SET shirt_size = 'XS', color = 'Off White'
WHERE color = 'White';

-- Display all shirts after updates
SELECT * FROM shirts;

-- Delete shirts where last_worn is greater than 200
DELETE FROM shirts
WHERE last_worn > 200;

-- Delete all rows from the shirts table
DELETE FROM shirts;

-- Drop the shirts table
DROP TABLE shirts;
