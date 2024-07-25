-- Active: 1720861686632@@127.0.0.1@3306@todoApp

-- 16. Creating and Managing Databases --
-- Create a database named pet_shop
create database pet_shop;

-- Drop the database pet_shop
Drop DATABASE pet_shop;

-- Switch to the pet_shop database
use pet_shop;

-- Create a table named my_table with id, name, and age columns
CREATE TABLE my_table (
    id INT PRIMARY KEY, 
    name VARCHAR(50),
    age INT
);

-- 18. Dropping and Recreating Tables --
-- Drop the table my_table
drop table my_table;

-- Create a new table my_table with id, name, and age columns
create table my_table ( 
    id int PRIMARY key , 
    name VARCHAR(50), 
    age int 
);

-- Select all rows from the my_table table
select * from my_table ;

-- Show the current database being used
select database() ;

-- 20. Creating and Using Another Database --
-- Create a database named tea_shop
create database tea_shop;

-- Switch to the tea_shop database
use tea_shop;

-- Show the current database being used (tea_shop)
select database();

-- 22. Creating Tables with Multiple Columns --
-- Create a table named my_table with id, name, breed, and age columns
create table my_table (
    id int primary key, 
    name varchar(50),
    breed varchar(50),
    age int 
);

-- 24. Creating Tables with Specific Columns --
-- Create a table named tweets with id, username, content, and number_of_favorites columns
create table tweets (
    id int PRIMARY key, 
    username varchar(50),
    content varchar(50), 
    number_of_favorites int 
);

-- Show all databases on the MySQL server
show databases;

-- Show all tables in the current database
show tables;

-- 26. Creating Multiple Tables --
-- Create a table named cats with id, name, and age columns
create table cats (
    id int PRIMARY key , 
    name VARCHAR(100) , 
    age int
);

-- Show all tables in the current database (tea_shop)
show tables;

-- Create a table named dogs with id, name, and age columns
create table dogs(
    id int PRIMARY KEY ,
    name  VARCHAR(50), 
    age int 
);

-- Show all tables in the current database (tea_shop)
show tables ;

-- 28. Interacting with Tables and Databases --
-- Show all tables in the current database (tea_shop)
show tables ;

-- Switch to the pet_shop database
use pet_shop;

-- Show all tables in the current database (pet_shop)
show tables;

-- Switch to the tea_shop database
use tea_shop;

-- Show columns from the cats table
show COLUMNs from cats;

-- Describe the structure of the cats table
desc cats;

-- Show all tables in the current database (tea_shop)
show tables;

-- 30. Dropping Tables --
-- Drop the cats table
drop table cats;

-- Drop the dogs table
drop table dogs;

-- Show all tables in the current database (tea_shop)
show tables;

-- Drop the my_table table
drop table my_table;

-- Drop the tweets table
drop table tweets;

-- 32. Creating a New Table --
-- Create a table named partries with id, name, and quantity columns
create  table partries (
    id int primary key , 
    name VARCHAR(50), 
    quantity int 
); 

-- Show all tables in the current database (tea_shop)
show tables;

-- 34. Dropping the Last Table --
-- Drop the partries table
drop table partries;
