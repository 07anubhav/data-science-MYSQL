SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;
    
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
