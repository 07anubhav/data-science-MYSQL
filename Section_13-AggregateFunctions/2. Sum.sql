SELECT 
    SUM(salary)
FROM
    salaries;
    
SELECT 
    *
FROM
    salaries
limit 10;

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';