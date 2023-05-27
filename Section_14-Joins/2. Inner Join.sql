SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no;
    

SELECT 
    *
FROM
    employees;

SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM
    employees e
        INNER JOIN
    dept_manager d ON e.emp_no = d.emp_no
ORDER BY e.emp_no;

SELECT 
    *
FROM
    employees;

SELECT 
    *
FROM
    titles;

SELECT 
    e.emp_no, e.first_name, e.last_name, t.title
FROM
    employees e
        INNER JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch'
ORDER BY e.emp_no;
