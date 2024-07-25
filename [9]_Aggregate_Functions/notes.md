# Aggregate Function

> Outline:

- [x] **132. Count Basics**
- [x] **134. GROUP BY**
- [x] **136. MIN and MAX Basics**
- [x] **138. Subqueries**
- [x] **140. Grouping By Multiple Columns**
- [x] **142. MIN and MAX With GROUP BY**
- [x] **144. SUM**
- [x] **146. AVG**
- [x] **Operation Process in SQL**

---

## Content

### 132. Count Basics

- **How to `Count`?**

  - The `COUNT` function in SQL is used to count the number of rows that match a specified condition. It can also be used to count non-null values in a specific column.

  **Syntax:**

  ```sql
  SELECT COUNT(column_name) AS alias_name
  FROM table_name;
  ```

  **Examples:**

  ```sql
  -- Count total number of books
  SELECT COUNT(*) AS total_books
  FROM books;

  -- Count non-null values in the author_fname column
  SELECT COUNT(author_fname) AS total_authors
  FROM books;
  ```

### 134. GROUP BY

- **How to use `GROUP BY`?**

  - The `GROUP BY` clause groups rows that have the same values into summary rows, like finding the total number of books by each author. It is often used with aggregate functions like `COUNT`, `SUM`, `AVG`, etc.

  **Syntax:**

  ```sql
  SELECT column_name(s), aggregate_function(column_name)
  FROM table_name
  GROUP BY column_name(s);
  ```

  **Examples:**

  ```sql
  -- Count books by each author
  SELECT author_lname, COUNT(*) AS books_written
  FROM books
  GROUP BY author_lname;
  ```

  **Notes:**

  - `GROUP BY` must follow the `SELECT` statement and precede the `ORDER BY` clause.
  - All columns in the `SELECT` statement that are not used in aggregate functions must be included in the `GROUP BY` clause.

### 136. MIN and MAX Basics

- **How to use `MIN` and `MAX`?**

  - `MIN` and `MAX` functions are used to find the smallest and largest values in a column, respectively.

  **Syntax:**

  ```sql
  SELECT MIN(column_name) AS min_value, MAX(column_name) AS max_value
  FROM table_name;
  ```

  **Examples:**

  ```sql
  -- Find the earliest and latest release years
  SELECT MIN(released_year) AS earliest_year, MAX(released_year) AS latest_year
  FROM books;

  -- Find the book with the maximum number of pages
  SELECT MAX(pages) AS max_pages
  FROM books;
  ```

### 138. Subqueries

- **How to use `Subqueries`?**

  - A subquery is a query within another query. It can be used to perform operations that require intermediate results.

  **Syntax:**

  ```sql
  SELECT column_name
  FROM table_name
  WHERE column_name = (SELECT column_name FROM table_name WHERE condition);
  ```

  **Examples:**

  ```sql
  -- Find books with the maximum number of pages
  SELECT title, pages
  FROM books
  WHERE pages = (
      SELECT MAX(pages)
      FROM books
  );
  ```

- **Rules to use `Subqueries`:**
  - Subqueries can be used in the `SELECT`, `WHERE`, and `FROM` clauses.
  - They should return a single value when used with comparison operators.
  - Can be nested, but deep nesting can impact performance.

### 140. Grouping By Multiple Columns

- **How to `Group By Multiple Columns`?**

  - You can group by more than one column to create more detailed summaries.

  **Syntax:**

  ```sql
  SELECT column_name1, column_name2, aggregate_function(column_name3)
  FROM table_name
  GROUP BY column_name1, column_name2;
  ```

  **Examples:**

  ```sql
  -- Count books by each author and by their first name
  SELECT author_lname, author_fname, COUNT(*) AS books_written
  FROM books
  GROUP BY author_lname, author_fname;
  ```

### 142. MIN and MAX With GROUP BY

