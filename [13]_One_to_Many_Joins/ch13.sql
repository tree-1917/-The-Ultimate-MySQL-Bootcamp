-- 222 -- 
create database ecm_shop;

use ecm_shop;

CREATE TABLE customers (
    customer_id int AUTO_INCREMENT,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY(customer_id)
);

create table orders(
    order_id int AUTO_INCREMENT,
    order_data DATE,
    amount DOUBLE,
    customer_id int,
    PRIMARY KEY(order_id),
    Foreign Key (customer_id) REFERENCES customers(customer_id)
);

alter table
    orders RENAME COLUMN order_data to order_date;

INSERT INTO
    customers (fname, lname, email)
VALUES
    ('John', 'Doe', 'john.doe@example.com'),
    ('Jane', 'Smith', 'jane.smith@example.com'),
    ('Alice', 'Johnson', 'alice.johnson@example.com'),
    ('Bob', 'Brown', 'bob.brown@example.com'),
    ('Charlie', 'Davis', 'charlie.davis@example.com'),
    ('Diana', 'Miller', 'diana.miller@example.com'),
    ('Edward', 'Wilson', 'edward.wilson@example.com'),
    ('Fiona', 'Moore', 'fiona.moore@example.com'),
    ('George', 'Taylor', 'george.taylor@example.com'),
    (
        'Hannah',
        'Anderson',
        'hannah.anderson@example.com'
    );

insert into
    customers (fname, lname, email)
values
    ('Hassan', 'Ali', 'Hassan.Ali@example.com'),
    ('Mohamed', 'Ali', 'Mohamed.Ali@example.com');

alter table
    orders RENAME COLUMN order_data to order_date;

INSERT INTO
    orders (order_date, amount, customer_id)
VALUES
    ('2024-07-01', 100.00, 1),
    ('2024-07-02', 150.00, 1),
    ('2024-07-03', 200.00, 2),
    ('2024-07-04', 250.00, 2),
    ('2024-07-05', 300.00, 3),
    ('2024-07-06', 350.00, 4),
    ('2024-07-07', 400.00, 5),
    ('2024-07-08', 450.00, 6),
    ('2024-07-09', 500.00, 7),
    ('2024-07-10', 550.00, 8),
    ('2024-07-11', 600.00, 9),
    ('2024-07-12', 650.00, 10),
    ('2024-07-13', 700.00, 1),
    ('2024-07-14', 750.00, 2),
    ('2024-07-15', 800.00, 3),
    ('2024-07-16', 850.00, 4),
    ('2024-07-17', 900.00, 5),
    ('2024-07-18', 950.00, 6),
    ('2024-07-19', 1000.00, 7),
    ('2024-07-20', 1050.00, 8);

select
    *
from
    customers;

select
    *
from
    orders;

select
    *
from
    orders
where
    customer_id = (
        select
            customer_id
        from
            customers
        where
            lname = 'Davis'
    );

-- 225 --
select
    *
from
    customers,
    orders;

select
    fname,
    lname,
    order_date,
    amount
from
    customers
    join orders on customers.customer_id = orders.customer_id;

select
    fname,
    lname,
    order_date,
    amount,
    email
from
    orders
    inner join customers on customers.customer_id = orders.customer_id;

-- 229 --
alter table
    customers rename COLUMN customer_id to id;

select
    *
from
    orders;

select
    fname,
    lname,
    order_date,
    amount
from
    customers
    inner join orders on orders.customer_id = customers.id;

select
    fname,
    lname,
    sum(amount) as total
from
    customers
    inner join orders on orders.customer_id = customers.id
group by
    fname,
    lname
order by
    total desc;

-- 231 --
select
    fname,
    lname,
    order_date,
    amount
from
    customers
    left join orders on customers.id = orders.customer_id;

-- 233 --
select
    fname,
    lname,
    IFNULL(sum(amount), 0)
from
    customers
    left join orders on customers.id = orders.customer_id
group by
    lname,
    fname;

-- 235 --
select
    fname,
    lname,
    sum(amount)
from
    customers
    right join orders on customers.id = orders.customer_id
group by
    fname,
    lname;

-- 237 --
delete from
    customers
where
    lname = "Doe";

desc orders;

desc customers;

