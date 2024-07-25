# 📚 Revisiting Data Types

## Table of Contents

- [📚 Revisiting Data Types](#-revisiting-data-types)
  - [Table of Contents](#table-of-contents)
  - [📊 Data Types Overview](#-data-types-overview)
  - [🆚 CHAR vs. VARCHAR](#-char-vs-varchar)
    - [Difference Between `CHAR` and `VARCHAR`](#difference-between-char-and-varchar)
  - [🔢 Numeric Types: INT, TINYINT, BIGINT](#-numeric-types-int-tinyint-bigint)
    - [Overview of Numerical Data Types](#overview-of-numerical-data-types)
  - [💰 DECIMAL Data Type](#-decimal-data-type)
    - [What is `DECIMAL`?](#what-is-decimal)
  - [🔢 FLOAT \& DOUBLE](#-float--double)
    - [What are `FLOAT` and `DOUBLE`?](#what-are-float-and-double)
  - [📅 DATE \& TIME](#-date--time)
    - [What are `DATE` and `TIME`?](#what-are-date-and-time)
  - [🕒 CURDATE, CURTIME, \& NOW](#-curdate-curtime--now)
    - [What are `CURDATE`, `CURTIME`, and `NOW`?](#what-are-curdate-curtime-and-now)
  - [📅 Date Functions](#-date-functions)
    - [Common Date Functions](#common-date-functions)
  - [⏰ Time Functions](#-time-functions)
    - [Common Time Functions](#common-time-functions)
  - [📅 Formatting Dates](#-formatting-dates)
    - [Common Date Formatting](#common-date-formatting)
  - [🔢 Date Math](#-date-math)
    - [Common Date Math Functions](#common-date-math-functions)
  - [⏱️ TIMESTAMPS](#️-timestamps)
    - [What are `TIMESTAMPS`?](#what-are-timestamps)
  - [🔄 DEFAULT \& ON UPDATE TIMESTAMPS](#-default--on-update-timestamps)
    - [DEFAULT \& ON UPDATE TIMESTAMPS](#default--on-update-timestamps)
    - [📝 Using `CHAR` Data Type in SQL](#-using-char-data-type-in-sql)
      - [🎯 Fixed-Length Identifiers](#-fixed-length-identifiers)
      - [🌍 Fixed-Length Country Codes](#-fixed-length-country-codes)
      - [🏷️ Fixed-Length Abbreviations](#️-fixed-length-abbreviations)
      - [📞 Uniform Data Formatting](#-uniform-data-formatting)
      - [🕰️ Legacy Systems Compatibility](#️-legacy-systems-compatibility)
    - [🕰️ Understanding `DATETIME` vs. `TIMESTAMP` in SQL](#️-understanding-datetime-vs-timestamp-in-sql)
      - [📅 `DATETIME`](#-datetime)
        - [Overview](#overview)
        - [Use Case](#use-case)
        - [Example](#example)
      - [⏲️ `TIMESTAMP`](#️-timestamp)
        - [OvervieW](#overview-1)
        - [Use CASE](#use-case-1)
        - [Examples](#examples)
      - [📊 Key Differences](#-key-differences)
        - [🎯 Choosing the Right Type](#-choosing-the-right-type)

---

## 📊 Data Types Overview

In SQL, data types define what kind of data can be stored in a column. Here’s a quick look at some common data types:

| **Data Type**  | **Description**                              | **Examples**     |
| -------------- | -------------------------------------------- | ---------------- |
| `CHAR(n)`      | Fixed-length string.                         | `CHAR(10)`       |
| `VARCHAR(n)`   | Variable-length string.                      | `VARCHAR(255)`   |
| `INT`          | Integer.                                     | `INT`, `INTEGER` |
| `TINYINT`      | Very small integer.                          | `TINYINT`        |
| `SMALLINT`     | Small integer.                               | `SMALLINT`       |
| `MEDIUMINT`    | Medium integer.                              | `MEDIUMINT`      |
| `BIGINT`       | Large integer.                               | `BIGINT`         |
| `DECIMAL(p,s)` | Fixed-point number with precision and scale. | `DECIMAL(5,2)`   |
| `FLOAT`        | Floating-point number.                       | `FLOAT`          |
| `DOUBLE`       | Double-precision floating-point number.      | `DOUBLE`         |
| `DATE`         | Date value.                                  | `DATE`           |
| `TIME`         | Time value.                                  | `TIME`           |
| `DATETIME`     | Date and time value.                         | `DATETIME`       |
| `TIMESTAMP`    | Date and time value, with automatic update.  | `TIMESTAMP`      |

---

## 🆚 CHAR vs. VARCHAR

### Difference Between `CHAR` and `VARCHAR`

- **`CHAR`**:

  - Fixed-length storage.
  - Space-padded if the value is shorter than the defined length.
  - Suitable for fixed-length data.

- **`VARCHAR`**:
  - Variable-length storage.
  - Uses only the necessary space.
  - More flexible for varying lengths.

**Example:**

```sql
CREATE TABLE example (
    fixed CHAR(10),
    variable VARCHAR(10)
);
```

---

## 🔢 Numeric Types: INT, TINYINT, BIGINT

### Overview of Numerical Data Types

| **Data Type** | **Description**    | **Range**                                               |
| ------------- | ------------------ | ------------------------------------------------------- |
| `INT`         | Integer            | -2,147,483,648 to 2,147,483,647                         |
| `TINYINT`     | Very small integer | 0 to 255 (unsigned) or -128 to 127                      |
| `SMALLINT`    | Small integer      | -32,768 to 32,767                                       |
| `MEDIUMINT`   | Medium integer     | -8,388,608 to 8,388,607                                 |
| `BIGINT`      | Large integer      | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 |

**Example:**

```sql
CREATE TABLE numbers (
    small_num TINYINT,
    medium_num MEDIUMINT,
    large_num BIGINT
);

INSERT INTO numbers (large_num) VALUES (9223372036854775807);
```

---

## 💰 DECIMAL Data Type

### What is `DECIMAL`?

- `DECIMAL` is a fixed-point number that stores exact numeric values with a specified precision and scale.

**Why is `DECIMAL` Costly?**

- Requires more storage and computation resources due to its precision.

**Example:**

```sql
CREATE TABLE prices (
    price DECIMAL(10, 2)
);

INSERT INTO prices (price) VALUES (12345.67);
```

---

## 🔢 FLOAT & DOUBLE

### What are `FLOAT` and `DOUBLE`?

- **`FLOAT`**: Single-precision floating-point number.
- **`DOUBLE`**: Double-precision floating-point number.

**Differences:**

- `DECIMAL`: Exact precision.
- `FLOAT`: Approximate precision, less storage.
- `DOUBLE`: More precision than `FLOAT`, but still approximate.

**Example:**

```sql
CREATE TABLE measurements (
    single_precision FLOAT,
    double_precision DOUBLE
);

INSERT INTO measurements (single_precision, double_precision) VALUES (3.14159, 3.14159265358979);
```

---

## 📅 DATE & TIME

### What are `DATE` and `TIME`?

- **`DATE`**: Stores date values (YYYY-MM-DD).
- **`TIME`**: Stores time values (HH:MM:SS).

**Formats:**

- `DATE`: `YYYY-MM-DD`
- `TIME`: `HH:MM:SS`
- `DATETIME`: `YYYY-MM-DD HH:MM:SS`

**Example:**

```sql
CREATE TABLE events (
    event_date DATE,
    event_time TIME,
    event_datetime DATETIME
);

INSERT INTO events (event_date, event_time, event_datetime)
VALUES ('2024-07-22', '15:30:00', '2024-07-22 15:30:00');
```

---

## 🕒 CURDATE, CURTIME, & NOW

### What are `CURDATE`, `CURTIME`, and `NOW`?

- **`CURDATE()`**: Current date.
- **`CURTIME()`**: Current time.
- **`NOW()`**: Current date and time.

**Examples:**

```sql
SELECT CURDATE();    -- Current date
SELECT CURTIME();    -- Current time
SELECT NOW();        -- Current date and time
```

---

## 📅 Date Functions

### Common Date Functions

| **Function**             | **Description**                      | **Example**                            |
| ------------------------ | ------------------------------------ | -------------------------------------- |
| `YEAR(date)`             | Extract year                         | `YEAR('2024-07-22')`                   |
| `MONTH(date)`            | Extract month                        | `MONTH('2024-07-22')`                  |
| `DAY(date)`              | Extract day                          | `DAY('2024-07-22')`                    |
| `WEEK(date)`             | Week number of the year              | `WEEK('2024-07-22')`                   |
| `DAYOFWEEK(date)`        | Day of the week (1=Sunday)           | `DAYOFWEEK('2024-07-22')`              |
| `MONTHNAME(date)`        | Full name of the month               | `MONTHNAME('2024-07-22')`              |
| `DAYOFYEAR(date)`        | Day number of the year               | `DAYOFYEAR('2024-07-22')`              |
| `QUARTER(date)`          | Quarter of the year                  | `QUARTER('2024-07-22')`                |
| `DATEDIFF(date1, date2)` | Difference in days between two dates | `DATEDIFF('2024-07-22', '2024-01-01')` |

---

## ⏰ Time Functions

### Common Time Functions

| **Function**                         | **Description**                       | **Example**                                |
| ------------------------------------ | ------------------------------------- | ------------------------------------------ |
| `HOUR(time)`                         | Extract hour                          | `HOUR('15:30:00')`                         |
| `MINUTE(time)`                       | Extract minute                        | `MINUTE('15:30:00')`                       |
| `SECOND(time)`                       | Extract second                        | `SECOND('15:30:00')`                       |
| `TIMEDIFF(time1, time2)`             | Difference in time between two values | `TIMEDIFF('15:30:00', '14:00:00')`         |
| `ADDDATE(date, INTERVAL expr unit)`  | Add interval to date                  | `ADDDATE('2024-07-22', INTERVAL 5 DAY)`    |
| `SUBDATE(date, INTERVAL expr unit)`  | Subtract interval from date           | `SUBDATE('2024-07-22', INTERVAL 5 DAY)`    |
| `DATE_ADD(date, INTERVAL expr unit)` | Add interval to date                  | `DATE_ADD('2024-07-22', INTERVAL 1 MONTH)` |
| `DATE_SUB(date, INTERVAL expr unit)` | Subtract interval from date           | `DATE_SUB('2024-07-22                      |

', INTERVAL 1 MONTH)` |

---

## 📅 Formatting Dates

### Common Date Formatting

| **Format** | **Description**          | **Example**                                |
| ---------- | ------------------------ | ------------------------------------------ |
| `%Y`       | Year (4 digits)          | `DATE_FORMAT('2024-07-22', '%Y')`          |
| `%m`       | Month (2 digits)         | `DATE_FORMAT('2024-07-22', '%m')`          |
| `%d`       | Day of month (2 digits)  | `DATE_FORMAT('2024-07-22', '%d')`          |
| `%H`       | Hour (24-hour format)    | `DATE_FORMAT('2024-07-22 15:30:00', '%H')` |
| `%i`       | Minutes (2 digits)       | `DATE_FORMAT('2024-07-22 15:30:00', '%i')` |
| `%s`       | Seconds (2 digits)       | `DATE_FORMAT('2024-07-22 15:30:00', '%s')` |
| `%p`       | AM/PM                    | `DATE_FORMAT('2024-07-22 15:30:00', '%p')` |
| `%a`       | Abbreviated weekday name | `DATE_FORMAT('2024-07-22', '%a')`          |
| `%b`       | Abbreviated month name   | `DATE_FORMAT('2024-07-22', '%b')`          |
| `%W`       | Full weekday name        | `DATE_FORMAT('2024-07-22', '%W')`          |
| `%M`       | Full month name          | `DATE_FORMAT('2024-07-22', '%M')`          |
| `%j`       | Day of year (3 digits)   | `DATE_FORMAT('2024-07-22', '%j')`          |
| `%U`       | Week number of year      | `DATE_FORMAT('2024-07-22', '%U')`          |
| `%q`       | Quarter of year          | `DATE_FORMAT('2024-07-22', '%q')`          |
| `%Z`       | Timezone abbreviation    | `DATE_FORMAT('2024-07-22', '%Z')`          |

---

## 🔢 Date Math

### Common Date Math Functions

| **Function**                         | **Description**                      | **Example**                                             |
| ------------------------------------ | ------------------------------------ | ------------------------------------------------------- |
| `DATE_ADD(date, INTERVAL expr unit)` | Adds interval to a date              | `DATE_ADD('2024-07-22', INTERVAL 10 DAY)`               |
| `DATE_SUB(date, INTERVAL expr unit)` | Subtracts interval from a date       | `DATE_SUB('2024-07-22', INTERVAL 10 DAY)`               |
| `TIMESTAMPDIFF(unit, date1, date2)`  | Difference between two dates in unit | `TIMESTAMPDIFF(DAY, '2024-07-22', '2024-07-30')`        |
| `DATEDIFF(date1, date2)`             | Number of days between two dates     | `DATEDIFF('2024-07-30', '2024-07-22')`                  |
| `ADDDATE(date, INTERVAL expr unit)`  | Adds interval to date                | `ADDDATE('2024-07-22', INTERVAL 5 MONTH)`               |
| `SUBDATE(date, INTERVAL expr unit)`  | Subtracts interval from date         | `SUBDATE('2024-07-22', INTERVAL 5 MONTH)`               |
| `CONVERT_TZ(date, from_tz, to_tz)`   | Converts time between time zones     | `CONVERT_TZ('2024-07-22 15:00:00', '+00:00', '+05:00')` |
| `EXTRACT(unit FROM date)`            | Extracts part of a date              | `EXTRACT(YEAR FROM '2024-07-22')`                       |

---

## ⏱️ TIMESTAMPS

### What are `TIMESTAMPS`?

- `TIMESTAMP` represents a point in time, including both date and time. It often includes automatic updating features.

**Difference Between `DATETIME` and `TIMESTAMP`:**

- **`DATETIME`**: Stores date and time without timezone considerations.
- **`TIMESTAMP`**: Stores date and time with timezone support and can auto-update on changes.

**Example:**

```sql
CREATE TABLE logs (
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO logs (log_time) VALUES (NOW());
```

---

## 🔄 DEFAULT & ON UPDATE TIMESTAMPS

### DEFAULT & ON UPDATE TIMESTAMPS

- **`DEFAULT CURRENT_TIMESTAMP`**: Automatically sets the current timestamp when a record is created.
- **`ON UPDATE CURRENT_TIMESTAMP`**: Automatically updates the timestamp when a record is modified.

**Example:**

```sql
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO employees (name) VALUES ('John Doe');
UPDATE employees SET name = 'Jane Doe' WHERE id = 1;
```

### 📝 Using `CHAR` Data Type in SQL

#### 🎯 Fixed-Length Identifiers

Use `CHAR` for fixed-length identifiers such as product codes or employee IDs where each entry has a consistent length.

```sql
CREATE TABLE products (
    product_code CHAR(8) PRIMARY KEY,
    product_name VARCHAR(100)
);
```

#### 🌍 Fixed-Length Country Codes

`CHAR` is ideal for storing fixed-length country codes, such as ISO codes which are always 2 characters long.

```sql
CREATE TABLE countries (
    country_code CHAR(2) PRIMARY KEY,
    country_name VARCHAR(100)
);
```

#### 🏷️ Fixed-Length Abbreviations

Store abbreviations like status codes or state abbreviations using `CHAR` to maintain uniform length.

```sql
CREATE TABLE status (
    status_code CHAR(3) PRIMARY KEY,
    status_description VARCHAR(255)
);
```

#### 📞 Uniform Data Formatting

For data that follows a fixed format, like social security numbers or phone numbers, use `CHAR` to ensure consistent formatting.

```sql
CREATE TABLE people (
    ssn CHAR(11) PRIMARY KEY,
    name VARCHAR(100)
);
```

#### 🕰️ Legacy Systems Compatibility

When working with older systems that expect fixed-length fields, `CHAR` helps ensure compatibility with those legacy formats.

```sql
CREATE TABLE legacy_data (
    legacy_id CHAR(10) PRIMARY KEY,
    legacy_value VARCHAR(255)
);
```

Certainly! Here’s a tutorial explaining the differences between `DATETIME` and `TIMESTAMP` in SQL, with emojis for better engagement:

### 🕰️ Understanding `DATETIME` vs. `TIMESTAMP` in SQL

When working with date and time in SQL, you’ll often encounter two key data types: `DATETIME` and `TIMESTAMP`. Here's a guide to understanding their differences and when to use each.

#### 📅 `DATETIME`

##### Overview

- **Purpose:** Stores both date and time values.
- **Format:** `YYYY-MM-DD HH:MM:SS`
- **Range:** From `1000-01-01 00:00:00` to `9999-12-31 23:59:59`
- **Timezone:** No time zone conversion; stores the value as-is.

##### Use Case

Use `DATETIME` when you need to store a specific date and time without any concern for time zones or when working with a broad range of dates.

##### Example

```sql
-- Create a table to store event details
CREATE TABLE events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATETIME
);

-- Insert a record with a specific date and time
INSERT INTO events (event_id, event_name, event_date)
VALUES (1, 'Conference', '2024-08-15 14:00:00');
```

#### ⏲️ `TIMESTAMP`

##### OvervieW

- **Purpose:** Stores both date and time values with automatic time zone conversion.
- **Format:** `YYYY-MM-DD HH:MM:SS`
- **Range:** Typically from `1970-01-01 00:00:01` to `2038-01-19 03:14:07` (32-bit systems).
- **Timezone:** Converts to the current time zone when retrieved; stored in UTC.

##### Use CASE

Use `TIMESTAMP` when you need to track the time of data creation or modification automatically and require time zone adjustments.

##### Examples

```sql
-- Create a table to log system events with automatic timestamp
CREATE TABLE logs (
    log_id INT PRIMARY KEY,
    log_message VARCHAR(255),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert a record with an automatic timestamp
INSERT INTO logs (log_id, log_message)
VALUES (1, 'System started');
```

#### 📊 Key Differences

| Feature               | `DATETIME`                 | `TIMESTAMP`                                      |
| --------------------- | -------------------------- | ------------------------------------------------ |
| **Date Range**        | 1000-01-01 to 9999-12-31   | 1970-01-01 to 2038-01-19                         |
| **Timezone Handling** | No time zone conversion    | Converts to/from UTC based on session time zone  |
| **Default Value**     | Must be set explicitly     | Defaults to current timestamp if specified       |
| **Use Case**          | Fixed date and time values | Automatic time tracking and time zone conversion |

---

##### 🎯 Choosing the Right Type

- Use **`DATETIME`** for static dates where time zone adjustments are not necessary.
- Use **`TIMESTAMP`** for dynamic time tracking with automatic timezone adjustments.

---
