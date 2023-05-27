SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

-- Similar as below
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

-- Mixing with inner join
SELECT 
    e.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
        INNER JOIN
    employees e ON e.emp_no = dm.emp_no
WHERE
    d.dept_no != dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

-- Exercise
SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_no;

SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_name;