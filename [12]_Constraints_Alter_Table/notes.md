Here’s an outline and content for the "Constraints Alter Table" topic, as requested:

---

## Outline

- **201. UNIQUE Constraint**
- **203. CHECK Constraints**
- **205. Named Constraints**
- **207. Multiple Column Constraints**
- **209. ALTER TABLE: Adding Columns**
- **211. ALTER TABLE: Dropping Columns**
- **213. ALTER TABLE: Renaming**
- **215. ALTER TABLE: Modifying Columns**
- **217. ALTER TABLE: Constraints**

---

## Content

### 201. UNIQUE Constraint

**What is `UNIQUE` Constraint?**

- The `UNIQUE` constraint ensures that all values in a column or a combination of columns are distinct from each other. It prevents duplicate values from being entered into a column, ensuring data integrity.

**Examples of Using `UNIQUE` Constraint:**

1. **Single Column Unique Constraint:**

   ```sql
   CREATE TABLE Users (
       UserID INT PRIMARY KEY,
       Username VARCHAR(50) UNIQUE
   );
   ```

   Here, the `Username` column will only accept unique values.

2. **Unique Constraint on an Existing Column:**

   ```sql
   ALTER TABLE Users
   ADD CONSTRAINT unique_email UNIQUE (Email);
   ```

   This will ensure that the `Email` column in the `Users` table contains only unique values.

3. **Composite Unique Constraint:**
   ```sql
   CREATE TABLE Orders (
       OrderID INT,
       CustomerID INT,
       OrderDate DATE,
       UNIQUE (CustomerID, OrderDate)
   );
   ```
   This ensures that a customer cannot place more than one order on the same date.

### 203. CHECK Constraints

**What is `CHECK` Constraints?**

- The `CHECK` constraint ensures that the values in a column meet a specific condition or criteria. It enforces domain integrity by restricting the values that can be entered into a column.

**Examples of Using `CHECK` Constraint:**

1. **Single Column Check Constraint:**

   ```sql
   CREATE TABLE Employees (
       EmployeeID INT PRIMARY KEY,
       Age INT CHECK (Age >= 18)
   );
   ```

   This constraint ensures that all employees are at least 18 years old.

2. **Check Constraint with Complex Condition:**

   ```sql
   CREATE TABLE Products (
       ProductID INT PRIMARY KEY,
       Price DECIMAL CHECK (Price > 0)
   );
   ```

   This ensures that all products have a positive price.

3. **Check Constraint on Multiple Columns:**
   ```sql
   CREATE TABLE Contracts (
       ContractID INT PRIMARY KEY,
       StartDate DATE,
       EndDate DATE,
       CHECK (EndDate > StartDate)
   );
   ```
   This ensures that the end date of a contract is always after the start date.

### 205. Named Constraints

**How to `Named` Constraints?**

- Named constraints are user-defined names for constraints, which makes it easier to reference and manage them. When creating or altering constraints, you can specify a custom name.

**Examples of Creating Custom Names for Constraints:**

1. **Named Unique Constraint:**

   ```sql
   CREATE TABLE Students (
       StudentID INT PRIMARY KEY,
       Email VARCHAR(100),
       CONSTRAINT unique_student_email UNIQUE (Email)
   );
   ```

   The unique constraint on the `Email` column is named `unique_student_email`.

2. **Named Check Constraint:**

   ```sql
   CREATE TABLE Orders (
       OrderID INT PRIMARY KEY,
       Quantity INT,
       CONSTRAINT check_quantity_positive CHECK (Quantity > 0)
   );
   ```

   The check constraint on the `Quantity` column is named `check_quantity_positive`.

3. **Named Foreign Key Constraint:**
   ```sql
   CREATE TABLE OrderDetails (
       OrderDetailID INT PRIMARY KEY,
       OrderID INT,
       ProductID INT,
       CONSTRAINT fk_order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
   );
   ```
   The foreign key constraint is named `fk_order`.

### 207. Multiple Column Constraints

**How to Create `Multiple Column Constraints`?**

- Multiple column constraints apply constraints based on a combination of two or more columns. They ensure that the combination of values in these columns meets certain conditions.

**Examples of Using Multiple Column Constraints:**

1. **Composite Unique Constraint:**

   ```sql
   CREATE TABLE EventRegistrations (
       EventID INT,
       ParticipantID INT,
       RegistrationDate DATE,
       UNIQUE (EventID, ParticipantID)
   );
   ```

   This ensures that a participant can register for the same event only once.

2. **Composite Primary Key:**

   ```sql
   CREATE TABLE CourseEnrollments (
       StudentID INT,
       CourseID INT,
       EnrollmentDate DATE,
       PRIMARY KEY (StudentID, CourseID)
   );
   ```

   The combination of `StudentID` and `CourseID` must be unique in this table.

3. **Composite Check Constraint:**
   ```sql
   CREATE TABLE Shipping (
       OrderID INT,
       ShipDate DATE,
       DeliveryDate DATE,
       CHECK (DeliveryDate >= ShipDate)
   );
   ```
   This ensures that the `DeliveryDate` is always after or on the same day as the `ShipDate`.

