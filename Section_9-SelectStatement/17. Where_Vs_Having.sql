SELECT 
    first_name, COUNT(first_name) AS encountered
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING encountered < 200
ORDER BY first_name DESC;

SELECT 
    *
FROM
    dept_emp;

SELECT 
    emp_no, COUNT(dept_no) AS dept_count
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING dept_count > 1
ORDER BY emp_no;