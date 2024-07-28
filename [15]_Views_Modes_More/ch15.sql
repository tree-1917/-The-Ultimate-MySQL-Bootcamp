-- 268. WITH ROLLUP: Working with Grouped Data and Rollup
-- Display the list of databases
show databases;

-- Select the database to use
use tv_db;

-- Show the tables in the current database
show tables;

-- Select all records from the 'full_reviews' view
select
    *
from
    full_reviews;

-- Group data by 'title' and include rollup totals
select
    title,
    count(rating)
from
    full_reviews
group by
    title with ROLLUP;

-- Group data by 'released_year' and 'genre' with rollup, replace NULLs with custom values
SELECT
    COALESCE(CAST(released_year AS CHAR), 'Total') AS released_year,
    COALESCE(genre, 'All Genres') AS genre,
    COALESCE(AVG(rating), 0) AS avg_rating
FROM
    full_reviews
GROUP BY
    released_year,
    genre WITH ROLLUP;

-- 270. SQL Modes Basics: Understanding and Modifying SQL Modes
-- Show the global SQL mode settings
select
    @ @GLOBAL.sql_mode;

-- Show the current session SQL mode settings
select
    @ @session.sql_mode;

-- Set the SQL mode for the session to enforce specific rules
set
    session sql_mode = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';

-- Attempt a division by zero, which should trigger an error or warning based on the SQL mode
select
    3 / 0;

-- Display any warnings that were generated by the previous query
show WARNINGS;

-- Verify the SQL mode settings for the current session
select
    @ @session.sql_mode;

-- Describe the structure of the 'reviews' table
desc reviews;

-- Change the session SQL mode to ignore spaces and some other rules
set
    SESSION sql_mode = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';

-- Attempt to insert a non-numeric value into a numeric column, which should trigger a warning
insert into
    reviews(rating)
values
    ('HI');

-- Display any warnings that were generated by the previous query
show WARNINGS;

-- Select all records from the 'reviews' table to see the effect of the previous insert
select
    *
from
    reviews;

-- 273. Using SQL Modes to Enforce Group By and Date Validations
-- Set SQL mode to enforce full group by rules
set
    session sql_mode = 'ONLY_FULL_GROUP_BY';

-- Query that requires full group by mode to be enforced
select
    title,
    AVG(rating)
from
    series
    join reviews on reviews.series_id = series.id
group by
    title;

-- Reset SQL mode to default (no special restrictions)
set
    session sql_mode = "";

-- Query without full group by mode enforcement (may produce warnings or errors)
select
    title
from
    series
    join reviews on reviews.series_id = series.id
group by
    title;

-- Attempt to create a date from an invalid date string
select
    DATE('2010-01-00');

-- Display current session SQL mode settings
select
    @ @SESSION.sql_mode;

-- Set SQL mode to disallow zero dates
set
    session sql_mode = "NO_ZERO_IN_DATE";

-- Attempt to create a date from an invalid date string (should trigger a warning or error now)
select
    DATE("2010-01-00");

-- Show warnings generated by the previous query
show WARNINGS;

-- Create a new table named 'dates' with a single date column
create table dates(d date);

-- Insert a valid date into the 'dates' table
insert into
    dates (d)
values
    ('2022-11-01');