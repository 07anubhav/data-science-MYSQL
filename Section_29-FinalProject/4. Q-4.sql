/*
Retrieve a list of all employees that have been hired in 2000. 
*/
SELECT 
    emp_no, hire_date
FROM
    employees
WHERE
    YEAR(hire_date) = '2000'