/*
Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range. 
Let this range be defined by two values the user can insert when calling the procedure.

Finally, visualize the obtained result-set in Tableau as a double bar chart. 
*/
DROP PROCEDURE IF EXISTS filter_salary;

DELIMITER $$
CREATE PROCEDURE filter_salary(IN min_salary FLOAT, IN max_salary FLOAT)
BEGIN
	SELECT 
		e.gender,
        d.dept_name,
		ROUND(AVG(s.salary),2) as avg_salary_per_department
	FROM
		t_salaries s
	INNER JOIN
		t_employees e ON e.emp_no=s.emp_no
	INNER JOIN
		t_dept_emp de ON de.emp_no=e.emp_no
	INNER JOIN
		t_departments d ON de.dept_no=d.dept_no
	WHERE s.salary BETWEEN min_salary AND max_salary
    GROUP BY d.dept_no,e.gender; 
END$$

DELIMITER ;


call filter_salary(50000,90000);