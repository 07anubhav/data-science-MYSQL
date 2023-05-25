SELECT 
    *
FROM
    employees
WHERE emp_no=999903;

COMMIT;

SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
    
DELETE FROM employees 
WHERE
    emp_no = 999903;
    
ROLLBACK;

SELECT 
    *
FROM
    departments;
    
DELETE FROM departments 
WHERE
    dept_no = 'd010';