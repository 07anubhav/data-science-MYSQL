/*
UNION (remove duplicate) (more computational power and storage space is required)
Union All (include duplicates as well):
- used to combine a few select statements in a single output
- we have to select the same number of columns from each table
- these columns should have the same name, same order, should contain related data types
*/

drop table if exists employees_dup;

CREATE TABLE employees_dub (
    emp_no INT(11),
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender ENUM('M', 'F'),
    hire_date DATE
);

INSERT INTO employees_dub
SELECT 
    e.*
FROM
    employees e
LIMIT 20;

SELECT 
    *
FROM
    employees_dub;
    
-- insert duplicate row
insert into employees_dub
values
('10001','1953-09-02','Georgi','Facello','M','1986-06-26');

-- Union vs Union All
-- If both tables dont have same columns 
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dub AS e
WHERE
    e.emp_no = 10001 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    d.dept_no,
    d.from_date
FROM
    dept_manager AS d;

SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' 
		UNION 
	SELECT 
		NULL AS emp_no,
		NULL AS first_name,
		NULL AS last_name,
		dm.dept_no,
		dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY - a.emp_no DESC;

