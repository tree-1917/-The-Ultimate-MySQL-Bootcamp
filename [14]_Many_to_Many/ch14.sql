-- TV Show Reviewing Application --
-- Create database
CREATE DATABASE tv_db;

-- Use the created database
USE tv_db;

-- Create the 'reviewers' table
CREATE TABLE reviewers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    -- Unique identifier for each reviewer
    f_name TEXT NOT NULL,
    -- First name of the reviewer
    l_name TEXT NOT NULL -- Last name of the reviewer
);

-- Create the 'series' table
CREATE TABLE series (
    id INT PRIMARY KEY AUTO_INCREMENT,
    -- Unique identifier for each series
    title TEXT NOT NULL,
    -- Title of the series
    released_year INT,
    -- Year the series was released
    genre TEXT NOT NULL -- Genre of the series
);

-- Insert data into the 'series' table
INSERT INTO
    series (title, released_year, genre)
VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ('Bob\'s Burgers', 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ('Breaking Bad', 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ('Fargo', 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

-- Insert data into the 'reviewers' table
INSERT INTO
    reviewers (f_name, l_name)
VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');

-- Create the 'reviews' table
CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    -- Unique identifier for each review
    rating FLOAT,
    -- Rating given in the review
    reviewer_id INT,
    -- Foreign key to the 'reviewers' table
    series_id INT,
    -- Foreign key to the 'series' table
    FOREIGN KEY (reviewer_id) REFERENCES reviewers(id),
    -- Reference to 'reviewers' table
    FOREIGN KEY (series_id) REFERENCES series(id) -- Reference to 'series' table
);

-- Insert data into the 'reviews' table
INSERT INTO
    reviews (series_id, reviewer_id, rating)
VALUES
    (1, 1, 8.0),
    (1, 2, 7.5),
    (1, 3, 8.5),
    (1, 4, 7.7),
    (1, 5, 8.9),
    (2, 1, 8.1),
    (2, 4, 6.0),
    (2, 3, 8.0),
    (2, 6, 8.4),
    (2, 5, 9.9),
    (3, 1, 7.0),
    (3, 6, 7.5),
    (3, 4, 8.0),
    (3, 3, 7.1),
    (3, 5, 8.0),
    (4, 1, 7.5),
    (4, 3, 7.8),
    (4, 4, 8.3),
    (4, 2, 7.6),
    (4, 5, 8.5),
    (5, 1, 9.5),
    (5, 3, 9.0),
    (5, 4, 9.1),
    (5, 2, 9.3),
    (5, 5, 9.9),
    (6, 2, 6.5),
    (6, 3, 7.8),
    (6, 4, 8.8),
    (6, 2, 8.4),
    (6, 5, 9.1),
    (7, 2, 9.1),
    (7, 5, 9.7),
    (8, 4, 8.5),
    (8, 2, 7.8),
    (8, 6, 8.8),
    (8, 5, 9.3),
    (9, 2, 5.5),
    (9, 3, 6.8),
    (9, 4, 5.8),
    (9, 6, 4.3),
    (9, 5, 4.5),
    (10, 5, 9.9),
    (13, 3, 8.0),
    (13, 4, 7.2),
    (14, 2, 8.5),
    (14, 3, 8.9),
    (14, 4, 8.9);

-- Query to view all reviews
SELECT
    *
FROM
    reviews;

-- #1: Retrieve the series title and its corresponding rating
SELECT
    title,
    rating
FROM
    series
    JOIN reviews ON series.id = reviews.series_id;

-- #2: Retrieve the average rating for each series, rounded to 2 decimal places, sorted by highest average rating
SELECT
    title,
    ROUND(AVG(rating), 2) AS avg_rating
FROM
    series
    JOIN reviews ON series.id = reviews.series_id
GROUP BY
    title
ORDER BY
    avg_rating DESC;

-- #3: Retrieve the first and last name of reviewers and their ratings
SELECT
    f_name,
    l_name,
    rating
FROM
    reviewers
    JOIN reviews ON reviewers.id = reviews.reviewer_id;

-- #4: Retrieve the title and rating for series that do not have any reviews
SELECT
    title,
    rating
FROM
    series
    LEFT JOIN reviews ON series.id = reviews.series_id
WHERE
    reviews.series_id IS NULL;

-- #5: Retrieve the average rating for each genre, rounded to 3 decimal places
SELECT
    genre,
    ROUND(AVG(rating), 3) AS avg_rating
FROM
    series
    JOIN reviews ON series.id = reviews.series_id
GROUP BY
    genre;

-- #6: Retrieve reviewer statistics including count, min, max, and average rating, with status based on rating count
SELECT
    f_name,
    l_name,
    COUNT(rating) AS COUNT,
    IFNULL(ROUND(MIN(rating), 3), 0) AS MIN,
    IFNULL(ROUND(MAX(rating), 3), 0) AS MAX,
    IFNULL(ROUND(AVG(rating), 3), 0) AS AVG,
    CASE
        WHEN COUNT(rating) = 0 THEN 'INACTIVE'
        ELSE 'ACTIVE'
    END AS Status
FROM
    reviewers
    LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY
    f_name,
    l_name;

-- #7: Retrieve the title, rating, and full name of reviewers for each review
SELECT
    title,
    rating,
    CONCAT(f_name, ' ', l_name) AS full_name
FROM
    reviews
    JOIN series ON series.id = reviews.series_id
    JOIN reviewers ON reviews.reviewer_id = reviewers.id;