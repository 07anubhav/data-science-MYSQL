SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no ASC;
    
ALTER TABLE departments_dup
modify COLUMN dept_name VARCHAR(40) NULL;

INSERT INTO departments_dup(
	dept_no) VALUES
    ('d010'), 
    ('d011');

ALTER TABLE employees.departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

COMMIT;

SELECT 
    dept_no, IFNULL(dept_name, 'dept_name not provided') as dept_name
FROM
    departments_dup
ORDER BY dept_no ASC;

SELECT 
    dept_no, COALESCE(dept_name, 'dept_name not provided') as dept_name
FROM
    departments_dup
ORDER BY dept_no ASC;

SELECT 
    dept_no, 
    dept_name,
    COALESCE(dept_manager,dept_name, 'N/A') as dept_name
FROM
    departments_dup
ORDER BY dept_no ASC;

SELECT 
    dept_no, 
    dept_name,
    COALESCE('dept manager name') as fake_col
FROM
    departments_dup
ORDER BY dept_no ASC;

/*
Select the department number and name from the ‘departments_dup’ table and 
add a third column where you name the department number (‘dept_no’) as ‘dept_info’. 
If ‘dept_no’ does not have a value, use ‘dept_name’.
*/
SELECT 
    dept_no, 
    dept_name,
    COALESCE(dept_no,dept_name) as dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;

/*
Modify the code obtained from the previous exercise in the following way. 
Apply the IFNULL() function to the values from the first and second column, 
so that ‘N/A’ is displayed whenever a department number has no value, and 
‘Department name not provided’ is shown if there is no value for ‘dept_name’.
*/
SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Departement name not provided') AS dept_name,
	COALESCE(dept_no,dept_name) as dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;