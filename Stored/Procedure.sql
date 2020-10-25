
DELIMITER $$

CREATE PROCEDURE employeeIdByTitles(
IN titles VARCHAR (50)
)

BEGIN
SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM employees e
INNER JOIN titles t ON e.emp_no = t.emp_no
WHERE first_name LIKE 'm%'
LIMIT 100;

END $$

DELIMITER ;
CALL employeeIdByTitles;

DELIMITER $$

CREATE PROCEDURE GetCountAverageSalarybyDepartments(
IN amount INT
)

BEGIN 
SELECT s.emp_no, e.first_name, e.last_name, t.title, d.dept_name
FROM salaries s
INNER JOIN employees e ON s.emp_no = e.emp_no
INNER JOIN titles t ON s.emp_no = t.emp_no
INNER JOIN departments d ON s.emp_no = d.dept_no = d.dept_name
WHERE salary = 90000;

END $$

DELIMITER ;
CALL GetCountAverageSalarybyDepartments(90000);

DELIMITER //
CREATE PROCEDURE LenghtInJobs (
IN EmployeeNumber INT,
OUT LenghtINJObs INT
)

BEGIN 
SELECT year(de.from_date) AS "Start Date", year(de.to_date) AS "Last Date", e.first_name, e.last_name
FROM dept_emp de 
INNER JOIN employees e ON de.emp_no = e.emp_no;
END //

DELIMITER ;
CALL LenghtInJobs(@EmployeeNumber, @LenghtINJObs);

DELIMITER >>
CREATE PROCEDURE CountOfsalaryByamount(
IN amount INT,
OUT salaryTotal INT,
INOUT goodPayJobs INT
)

BEGIN
SELECT COUNT(*)
FROM salaries
WHERE salary = amount;
IF salaryTotal = 85000 THEN 
  SET goodpayJobs = 10;
  ELSE 
    SET goodPayJobs = 1000;
END IF;
  
END >>

DELIMITER ;
SET @goodPayJobs = 100;
CALL CountOfsalaryByamount(75000, @salaryTotal, @goodPayJobs);

DELIMITER ]]
CREATE PROCEDURE employeesSalaryAverageByBirthDate(
IN birthDay INT
)
BEGIN
SELECT avg(s.salary), e.birth_date
FROM salaries s
INNER JOIN employees e ON e.emp_no = s.emp_no
WHERE birth_date > 1990;
END ]]

DELIMITER ;
CALL employeesSalaryAverageByBirthDate(@birthDay);