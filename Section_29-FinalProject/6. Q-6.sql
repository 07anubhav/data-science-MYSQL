/*
Create a procedure that asks you to insert an employee number and that will obtain an output containing 
the same number, as well as the number and name of the last department the employee has worked in. 
Finally, call the procedure for employee number 10010.
*/
DROP PROCEDURE IF EXISTS proc;

DELIMITER $$
CREATE PROCEDURE proc(IN i_emp_no INT)
BEGIN
	SELECT
		e.emp_no,
        de.from_date,
        d.dept_name
	FROM
		employees e
	INNER JOIN
		dept_emp de ON e.emp_no=de.emp_no
	INNER JOIN
		departments d ON de.dept_no=d.dept_no
	WHERE 	e.emp_no=i_emp_no AND
			de.from_date = (SELECT
								MAX(from_date)
							FROM
								dept_emp
							WHERE
								emp_no = i_emp_no);
END$$

DELIMITER ;

call employees.proc(10010);