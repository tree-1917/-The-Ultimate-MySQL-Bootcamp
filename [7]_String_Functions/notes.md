# String Functions

> Outline :

- [String Functions](#string-functions)
  - [Content](#content)
    - [93. CONCAT](#93-concat)
    - [95. SUBSTRING](#95-substring)
    - [97. Combining String Functions](#97-combining-string-functions)
    - [99. Sidenote: SQL Formatting](#99-sidenote-sql-formatting)
    - [100. REPLACE](#100-replace)
    - [102. REVERSE](#102-reverse)
    - [104. CHAR\_LENGTH](#104-char_length)
    - [106. UPPER \& LOWER](#106-upper--lower)
    - [108. Other String Functions](#108-other-string-functions)

---

## Content

### 93. CONCAT

- **What is `CONCAT`?**

  - `CONCAT` is a function used to concatenate two or more strings into a single string.

- **How to use `CONCAT`?**

  - Syntax: `CONCAT(string1, string2, ...)`
  - Example:

    ```sql
    SELECT CONCAT('Hello', ' ', 'World') AS greeting;
    ```

### 95. SUBSTRING

- **What is `SUBSTRING`?**

  - `SUBSTRING` is a function that extracts a substring from a string, starting at a specified position and with a specified length.

- **How to use `SUBSTRING`?**

  - Syntax: `SUBSTRING(string, start_position, length)`
  - Example:

    ```sql
    SELECT SUBSTRING('Hello World', 1, 5) AS result;
    ```

### 97. Combining String Functions

- **How to combine string functions?**

  - You can combine multiple string functions to manipulate strings in various ways.
  - Example:

    ```sql
    SELECT CONCAT(SUBSTRING('Hello World', 1, 5), '...') AS short_greeting;
    ```

### 99. Sidenote: SQL Formatting

- **How to format SQL?**

  - SQL formatting involves organizing SQL queries for better readability and maintainability.

- **Why need SQL formatting?**
  - Improved readability
  - Easier debugging
  - Consistency across the codebase

### 100. REPLACE

- **How to use `REPLACE`?**

  - `REPLACE` replaces occurrences of a specified substring within a string.
  - Syntax: `REPLACE(string, old_substring, new_substring)`
  - Example:

    ```sql
    SELECT REPLACE('Hello World', 'World', 'SQL') AS result;
    ```

### 102. REVERSE

- **How to use `REVERSE`?**

  - `REVERSE` returns the reverse of a string.
  - Syntax: `REVERSE(string)`
  - Example:

    ```sql
    SELECT REVERSE('Hello') AS result;
    ```

### 104. CHAR_LENGTH

- **How to use `CHAR_LENGTH`?**

  - `CHAR_LENGTH` returns the length of a string in characters.
  - Syntax: `CHAR_LENGTH(string)`
  - Example:

    ```sql
    SELECT CHAR_LENGTH('Hello World') AS length;
    ```

- **What is the difference between `CHAR_LENGTH` and `LENGTH`?**
  - `CHAR_LENGTH` counts the number of characters.
  - `LENGTH` counts the number of bytes.

### 106. UPPER & LOWER

- **How to use `UPPER` and `LOWER`?**

  - `UPPER` converts a string to uppercase.
  - Syntax: `UPPER(string)`
  - Example:

    ```sql
    SELECT UPPER('hello') AS result;
    ```

  - `LOWER` converts a string to lowercase.
  - Syntax: `LOWER(string)`
  - Example:

    ```sql
    SELECT LOWER('HELLO') AS result;
    ```

### 108. Other String Functions

- **Common 10 String Functions with examples:**

  1. `LEFT`: Extracts a substring from the left side of a string.

     ```sql
     SELECT LEFT('Hello', 2) AS result;
     ```

  2. `RIGHT`: Extracts a substring from the right side of a string.

     ```sql
     SELECT RIGHT('Hello', 2) AS result;
     ```

  3. `LTRIM`: Removes leading spaces from a string.

     ```sql
     SELECT LTRIM('  Hello') AS result;
     ```

  4. `RTRIM`: Removes trailing spaces from a string.

     ```sql
     SELECT RTRIM('Hello  ') AS result;
     ```

  5. `TRIM`: Removes leading and trailing spaces from a string.

     ```sql
     SELECT TRIM('  Hello  ') AS result;
     ```

  6. `POSITION`: Returns the position of the first occurrence of a substring.

     ```sql
     SELECT POSITION('World' IN 'Hello World') AS position;
     ```

  7. `INSTR`: Returns the position of the first occurrence of a substring.

     ```sql
     SELECT INSTR('Hello World', 'World') AS position;
     ```

  8. `REPEAT`: Repeats a string a specified number of times.

     ```sql
     SELECT REPEAT('SQL', 3) AS result;
     ```

  9. `SPACE`: Returns a string of spaces.

     ```sql
     SELECT SPACE(5) AS result;
     ```

  10. `FORMAT`: Formats a number as a string.

      ```sql
      SELECT FORMAT(123456.789, 2) AS result;
      ```
