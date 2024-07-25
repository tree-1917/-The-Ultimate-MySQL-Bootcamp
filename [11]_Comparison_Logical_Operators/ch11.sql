Here are comments for each SQL query block provided: sql نسخ الكود -- 177 --
-- Use the book_shop database
use book_shop;

-- Show all tables in the current database
show tables;

-- Select all columns from the 'books' table
select
    *
from
    books;

-- Select all columns from the 'books' table where the 'released_year' is not 2017
select
    *
from
    books
where
    released_year != 2017;

-- 179 --
-- Select the title of books where the title does not contain a space
select
    title
from
    books
where
    title not like "% %";

-- Select the title, author's first name, and last name where the author's first name does not start with 'da'
select
    title author_fname,
    author_lname
from
    books
where
    author_fname not like "da%";

-- Select the title of books where the title does not contain the letter 'a'
select
    title
from
    books
where
    title not like "%a%";

-- 181 --
-- Select the title of books where the 'released_year' is greater than 2005
select
    title
from
    books
where
    released_year > 2005;

-- Select the title of books where the number of pages is greater than 500
select
    title
from
    books
where
    pages > 500;

-- Select the title and number of pages of books where the pages are greater than 240, ordered by the number of pages in descending order
select
    title,
    pages
from
    books
where
    pages > 240
order by
    pages desc;

-- 183 --
-- Select the title, released year, and number of pages of books where the pages are greater than or equal to 300, ordered by the number of pages in descending order
select
    title,
    released_year,
    pages
from
    books
where
    pages >= 300
order by
    pages DESC;

-- 185 --
-- Select the author's full name (concatenation of first and last name), title, and released year where the author's last name is 'Eggers' and the released year is after 2010
select
    CONCAT(author_fname, " ", author_lname),
    title,
    released_year
from
    books
where
    author_lname = "Eggers"
    and released_year > 2010;

-- Boolean expressions
select
    1 > 2
    and 1 < 3;

-- False
select
    TRUE
    and TRUE;

-- True
select
    FALSE
    and FALSE;

-- False
select
    FALSE
    and "1";

-- False
select
    True
    and "3";

-- True
-- Select the title and number of pages of books where the title length is greater than 14 and pages are greater than 300
select
    title,
    pages
from
    books
where
    CHAR_LENGTH(title) > 14
    and pages > 300;

-- Select the title and number of pages of books where the title length is greater than 15 or pages are greater than 300
select
    title,
    pages
from
    books
where
    CHAR_LENGTH(title) > 15
    or pages > 300;

-- Select the title and number of pages of books where the pages are greater than 300 and the released year is greater than 2002
select
    title,
    pages
from
    books
where
    pages > 300
    and released_year > 2002;

-- 189 --
-- Retrieve all books released between 2004 and 2015 inclusive
select
    *
from
    books
where
    released_year >= 2004
    and released_year <= 2015;

-- Retrieve all books released between 2000 and 2010 inclusive
select
    *
from
    books
where
    released_year BETWEEN 2000
    and 2010;

-- Retrieve all books released outside the range 2000 to 2010
select
    *
from
    books
where
    released_year not BETWEEN 2000
    and 2010;

-- Show all databases
show DATABASEs;

-- Switch to the 'test' database
use test;

-- Show all tables in the 'test' database
show tables;

-- Retrieve all people where birthdate is before February 2, 2003
select
    *
from
    people
where
    bd < "2003-02-02";

-- Retrieve all people born before the year 2004
select
    *
from
    people
where
    year(bd) < 2004;

-- Retrieve all people where time is after 05:00:00
select
    *
from
    people
where
    bt > "05:00:00";

-- Retrieve all people where hour of time is greater than 8
select
    *
from
    people
where
    HOUR(bt) > 8;

-- Convert a string to TIME data type
select
    cast("09:00:00" As TIME);

-- Retrieve all people where time is between 10:00:00 and 15:00:00
select
    *
from
    people
where
    bt between "10:00:00"
    and "15:00:00";

