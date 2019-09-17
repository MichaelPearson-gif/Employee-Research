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

