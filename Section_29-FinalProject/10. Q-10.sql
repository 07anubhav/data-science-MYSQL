/*
Based on the previous exercise, you can now try to create a third function that also accepts a second 
parameter. Let this parameter be a character sequence. Evaluate if its value is 'min' or 'max' and based on 
that retrieve either the lowest or the highest salary, respectively (using the same logic and code structure 
from Exercise 9). If the inserted value is any string value different from ‘min’ or ‘max’, let the function 
return the difference between the highest and the lowest salary of that employee.
*/

DROP FUNCTION IF EXISTS f_min_or_max_salary;

DELIMITER $$
CREATE FUNCTION f_min_or_max_salary (f_emp_no INTEGER, f_evaluate varchar(10)) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
DECLARE f_salary DECIMAL(10,2);

SELECT
    CASE
		WHEN f_evaluate='min' THEN min(s.salary)
        WHEN f_evaluate='max' THEN max(s.salary)
        ELSE max(s.salary)-min(s.salary)
    END AS salary_info INTO f_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = f_emp_no;

RETURN f_salary;
END$$

DELIMITER ;


select f_min_or_max_salary(11356,'min');
select f_min_or_max_salary(11356,'max');
select f_min_or_max_salary(11356,'xyz');

SELECT 
    emp_no, MIN(salary), MAX(salary)
FROM
    salaries
WHERE
    emp_no = 11356;