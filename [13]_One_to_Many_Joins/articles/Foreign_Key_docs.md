# Foreign Keys: A Comprehensive Tutorial

## 1. Introduction to Foreign Keys

A foreign key is a field (or a collection of fields) in one table that uniquely identifies a row in another table. It is used to establish and enforce a link between the data in the two tables, ensuring data integrity and consistency.

### 2. Principles of Foreign Keys

#### 2.1. Referential Integrity

- **Definition**: Referential integrity ensures that a foreign key value in one table corresponds to a valid, existing value in another table.
- **Purpose**: Prevents the creation of orphaned records where a foreign key in a child table points to a non-existent record in the parent table.

#### 2.2. Unique References

- **Primary Key**: The foreign key typically references a primary key in the parent table. Primary keys are unique by definition.
- **Unique Key**: A foreign key can also reference a unique key column in the parent table. Unique keys enforce uniqueness but are not necessarily the primary key.

#### 2.3. Cascading Actions

- **CASCADE**: Automatically updates or deletes rows in the child table when the corresponding row in the parent table is updated or deleted.
- **SET NULL**: Sets the foreign key column to `NULL` in the child table when the corresponding row in the parent table is deleted.
- **SET DEFAULT**: Sets the foreign key column to its default value when the corresponding row in the parent table is deleted.
- **NO ACTION**: Prevents changes in the parent table if there are corresponding rows in the child table.

### 3. Use Cases for Foreign Keys

#### 3.1. Maintaining Data Integrity

- **Example**: In a database of employees and departments, a foreign key ensures that each employee is assigned to a valid department.

#### 3.2. Establishing Relationships

- **Example**: A foreign key relationship between orders and customers shows which customer placed each order.

#### 3.3. Normalizing Data

- **Example**: In a normalized database, foreign keys help to avoid redundancy by splitting data into related tables.

### 4. Creating Foreign Keys: Examples

#### 4.1. Basic Example

**Tables Definition:**

```sql
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
```

**Explanation:**

- `department_id` in the `employees` table is a foreign key that references `department_id` in the `departments` table.
- Ensures each employee is assigned to a valid department.

#### 4.2. Foreign Key with Cascading Actions

**Tables Definition:**

```sql
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE
);
```

**Explanation:**

- If a product is deleted from the `products` table, all related orders in the `orders` table will also be deleted due to the `ON DELETE CASCADE` action.

#### 4.3. Foreign Key with `SET NULL`

**Tables Definition:**

```sql
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(50) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
        ON DELETE SET NULL
);
```

**Explanation:**

- If a category is deleted from the `categories` table, the `category_id` in the `items` table will be set to `NULL` for all related items.

### 5. Principles for Using Foreign Keys

#### 5.1. Ensure Valid Relationships

- **Action**: Always ensure the foreign key columns reference existing unique columns in the parent table.

#### 5.2. Choose Appropriate Cascading Actions

- **Action**: Select cascading actions based on how you want changes in the parent table to affect the child table.

#### 5.3. Normalize Your Database

- **Action**: Use foreign keys to maintain normalization and avoid data redundancy.

#### 5.4. Enforce Data Integrity

- **Action**: Use foreign keys to prevent invalid data entries and maintain referential integrity.

### 6. Summary

Foreign keys are a fundamental concept in relational database design. They ensure that relationships between tables are maintained and that the data remains consistent and valid. By enforcing referential integrity and choosing appropriate cascading actions, you can manage data relationships effectively and maintain the integrity of your database.

---