### 209. ALTER TABLE: Adding Columns

**How to Use `ALTER` to Add Columns?**

- The `ALTER TABLE` statement is used to modify an existing table, including adding new columns. This allows you to expand the table schema as needed.

**Examples of Using `ALTER TABLE` to Add Columns:**

1. **Adding a Single Column:**

   ```sql
   ALTER TABLE Employees
   ADD Department VARCHAR(50);
   ```

   This adds a new `Department` column to the `Employees` table.

2. **Adding Multiple Columns:**

   ```sql
   ALTER TABLE Products
   ADD StockQuantity INT,
   ADD Supplier VARCHAR(100);
   ```

   This adds both `StockQuantity` and `Supplier` columns to the `Products` table.

3. **Adding a Column with a Default Value:**

   ```sql
   ALTER TABLE Orders
   ADD OrderStatus VARCHAR(20) DEFAULT 'Pending';
   ```

   This adds an `OrderStatus` column with a default value of 'Pending'.

### 211. ALTER TABLE: Dropping Columns

**How to Use `ALTER` to Delete Columns?**

- The `ALTER TABLE` statement is used to remove one or more columns from an existing table. This operation will delete the column and all data contained within it.

**Examples of Using `ALTER TABLE` to Delete Columns:**

1. **Dropping a Single Column:**

   ```sql
   ALTER TABLE Employees
   DROP COLUMN MiddleName;
   ```

   This command removes the `MiddleName` column from the `Employees` table.

2. **Dropping Multiple Columns:**

   ```sql
   ALTER TABLE Products
   DROP COLUMN Discount,
   DROP COLUMN ExpiryDate;
   ```

   This command removes both the `Discount` and `ExpiryDate` columns from the `Products` table.

3. **Dropping a Column with a Constraint:**

   ```sql
   ALTER TABLE Orders
   DROP COLUMN ShippingAddress;
   ```

   If the `ShippingAddress` column has constraints, such as a foreign key or check constraint, those constraints need to be removed first.

### 213. ALTER TABLE: Renaming

**How to Use `ALTER` to Rename Tables and Columns?**

- The `ALTER TABLE` statement allows renaming a table or its columns. This operation does not affect the existing data but changes the table or column name.

**Examples of Renaming Using `ALTER TABLE`:**

1. **Renaming a Table:**

   ```sql
   ALTER TABLE OldTableName
   RENAME TO NewTableName;
   ```

   This command changes the name of the table from `OldTableName` to `NewTableName`.

2. **Renaming a Column:**

   ```sql
   ALTER TABLE Employees
   RENAME COLUMN OldColumnName TO NewColumnName;
   ```

   This command changes the column name from `OldColumnName` to `NewColumnName` in the `Employees` table.

3. **Renaming a Table with Existing Constraints:**
   ```sql
   ALTER TABLE Products
   RENAME TO Inventory;
   ```
   This command renames the `Products` table to `Inventory`, preserving existing constraints.

### 215. ALTER TABLE: Modifying Columns

**How to Use `ALTER` to Modify Columns?**

- The `ALTER TABLE` statement is used to change the definition of existing columns in a table. Modifications can include changing data types, setting default values, or adjusting column constraints.

**Examples of Modifying Columns Using `ALTER TABLE`:**

1. **Changing a Column Data Type:**

   ```sql
   ALTER TABLE Employees
   MODIFY COLUMN Salary DECIMAL(15, 2);
   ```

   This command changes the data type of the `Salary` column to `DECIMAL(15, 2)`.

2. **Setting a Default Value:**

   ```sql
   ALTER TABLE Orders
   ALTER COLUMN Status SET DEFAULT 'Pending';
   ```

   This command sets a default value of 'Pending' for the `Status` column.

3. **Changing Column Constraints:**
   ```sql
   ALTER TABLE Products
   MODIFY COLUMN Price DECIMAL(10, 2) NOT NULL;
   ```
   This command modifies the `Price` column to ensure it cannot contain `NULL` values.

### 217. ALTER TABLE: Constraints

**How to Use `ALTER` to Add and Remove Constraints?**

- The `ALTER TABLE` statement is used to add or remove constraints on existing tables. This includes constraints like `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, and `CHECK`.

**Examples of Adding and Removing Constraints Using `ALTER TABLE`:**

1. **Adding a Constraint:**

   ```sql
   ALTER TABLE Customers
   ADD CONSTRAINT chk_age CHECK (Age >= 18);
   ```

   This command adds a check constraint to ensure that the `Age` column has values greater than or equal to 18.

2. **Removing a Constraint:**

   ```sql
   ALTER TABLE Orders
   DROP CONSTRAINT fk_customer;
   ```

   This command removes a foreign key constraint named `fk_customer` from the `Orders` table.

3. **Modifying an Existing Constraint:**
   ```sql
   ALTER TABLE Employees
   DROP CONSTRAINT unique_email,
   ADD CONSTRAINT unique_email_address UNIQUE (Email);
   ```
   This command first drops an existing unique constraint on the `Email` column and then re-adds it with a new name.

---
