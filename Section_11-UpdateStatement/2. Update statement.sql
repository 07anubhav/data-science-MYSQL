-- If we will not use the WHERE condition in the UPDATE statement then it will upadte all the rows in the table

SELECT 
    * 
FROM
    employees
WHERE
    emp_no = 999901;
    
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;
    
SELECT 
    *
FROM
    departments
ORDER BY dept_no asc;

update departments
set
	dept_name='Data Analysis'
where dept_no='d010';
