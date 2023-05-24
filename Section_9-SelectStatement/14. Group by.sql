/*
Results can be grouped according to a specific field or fields.
It must be placed immediately after the WHERE condition, if any and just before the ORDER BY clause.
*/

SELECT 
    first_name
FROM
    employees
GROUP BY first_name;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;
