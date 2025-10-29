#3.1
Select COUNT(DISTINCT first_name, last_name) FROM employees.employees WHERE emp_no IN (SELECT emp_no FROM employees.salaries WHERE to_date >= '2025-10-29');

#3.2
SELECT COUNT(DISTINCT title) FROM employees.titles;

#3.3
SELECT AVG(salary) FROM employees.salaries WHERE to_date >= '2025-10-29';
SELECT STD(salary) FROM employees.salaries WHERE to_date >= '2025-10-29';