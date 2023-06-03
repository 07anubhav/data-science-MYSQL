/*
Similar to the exercises done in the lecture, 
obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990.
Create a fourth column in the query, indicating whether this employee is also a manager, 
according to the data provided in the dept_manager table, or a regular employee. 
*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN d.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS designation
FROM
    employees e
        LEFT JOIN
    dept_manager d ON d.emp_no = e.emp_no  
WHERE
    e.emp_no > 109990;
    
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_no,
    d.emp_no,
    d.from_date,
    d.to_date
FROM
    employees e
        LEFT JOIN
    dept_manager d ON d.emp_no = e.emp_no
WHERE
    e.emp_no > 109991;
    
/*
Extract a dataset containing the following information about the managers: 
employee number, first name, and last name. Add two columns at the end – 
one showing the difference between the maximum and minimum salary of that employee, 
and another one saying whether this salary raise was higher than $30,000 or NOT.
*/
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_hike,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary raise was higher that 30000'
        ELSE 'Salary raise was is not high'
    END AS salary_raise_comments
FROM
    employees e
        INNER JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        INNER JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY e.emp_no;

/*
Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” 
saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t.
*/
SELECT 
    de.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employeed'
        ELSE 'Not Employeed'
    END AS current_employees
FROM
    employees e
        INNER JOIN
    dept_emp de ON e.emp_no = de.emp_no
GROUP BY e.emp_no;

SELECT 
    de.emp_no,
    e.first_name,
    e.last_name,
    de.from_date,
    de.to_date
FROM
    employees e
        INNER JOIN
    dept_emp de ON e.emp_no = de.emp_no
WHERE
    e.emp_no = 10011;