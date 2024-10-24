CREATE DATABASE COMPANY
USE COMPANY
CREATE TABLE Actor(
act_id INT PRIMARY KEY,
act_Fname VARCHAR(20),
act_Lname VARCHAR(20),
act_Gender VARCHAR(1)
)
CREATE TABLE Director(
dir_id INT PRIMARY KEY,
dir_Fname VARCHAR(20),
dir_Lname VARCHAR(20)
)
CREATE TABLE Movie_Direction(
dir_id INT,
mov_id INT
)
CREATE TABLE Movie_cast(
act_id INT,
mov_id INT,
rolee VARCHAR(30)
)
CREATE TABLE Movie(
mov_id INT PRIMARY KEY,
mov_title VARCHAR(50),
mov_year INT,
mov_time INT,
mov_lang VARCHAR(50),
mov_dt_rel DATE,
mov_rel_country VARCHAR(5)
)
CREATE TABLE Reviewer(
rev_id INT PRIMARY KEY,
rev_name VARCHAR(30)
)
CREATE TABLE Genres(
gen_id INT PRIMARY KEY,
gen_title VARCHAR(20)
)
CREATE TABLE Movie_Genres(
mov_id INT ,
gen_id INT
)
CREATE TABLE Rating(
mov_id INT,
rev_id INT,
rev_stars INT,
num_o_ratings INT
)
--1.Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
CREATE TABLE Employees(
Id INT,
Name VARCHAR,
Salary decimal
)
--2.Add a new column named "Department" to the "Employees" table with data type varchar(50).
ALTER TABLE Employees
ADD Department varchar(50)

--3.Remove the "Salary" column from the "Employees" table.
ALTER TABLE Employees
DROP COLUMN Salary

--4.Rename the "Department" column in the "Employees" table to "DeptName".
EXEC sp_rename 'Department' ,'DeptName'

--5.Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
CREATE TABLE Projects(
ProjectID INT,
ProjectName VARCHAR
)

--6.Add a primary key constraint to the "Employees" table for the "ID" column.
ALTER TABLE Employees
ADD PRIMARY KEY (ID)

--7.Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").
ALTER TABLE Employees
ADD foreign key (Id) references Projects (ProjectID)
--8.Remove the foreign key relationship between "Employees" and "Projects."
ON DELETE CASCADE

--9.Add a unique constraint to the "Name" column in the "Employees" table.
ALTER TABLE Employees
ADD unique (Name)  

--10.Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
CREATE TABLE Customerss(
CustomerID INT,
FirstName VARCHAR ,
LastName VARCHAR ,
EMAIL VARCHAR ,
Status VARCHAR 
)

--11.Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE Customerss
ADD unique(FirstName ,LastName)

--12.Add a default value of 'Active' for the "Status" column in the "Customers" table,where the default value should be applied when a new record is inserted.
ALTER TABLE Customerss
ADD DEFAULT 'Active' FOR Status

--13.Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
CREATE TABLE Ordeers(
OrderID INT ,
CustomerID INT ,
OrderDate datetime,
--14.Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
TotalAmount decimal CHECK(TotalAmount < 0)
)

--15.Create a schema named "Sales" and move the "Orders" table into this schema.
CREATE SCHEMA SALES
ALTER SCHEMA SALES transfer dbo.Ordeers


--16.Rename the "Orders" table to "SalesOrders."
EXEC sp_rename 'Orders' ,'SalesOrders'