SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND (gender = 'M' OR gender = 'F');
    
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' and (first_name = 'Kellie' or first_name='Aruna');