# Many-to-Many Relationships in SQL

## Outline

- [x] **Basics of Many-to-Many Relationships**
- [x] **Examples of Many-to-Many Relationships**
- [x] **Using `CASE` and `IF` Statements**
- [x] **Differences Between `CASE` and `IF` in SQL**

---

## Content

### 244. Many-to-Many Basics

#### What is a `Many-to-Many` Relationship? 🤔

A **Many-to-Many** relationship in SQL describes a scenario where multiple records in one table can be associated with multiple records in another table. This is typically implemented using a junction table that links the two related tables.

**Example**:

- A `students` table and a `courses` table where each student can enroll in multiple courses, and each course can have multiple students.

#### Examples of Many-to-Many Relationships 🔗

1. **Students and Courses**

   **Tables**:

   - `students` (`student_id`, `student_name`)
   - `courses` (`course_id`, `course_name`)
   - `enrollments` (junction table with `student_id` and `course_id`)

   **SQL Schema**:

   ```sql
   CREATE TABLE students (
       student_id INT PRIMARY KEY,
       student_name VARCHAR(100)
   );

   CREATE TABLE courses (
       course_id INT PRIMARY KEY,
       course_name VARCHAR(100)
   );

   CREATE TABLE enrollments (
       student_id INT,
       course_id INT,
       PRIMARY KEY (student_id, course_id),
       FOREIGN KEY (student_id) REFERENCES students(student_id),
       FOREIGN KEY (course_id) REFERENCES courses(course_id)
   );
   ```

   **Description**: Each student can enroll in multiple courses, and each course can have multiple students.

2. **Authors and Books**

   **Tables**:

   - `authors` (`author_id`, `author_name`)
   - `books` (`book_id`, `book_title`)
   - `author_books` (junction table with `author_id` and `book_id`)

   **SQL Schema**:

   ```sql
   CREATE TABLE authors (
       author_id INT PRIMARY KEY,
       author_name VARCHAR(100)
   );

   CREATE TABLE books (
       book_id INT PRIMARY KEY,
       book_title VARCHAR(100)
   );

   CREATE TABLE author_books (
       author_id INT,
       book_id INT,
       PRIMARY KEY (author_id, book_id),
       FOREIGN KEY (author_id) REFERENCES authors(author_id),
       FOREIGN KEY (book_id) REFERENCES books(book_id)
   );
   ```

   **Description**: An author can write multiple books, and a book can be written by multiple authors.

3. **Products and Categories**

   **Tables**:

   - `products` (`product_id`, `product_name`)
   - `categories` (`category_id`, `category_name`)
   - `product_categories` (junction table with `product_id` and `category_id`)

   **SQL Schema**:

   ```sql
   CREATE TABLE products (
       product_id INT PRIMARY KEY,
       product_name VARCHAR(100)
   );

   CREATE TABLE categories (
       category_id INT PRIMARY KEY,
       category_name VARCHAR(100)
   );

   CREATE TABLE product_categories (
       product_id INT,
       category_id INT,
       PRIMARY KEY (product_id, category_id),
       FOREIGN KEY (product_id) REFERENCES products(product_id),
       FOREIGN KEY (category_id) REFERENCES categories(category_id)
   );
   ```

   **Description**: A product can belong to multiple categories, and each category can contain multiple products.

#### How to Use `CASE` and `IF`? 🛠️

**`CASE` Statement**: Used for conditional logic in SQL queries. It returns values based on conditions.

**Syntax**:

```sql
SELECT column1,
       CASE
           WHEN condition1 THEN result1
           WHEN condition2 THEN result2
           ELSE result_default
       END AS alias_name
FROM table_name;
```

**Example**:

```sql
SELECT student_name,
       CASE
           WHEN grade >= 90 THEN 'A'
           WHEN grade >= 80 THEN 'B'
           WHEN grade >= 70 THEN 'C'
           ELSE 'D'
       END AS letter_grade
FROM students;
```

**`IF` Statement**: Primarily used in procedural SQL or certain SQL dialects (e.g., MySQL). It also performs conditional logic but is less common in pure SQL queries.

**Syntax**:

```sql
IF(condition, true_value, false_value);
```

**Example**:

```sql
SELECT student_name,
       IF(grade >= 90, 'A', 'Not A') AS result
FROM students;
```

#### Differences Between `CASE` and `IF` in SQL 📊

1. **Usage Context**:

   - `CASE` is used in standard SQL and can be used in `SELECT`, `UPDATE`, and `WHERE` clauses.
   - `IF` is often used in procedural SQL and some specific SQL dialects like MySQL.

2. **Flexibility**:

   - `CASE` provides more flexibility with multiple conditions and can return different values based on those conditions.
   - `IF` is simpler and typically used for straightforward conditions.

3. **Standard Compliance**:
   - `CASE` is part of the SQL standard and supported by most SQL databases.
   - `IF` may not be supported across all SQL databases and is more specific to certain SQL dialects.