create table orders(
    order_id int AUTO_INCREMENT,
    order_data DATE,
    amount DOUBLE,
    customer_id int,
    PRIMARY KEY(order_id),
    Foreign Key (customer_id) REFERENCES customers(customer_id)
);

SELECT
    CONSTRAINT_NAME
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
    TABLE_NAME = 'orders'
    AND COLUMN_NAME = 'customer_id'
    AND CONSTRAINT_SCHEMA = DATABASE();

alter table
    orders drop FOREIGN key orders_ibfk_1;

alter table
    orders
add
    CONSTRAINT fk_customer FOREIGN key (customer_id) REFERENCES customers(id) on delete CASCADE;

SELECT
    CONSTRAINT_NAME,
    DELETE_RULE
FROM
    INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
WHERE
    CONSTRAINT_SCHEMA = DATABASE() -- current database
    AND TABLE_NAME = 'orders';

-- table with the foreign key
select
    CONSTRAINT_NAME,
    DELETE_RULE
from
    information_schema.REFERENTIAL_CONSTRAINTS
where
    CONSTRAINT_SCHEMA = DATABASE()
    and TABLE_NAME = 'orders';

select
    fname,
    lname
from
    customers;

delete from
    customers
where
    fname = "Jane";

select
    fname,
    lname,
    email,
    order_date,
    amount
from
    customers
    join orders on customers.id = orders.customer_id;

-- Ex -- 
-- Active: 1720861686632@@127.0.0.1@3306
-- create shcool database
create database school;

use school;

-- create schema into school
create table stds(
    id int AUTO_INCREMENT PRIMARY key,
    f_name VARCHAR(50) not null
);

create table papers(
    title VARCHAR(100) not NULL,
    grade double,
    std_id int not null,
    Foreign Key (std_id) REFERENCES stds(id)
);

INSERT INTO
    stds (f_name)
VALUES
    ('Alice');

INSERT INTO
    stds (f_name)
VALUES
    ('Bob');

INSERT INTO
    stds (f_name)
VALUES
    ('Charlie');

INSERT INTO
    stds (f_name)
VALUES
    ('David');

INSERT INTO
    stds (f_name)
VALUES
    ('Eve');

INSERT INTO
    stds (f_name)
VALUES
    ('Frank');

INSERT INTO
    stds (f_name)
VALUES
    ('Grace');

INSERT INTO
    stds (f_name)
VALUES
    ('Hannah');

INSERT INTO
    stds (f_name)
VALUES
    ('Ivy');

INSERT INTO
    stds (f_name)
VALUES
    ('Jack');

-- Insert papers for Student 1 (ID 1)
INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('Math Exam', 85, 1);

-- Insert papers for Student 2 (ID 2)
INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('Science Exam', 90, 2);

INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('History Exam', 88, 2);

-- Insert papers for Student 3 (ID 3)
INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('English Exam', 75, 3);

INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('Geography Exam', 80, 3);

INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('Biology Exam', 85, 3);

-- Insert papers for Student 4 (ID 4)
INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('Chemistry Exam', 82, 4);

-- Insert papers for Student 5 (ID 5)
INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('Physics Exam', 78, 5);

INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('Math Homework', 92, 5);

-- Insert papers for Student 6 (ID 6)
INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('Art Project', 88, 6);

INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('Music Exam', 85, 6);

INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('Physical Education', 90, 6);

-- Insert papers for Student 7 (ID 7)
INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('Literature Essay', 77, 7);

-- Insert papers for Student 8 (ID 8)
INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('Computer Science Test', 89, 8);

INSERT INTO
    papers (title, grade, std_id)
VALUES
    ('Statistics Quiz', 91, 8);

-- Students 9 and 10 (IDs 9 and 10) will not have any papers
select
    *
from
    stds;

select
    *
from
    papers;

select
    f_name,
    title,
    grade
from
    stds
    join papers on papers.std_id = stds.id;

select
    f_name,
    IFNULL(title, 'Missing'),
    IFNULL(grade, 0)
from
    stds
    left join papers on papers.std_id = stds.id;

select
    f_name,
    (IFNULL(AVG(grade), 0)) as ave,
    case
        when (IFNULL(AVG(grade), 0)) > 87 then 'Passing'
        else 'Faling'
    end as passing_status
from
    stds
    left join papers on papers.std_id = stds.id
group by
    f_name;