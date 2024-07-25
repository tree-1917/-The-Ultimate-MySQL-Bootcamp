-- Active: 1720861686632@@127.0.0.1@3306
use book_shop;

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
	('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
	('fake_book', 'Freida', 'Harris', 2001, 287, 428),
	(
		'Lincoln In The Bardo',
		'George',
		'Saunders',
		2017,
		1000,
		367
	);

show tables;

-- 116 -- 
select
	DISTINCT author_lname
from
	books;

select
	DISTINCT released_year
from
	books;

select
	DISTINCT CONCAT(author_fname, ' ', author_lname)
from
	books;

select
	CONCAT(author_fname, ' ', author_lname)
from
	books;

select
	DISTINCT author_fname,
	author_lname,
	released_year
from
	books;

-- 118 --
select
	book_id,
	title,
	author_lname
from
	books;

insert into
	books(title, author_lname)
values
	("my_work", "ali");

select
	author_lname
from
	books
order BY
	author_fname desc;

DESC TABLE books;

desc books;

select
	title,
	pages
from
	books
order BY
	pages;

select
	title,
	pages,
	released_year
from
	books
order BY
	released_year;

-- 120 --
use book_shop;

select
	book_id,
	author_fname,
	author_lname,
	pages
from
	books
order by
	released_year;

show tables;

select
	*
from
	books;

select
	CONCAT(author_fname, " ", author_lname) as author
from
	books
order by
	author desc;

-- 122 -- 
select
	book_id,
	title,
	released_year
from
	books
order by
	released_year
limit
	3;

select
	book_id,
	title,
	released_year
from
	books
order by
	released_year
limit
	3, 2;

-- 124 --
select
	title,
	author_fname,
	author_lname
from
	books
where
	author_fname like "%%v%";

select
	*
from
	books
where
	title like "%:%";

select
	*
from
	books
where
	author_fname like "___";

select
	*
from
	books
where
	author_fname like "%a%";

select
	*
from
	books
where
	author_fname like "%n";

-- 126 -- 
select
	*
from
	books
where
	title like "%\_%";

-- 128 --
select
	title
from
	books
where
	title like "%stories%";

select
	title,
	pages
from
	books
order by
	pages DESC
limit
	1;

CASE
	WHEN your_column IS NULL THEN 1
	ELSE 0
END,
-- Nulls lastCASE WHEN your_column IS NULL THEN 1 ELSE 0 END, -- Nulls last
your_column;

your_column;

select
	CONCAT(title, ' - ', released_year) as summary
from
	books
order by
	released_year DESC
limit
	3;

select
	title,
	author_lname
from
	books
where
	author_lname like "% %";

use book_shop;

select
	title,
	released_year,
	stock_quantity
from
	books
order by
	stock_quantity;

select
	title,
	author_lname
from
	books
order by
	title,
	author_lname;

select
	CONCAT(
		'MY FAVORITE AUTHOR IS ',
		UPPER(author_lname),
		" ",
		Upper(author_fname),
		"!"
	)
from
	booksa
order by
	author_lname;

---