Creating Views:
🎯 Objective
To help you learn how to create and use SQL views for:

-->Data abstraction
-->Data security
-->Simplifying complex queries
-->Making SQL logic reusable

This Task Contains:
1. HR Database Structure
Tables:
Employees – stores basic employee info.
Departments – lists all departments (like HR, IT).
Salaries – holds salary records tied to employees.

2. Sample Data
Populates each table with realistic HR data:

emp_id	Name	Department	Salary
101	Alice Brown	HR	55000
102	Bob Smith	IT	72000
...	...	...	...

3. Views Created
🔹 View 1: EmployeeDirectory
Shows employee full names and their departments.
Purpose: Good for simple directory or reporting.
CREATE VIEW EmployeeDirectory AS
SELECT emp_id, CONCAT(first_name, ' ', last_name) AS full_name, department_name
FROM Employees JOIN Departments ON department_id;
🔹 View 2: HighEarners
Shows employees earning more than ₹65,000.
Purpose: Abstract salary data for management.
CREATE VIEW HighEarners AS
SELECT emp_id, full_name, salary FROM Employees JOIN Salaries WHERE salary > 65000;
🔹 View 3: EmployeeSummary
Combines employee name, department, salary, and hire date.
Purpose: Useful for HR reports or dashboards.

4. Sample Queries
The file includes SELECT statements like:
SELECT * FROM EmployeeDirectory;
SELECT * FROM HighEarners;
SELECT * FR*
