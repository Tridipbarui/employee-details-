# 💻 Task 7: Creating Views – SQL Developer Internship

This repository contains the SQL script and view-based solutions for **Task 7: Creating and Using Views**, part of the SQL Developer Internship.

---

## 🧠 Objective

Learn how to:
- Create SQL views using `CREATE VIEW`
- Abstract data and simplify access using views
- Enforce data rules with `WITH CHECK OPTION`
- Use views for reporting and security

---

## 🛠️ Tools Used

- MySQL Workbench 8.0+
- MySQL RDBMS
- Git & GitHub

---

## 📁 Files Included

| File Name     | Description                               |
|---------------|-------------------------------------------|
| `views_task.sql` | Full SQL script including table creation, data insertion, view definitions, and usage |
| `README.md`   | This file — project overview and instructions |
| `screenshots/`| (Optional) Folder for screenshots of output |

---

## 🧱 Tables Created

### `Departments`
- `dept_id` (Primary Key)
- `dept_name`

### `Employees`
- `emp_id` (Primary Key)
- `emp_name`
- `salary`
- `dept_id` (Foreign Key → Departments)

---

## 🔍 Views Created

### `EmployeeDetails`
Joins employee data with department names.

### `HighEarners`
Shows employees with a salary above 60,000.

### `AvgSalaryPerDept`
Shows average salary grouped by department.

### `HR_Employees`
Shows only HR employees with `WITH CHECK OPTION` to restrict insert/update access.

---

## 📌 Sample Queries

```sql
SELECT * FROM EmployeeDetails;
SELECT * FROM HighEarners;
SELECT * FROM AvgSalaryPerDept;
SELECT * FROM HR_Employees;
