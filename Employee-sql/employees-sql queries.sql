
--1. List employee number, last name, first name, sex, and salary of each employee
--select employee number, last name, first name, sex from employees table
--join salary table on employee id
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no=salaries.emp_no;

--2. List the first name, last name, and hire date for employees hired in 1986
--select first name, last name, hire date
--where the hire date contains 1986
SELECT employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE employees.hire_date LIKE '%1986%';

--3. List manager of each department and department number, department name, employee number, last name, and first name
--select employee number and department from dept_manager
--sub-query department name from departments
--sub-query last name and first name via employee number from managers
SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name
FROM dept_manager
JOIN employees
ON dept_manager.emp_no=employees.emp_no
	JOIN departments
	ON (dept_manager.dept_no=departments.dept_no)
	ORDER BY dept_manager.dept_no;


--4. List department number for each employee along with employee number, last name, first name, and department name
--SELECT employee number, last name, first name 
--join dept_emp table for link from employee number to dept number, JOIN departments for dept name
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no, departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
	JOIN departments
	ON dept_emp.dept_no=departments.dept_no;

--5. List first name, last name, and sex of each employee with first name 'Hercules' and last name begins with 'B'
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';


--6. List each employee in the sales department, including employee number, last name, and first name
--Select employee number, last name, first name WHERE dept.id is whatever the dept.id corresponds to for the dept.name
SELECT employees.emp_no, employees.first_name, employees.last_name
FROM employees
WHERE employees.emp_no IN
	(SELECT dept_emp.emp_no
	FROM dept_emp
	WHERE dept_emp.dept_no IN
		(SELECT departments.dept_no
		FROM departments
		WHERE departments.dept_name='Sales'));


--7. List each employee in Sales and Development departments including employee number, last name, first name, and department name
--Same as the method for question 6, but using OR/AND statements to get multiple departments information
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales' or departments.dept_name='Development';


--8. List the frequency counts (in descending order) of all employee last names
--SELECT the count() of employee names (Sort descending)
SELECT employees.last_name, count(employees.last_name)
FROM employees
GROUP by employees.last_name
ORDER BY count(employees.last_name) DESC;