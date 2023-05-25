-- Aggregate Function: They gather data from many rows of a table, then aggregate it into a single value.
-- COUNT(*) will count NULL values as well

SELECT 
    *
FROM
    salaries
LIMIT 10;

SELECT 
    COUNT(salary)
FROM
    salaries;
    
SELECT 
    COUNT(DISTINCT (from_date))
FROM
    salaries;
    
SELECT 
    COUNT(DISTINCT (dept_no))
FROM
    dept_emp;