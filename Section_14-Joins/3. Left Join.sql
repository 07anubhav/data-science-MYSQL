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
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;
    
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
WHERE
    d.dept_name IS NULL
ORDER BY m.dept_no;
    
SELECT 
    *
FROM
    employees;

SELECT 
    *
FROM
    dept_manager;

SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date,d.emp_no
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY e.emp_no DESC;