# SQL Notes & Queries - README

## Course Overview 📚

This course offers a comprehensive introduction to SQL with a focus on MySQL 8.x. It covers essential topics and advanced techniques to help you master SQL and apply it to real-world problems.

### What You'll Learn 🎓

- **SQL Syntax**: Fundamentals and advanced syntax for effective querying.
- **Data Analysis**: Using aggregate functions to analyze data.
- **Complex Queries**: Implementing complex queries with joins, conditions, and functions.
- **Database Design**: Creating and managing database schemas.
- **Advanced Features**: Working with MySQL 8.x features like window functions and views.

### Course Content 📁

1. **[Introduction: 5 Minutes of SQL](./[1]_Introduction_5_Mins_of_SQL/notes.md)**
2. **[Getting Started: Installation](./[2]_Getting_Started_Installation/notes.md)**
3. **[Creating Database Tables](./[3]_Creating_Database_Tables/notes.md/notes.md)**
4. **[Inserting Data](./[4]_Inserting_Data/notes.md)**
5. **[CRUD Basics](./[5]_Crud_Basics/notes.md)**
6. **[CRUD Challenge](./[6]_Crud_Challenge/notes.md)**
7. **[String Functions](./[7]_String_Functions/notes.md)**
8. **[Refining Selections](./[8]_Refining_Selections/notes.md)**
9. **[Aggregate Functions](./[9]_Aggregate_Functions/notes.md)**
10. **[Revisiting Data Types](./[10]_Revisting_Data_type/notes.md)**
11. **[Comparison & Logical Operators](./[11]_Comparison_Logical_Operators/notes.md)**
12. **[Constraints & Alter Table](./[12]_Constraints_Alter_Table/notes.md)**
13. **[One-to-Many Joins](./[13]_One_to_Many_Joins/notes.md)**
14. **[Many-to-Many](./[14]_Many_to_Many/notes.md)**
15. **[Views, Modes, & More](#views-modes-more)**
16. **[Window Functions](#window-functions)**
17. **[Instagram Database Clone](#instagram-database-clone)**
18. **[Working with Lots of IG Data](#working-with-lots-of-ig-data)**

### SQL Command Preview 🔍

#### Basic SQL Query (Easy) 🟢

**Objective**: Retrieve all records from the `employees` table where the `department` is 'Sales'.

**Query**:

```sql
SELECT *
FROM employees
WHERE department = 'Sales';
```

**Explanation**: This query selects all columns from the `employees` table where the `department` column matches 'Sales'.

#### Intermediate SQL Query (Mid) 🟠

**Objective**: Find the average salary of employees in each department with a salary greater than 50,000.

**Query**:

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE salary > 50000
GROUP BY department;
```

**Explanation**: This query filters the `employees` table to include only those with a salary greater than 50,000, groups the results by `department`, and calculates the average salary for each department.

#### Advanced SQL Query (Hard) 🔴

**Objective**: Retrieve the top 5 employees with the highest salaries and include their department names.

**Query**:

```sql
SELECT e.name, e.salary, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.id
ORDER BY e.salary DESC
LIMIT 5;
```

**Explanation**: This query joins the `employees` and `departments` tables based on `department_id`, orders the results by salary in descending order, and limits the output to the top 5 employees with the highest salaries.

---
