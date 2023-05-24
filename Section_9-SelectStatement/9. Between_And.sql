SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';

SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';
    
SELECT 
    *
FROM
    salaries;

SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '66000' AND '70000';

SELECT 
    *
FROM
    salaries
WHERE
    emp_no NOT BETWEEN '1004' AND '1012';

SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';