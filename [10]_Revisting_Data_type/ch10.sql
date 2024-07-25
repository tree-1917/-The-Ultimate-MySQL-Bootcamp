-- 154 --
CREATE DATABASE test;

USE test;

CREATE TABLE friends (
    name VARCHAR(10) -- Limits the length of names to 10 characters
);

INSERT INTO
    friends(name)
VALUES
    ('ali'),
    ('hassan'),
    ('Hassan Moh');

-- Error IF try bigger name: The name exceeds the VARCHAR(10) limit
SELECT
    *
FROM
    friends;

CREATE TABLE states (
    abbr CHAR(2) -- Fixed length of 2 characters for state abbreviations
);

INSERT INTO
    states(abbr)
VALUES
    ('CA'),
    ('NY'),
    ('X'),
    ('XY');

SELECT
    *
FROM
    states;

SELECT
    CHAR_LENGTH(abbr)
FROM
    states;

-- Length of state abbreviations
SELECT
    CHAR_LENGTH(name)
FROM
    friends;

-- Length of names in friends table
-- 155 --
CREATE TABLE parent (
    childer TINYINT -- TINYINT can store values from -128 to 127 (signed)
);

INSERT INTO
    parent (childer)
VALUES
    (-128);

SELECT
    *
FROM
    parent;

DROP TABLE parent;

CREATE TABLE parent (
    childern TINYINT UNSIGNED -- UNSIGNED TINYINT can store values from 0 to 255
);

INSERT INTO
    parent (childern)
VALUES
    (255);

-- 156 --
INSERT INTO
    parent (childern)
VALUES
    (12.32);

-- Truncated to 12 due to data type
SELECT
    *
FROM
    parent;

DROP TABLE parent;

CREATE TABLE parent (
    childern DECIMAL -- DECIMAL can store exact numeric values
);

CREATE TABLE products (
    price DECIMAL(5, 3) -- DECIMAL with 5 digits total and 3 decimal places
);

INSERT INTO
    products (price)
VALUES
    (2.50),
    (32.23),
    (23.3);

INSERT INTO
    products (price)
VALUES
    (23.232232);

-- Value is rounded to fit DECIMAL(5, 3)
SHOW WARNINGS;

-- Shows warnings from previous operations
SELECT
    *
FROM
    products;

-- 157 --
CREATE TABLE numbers (
    x FLOAT,
    -- FLOAT has less precision compared to DOUBLE
    y DOUBLE -- DOUBLE has more precision
);

INSERT INTO
    numbers (x, y)
VALUES
    (1.123, 1.123),
    (1.1234567, 1.1234567891023123);

SELECT
    *
FROM
    numbers;

-- 159 --
CREATE TABLE users (
    name VARCHAR(50),
    -- Allows up to 50 characters for name
    DOB DATETIME -- Stores date and time
);

INSERT INTO
    users(name, DOB)
VALUES
    ('ali', '2002-03-02 10:00:00');

INSERT INTO
    users(name, DOB)
VALUES
    ('hassan', '2002-11-02 10:00:00');

INSERT INTO
    users(name, DOB)
VALUES
    ('Houssam', '2004-09-11 10:00:00');

CREATE TABLE people (
    name VARCHAR(100),
    bd DATE,
    -- Stores date only
    bt TIME,
    -- Stores time only
    bdt DATETIME -- Stores date and time
);

DESC people;

-- Shows the structure of the 'people' table
INSERT INTO
    people (name, bd, bt, bdt)
VALUES
    (
        'ali',
        '2003-02-02',
        '10:00:12',
        '2003-02-02 10:00:12'
    );

SELECT
    *
FROM
    people;

INSERT INTO
    people (name, bd, bt, bdt)
VALUES
    (
        'Hassan',
        '2004-12-02',
        '10:10:12',
        '2004-12-02 10:10:12'
    );

SELECT
    *
FROM
    people;

UPDATE
    people
SET
    name = "Ali"
WHERE
    name = "ali";

SELECT
    *
FROM
    people;

