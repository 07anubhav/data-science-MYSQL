/*
Find the average salary of the male and female employees in each department.
*/
SELECT 
    d.dept_name, e.gender, AVG(s.salary) AS avg_salary
FROM
    employees e
        INNER JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        INNER JOIN
    departments d ON d.dept_no = dm.dept_no
        INNER JOIN
    salaries s ON s.emp_no = e.emp_no
GROUP BY d.dept_no,e.gender
order by d.dept_name;
