# CRUD Basics 🐍📊

> Outline:

- [CRUD Basics 🐍📊](#crud-basics-)
  - [Content](#content)
    - [56. Introducing CRUD 🛠️](#56-introducing-crud-️)
    - [57. Getting Our New "Dataset" 🐾](#57-getting-our-new-dataset-)
    - [59. Officially Introducing SELECT 📋](#59-officially-introducing-select-)
    - [61. The WHERE Clause 🔍](#61-the-where-clause-)
    - [66. Aliases 🏷️](#66-aliases-️)
    - [67. Using UPDATE 🔄](#67-using-update-)
    - [70. A Quick Rule Of Thumb 📝](#70-a-quick-rule-of-thumb-)

---

## Content

### 56. Introducing CRUD 🛠️

**What is `CRUD`?**

CRUD stands for **C**reate, **R**ead, **U**pdate, and **D**elete. These are the four basic operations for interacting with a database. They allow you to perform the following:

- **Create**: Add new records to the database.
- **Read**: Retrieve data from the database.
- **Update**: Modify existing records.
- **Delete**: Remove records from the database.

### 57. Getting Our New "Dataset" 🐾

> **Example Database: Pet Shop**

Let's create a simple SQLite database for a pet shop and add 7 animals.

```python
import sqlite3
from contextlib import closing

# Create a database connection
conn = sqlite3.connect('pet_shop.db')

# Create table
with closing(conn.cursor()) as cursor:
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS animals (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        species TEXT NOT NULL,
        age INTEGER,
        price REAL
    );
    """)
    conn.commit()

# Insert animals
animals = [
    ('Bella', 'Dog', 3, 300.00),
    ('Charlie', 'Cat', 2, 150.00),
    ('Max', 'Parrot', 1, 200.00),
    ('Lucy', 'Rabbit', 4, 100.00),
    ('Daisy', 'Hamster', 1, 50.00),
    ('Lola', 'Dog', 5, 250.00),
    ('Molly', 'Cat', 3, 175.00)
]

with closing(conn.cursor()) as cursor:
    cursor.executemany("""
    INSERT INTO animals (name, species, age, price) VALUES (?, ?, ?, ?);
    """, animals)
    conn.commit()

# Fetch and display animals
with closing(conn.cursor()) as cursor:
    cursor.execute("SELECT * FROM animals;")
    rows = cursor.fetchall()
    for row in rows:
        print(row)

conn.close()
```

### 59. Officially Introducing SELECT 📋

> **How to Read Data from Tables**

The `SELECT` statement is used to retrieve data from a database.

1. **Select All Columns**

```sql
SELECT * FROM animals;
```

2. **Select Specific Columns**

```sql
SELECT name, species FROM animals;
```

3. **Select with Conditions**

```sql
SELECT * FROM animals WHERE species = 'Dog';
```

4. **Select with Ordering**

```sql
SELECT * FROM animals ORDER BY price DESC;
```

5. **Select with Limit**

```sql
SELECT * FROM animals LIMIT 3;
```

### 61. The WHERE Clause 🔍

**How to Use `WHERE`**

The `WHERE` clause is used to filter records.

1. **Basic Usage**

```sql
SELECT * FROM animals WHERE age > 2;
```

2. **Using Multiple Conditions**

```sql
SELECT * FROM animals WHERE species = 'Cat' AND age < 4;
```

3. **Using `OR`**

```sql
SELECT * FROM animals WHERE species = 'Dog' OR price < 100;
```

4. **Using `IN`**

```sql
SELECT * FROM animals WHERE species IN ('Cat', 'Rabbit');
```

5. **Using `LIKE` for Pattern Matching**

```sql
SELECT * FROM animals WHERE name LIKE 'M%';
```

### 66. Aliases 🏷️

**What are Aliases?**

Aliases are used to give a table or a column a temporary name.

**How to Use Aliases**

- **Column Alias**

```sql
SELECT name AS pet_name, price AS pet_price FROM animals;
```

- **Table Alias**

```sql
SELECT a.name, a.species FROM animals AS a;
```

**Why Use Aliases?**

Aliases make queries easier to read and write, especially when dealing with complex queries or multiple tables.

### 67. Using UPDATE 🔄

**What is `UPDATE`?**

The `UPDATE` statement is used to modify existing records in a table.

**How to `UPDATE`**

- **Basic Usage**

```sql
UPDATE animals SET price = 350.00 WHERE name = 'Bella';
```

- **Updating Multiple Columns**

```sql
UPDATE animals SET age = 4, price = 280.00 WHERE name = 'Molly';
```

**Example to Update Data**

```python
with closing(conn.cursor()) as cursor:
    cursor.execute("""
    UPDATE animals SET price = 350.00 WHERE name = 'Bella';
    """)
    conn.commit()
```

### 70. A Quick Rule Of Thumb 📝

**A Good Rule of Thumb: Try Selecting Before You Update**

Before updating records, it's a good practice to perform a `SELECT` query to ensure you are updating the correct records. This helps prevent unintended changes and data loss.

```sql
-- Select to verify records
SELECT * FROM animals WHERE name = 'Bella';

-- Then update
UPDATE animals SET price = 350.00 WHERE name = 'Bella';
```

By following this structure, you can ensure that your CRUD operations are performed accurately and efficiently.