INSERT INTO
    people (name, bd, bt, bdt)
VALUES
    (
        'Elton',
        '2000-12-25',
        '11:00:00',
        '2000-12-25 11:00:00'
    );

INSERT INTO
    people (name, bd, bt, bdt)
VALUES
    (
        'Lulu',
        '1985-04-11',
        '9:45:10',
        '1985-04-11 9:45:10'
    );

INSERT INTO
    people (name, bd, bt, bdt)
VALUES
    (
        'Juan',
        '2020-08-15',
        '23:59:00',
        '2020-08-15 23:59:00'
    );

SELECT
    *
FROM
    people;

SELECT
    CURTIME();

-- Current time
SELECT
    NOW();

-- Current date and time
SELECT
    CURDATE();

-- Current date
SELECT
    CURRENT_TIMESTAMP();

-- Current date and time
INSERT INTO
    people (name, bd, bt, bdt)
VALUES
    ('hassan', CURDATE(), CURTIME(), NOW());

SELECT
    *
FROM
    people;

UPDATE
    people
SET
    name = CONCAT(UCASE(LEFT(name, 1)), LCASE(SUBSTR(name, 2)));

-- Capitalize names
SELECT
    *
FROM
    people;

SELECT
    YEAR(bd)
FROM
    people;

-- Extract year from bd
SELECT
    MONTH(bd)
FROM
    people;

-- Extract month from bd
SELECT
    DAY(bd)
FROM
    people;

-- Extract day from bd
SELECT
    name,
    bd,
    MONTHNAME(bd),
    DAYOFYEAR(bd),
    WEEK(bd, 2)
FROM
    people;

SELECT
    MINUTE(bt)
FROM
    people;

-- Extract minutes from bt
SELECT
    HOUR(bt)
FROM
    people;

-- Extract hours from bt
SELECT
    TIMESTAMP(bdt)
FROM
    people;

-- Convert bdt to TIMESTAMP
-- 167 --
SELECT
    CONCAT(MONTHNAME(bdt), ' ', DAY(bdt), ' ', YEAR(bdt))
FROM
    people;

SELECT
    DATE_FORMAT(bdt, '%d,%M,%y ... %H:%i:%s')
FROM
    people;

SELECT
    bdt,
    DATE_FORMAT(bdt, "Born on %a.%b.%Y")
FROM
    people;

-- 169 --
SELECT
    bd
FROM
    people;

SELECT
    bd,
    DATEDIFF(CURDATE(), bd)
FROM
    people;

-- Difference in days between current date and bd
SELECT
    bd,
    DATE_SUB(bd, INTERVAL 2 YEAR)
FROM
    people;

-- Subtract 2 years from bd
SELECT
    bt,
    TIMEDIFF(bt, '07:00:00')
FROM
    people;

-- Difference between bt and '07:00:00'
SELECT
    3 - 4;

-- Arithmetic operation
SELECT
    NOW() - INTERVAL 18 YEAR;

-- Subtract 18 years from current date and time
SELECT
    name,
    bd,
    YEAR(bd + INTERVAL 21 YEAR) AS user_21
FROM
    people;

-- Add 21 years to bd
-- 170 --
SELECT
    bdt,
    TIMESTAMP(bd)
FROM
    people;

SELECT
    NOW();

-- Current date and time
SELECT
    TIMESTAMP(NOW() + INTERVAL 40 YEAR);

-- Add 40 years to current date and time
-- 171 --
CREATE TABLE captions (
    text VARCHAR(50),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Default to current timestamp on insert
);

INSERT INTO
    captions (text)
VALUES
    ("Hello is that work"),
    ("Hello man is that not work");

SELECT
    *
FROM
    captions;

CREATE TABLE captions2 (
    text VARCHAR(50),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Updates timestamp on row modification
);

INSERT INTO
    captions2 (text)
VALUES
    ("Hello World");

SELECT
    *
FROM
    captions2;

UPDATE
    captions2
SET
    text = "hello world 2!!!$$23";

SELECT
    *
FROM
    captions2;