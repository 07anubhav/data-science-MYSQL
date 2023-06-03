/*
SELECT-INTO structure will be used to store the output of the parameter
*/

DROP PROCEDURE IF EXISTS emp_avg_salary_out;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INT, OUT p_avg_salary DECIMAL(10,2))
BEGIN
SELECT 
    AVG(salary)
INTO p_avg_salary FROM
    employees e
        INNER JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END$$

DELIMITER ;

SET @v_avg_salary = 0;
CALL employees.emp_avg_salary_out(11300,@v_avg_salary);
select @v_avg_salary;

/*
Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.
*/
DROP PROCEDURE IF EXISTS emp_info;

DELIMITER $$
CREATE PROCEDURE emp_info(IN p_first_name VARCHAR(20), IN p_last_name VARCHAR(20), OUT p_emp_no INT)
BEGIN
SELECT 
    emp_no
INTO p_emp_no 
FROM employees
WHERE
    first_name=p_first_name AND last_name=p_last_name;
END$$

DELIMITER ;

call employees.emp_info('Lillian','Fontet',@p_emp_no);
select @p_emp_no;
