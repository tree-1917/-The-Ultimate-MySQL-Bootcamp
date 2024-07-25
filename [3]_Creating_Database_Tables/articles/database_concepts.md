# 📚 Database Concepts Tutorial

### Introduction

In this tutorial, we'll cover the fundamental concepts of databases, which are essential for designing, implementing, and managing database systems effectively.

### 1. 📂 Database

**Definition**: A database is a collection of organized data that can be easily accessed, managed, and updated.

### 2. 📊 Table

**Definition**: A table is a collection of related data entries consisting of columns and rows.

**Example**:

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);
```

### 3. 📑 Column

**Definition**: A column is a set of data values of a particular type, one for each row of the table.

**Example**: In the `employees` table, `id`, `name`, and `age` are columns.

### 4. 🧍 Row

**Definition**: A row, also known as a record or tuple, represents a single, implicitly structured data item in a table.

**Example**:

```sql
INSERT INTO employees (id, name, age) VALUES (1, 'Alice', 30);
```

### 5. 🔑 Primary Key

**Definition**: A primary key is a column, or a set of columns, whose values uniquely identify each row in a table.

**Example**:

```sql
ALTER TABLE employees ADD PRIMARY KEY (id);
```

### 6. 🔗 Foreign Key

**Definition**: A foreign key is a column or a set of columns in one table that uniquely identifies rows in another table, establishing a link between the data in the two tables.

**Example**:

```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
```

### 7. 🔍 Index

**Definition**: An index is a database object that improves the speed of data retrieval operations on a table.

**Example**:

```sql
CREATE INDEX idx_name ON employees(name);
```

### 8. 🗂️ Schema

**Definition**: A schema is the structure that defines the organization of data in a database, including tables, columns, data types, relationships, constraints, and other elements.

**Example**: A database schema includes tables like `employees`, `departments`, etc.

### 9. ❓ Query

**Definition**: A query is a request for data or information from a database table or combination of tables.

**Example**:

```sql
SELECT * FROM employees WHERE age > 25;
```

### 10. 👓 View

**Definition**: A view is a virtual table that provides a way to look at data in one or more tables in a different way without changing the tables themselves.

**Example**:

```sql
CREATE VIEW employee_view AS
SELECT name, age FROM employees;
```

### 11. 🔄 Transaction

**Definition**: A transaction is a sequence of database operations that are treated as a single unit of work.

**Example**:

```sql
START TRANSACTION;
INSERT INTO employees (id, name, age) VALUES (2, 'Bob', 25);
UPDATE employees SET age = 26 WHERE id = 2;
COMMIT;
```

### 12. ✨ Normalization

**Definition**: Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity.

**Example**: Splitting a `users` table into `users` and `addresses` tables.

### 13. 🔄 Denormalization

**Definition**: Denormalization is the process of combining normalized tables to improve read performance.

**Example**: Combining `orders` and `order_details` into a single table for faster read access.

### 14. 🔒 Constraints

**Definition**: Constraints are rules applied to the data in a table to ensure its integrity and validity.

**Types of Constraints**:

- **NOT NULL**: Ensures that a column cannot have a NULL value.
- **UNIQUE**: Ensures that all values in a column are unique.
- **PRIMARY KEY**: Combines NOT NULL and UNIQUE. Uniquely identifies each row in a table.
- **FOREIGN KEY**: Ensures referential integrity for a record in another table.
- **CHECK**: Ensures that all values in a column satisfy a specific condition.

**Example**:

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age > 0)
);
```

### 15. 🏗️ Stored Procedure

**Definition**: A stored procedure is a precompiled collection of one or more SQL statements that can be executed as a single unit.

**Example**:

```sql
CREATE PROCEDURE add_employee(IN name VARCHAR(100), IN age INT)
BEGIN
    INSERT INTO employees (name, age) VALUES (name, age);
END;
```

### 16. ⚡ Trigger

**Definition**: A trigger is a special kind of stored procedure that automatically executes in response to certain events on a particular table or view.

**Example**:

```sql
CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
SET NEW.name = UPPER(NEW.name);
```

### 17. 🗂️ Replication

**Definition**: Replication is the process of copying and maintaining database objects in multiple database systems to improve data availability and reliability.

### 18. 📦 Backup and Recovery

**Definition**: Backup and recovery refer to the processes of copying and restoring database data to protect it against data loss.

---

### Summary

Understanding these fundamental database concepts is crucial for anyone working with databases. They provide the foundation for effectively designing, implementing, and managing database systems.

---
