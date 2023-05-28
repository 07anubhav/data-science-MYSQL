/*
In this lecture all the procedures are non-parametric procedures (i.e dont have parameters)
*/

use employees;

DROP PROCEDURE IF EXISTS select_employees;
/*
Create a Procedures
*/
DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
	SELECT 
    *
	FROM
		employees
	LIMIT 1000;
END$$

DELIMITER ;

/*
Calling Procedures
*/
call employees.select_employees();

-- -----------------------------------------------------------------------------------

/*
Create a procedure that will provide the average salary of all employees.
*/
DROP PROCEDURE IF EXISTS average_salary_of_employees;

DELIMITER $$
CREATE PROCEDURE average_salary_of_employees()
BEGIN
	SELECT round(avg(salary),2)
    FROM
    salaries;
    
END$$

DELIMITER ;

call employees.average_salary_of_employees();
