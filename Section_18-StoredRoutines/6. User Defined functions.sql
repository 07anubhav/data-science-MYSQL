DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary(p_emp_no INT) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN

DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
    AVG(salary)
INTO v_avg_salary FROM
    employees e
        INNER JOIN 
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;

RETURN v_avg_salary;
END$$

DELIMITER ;

SELECT employees.f_emp_avg_salary(11300);

/*
Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, 
and returns the salary from the newest contract of that employee.
*/
select * from salaries
WHERE emp_no=10001;

DROP FUNCTION IF EXISTS f_emp_info;

DELIMITER $$
CREATE FUNCTION f_emp_info(p_first_name VARCHAR(20),p_last_name VARCHAR(20)) RETURNS INT
DETERMINISTIC NO SQL READS SQL DATA
BEGIN

DECLARE v_salary INT;

SELECT 
    salary
INTO v_salary FROM
    employees e
        INNER JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
ORDER BY s.from_date DESC
LIMIT 1;

RETURN v_salary;

END$$

DELIMITER ;
 
SELECT f_emp_info('Aruna', 'Journel');
