CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;
-- Drop views first to avoid dependency errors
DROP VIEW IF EXISTS HR_Employees;
DROP VIEW IF EXISTS AvgSalaryPerDept;
DROP VIEW IF EXISTS HighEarners;
DROP VIEW IF EXISTS EmployeeDetails;

-- Drop tables
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- Create Departments table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Marketing');

-- Insert employees
INSERT INTO Employees (emp_id, emp_name, salary, dept_id) VALUES
(1, 'Alice', 75000.00, 1),
(2, 'Bob', 60000.00, 1),
(3, 'Charlie', 50000.00, 2),
(4, 'Diana', 45000.00, 2),
(5, 'Eve', 70000.00, 3);

-- View: Join employee details with department
CREATE VIEW EmployeeDetails AS
SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

-- View: High earning employees
CREATE VIEW HighEarners AS
SELECT emp_name, salary
FROM Employees
WHERE salary > 60000;

-- View: Average salary per department
CREATE VIEW AvgSalaryPerDept AS
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- View: HR employees only, with check option
CREATE VIEW HR_Employees AS
SELECT * FROM Employees
WHERE dept_id = 2
WITH CHECK OPTION;

-- Test: SELECT from views
SELECT * FROM EmployeeDetails;
SELECT * FROM HighEarners;
SELECT * FROM AvgSalaryPerDept;
SELECT * FROM HR_Employees;

-- Test: INSERT valid into HR_Employees (should succeed)
INSERT INTO HR_Employees (emp_id, emp_name, salary, dept_id)
VALUES (6, 'Frank', 42000.00, 2);

-- Uncomment below to test failure (should fail due to CHECK OPTION)
-- INSERT INTO HR_Employees (emp_id, emp_name, salary, dept_id)
-- VALUES (7, 'Grace', 40000.00, 1);
