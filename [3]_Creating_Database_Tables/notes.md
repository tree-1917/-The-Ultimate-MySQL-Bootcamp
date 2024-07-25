# 📊 Creating Databases And Tables

> Outline :

- [x] Showing Databases
- [x] Creating Databases
- [x] Dropping and Using Databases
- [x] Introducing Tables
- [x] Data Types: The Basics
- [x] Creating Tables
- [x] How Do We Know It Worked?
- [x] Dropping Tables
- [x] MySQL Comments

---

## Content

### 16. Showing Databases

- **What does `SHOW DATABASES;` mean?**  
  📋 Displays all databases on the MySQL server.
  ```sql
  SHOW DATABASES;
  ```

### 18. Creating Databases

- **What does `CREATE DATABASE <name>;` mean?**  
  🏗️ Creates a new database with the specified name.

  ```sql
  CREATE DATABASE my_database;
  ```

- **What does `DROP DATABASE <name>;` mean?**  
  ❌ Deletes the specified database.
  ```sql
  DROP DATABASE my_database;
  ```

### 20. Dropping and Using Databases

- **What does `DROP DATABASE <name>;` mean?**  
  ❌ Deletes the specified database.

  ```sql
  DROP DATABASE my_database;
  ```

- **What does `USE <database name>;` mean?**  
  🎯 Selects the specified database for subsequent operations.

  ```sql
  USE my_database;
  ```

- **What does `SELECT DATABASE();` mean?**  
  🔍 Returns the name of the currently selected database.
  ```sql
  SELECT DATABASE();
  ```

### 22. Introducing Tables

- **What does `tables` mean?**  
  📦 Tables are structured data storage units within a database.

- **Why are `tables` the heart of a database?**  
  ❤️ Tables store the actual data and define its structure.

- **What does it mean that a database is just a bunch of `tables`?**  
  🗂️ A database is composed of multiple tables, each holding different data.

- **What are the concepts in a database?**  
  📚 Tables, rows, columns, primary keys, foreign keys, indexes, constraints.

### 23. Data Types: The Basics

- **What are data types in a database?**  
  📋 Data types define the kind of data that can be stored in a column (e.g., INT, VARCHAR).

- **What does consistency of data types mean?**  
  ✅ Ensuring that the data type of each column is consistent with its intended use to maintain data integrity.
  ```sql
  CREATE TABLE users (
      id INT PRIMARY KEY,
      name VARCHAR(50),
      age INT
  );
  ```

### 26. Creating Tables

- **How to create a table?**  
  🏗️ Use the `CREATE TABLE` statement with column definitions.
  ```sql
  CREATE TABLE pets (
      id INT PRIMARY KEY,
      name VARCHAR(50),
      breed VARCHAR(50),
      age INT
  );
  ```

### 28. How Do We Know It Worked?

- **Tutorial: `SHOW TABLES;`, `SHOW COLUMNS FROM cats;`, `DESC cats;`**

  - **`SHOW TABLES;`**: 📋 Lists all tables in the database.

    ```sql
    SHOW TABLES;
    ```

  - **`SHOW COLUMNS FROM cats;`**: 📄 Lists columns in the `cats` table.

    ```sql
    SHOW COLUMNS FROM cats;
    ```

  - **`DESC cats;`**: 🔍 Describes the `cats` table structure.
    ```sql
    DESC cats;
    ```

### 30. Dropping Tables

- **What does `DROP TABLE <tableName>;` mean?**  
  ❌ Deletes the specified table from the database.
  ```sql
  DROP TABLE my_table;
  ```

### 34. MySQL Comments

1. **Single-Line Comments**:

   ```sql
   -- This is a single-line comment
   SELECT * FROM employees;
   ```

2. **Hash Comments**:

   ```sql
   # This is a hash comment
   SELECT * FROM employees;
   ```

3. **Multi-Line Comments**:

   ```sql
   /*
     This is a multi-line comment.
     It can span multiple lines.
   */
   SELECT * FROM employees;
   ```

> Effective Commenting Rules 📝

1. **Be Clear and Concise**:

   ```sql
   -- Select all employees
   SELECT * FROM employees;
   ```

2. **Explain Why, Not What**:

   ```sql
   /* Filtering out inactive employees */
   SELECT * FROM employees WHERE status = 'active';
   ```

3. **Consistent Style**:

   ```sql
   -- Consistent single-line comments
   ```

4. **Update Comments**:

   ```sql
   -- Previously selected all employees, now only active ones
   SELECT * FROM employees WHERE status = 'active';
   ```

5. **Avoid Redundant Comments**:

   ```sql
   -- Good: Explain logic
   SELECT * FROM employees WHERE join_date > '2020-01-01';
   ```
