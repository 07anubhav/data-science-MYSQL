/*
Views are virtual table whose contents are obtained from the  existing table or tables called base tables
A view act as shortcut for writing the same SELECT statement everytime a new request has been made
Acts as a dynamic table because it instantly reflects data and structural change in the base table
We cannot insert or update the info that has already been extracted
*/

SELECT 
    *
FROM
    dept_emp;
    
SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS NUM
FROM
    dept_emp
GROUP BY emp_no
HAVING NUM > 1;

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
    
SELECT 
    *
FROM
    employees.v_dept_emp_latest_date;
    
/*
Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.
*/
CREATE OR REPLACE VIEW v_avg_salary_of_managers AS
    SELECT 
        ROUND(AVG(s.salary), 2) AS avg_salary
    FROM
        dept_manager dm
            INNER JOIN
        salaries s ON dm.emp_no = s.emp_no
    ORDER BY dm.emp_no;
    
SELECT 
    *
FROM
    v_avg_salary_of_managers;
    