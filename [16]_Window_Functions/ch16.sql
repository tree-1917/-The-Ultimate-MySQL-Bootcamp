-- 276 -- 
CREATE TABLE employees (
    emp_no INT AUTO_INCREMENT PRIMARY KEY,
    dep VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO
    employees (dep, salary)
VALUES
    ('HR', 55000.00),
    ('HR', 60000.00),
    ('HR', 52000.00),
    ('HR', 65000.00),
    ('Finance', 70000.00),
    ('Finance', 72000.00),
    ('Finance', 68000.00),
    ('Finance', 75000.00),
    ('IT', 80000.00),
    ('IT', 85000.00),
    ('IT', 78000.00),
    ('IT', 90000.00),
    ('Sales', 65000.00),
    ('Sales', 62000.00),
    ('Sales', 69000.00),
    ('Sales', 67000.00),
    ('HR', 58000.00),
    ('Finance', 74000.00),
    ('IT', 82000.00),
    ('Sales', 66000.00);

select
    *
from
    employees;

select
    dep,
    avg(salary)
from
    employees
group by
    dep;

select
    avg(salary)
from
    employees;

select
    avg(salary) over()
from
    employees;

select
    emp_no,
    dep,
    salary,
    avg(salary) over()
from
    employees;

select
    emp_no,
    dep,
    salary,
    min(salary) over(),
    max(salary) over()
from
    employees;

-- 278 --
select
    emp_no,
    dep,
    salary,
    avg(salary) over(PARTITION BY dep) as dep_avg,
    min(salary) over(PARTITION BY dep) as min_salary,
    max(salary) over(PARTITION BY dep) as max_salary,
    count(*) over(PARTITION BY dep) as emp_in_dep
from
    employees;

INSERT INTO
    employees (dep, salary)
VALUES
    ('HR', 55000.00),
    ('HR', 56000.00),
    ('HR', 57000.00),
    ('HR', 58000.00),
    ('HR', 59000.00),
    ('HR', 60000.00),
    ('HR', 61000.00),
    ('HR', 62000.00),
    ('HR', 63000.00),
    ('HR', 64000.00),
    ('Finance', 70000.00),
    ('Finance', 72000.00),
    ('Finance', 74000.00),
    ('IT', 75000.00),
    ('IT', 76000.00),
    ('IT', 77000.00),
    ('IT', 78000.00),
    ('IT', 79000.00),
    ('IT', 80000.00),
    ('IT', 81000.00),
    ('IT', 82000.00),
    ('IT', 83000.00),
    ('IT', 84000.00),
    ('IT', 85000.00),
    ('IT', 86000.00),
    ('IT', 87000.00),
    ('IT', 88000.00),
    ('IT', 89000.00),
    ('IT', 90000.00),
    ('IT', 91000.00),
    ('IT', 92000.00),
    ('IT', 93000.00),
    ('IT', 94000.00),
    ('IT', 95000.00),
    ('Sales', 66000.00),
    ('Sales', 67000.00),
    ('Sales', 68000.00),
    ('Sales', 69000.00),
    ('Sales', 70000.00),
    ('Sales', 71000.00),
    ('Sales', 72000.00);

-- 280 --
select
    emp_no,
    dep,
    salary,
    SUM(salary) over(
        PARTITION BY dep
        ORDER BY
            salary
    ) as rolling_dep_salary,
    SUM(salary) over(PARTITION BY dep) as dep_salary
from
    employees;

-- 282 --
select
    emp_no,
    dep,
    salary,
    rank() over(
        PARTITION BY dep
        order by
            salary desc
    ) as dep_salary_rank,
    RANK() over(
        order by
            salary desc
    ) as overall_salary_rank
from
    employees
order by
    dep;

-- 283 --
select
    emp_no,
    dep,
    salary,
    ROW_NUMBER() over(
        PARTITION BY dep
        order by
            salary desc
    ) as row_number_salary,
    rank() over(
        PARTITION BY dep
        order by
            salary desc
    ) as dep_salary_rank,
    RANK() over(
        order by
            salary desc
    ) as overall_salary_rank,
    DENSE_RANK() over(
        order by
            salary desc
    ) as overall_rank
from
    employees
order by
    overall_rank;

-- 285 --
select
    emp_no,
    dep,
    salary,
    ntile(4) over(
        PARTITION BY dep
        order by
            salary desc
    ) as dep_salary_quartile,
    ntile(4) over(
        order by
            salary desc
    ) as salary_quartile
from
    employees
order by
    dep,
    dep_salary_quartile;

-- 287 --
select
    emp_no,
    dep,
    salary,
    FIRST_VALUE(emp_no) over(
        PARTITION BY dep
        order by
            salary desc
    ) as highest_paid_dept,
    FIRST_VALUE(emp_no) over(
        order by
            salary desc
    ) as highest_paid_overall
from
    employees
order by
    dep;

-- 289 --
select
    emp_no,
    dep,
    salary,
    lag(salary) over (
        order by
            salary desc
    ) as prev_salary,
    salary - lag(salary, 3) over(
        PARTITION BY dep
        order by
            salary desc
    ) as salary_diff
from
    employees;