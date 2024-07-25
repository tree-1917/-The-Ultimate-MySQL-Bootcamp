# SQL Comparison Logical Operators Tutorial

## Table of Contents

- [SQL Comparison Logical Operators Tutorial](#sql-comparison-logical-operators-tutorial)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [177. Not Equal (`NOT`)](#177-not-equal-not)
    - [What is `NOT`?](#what-is-not)
    - [Examples Using `NOT`:](#examples-using-not)
  - [179. Not Like (`NOT LIKE`)](#179-not-like-not-like)
    - [What is `NOT LIKE`?](#what-is-not-like)
    - [Examples Using `NOT LIKE`:](#examples-using-not-like)
  - [181. Greater Than, Less Than, and Equal To](#181-greater-than-less-than-and-equal-to)
    - [What are Greater Than, Less Than, and Equal To?](#what-are-greater-than-less-than-and-equal-to)
    - [Examples](#examples)
  - [185. Logical AND (`AND`)](#185-logical-and-and)
    - [What is `Logical AND`?](#what-is-logical-and)
    - [Examples Using `Logical AND`:](#examples-using-logical-and)
  - [187. Logical OR (`OR`)](#187-logical-or-or)
    - [What is `Logical OR`?](#what-is-logical-or)
    - [Examples Using `Logical OR`:](#examples-using-logical-or)
  - [189. Between (`BETWEEN`)](#189-between-between)
    - [What is `BETWEEN`?](#what-is-between)
    - [Examples Using `BETWEEN`:](#examples-using-between)
  - [193. The IN Operator (`IN`)](#193-the-in-operator-in)
    - [What is `IN`?](#what-is-in)
    - [Examples Using `IN`:](#examples-using-in)

---

## Introduction

In SQL, comparison logical operators are used to filter records based on specific conditions. Understanding these operators is essential for querying databases effectively. This tutorial will guide you through the common logical operators used in SQL queries, providing explanations and examples for each.

---

## 177. Not Equal (`NOT`)

### What is `NOT`?

- The `NOT` operator negates a condition, meaning it filters out records that do not meet the specified condition. It inverts the result of the condition it is applied to.

### Examples Using `NOT`:

1. **Find all books where the author's last name is not 'Smith':**

   ```sql
   SELECT title
   FROM books
   WHERE author_lname NOT = 'Smith';
   ```

2. **Find all employees who are not in department 'Sales':**

   ```sql
   SELECT name
   FROM employees
   WHERE department NOT = 'Sales';
   ```

---

## 179. Not Like (`NOT LIKE`)

### What is `NOT LIKE`?

- The `NOT LIKE` operator filters records where a column value does not match a specified pattern. It uses wildcard characters to specify patterns.

### Examples Using `NOT LIKE`:

1. **Find all books where the title does not contain 'Mystery':**

   ```sql
   SELECT title
   FROM books
   WHERE title NOT LIKE '%Mystery%';
   ```

2. **Find all employees whose email does not end with 'example.com':**

   ```sql
   SELECT name
   FROM employees
   WHERE email NOT LIKE '%@example.com';
   ```

---

## 181. Greater Than, Less Than, and Equal To

### What are Greater Than, Less Than, and Equal To?

- **Greater Than (`>`)**: Returns true if the left operand is greater than the right operand.
- **Less Than (`<`)**: Returns true if the left operand is less than the right operand.
- **Equal To (`=`)**: Returns true if the left operand is equal to the right operand.

### Examples

1. **Find all books published after 2000 (Greater Than):**

   ```sql
   SELECT title
   FROM books
   WHERE released_year > 2000;
   ```

2. **Find all books published before 2010 (Less Than):**

   ```sql
   SELECT title
   FROM books
   WHERE released_year < 2010;
   ```

3. **Find all books with exactly 300 pages (Equal To):**

   ```sql
   SELECT title
   FROM books
   WHERE pages = 300;
   ```

---

## 185. Logical AND (`AND`)

### What is `Logical AND`?

- The `AND` operator combines multiple conditions in a query. All conditions connected by `AND` must be true for a record to be included in the results.

### Examples Using `Logical AND`:

1. **Find all books published after 2000 and with more than 300 pages:**

   ```sql
   SELECT title
   FROM books
   WHERE released_year > 2000
   AND pages > 300;
   ```

2. **Find all employees in the 'IT' department who have more than 5 years of experience:**

   ```sql
   SELECT name
   FROM employees
   WHERE department = 'IT'
   AND experience > 5;
   ```

---

## 187. Logical OR (`OR`)

### What is `Logical OR`?

- The `OR` operator combines multiple conditions in a query. At least one of the conditions connected by `OR` must be true for a record to be included in the results.

### Examples Using `Logical OR`:

1. **Find all books published before 1980 or after 2010:**

   ```sql
   SELECT title
   FROM books
   WHERE released_year < 1980
   OR released_year > 2010;
   ```

2. **Find all employees who work in the 'Sales' or 'Marketing' department:**

   ```sql
   SELECT name
   FROM employees
   WHERE department = 'Sales'
   OR department = 'Marketing';
   ```

---

## 189. Between (`BETWEEN`)

### What is `BETWEEN`?

- The `BETWEEN` operator filters records within a specified range. It is inclusive of the boundary values.

### Examples Using `BETWEEN`:

1. **Find all books released between 2000 and 2010:**

   ```sql
   SELECT title
   FROM books
   WHERE released_year BETWEEN 2000 AND 2010;
   ```

2. **Find all employees who have worked between 2 and 5 years:**

   ```sql
   SELECT name
   FROM employees
   WHERE experience BETWEEN 2 AND 5;
   ```

---

## 193. The IN Operator (`IN`)

### What is `IN`?

- The `IN` operator checks if a value matches any value in a specified list. It simplifies queries where you need to check for multiple possible values.

### Examples Using `IN`:

1. **Find all books written by authors 'Eggers' or 'Chabon':**

   ```sql
   SELECT title
   FROM books
   WHERE author_lname IN ('Eggers', 'Chabon');
   ```

2. **Find all employees with job titles 'Manager', 'Developer', or 'Analyst':**

   ```sql
   SELECT name
   FROM employees
   WHERE job_title IN ('Manager', 'Developer', 'Analyst');
   ```

---
