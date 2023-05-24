SELECT 
    *
FROM
    employees
WHERE
    first_name <> 'Mark';

SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';

SELECT 
    *
FROM
    employees
WHERE
    hire_date < '1985-02-01';

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >= '2000-01-01';

SELECT 
    *
FROM
    salaries;

SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;