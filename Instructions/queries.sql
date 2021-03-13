--DROP TABLE IF EXISTS employees;
--DROP TABLE IF EXISTS dept_emp;
--DROP TABLE IF EXISTS titles;
--DROP TABLE IF EXISTS departments;
--DROP TABLE IF EXISTS salaries;
--DROP TABLE IF EXISTS dept_manager;


CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR,
	PRIMARY KEY(dept_no, emp_no));
	
Select * from dept_emp;

CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY, 
	title VARCHAR);
	
Select * from titles;

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT);
	
Select * from salaries;

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT,
	PRIMARY KEY(dept_no, emp_no));
	
Select * from dept_manager;

CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR);

Select * from departments;

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date Varchar
);
Select * from employees;

-- 1 List the following details of each employee: Employee number, Last Name, First Name, Sex and Salary
Select emp.emp_no, last_name, first_name, sex, salary 
from employees emp
Join salaries sal ON sal.emp_no = emp.emp_no;

-- 2 List first name, last name, and hire date for employees who were hired in 1986
Select first_name, last_name, hire_date
From employees
Where hire_date LIKE '%1986';

-- 3 List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
Select dep.dept_no, dep.dept_name, man.emp_no, emp.last_name, emp.first_name
From employees emp
Join dept_manager man on man.emp_no = emp.emp_no 
Join departments dep on dep.dept_no = man.dept_no;


-- 4 List the department of each employee with the following information: employee number, last name, first name, and department name.

Select emp.emp_no, emp.last_name, emp.first_name, de.dept_name
from employees emp
Join dept_emp dep ON dep.emp_no = emp.emp_no
Join departments de on de.dept_no = dep.dept_no;

-- 5 List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select first_name, last_name, sex
From employees
Where first_name = 'Hercules' AND LEFT(last_name, 1) = 'B';

-- 6 List all employees in the Sales department, including their employee number, last name, first name, and department name.

Select emp.emp_no, last_name, first_name, dept_name
From employees emp
Join dept_emp dep on dep.emp_no = emp.emp_no 
Join departments de on de.dept_no = dep.dept_no
Where dept_name = 'Sales';

-- 7 List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

Select emp.emp_no, last_name, first_name, dept_name
From employees emp
Join dept_emp dep on dep.emp_no = emp.emp_no 
Join departments de on de.dept_no = dep.dept_no
Where dept_name = 'Sales' 
OR dept_name ='Development'

-- 8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

Select last_name, Count(*)
From employees
Group By last_name 
ORDER BY Count(*) DESC

