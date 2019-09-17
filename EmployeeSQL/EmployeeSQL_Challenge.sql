-- Create tables to store the data from the CSV files

CREATE TABLE departments (
	dept_no character varying(4) NOT NULL,
	dept_name character varying(20) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no CHARACTER VARYING(4) NOT NULL,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE dept_manager (
	dept_no CHARACTER VARYING(4) NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	birth_date date DEFAULT ('now'::text)::date NOT NULL,
	first_name CHARACTER VARYING(45) NOT NULL,
	last_name CHARACTER VARYING(45) NOT NULL,
	gender CHARACTER VARYING(1) NOT NULL,
	hire_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE titles (
	emp_no INTEGER NOT NULL,
	title CHARACTER VARYING(100) NOT NULL,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);

-- Check each table
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM titles;
SELECT * FROM salaries;
SELECT * FROM employees;

-- 1. List employee number, last name, first name, gender, and salary
-- Perform an inner join

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

-- 2. List employees who were hired in 1986

SELECT first_name, last_name,
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments, dept_manager, employees
WHERE departments.dept_no=dept_manager.dept_no AND dept_manager.emp_no=employees.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees, departments, dept_emp
WHERE employees.emp_no=dept_emp.emp_no AND dept_emp.dept_no=departments.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B".
-- LIKE %B allows me to search for last names beginning with B
SELECT first_name, last_name
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees, departments, dept_emp
WHERE employees.emp_no=dept_emp.emp_no AND dept_emp.dept_no=departments.dept_no AND dept_name='Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees, departments, dept_emp
WHERE employees.emp_no=dept_emp.emp_no AND dept_emp.dept_no=departments.dept_no AND dept_name='Sales' OR dept_name='Development';