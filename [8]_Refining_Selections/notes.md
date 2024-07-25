# Refining Selections

## 116. DISTINCT

- **How To Use `DISTINCT`?**

  The `DISTINCT` keyword is used in SQL to return only distinct (different) values from a column. It eliminates duplicate values.

  **Syntax:**

  ```sql
  SELECT DISTINCT column1, column2, ...
  FROM table_name;
  ```

  **Example:**

  ```sql
  SELECT DISTINCT author_lname
  FROM books;
  ```

  This query retrieves unique author last names from the `books` table.

## 118. ORDER BY

- **How To Use `ORDER BY`?**

  The `ORDER BY` clause is used to sort the result set of a query by one or more columns. By default, the sorting is in ascending order. You can use `DESC` for descending order.

  **Syntax:**

  ```sql
  SELECT column1, column2, ...
  FROM table_name
  ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...;
  ```

  **Example:**

  ```sql
  SELECT title, released_year
  FROM books
  ORDER BY released_year DESC;
  ```

  This query sorts the books by `released_year` in descending order.

## 120. More On ORDER BY

- **Make More Examples About `ORDER BY`**

  **Sorting by Column Name:**

  ```sql
  SELECT title, pages
  FROM books
  ORDER BY pages;
  ```

  **Sorting by Column Number:**

  ```sql
  SELECT title, pages
  FROM books
  ORDER BY 2;  -- Sorts by the second column in the SELECT list
  ```

  **Sorting by Multiple Columns:**

  ```sql
  SELECT title, released_year, stock_quantity
  FROM books
  ORDER BY released_year, stock_quantity DESC;
  ```

  **Additional Sorting Options:**

  - **Descending and Ascending Together:**

    ```sql
    SELECT title, released_year
    FROM books
    ORDER BY released_year DESC, title ASC;
    ```

## 122. LIMIT

- **How To Use `LIMIT`?**

  The `LIMIT` clause is used to specify the number of rows returned by the query. It is often used for pagination.

  **Syntax:**

  ```sql
  SELECT column1, column2, ...
  FROM table_name
  LIMIT number_of_rows;
  ```

  **Example:**

  ```sql
  SELECT title
  FROM books
  LIMIT 3;
  ```

  This query retrieves the first 3 rows from the `books` table.

- **What Does `LIMIT 3, 2` Mean?**

  `LIMIT 3, 2` means to skip the first 3 rows and return the next 2 rows. This is used for pagination purposes.

  **Example:**

  ```sql
  SELECT title
  FROM books
  LIMIT 3, 2;
  ```

  This query skips the first 3 rows and returns the 4th and 5th rows.

## 124. LIKE

- **How To Use `LIKE`?**

  The `LIKE` operator is used in a `WHERE` clause to search for a specified pattern in a column.

  **Syntax:**

  ```sql
  SELECT column1, column2, ...
  FROM table_name
  WHERE column_name LIKE pattern;
  ```

  **Example:**

  ```sql
  SELECT *
  FROM books
  WHERE title LIKE '%story%';
  ```

  This query finds all books where the title contains the word "story".

- **Table with All Wildcards with `LIKE`:**

  | Wildcard | Description                         | Example                                 |
  | -------- | ----------------------------------- | --------------------------------------- |
  | `_`      | Matches any single character        | `LIKE '_at'` finds 'cat', 'bat', etc.   |
  | `%`      | Matches zero or more characters     | `LIKE '%book%'` finds 'storybook', etc. |
  | `$`      | Matches the end of a string (MySQL) | `LIKE '%end$'` finds 'theend'           |

## 126. Escaping Wildcards

- **How To Escape Wildcards?**

  To search for literal wildcards (like `%` or `_`) in a column, you need to escape them. This can be done using a backslash (`\`) or by using specific escape characters provided by the SQL dialect.

  **Syntax:**

  ```sql
  SELECT column1, column2, ...
  FROM table_name
  WHERE column_name LIKE 'pattern' ESCAPE 'escape_character';
  ```

  **Example:**

  ```sql
  SELECT *
  FROM books
  WHERE title LIKE '%\_%' ESCAPE '\';
  ```

  This query finds titles that contain the underscore character `_`.
