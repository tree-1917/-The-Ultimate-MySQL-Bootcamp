-- 36 --
-- Use the `pet_shop` database
use pet_shop;

-- Create a table `cats` with columns `id` (auto-increment primary key), `name`, and `age`
create table cats(
    id int AUTO_INCREMENT PRIMARY key, 
    name VARCHAR(30),
    age VARCHAR(30)
);

-- Insert data into `cats` table
insert into cats (name, age) values 
('a', 3), ('b', 5);

-- Select all records from `cats` table
select * from cats;

-- 38 --
-- Select all records from `cats` table
select * from cats;

-- 40 --
-- Insert additional data into `cats` table
insert into cats (age, name) values 
("oom", 3),
("oom", 3),
("oom", 3);

-- Select first 3 records from `cats` table
select * from cats limit 3;

-- 42 --
-- Create a table `people` with columns `id` (auto-increment primary key), `first_name`, `last_name`, `full_name` (derived column), and `age`
create table people (
    id int PRIMARY key AUTO_INCREMENT, 
    first_name VARCHAR(20),
    last_name VARCHAR(20), 
    full_name VARCHAR(50) as (CONCAT(first_name," ",last_name)),
    age int
);

-- Insert data into `people` table
insert into people (first_name, last_name, age) values 
("hassan", "ali", 3),
("hassan", "ali", 3),
("hassan", "ali", 3);

-- Select all records from `people` table
select * from people;

-- 44 --
-- Show available databases
show databases;

-- Use the `pet_shop` database
use pet_shop;

-- Show tables in the `pet_shop` database
show tables;

-- Select all records from `cats` table
select * from cats;

-- Insert a new record into `cats` table with specified `name`
insert into cats(name) values ("so");

-- Select all records from `cats` table
select * from cats;

-- Insert a new record into `cats` table without specifying any values
insert into cats() values ();

-- Select all records from `cats` table
select * from cats;

-- Select `name` column from `cats` table
select name from cats;

-- Select `id` column from `cats` table
select id from cats;

-- Create a new table `cats2` with columns `id` (auto-increment primary key), `name` (not null), and `age` (not null)
create table cats2(
    id int PRIMARY key AUTO_INCREMENT , 
    name VARCHAR(50) not NULL, 
    age int not NULL
);

-- Select all records from `cats2` table
select * from cats2;

-- Insert data into `cats2` table
insert into cats2(name, age) values 
("a", 23),
("b",12);

-- Select all records from `cats2` table
select * from cats2;

-- 46 --
-- Insert data into `cats2` table, handling quotes in values
insert into cats2(name, age) values 
("a\'2", 23);

-- Select all records from `cats2` table
select * from cats2;

-- Insert data into `cats` table, handling quotes in values
insert into cats(name) values 
("she said 'haha'");

-- Select all records from `cats` table
select * from cats;

-- 47 --
-- Create a table `cat3` with columns `name` (default 'unamed') and `age` (not null)
create table cat3 ( 
    name VARCHAR(100) DEFAULT 'unamed', 
    age int not null
);

-- Insert data into `cat3` table, specifying only `age`
insert into cat3(age) VALUES(2);

-- Select all records from `cat3` table
select * from cat3;

-- Describe structure of `cat3` table
DESC cat3;

-- 49 --
-- Create a table `cat4` with columns `id` (auto-increment primary key), `name`, and `age`
create table cat4( 
    id int PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(50), 
    age int
);

-- Insert data into `cat4` table
insert into cat4(name, age) values 
("a", 3), 
("d", 12);

-- Select all records from `cat4` table
select * from cat4;

-- 51 --
-- Create a table `m_table` with columns `cat_id` (auto-increment primary key), `name` (not null), and `age` (not null)
create table m_table(
    cat_id int AUTO_INCREMENT , 
    name VARCHAR(50) NOT NULL, 
    age int not NULL , 
    PRIMARY KEY (cat_id)
);

-- Insert data into `m_table` table
insert into m_table (name, age) values 
("h",1);

-- Select all records from `m_table` table
select * from m_table;

-- 52 --
-- Create a table `Employees` with columns `id` (auto-increment primary key), `last_name`, `first_name`, `middle_name`, and `age`
CREATE TABLE Employees (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    last_name TEXT NOT NULL, 
    first_name TEXT NOT NULL, 
    middle_name TEXT, 
    age INT NOT NULL
);

-- Create a table `Emploee` (typo?) with columns `id` (auto-increment primary key), `last_name`, `first_name`, `middle_name`, `age`, and `current_status` (default 'employed')
CREATE TABLE Emploee (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    last_name TEXT NOT NULL, 
    first_name TEXT NOT NULL, 
    middle_name TEXT, 
    age INT NOT NULL, 
    current_status VARCHAR(100) DEFAULT "employed" not NULL
);

-- Insert data into `Emploee` table
insert Emploee(last_name,first_name, age) values 
("Ali", "Hassan", 32);

-- Select all records from `Emploee` table
select * from Emploee;
