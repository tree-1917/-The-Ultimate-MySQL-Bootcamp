# Inserting Data Tutorial 📥

## Outline

- [x] **36. INSERT: The Basics**

  - 🤔 How to Insert Data into a Table?

- [x] **38. A Quick Preview of SELECT**

  - 🕵️‍♂️ How to Use the SELECT Command?

- [x] **40. Multi-inserts**

  - 🔄 How to Perform Multi-inserts?

- [x] **44. Working With NOT NULL**

  - 🚫 What Does NULL Mean?
  - 🛠️ How to Control NULL Constraints for Each Column?

- [x] **46. Sidenote: Quotes In MySQL**

  - 🖋️ How to Use Quotes in MySQL Queries?
  - 🔄 Differences Between DBMS in Using Quotes?

- [x] **47. Adding DEFAULT Values**

  - 🎯 What Are DEFAULT Values in MySQL?
  - 🛠️ How to Add DEFAULT Values to Columns?
  - 💡 Reasons to Use DEFAULT Values in Database Design?

- [x] **49. Introducing Primary Keys**
  - 🔑 What is a Primary Key?
  - 🌟 Why is a Primary Key Important in Database Tables?

---

### 36. INSERT: The Basics

In SQL, the `INSERT` statement is used to add new records (rows) into a table. Here’s how you can insert data into a table:

```sql
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
```

Replace `table_name` with the name of your table and specify the column names and corresponding values you want to insert.

### 38. A Quick Preview of SELECT

The `SELECT` statement in SQL retrieves data from one or more tables. Here’s a basic example:

```sql
SELECT column1, column2, ...
FROM table_name;
```

You can customize the `SELECT` statement with conditions, sorting, and more to retrieve specific data.

### 40. Multi-inserts

To insert multiple rows in a single `INSERT` statement, you can use the following syntax:

```sql
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...),
       (value1, value2, ...),
       ...;
```

This can improve performance when inserting a large number of rows.

### 44. Working With NOT NULL

In SQL, `NULL` represents a missing or unknown value. To ensure that a column does not accept `NULL` values, specify `NOT NULL` when creating the table:

```sql
CREATE TABLE table_name (
    column1 datatype NOT NULL,
    column2 datatype,
    ...
);
```

### 46. Sidenote: Quotes In MySQL

Quotes in MySQL are used to enclose string literals or identifiers. Use single quotes (`'`) for string literals and backticks (\`) for identifiers (like table or column names) that might contain special characters or are keywords.

### 47. Adding DEFAULT Values

DEFAULT values in MySQL are used to automatically assign a value if none is provided during `INSERT` operations. Here’s how you can define a DEFAULT value when creating a table:

```sql
CREATE TABLE table_name (
    column1 datatype DEFAULT default_value,
    column2 datatype DEFAULT default_value,
    ...
);
```

### 49. Introducing Primary Keys

A Primary Key in SQL uniquely identifies each record in a table. It must contain unique values and cannot contain `NULL`. Here’s how you define a Primary Key:

```sql
CREATE TABLE table_name (
    id INT PRIMARY KEY,
    ...
);
```

---
