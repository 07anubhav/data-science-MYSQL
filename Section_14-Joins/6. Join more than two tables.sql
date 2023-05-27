SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    dm.from_date,
    d.dept_name
FROM
    employees e
        INNER JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        INNER JOIN
    departments d ON dm.dept_no = d.dept_no;
    
/*
Select all managers’ first and last name, hire date, job title, start date, and department name.
*/
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        INNER JOIN
    dept_manager m ON e.emp_no = m.emp_no
        INNER JOIN
    departments d ON m.dept_no = d.dept_no
        INNER JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;

SELECT 
    d.dept_name, AVG(salary) as avg_salary
FROM
    departments d
        INNER JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
        INNER JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING avg_salary>80000
ORDER BY avg_salary desc;

/*How many male and how many female managers do we have in the ‘employees’ database?*/
SELECT 
    e.gender, COUNT(dm.dept_no) AS managers_count
FROM
    employees e
        INNER JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY e.gender
ORDER BY e.gender;

