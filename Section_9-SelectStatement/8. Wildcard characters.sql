-- Wildcard characters ('%' | '*' | '_') : you need a wildcard character whenever you wished to put anything in place

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%jack%');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%jack%');