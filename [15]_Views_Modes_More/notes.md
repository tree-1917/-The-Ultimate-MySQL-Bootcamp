# SQL Views

## Table of Contents

- [SQL Views](#sql-views)
  - [Table of Contents](#table-of-contents)
  - [261. Introducing Views](#261-introducing-views)
    - [What is a View? 🤔](#what-is-a-view-)
    - [Why Use Views? 💡](#why-use-views-)
    - [Examples](#examples)
  - [263. Updateable Views](#263-updateable-views)
    - [What is an Updateable View? ✏️](#what-is-an-updateable-view-️)
    - [Examples](#examples-1)
    - [Rules for Updateable Views 📜](#rules-for-updateable-views-)
  - [264. Replacing/Altering Views](#264-replacingaltering-views)
    - [How to Replace/Alter Views 🔧](#how-to-replacealter-views-)
    - [Examples](#examples-2)
  - [266. HAVING Clause](#266-having-clause)
    - [How to Use HAVING 🎯](#how-to-use-having-)
    - [Examples](#examples-3)
  - [268. WITH ROLLUP](#268-with-rollup)
    - [How to Use WITH ROLLUP 📊](#how-to-use-with-rollup-)
    - [Examples](#examples-4)
  - [270. SQL Modes Basics](#270-sql-modes-basics)
    - [What are SQL Modes? 🌐](#what-are-sql-modes-)
    - [Examples of SQL Modes 🛠️](#examples-of-sql-modes-️)
    - [Common SQL Modes Table](#common-sql-modes-table)
  - [272. STRICT\_TRANS\_TABLES](#272-strict_trans_tables)
    - [What is STRICT\_TRANS\_TABLES? 📜](#what-is-strict_trans_tables-)
    - [Examples](#examples-5)

---

## 261. Introducing Views

### What is a View? 🤔

- **Definition**: A view is a virtual table in SQL that displays data from one or more tables based on a query. It does not store data itself but provides a way to simplify complex queries and manage data access.

### Why Use Views? 💡

- **Simplicity**: Simplify complex queries and encapsulate logic.
- **Security**: Restrict access to sensitive data.
- **Consistency**: Provide a consistent view of data across applications.

### Examples

1. **Simple View** 📋

   ```sql
   CREATE VIEW employee_view AS
   SELECT first_name, last_name, department
   FROM employees;
   ```

2. **View with Filtering** 🔍

   ```sql
   CREATE VIEW active_employees AS
   SELECT first_name, last_name
   FROM employees
   WHERE status = 'active';
   ```

3. **View with Aggregation** 📊
   ```sql
   CREATE VIEW department_summary AS
   SELECT department, COUNT(*) AS employee_count
   FROM employees
   GROUP BY department;
   ```

---

## 263. Updateable Views

### What is an Updateable View? ✏️

- **Definition**: An updateable view allows modifications (such as `INSERT`, `UPDATE`, and `DELETE`) to be performed on the view, which then affect the underlying base tables.

### Examples

1. **Basic Update** 🔄

   ```sql
   UPDATE active_employees
   SET status = 'inactive'
   WHERE first_name = 'John';
   ```

2. **Insert into View** ➕

   ```sql
   INSERT INTO employee_view (first_name, last_name, department)
   VALUES ('Jane', 'Doe', 'Marketing');
   ```

3. **Delete from View** 🗑️
   ```sql
   DELETE FROM active_employees
   WHERE last_name = 'Doe';
   ```

### Rules for Updateable Views 📜

- **Direct Mapping**: Must directly map to base tables.
- **Single Base Table**: Typically based on a single base table.
- **No Aggregates**: Cannot use aggregate functions or `DISTINCT`.

---

## 264. Replacing/Altering Views

### How to Replace/Alter Views 🔧

- **Replace View**: Use `CREATE OR REPLACE VIEW` to update the view definition.
- **Alter View**: Modify the structure or query of an existing view.

### Examples

1. **Replace View** 🔄

   ```sql
   CREATE OR REPLACE VIEW employee_summary AS
   SELECT department, AVG(salary) AS avg_salary
   FROM employees
   GROUP BY department;
   ```

2. **Add Columns** ➕

   ```sql
   CREATE OR REPLACE VIEW employee_details AS
   SELECT first_name, last_name, department, email
   FROM employees;
   ```

3. **Modify Query** 🔍
   ```sql
   CREATE OR REPLACE VIEW department_summary AS
   SELECT department, COUNT(*) AS employee_count, AVG(salary) AS avg_salary
   FROM employees
   GROUP BY department;
   ```

---

Feel free to adapt the examples and explanations according to your needs! If you need further details or additional sections, just let me know.

## 266. HAVING Clause

### How to Use HAVING 🎯

- **Definition**: The `HAVING` clause filters the results of a `GROUP BY` query, allowing you to specify conditions on aggregated data.

### Examples

1. **Basic Usage** 🏢

   ```sql
   SELECT department, COUNT(*) AS employee_count
   FROM employees
   GROUP BY department
   HAVING COUNT(*) > 5;
   ```

2. **With Aggregated Function** 📈

   ```sql
   SELECT department, AVG(salary) AS avg_salary
   FROM employees
   GROUP BY department
   HAVING AVG(salary) > 50000;
   ```

3. **Multiple Conditions** ⚖️
   ```sql
   SELECT department, COUNT(*) AS employee_count
   FROM employees
   GROUP BY department
   HAVING COUNT(*) > 10 AND AVG(salary) < 60000;
   ```

---

## 268. WITH ROLLUP

### How to Use WITH ROLLUP 📊

- **Definition**: `WITH ROLLUP` adds summary rows (like totals) to the result set of a `GROUP BY` query.

### Examples

1. **Basic Rollup** 📋

   ```sql
   SELECT department, COUNT(*) AS employee_count
   FROM employees
   GROUP BY department WITH ROLLUP;
   ```

2. **Rollup with Aggregation** 🧮

   ```sql
   SELECT department, AVG(salary) AS avg_salary
   FROM employees
   GROUP BY department WITH ROLLUP;
   ```

3. **Detailed Rollup** 🗂️
   ```sql
   SELECT department, position, COUNT(*) AS employee_count
   FROM employees
   GROUP BY department, position WITH ROLLUP;
   ```

---

## 270. SQL Modes Basics

### What are SQL Modes? 🌐

- **Definition**: SQL modes are settings that control how SQL queries are processed and validated by the database engine. They influence aspects such as error handling, data validation, and compatibility.

### Examples of SQL Modes 🛠️

1. **Strict Mode** 🧐

   ```sql
   SET sql_mode = 'STRICT_TRANS_TABLES';
   ```

2. **NO_ZERO_DATE** 🚫

   ```sql
   SET sql_mode = 'NO_ZERO_DATE';
   ```

3. **ONLY_FULL_GROUP_BY** ✅

   ```sql
   SET sql_mode = 'ONLY_FULL_GROUP_BY';
   ```

4. **ANSI_QUOTES** 🅰️

   ```sql
   SET sql_mode = 'ANSI_QUOTES';
   ```

5. **NO_ENGINE_SUBSTITUTION** ⚙️
   ```sql
   SET sql_mode = 'NO_ENGINE_SUBSTITUTION';
   ```

### Common SQL Modes Table

| SQL Mode                 | Description                                                    |
| ------------------------ | -------------------------------------------------------------- |
| `STRICT_TRANS_TABLES`    | Enforces strict data validation and error handling.            |
| `NO_ZERO_DATE`           | Disallows '0000-00-00' dates.                                  |
| `ONLY_FULL_GROUP_BY`     | Ensures `GROUP BY` columns include all non-aggregated columns. |
| `ANSI_QUOTES`            | Treats double quotes as identifier quotes.                     |
| `NO_ENGINE_SUBSTITUTION` | Prevents automatic substitution of storage engines.            |
| `TRADITIONAL`            | Combines several modes for strict SQL behavior.                |
| `NO_AUTO_VALUE_ON_ZERO`  | Disallows automatic increment for zero values.                 |

---

## 272. STRICT_TRANS_TABLES

### What is STRICT_TRANS_TABLES? 📜

- **Definition**: `STRICT_TRANS_TABLES` is an SQL mode that enforces strict data validation and error handling for transactional tables. It ensures that any data modifications meet specified data type and constraints.

### Examples

1. **Enforcing Data Types** 🔍

   ```sql
   SET sql_mode = 'STRICT_TRANS_TABLES';

   INSERT INTO employees (salary) VALUES ('invalid_value');
   -- This will result in an error if 'invalid_value' is not a valid numeric value.
   ```

2. **Preventing Invalid Dates** 🚫

   ```sql
   SET sql_mode = 'STRICT_TRANS_TABLES';

   INSERT INTO employees (hire_date) VALUES ('0000-00-00');
   -- This will result in an error if '0000-00-00' is not a valid date.
   ```

3. **Rejecting Truncated Data** ⚠️

   ```sql
   SET sql_mode = 'STRICT_TRANS_TABLES';

   INSERT INTO employees (name) VALUES ('This name is way too long for the column');
   -- This will result in an error if the name exceeds the column's maximum length.
   ```

---
