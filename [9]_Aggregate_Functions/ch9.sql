-- SQL Script for Book Database Analysis
-- This script performs various operations on the `books` table to analyze book data.
-- 132: Basic Counts and Distinct Counts
-- Count the total number of books in the `books` table.
SELECT
    COUNT(*) AS total_books
FROM
    books;

-- Count the number of non-null `author_lname` and `author_fname` values.
SELECT
    COUNT(author_lname) AS lname_count,
    COUNT(author_fname) AS fname_count
FROM
    books;

-- Count the total and distinct number of `author_fname` values.
SELECT
    COUNT(author_fname) AS total_fname_count,
    COUNT(DISTINCT author_fname) AS distinct_fname_count
FROM
    books;

-- Count the number of distinct `released_year` values.
SELECT
    COUNT(DISTINCT released_year) AS distinct_release_years
FROM
    books;

-- Count the number of distinct `author_lname` values.
SELECT
    COUNT(DISTINCT author_lname) AS distinct_lname_count
FROM
    books;

-- Count the number of books that have "the" in the title.
SELECT
    COUNT(*) AS books_with_the
FROM
    books
WHERE
    title LIKE '%the%';

-- 134: Grouping and Ordering
-- Count the number of books written by each author (grouped by last name).
SELECT
    author_lname,
    COUNT(author_lname) AS books_written
FROM
    books
GROUP BY
    author_lname
ORDER BY
    books_written DESC;

-- Count the number of books released each year (grouped by release year).
SELECT
    released_year,
    COUNT(*) AS books_in_year
FROM
    books
GROUP BY
    released_year
ORDER BY
    books_in_year DESC;

-- 136: Basic Aggregates and Grouping
-- List all distinct `author_lname` values.
SELECT
    DISTINCT author_lname
FROM
    books;

-- Count the total number of books in the `books` table.
SELECT
    COUNT(*) AS total_books
FROM
    books;

-- Find the maximum `released_year` value.
SELECT
    MAX(released_year) AS latest_release_year
FROM
    books;

-- Find the minimum `released_year` value.
SELECT
    MIN(released_year) AS earliest_release_year
FROM
    books;

-- Find the maximum number of pages in any book.
SELECT
    MAX(pages) AS max_pages
FROM
    books;

-- Find both the minimum and maximum `released_year` values.
SELECT
    MIN(released_year) AS earliest_release_year,
    MAX(released_year) AS latest_release_year
FROM
    books;

-- Find both the minimum and maximum number of pages in any book.
SELECT
    MIN(pages) AS min_pages,
    MAX(pages) AS max_pages
FROM
    books;

-- 138: Subqueries and Selection
-- Select the title, pages, and released year of the book(s) with the maximum number of pages.
SELECT
    title,
    pages,
    released_year
FROM
    books
WHERE
    pages = (
        SELECT
            MAX(pages)
        FROM
            books
    );

-- 140: Ordering and Grouping
-- Order authors by last name.
SELECT
    author_fname,
    author_lname
FROM
    books
ORDER BY
    author_lname;

-- Count the number of books written by each author (grouped by both first and last name).
SELECT
    author_lname,
    author_fname,
    COUNT(*) AS books_written
FROM
    books
GROUP BY
    author_lname,
    author_fname;

-- Concatenate the first and last names of authors and count the number of books.
SELECT
    CONCAT(author_fname, ' ', author_lname) AS full_name,
    COUNT(*) AS books_written
FROM
    books
GROUP BY
    author_lname,
    author_fname;

-- 142: Aggregate Functions
-- Aggregate statistics by author last name, including count of books, latest and earliest release year, and longest page count.
SELECT
    author_lname,
    COUNT(*) AS books_written,
    MAX(released_year) AS latest_release,
    MIN(released_year) AS earliest_release,
    MAX(pages) AS longest_page_count
FROM
    books
GROUP BY
    author_lname;

-- Count books by author (grouped by both first and last name).
SELECT
    author_lname,
    author_fname,
    COUNT(*) AS books_written
FROM
    books
GROUP BY
    author_lname,
    author_fname;

-- Calculate the total number of pages across all books.
SELECT
    SUM(pages) AS total_pages
FROM
    books;

-- Calculate the total number of pages for each author (grouped by last name).
SELECT
    author_lname,
    SUM(pages) AS total_pages
FROM
    books
GROUP BY
    author_lname;

-- Perform a simple addition operation.
SELECT
    291 + 234 AS sum_result;

-- Count books and find the earliest release year by author last name.
SELECT
    author_lname,
    COUNT(*) AS books_written,
    MIN(released_year) AS earliest_release
FROM
    books
GROUP BY
    author_lname;

-- Note: The following query will cause an error as `author_lname` is a string and cannot be summed.
-- SELECT SUM(author_lname) AS sum_lname
-- FROM books;
-- 146: Average Calculations
-- Calculate the average stock quantity across all books.
SELECT
    AVG(stock_quantity) AS average_stock_quantity
FROM
    books;

-- Calculate the average stock quantity and count of books for each release year.
SELECT
    released_year,
    AVG(stock_quantity) AS average_stock_quantity,
    COUNT(*) AS books_count
FROM
    books
GROUP BY
    released_year;

# EXercies 
select
    count(*)
from
    books;

select
    released_year,
    count(*)
from
    books
group by
    released_year;

select
    sum(stock_quantity)
from
    books;

select
    author_fname,
    avg(released_year)
from
    books
group by
    author_fname;

select
    CONCAT(author_fname, " ", author_lname)
from
    books
where
    pages = (
        select
            max(pages)
        from
            books
    );

select
    released_year as year,
    count(*) as Books,
    avg(pages) as
from
    books
group by
    released_year;