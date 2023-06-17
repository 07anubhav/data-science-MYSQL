/*
Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set the 
hire date to equal the current date. Format the output appropriately (YY-mm-dd). 
Extra challenge: You can try to declare a new variable called 'today' which stores today's data, and then 
use it in your trigger!
*/
DROP TRIGGER IF EXISTS trig_hire_date;

DELIMITER $$
CREATE TRIGGER trig_hire_date
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
DECLARE h_date DATE;
	SELECT date_format(sysdate(), '%Y-%m-%d') INTO h_date;
    
	IF NEW.hire_date > h_date THEN
		SET NEW.hire_date=h_date;
	END IF;
END$$

DELIMITER ;


INSERT employees VALUES ('999905', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');  

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;