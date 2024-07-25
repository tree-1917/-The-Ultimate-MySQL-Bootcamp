-- Create database and use it
CREATE DATABASE book_shop;

USE book_shop;

-- Create the books table
CREATE TABLE books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY(book_id)
);

-- Insert data into the books table
INSERT INTO
    books (
        title,
        author_fname,
        author_lname,
        released_year,
        stock_quantity,
        pages
    )
VALUES
    (
        'The Namesake',
        'Jhumpa',
        'Lahiri',
        2003,
        32,
        291
    ),
    (
        'Norse Mythology',
        'Neil',
        'Gaiman',
        2016,
        43,
        304
    ),
    ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
    (
        'Interpreter of Maladies',
        'Jhumpa',
        'Lahiri',
        1996,
        97,
        198
    ),
    (
        'A Hologram for the King: A Novel',
        'Dave',
        'Eggers',
        2012,
        154,
        352
    ),
    ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
    (
        'The Amazing Adventures of Kavalier & Clay',
        'Michael',
        'Chabon',
        2000,
        68,
        634
    ),
    ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
    (
        'A Heartbreaking Work of Staggering Genius',
        'Dave',
        'Eggers',
        2001,
        104,
        437
    ),
    ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
    (
        'What We Talk About When We Talk About Love: Stories',
        'Raymond',
        'Carver',
        1981,
        23,
        176
    ),
    (
        "Where I'm Calling From: Selected Stories",
        'Raymond',
        'Carver',
        1989,
        12,
        526
    ),
    ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
    (
        'Cannery Row',
        'John',
        'Steinbeck',
        1945,
        95,
        181
    ),
    (
        'Oblivion: Stories',
        'David',
        'Foster Wallace',
        2004,
        172,
        329
    ),
    (
        'Consider the Lobster',
        'David',
        'Foster Wallace',
        2005,
        92,
        343
    );

-- Select all records from the books table
SELECT
    *
FROM
    books;

-- Display the current database
SELECT
    DATABASE();

-- Describe the structure of the books table
DESC books;

-- 93 --
-- Concatenate first and last names of authors
SELECT
    CONCAT(author_fname, ' ', author_lname) AS author_name
FROM
    books;

-- Concatenate first and last names of authors with underscore
SELECT
    CONCAT_WS("_", author_fname, author_lname)
FROM
    books;

-- 95 --
-- Demonstrate the SUBSTRING function
SELECT
    SUBSTRING("hello world", 1, 5);

SELECT
    SUBSTRING("hello world two", 3, 10);

SELECT
    SUBSTRING("this is new string for test", 8);

SELECT
    SUBSTRING("this is new string for us", 3);

-- Substring on book titles and author last names
SELECT
    SUBSTRING(title, 1, 15) AS title_15
FROM
    books;

SELECT
    SUBSTRING(author_lname, 1, 1) AS last_char,
    author_lname
FROM
    books;

-- 97 --
-- Concatenate and truncate titles and names
SELECT
    CONCAT(SUBSTR(title, 1, 10), ' ...') AS short_title
FROM
    books;

SELECT
    CONCAT(
        SUBSTR(author_fname, 1, 1),
        '.',
        SUBSTR(author_lname, 1, 1),
        '.'
    ) AS short_name
FROM
    books;

-- 99 --
-- Demonstrate the REPLACE function
SELECT
    REPLACE('www.sql.com', 'w', 'ww');

SELECT
    REPLACE('name is gamal', 'gamal', '!@#@#$');

SELECT
    REPLACE('this is my replace example', ' ', ' and ');

SELECT
    REPLACE('i am ali!', 'ali', 'sodf');

SELECT
    REPLACE(title, ' ', '_') AS easy_name
FROM
    books;

-- 100 --
-- Demonstrate the REVERSE function
SELECT
    REVERSE('hello world');

SELECT
    REVERSE("good world");

SELECT
    REVERSE(NULL);

SELECT
    REVERSE(author_fname)
FROM
    books;

SELECT
    CONCAT(
        REVERSE(author_fname),
        '..',
        REVERSE(author_lname)
    ) AS final_col
FROM
    books;

-- 104 --
-- Demonstrate the CHAR_LENGTH function
SELECT
    CHAR_LENGTH("hello world");

SELECT
    CHAR_LENGTH(title)
FROM
    books;

SELECT
    LENGTH(title)
FROM
    books;

SELECT
    CHAR_LENGTH(title) AS title_len,
    title
FROM
    books;

-- Demonstrate the UPPER and LOWER functions
SELECT
    UPPER("Hello");

SELECT
    UCASE("hello");

SELECT
    LOWER("HEOIDFJ");

SELECT
    CONCAT(UPPER('i love the ('), UPPER(title), " )!!!") AS TITLE
FROM
    books;

-- 108 --
-- Demonstrate the INSERT function
SELECT
INSERT
('hello World my work', 7, 8, 'there');

SELECT
    CONCAT(
        LEFT(author_fname, 1),
        '.',
        RIGHT(author_lname, 1)
    )
FROM
    books;

SELECT
    REPEAT('H', 5);

SELECT
    TRIM('          this is osidjf        ');

SELECT
    TRIM(
        LEADING 'www.'
        FROM
            TRIM(
                TRAILING '.com'
                FROM
                    'www.school.com'
            )
    );

-- 110 --
-- Reverse a string and replace characters
SELECT
    REVERSE("Why does my cat look at me with such hatred?");

SELECT
    REPLACE(CONCAT("I", " ", "like", " ", "cats"), " ", "-");

-- Use the book_shop database and perform additional operations
USE book_shop;

SELECT
    *
FROM
    books;

SELECT
    REPLACE(title, " ", "->") AS title
FROM
    books;

SELECT
    author_lname AS forwards,
    REVERSE(author_lname) AS backwards
FROM
    books;

SELECT
    UPPER(CONCAT(author_fname, " ", author_lname))
FROM
    books;

SELECT
    CONCAT(title, " was released in ", released_year)
FROM
    books;

SELECT
    title,
    LENGTH(title)
FROM
    books;

SELECT
    title,
    CHAR_LENGTH(title)
FROM
    books;

SELECT
    *
FROM
    books;

-- Concatenate and format titles, authors, and stock quantities
SELECT
    CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, " in stock") AS quantity
FROM
    books;