-- Retrieve all people where time is between 10:00:00 and 16:00:00 using TIME cast
select
    *
from
    people
where
    bt BETWEEN cast("10:00:00" as time)
    and cast("16:00:00" as time);

-- Retrieve all people where hour of time is between 10 and 18
select
    *
from
    people
where
    hour(bt) between 10
    and 18;

-- Switch back to the 'book_shop' database
use book_shop;

-- Retrieve titles and author last names for authors not in the given list
select
    title,
    author_lname
from
    books
where
    author_lname not in ('Carver', 'Lahiri', 'Smith');

-- Retrieve titles and release years for books not released in specified years
select
    title,
    released_year
from
    books
where
    released_year not in (
        2000,
        2002,
        2004,
        2006,
        2008,
        2010,
        2012,
        2014,
        2016
    );

-- Retrieve titles and release years of books with odd release years
select
    title,
    released_year
from
    books
where
    released_year % 2 != 0;

-- Categorize books based on their release year:
-- - 'modern' for books released after 2010
-- - 'lit modern' for books released between 2001 and 2010
-- - '20th Century lit' for books released in 2000 or earlier
select
    title,
    released_year,
    case
        when released_year > 2010 then 'modern'
        when released_year > 2000 then 'lit modern'
        else '20th Century lit'
    end as Gener
from
    books;

-- Update the stock quantity of all books with a random number between 1 and 200
update
    books
set
    stock_quantity = floor(rand() * 200 + 1);

-- Retrieve all columns from the 'books' table to view updated stock quantities
select
    *
from
    books;

-- Retrieve titles and stock quantities, and categorize stock with stars:
-- - '*' for stock between 0 and 50
-- - '**' for stock between 51 and 100
-- - '***' for stock above 100
select
    title,
    stock_quantity,
    case
        when stock_quantity between 0
        and 50 then '*'
        when stock_quantity between 51
        and 100 then '**'
        else '***'
    end as stars
from
    books;

-- Retrieve all books where the author's first name is NULL
select
    *
from
    books
where
    author_fname is Null;

-- Check if 10 is not equal to 10 (will return FALSE)
select
    10 != 10;

-- Check if 15 is greater than 14 and if 99 - 5 is less than or equal to 94 (will return TRUE)
select
    15 > 14
    and 99 -5 <= 94;

-- Check if 1 is in the list (5, 3) or if 9 is between 8 and 10 (will return TRUE)
select
    1 in (5, 3)
    or 9 between 8
    and 10;

-- Retrieve titles of books released before 1980
select
    title
from
    books
where
    released_year < 1980;

-- Retrieve titles and author last names for authors 'Eggers' or 'Chabon'
select
    title,
    author_lname
from
    books
where
    author_lname in ("Eggers", "Chabon");

-- Retrieve titles and author last names for books written by 'Lahiri' released after 2000
select
    title,
    author_lname
from
    books
where
    author_lname = 'Lahiri'
    and released_year > 2000;

-- Retrieve titles and page counts for books with pages between 100 and 200
select
    title,
    pages
from
    books
where
    pages between 100
    and 200;

-- Retrieve titles and author last names where the author's last name contains 'C' or 'S'
-- Note: The query seems to be incorrect. It should be: 
-- author_lname like '%C%' or author_lname like '%S%'
select
    title,
    author_lname
from
    books
where
    author_lname like '%C%'
    or '%S%';

-- Retrieve titles, author last names, and categorize books as 'short story' if the title contains 'STORIES'
-- Otherwise, categorize as 'Novel'
select
    title,
    author_lname,
    case
        when UPPER(title) like "%STORIES%" then 'short story'
        else "Novel"
    end as TYPE
from
    books;

-- Retrieve author names and the count of books by each author, with correct singular/plural form
select
    author_lname,
    author_fname,
    CONCAT(
        book_counts,
        case
            when book_counts > 1 then ' books'
            else ' book'
        end
    )
from
    (
        select
            author_lname,
            author_fname,
            count(*) as book_counts
        from
            books
        group by
            author_fname,
            author_lname
    ) as counts;