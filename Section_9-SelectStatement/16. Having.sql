/*
Refines the output from records that do not satisfy a certain condition, frequently implemented by GROUP BY. Used after GROUP BY and before ORDER BY.
We cannot have aggregated and non-aggregated condition in the HAVING clause
*/

SELECT 
    emp_no, AVG(salary) AS avg_salary
FROM
    salaries
GROUP BY emp_no
HAVING avg_salary > 120000;