- **How to use `MIN` and `MAX` with `GROUP BY`?**

  - You can use `MIN` and `MAX` in conjunction with `GROUP BY` to find the minimum and maximum values within each group.

  **Syntax:**

  ```sql
  SELECT column_name, MIN(numeric_column) AS min_value, MAX(numeric_column) AS max_value
  FROM table_name
  GROUP BY column_name;
  ```

  **Examples:**

  ```sql
  -- Find the earliest and latest release year for each author
  SELECT author_lname, MIN(released_year) AS earliest_release, MAX(released_year) AS latest_release
  FROM books
  GROUP BY author_lname;
  ```

### 144. SUM

- **How to use `SUM`?**

  - The `SUM` function adds up the values in a numeric column.

  **Syntax:**

  ```sql
  SELECT SUM(column_name) AS total_sum
  FROM table_name;
  ```

  **Examples:**

  ```sql
  -- Calculate the total number of pages in all books
  SELECT SUM(pages) AS total_pages
  FROM books;

  -- Calculate the total number of pages for each author
  SELECT author_lname, SUM(pages) AS total_pages
  FROM books
  GROUP BY author_lname;
  ```

### 146. AVG

- **How to use `AVG`?**

  - The `AVG` function calculates the average value of a numeric column.

  **Syntax:**

  ```sql
  SELECT AVG(column_name) AS average_value
  FROM table_name;
  ```

  **Examples:**

  ```sql
  -- Calculate the average number of pages across all books
  SELECT AVG(pages) AS average_pages
  FROM books;

  -- Calculate the average stock quantity and count of books for each release year
  SELECT released_year, AVG(stock_quantity) AS average_stock_quantity, COUNT(*) AS books_count
  FROM books
  GROUP BY released_year;
  ```

### Operation Process in SQL

Understanding how SQL processes a query helps in writing efficient and effective queries. Here’s a simplified order of SQL query processing:

1. **FROM**: Specifies the tables to retrieve data from and joins them.
2. **WHERE**: Filters the rows based on conditions.
3. **GROUP BY**: Groups rows that have the same values into summary rows.
4. **HAVING**: Filters groups based on conditions (similar to WHERE but for groups).
5. **SELECT**: Chooses the columns to be returned in the result.
6. **ORDER BY**: Sorts the result set based on specified columns.
7. **LIMIT / OFFSET**: Limits the number of rows returned and skips a number of rows.

**Examples:**

1. **Example 1: Counting Books by Author**

   ```sql
   SELECT author_lname, COUNT(*) AS books_written
   FROM books
   WHERE released_year >= 2000
   GROUP BY author_lname
   HAVING COUNT(*) > 5
   ORDER BY books_written DESC;
   ```

   - **FROM**: `books`
   - **WHERE**: Filters books released in 2000 or later.
   - **GROUP BY**: Groups by `author_lname`.
   - **HAVING**: Filters groups with more than 5 books.
   - **SELECT**: Chooses `author_lname` and the count of books.
   - **ORDER BY**: Sorts authors by the number of books in descending order.

2. **Example 2: Average Pages per Author with Filtering**

   ```sql
   SELECT author_lname, AVG(pages) AS avg_pages
   FROM books
   WHERE stock_quantity > 0
   GROUP BY author_lname
   ORDER BY avg_pages DESC;
   ```

   - **FROM**: `books`
   - **WHERE**: Filters books with a positive stock quantity.
   - **GROUP BY**: Groups by `author_lname`.
   - **SELECT**: Chooses `author_lname` and the average number of pages.
   - **ORDER BY**: Sorts authors by average pages in descending order.

3. **Example 3: Maximum and Minimum Values with Grouping**

   ```sql
   SELECT author_lname, MAX(pages) AS max_pages, MIN(pages) AS min_pages
   FROM books
   GROUP BY author_lname
   ORDER BY author_lname;
   ```

   - **FROM**: `books`
   - **GROUP BY**: Groups by `author_lname`.
   - **SELECT**: Chooses `author_lname`, maximum pages, and minimum pages.
   - **ORDER BY**: Sorts results by `author_lname`.
