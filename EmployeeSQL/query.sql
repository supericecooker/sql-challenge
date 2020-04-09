--1. List the following details of each employee: 
--employee number, last name, first name, gender, and salary.
select * from "Employees";
SELECT "Employees".emp_no,
	"Employees".first_name, 
	"Employees".last_name, 
	"Employees".gender, "Salaries".salary
FROM "Employees"
JOIN "Salaries"
ON "Employees".emp_no = "Salaries".emp_no;

--2. List employees who were hired in 1986.
select first_name,
		last_name,
		hire_date
from "Employees"
where hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--3. List the manager of each department with the following information: 
--department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
SELECT "Department".dept_no,
	"Department".dept_name, 
	"Department_manager".emp_no, 
	"Employees".last_name, 
	"Employees".first_name, 
	"Department_manager".from_date, 
	"Department_manager".to_date
FROM "Department"
JOIN "Department_manager"
ON "Department".dept_no = "Department_manager".dept_no
JOIN "Employees"
ON "Department_manager".emp_no = "Employees".emp_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT "DEPT_EMP".emp_no, 
		"Employees".last_name, 
		"Employees".first_name, 
		"Department".dept_name
FROM "DEPT_EMP"
JOIN "Employees"
ON "DEPT_EMP".emp_no = "Employees".emp_no
JOIN "Department"
ON "DEPT_EMP".dept_no = "Department".dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT "DEPT_EMP".emp_no, 
		"Employees".last_name, 
		"Employees".first_name, 
		"Department".dept_name
FROM "DEPT_EMP"
JOIN "Employees"
ON "DEPT_EMP".emp_no = "Employees".emp_no
JOIN "Department"
ON "DEPT_EMP".dept_no = "Department".dept_no
WHERE "Department".dept_name = 'Sales';

--7. List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.
SELECT "DEPT_EMP".emp_no, 
		"Employees".last_name, 
		"Employees".first_name, 
		"Department".dept_name
FROM "DEPT_EMP"
JOIN "Employees"
ON "DEPT_EMP".emp_no = "Employees".emp_no
JOIN "Department"
ON "DEPT_EMP".dept_no = "Department".dept_no
WHERE "Department".dept_name = 'Sales' 
OR "Department".dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency count"
FROM "Employees"
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
