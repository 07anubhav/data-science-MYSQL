/*
Create a visualisation that provides a breakdown between the male and female employees working in the company each year, starting from 1990
*/
use employees_mod;

SELECT 
    YEAR(de.from_date) AS calendar_year,
    e.gender,
    COUNT(*) AS number_of_employees
FROM
    t_employees e
        INNER JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
GROUP BY calendar_year, e.gender
HAVING calendar_year >= 1990
ORDER BY calendar_year;
