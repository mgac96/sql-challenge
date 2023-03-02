--employee number, last name, first name, sex, and salary of each employee
select employees.emp_no, 
employees.last_name, 
employees.first_name,
employees.sex,
salaries.salary
from employees left join salaries on employees.emp_no =salaries.emp_no
order by emp_no;

--first name, last name, and hire date for the employees who were hired in 1986
select employees.first_name,
employees.last_name,
employees.hire_date
from employees
where date_part('YEAR',hire_date)=1986;



--manager department along with department number, department name
--employee number, last name, and first name.
 SELECT employees.emp_no,
employees.first_name, 
employees.last_name, 
department.dept_no, 
department.dept_name
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN department ON dept_manager.dept_no = department.dept_no;


--department number for each employee along with that employee’s 
--employee number, last name, first name, and department name
SELECT employees.first_name,
       employees.last_name,
       employees.emp_no,
	   department.dept_no,
	   department.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN department ON department.dept_no = dept_emp.dept_no;
--first name, last name, and sex of each employee whose first name is
--Hercules and whose last name begins with the letter B.
select employees.first_name,
employees.last_name,
employees.sex
from employees
where employees.first_name = 'Hercules' and 
(lower(employees.last_name) like 'b%');


--each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.first_name,
       employees.last_name,
       employees.emp_no,
	   department.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join department on dept_emp.dept_no=department.dept_no
where lower (department.dept_name)='sales';

--List each employee in the Sales and Development departments, including their employee number
--last name, first name, and department name.
SELECT employees.first_name,
       employees.last_name,
       employees.emp_no,
	   department.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join department on dept_emp.dept_no=department.dept_no
where lower (department.dept_name)='sales' or
lower(department.dept_name)='development';

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).

select last_name,count(last_name)as frequency
from employees
group by last_name
order by frequency desc;