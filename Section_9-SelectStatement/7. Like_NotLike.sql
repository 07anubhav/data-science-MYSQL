SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');

SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');