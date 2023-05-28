DROP PROCEDURE IF EXISTS emp_saalry;

DELIMITER $$
CREATE PROCEDURE emp_salary(IN p_emp_no INT)
BEGIN 
SELECT 
    e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM
    employees e
        INNER JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END$$

DELIMITER ;

call employees.emp_salary(11300);

-- -----------------------------------------

DROP PROCEDURE IF EXISTS avg_emp_salary;

DELIMITER $$
CREATE PROCEDURE avg_emp_salary(IN p_emp_no INT)
BEGIN 
SELECT 
    e.first_name, e.last_name, ROUND(AVG(s.salary), 2)
FROM
    employees e
        INNER JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no
GROUP BY e.emp_no;
END$$

DELIMITER ;

call employees.avg_emp_salary(11300);