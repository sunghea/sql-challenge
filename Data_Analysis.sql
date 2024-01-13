
-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT a.emp_no, a.first_name, a.last_name, a.sex , b.salary
	FROM public.employees a 
	inner join public.salaries b on a.emp_no = b.emp_no
	group by a.emp_no, a.first_name, a.last_name, a.sex , b.salary;
	
-- 2.List the first name, last name, and hire date for 
--   the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
	FROM public.employees
	where hire_date like '%1986%';
	
-- 3.List the manager of each department along 
-- with their department number, department name, employee number, last name, and first name.

SELECT c.dept_no, c.dept_name, a.emp_no, a.first_name, a.last_name
	FROM public.employees a 
	inner join public.dept_manager b on a.emp_no = b.emp_no
	inner join public.departments c on b.dept_no = c.dept_no
	group by c.dept_no, c.dept_name, a.emp_no, a.first_name, a.last_name;
	
-- 4. List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name (2 points)
SELECT  a.emp_no, a.last_name, a.first_name, c.dept_name
	FROM public.employees a 
	inner join public.dept_emp b on a.emp_no = b.emp_no
	inner join public.departments c on b.dept_no = c.dept_no
	group by c.dept_no, c.dept_name, a.emp_no, a.first_name, a.last_name;

-- 5.List first name, last name, and sex of each employee whose first name is Hercules 
--   and whose last name begins with the letter B.

SELECT first_name, last_name, sex
	FROM public.employees
	where first_name = 'Hercules'
	and last_name like 'B%';
	
-- 6.List each employee in the Sales department, 
--   including their employee number, last name, and first name.

SELECT  a.emp_no, a.last_name, a.first_name, c.dept_name
	FROM public.employees a 
	inner join public.dept_emp b on a.emp_no = b.emp_no
	inner join public.departments c on b.dept_no = c.dept_no
	where c.dept_name = 'Sales'
	
-- 7.List each employee in the Sales and Development departments, 
--   including their employee number, last name, first name, and department name.

SELECT  a.emp_no, a.last_name, a.first_name, c.dept_name
	FROM public.employees a 
	inner join public.dept_emp b on a.emp_no = b.emp_no
	inner join public.departments c on b.dept_no = c.dept_no
	where c.dept_name = 'Sales' or c.dept_name = 'Development' 
	
--8. List the frequency counts, in descending order, 
--   of all the employee last names (that is, how many employees share each last name)

SELECT count(emp_no) as frequency, last_name
	FROM public.employees
	group by last_name
	order by frequency desc;
	
