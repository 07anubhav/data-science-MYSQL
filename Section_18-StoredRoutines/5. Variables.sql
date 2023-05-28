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

SET @v_emp_no = 0;
call employees.emp_info('Aruna','Journel',@v_emp_no);
select @v_emp_no;
