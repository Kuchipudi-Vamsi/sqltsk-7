
-- MySQL HR Database: Views Example

-- Step 1: Create database
CREATE DATABASE IF NOT EXISTS HR_DB;
USE HR_DB;

-- Step 2: Create tables

-- Employees Table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    hire_date DATE
);

-- Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Salaries Table
CREATE TABLE Salaries (
    emp_id INT,
    salary DECIMAL(10,2),
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Step 3: Insert sample data

INSERT INTO Departments VALUES 
(1, 'HR'), 
(2, 'IT'), 
(3, 'Finance');

INSERT INTO Employees VALUES 
(101, 'Alice', 'Brown', 1, '2015-03-12'),
(102, 'Bob', 'Smith', 2, '2018-07-01'),
(103, 'Charlie', 'Johnson', 2, '2020-01-15'),
(104, 'Diana', 'White', 3, '2016-11-23');

INSERT INTO Salaries VALUES
(101, 55000, '2022-01-01', '2022-12-31'),
(102, 72000, '2022-01-01', '2022-12-31'),
(103, 69000, '2022-01-01', '2022-12-31'),
(104, 60000, '2022-01-01', '2022-12-31');

-- Step 4: Create Views

-- 1. View for employee full names and departments
CREATE VIEW EmployeeDirectory AS
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    d.department_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id;

-- 2. View for current salaries above 65000
CREATE VIEW HighEarners AS
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    s.salary
FROM Employees e
JOIN Salaries s ON e.emp_id = s.emp_id
WHERE s.salary > 65000;

-- 3. View combining employee, department, and salary
CREATE VIEW EmployeeSummary AS
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    d.department_name,
    s.salary,
    e.hire_date
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
JOIN Salaries s ON e.emp_id = s.emp_id;

-- Step 5: Sample Queries Using Views

-- View 1 usage
SELECT * FROM EmployeeDirectory;

-- View 2 usage
SELECT * FROM HighEarners;

-- View 3 usage
SELECT * FROM EmployeeSummary WHERE department_name = 'IT';
