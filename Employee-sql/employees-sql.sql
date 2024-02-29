-- create titles table

CREATE TABLE titles(
	title_id VARCHAR(10) PRIMARY KEY NOT NULL,
	title VARCHAR(20) NOT NULL);
	
--import data from titles csv

--create employees table
CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date VARCHAR(15) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(2) NOT NULL,
	hire_date VARCHAR(30) NOT NULL);

--import data from employees csv

--create departments table

CREATE TABLE departments(
	dept_no VARCHAR(10) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL);

--import data from departments csv

--create dept_emp table

CREATE TABLE dept_emp(
	dept_id SERIAL PRIMARY KEY,
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no));	
	
--import data from dept_emp csv

--create dept_manager table
CREATE TABLE dept_manager(
	id SERIAL PRIMARY KEY,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
	
	
--import data from dept_manager csv

--create salaries table
CREATE TABLE salaries(
	sal_id SERIAL PRIMARY KEY,
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL);
	
--import data from salaries csv


