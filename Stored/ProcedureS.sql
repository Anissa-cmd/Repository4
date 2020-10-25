SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM employees e
INNER JOIN titles t ON e.emp_no = t.emp_no
WHERE first_name LIKE 'm%'
LIMIT 100;

CALL employeeIdByTitles;

SELECT s.emp_no, e.first_name, e.last_name, t.title, d.dept_name
FROM salaries s
INNER JOIN employees e ON s.emp_no = e.emp_no
INNER JOIN titles t ON s.emp_no = t.emp_no
INNER JOIN departments d ON s.emp_no = d.dept_no = d.dept_name
WHERE salary = 90000;

CALL GetCountAverageSalarybyDepartments(90000);

SELECT year(de.from_date) AS "Start Date", year(de.to_date) AS "Last Date", e.first_name, e.last_name
FROM dept_emp de 
INNER JOIN employees e ON de.emp_no = e.emp_no;

CALL LenghtInJobs(@EmployeeNumber, @LenghtINJObs);

SELECT COUNT(salary)
FROM salaries
WHERE salary > 100000;

SELECT @salaryTotal;
SELECT @goodPayJobs;

SELECT avg(s.salary), e.birth_date
FROM salaries s
INNER JOIN employees e ON e.emp_no = s.emp_no
WHERE birth_date > 1990;

CALL employeesSalaryAverageByBirthDate(@birthDay);