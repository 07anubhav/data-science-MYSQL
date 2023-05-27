SELECT 
    e.gender, AVG(s.salary) AS avg_salary
FROM
    employees e
        INNER JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender
ORDER BY e.gender;