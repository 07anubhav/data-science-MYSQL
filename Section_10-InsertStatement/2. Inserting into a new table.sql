-- It will copy the data from one table to another table based on condition
drop table if exists departments_dup;
SELECT 
    *
FROM
    departments;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

INSERT INTO departments_dup(
	dept_no,
    dept_name
)
SELECT 
    *
FROM
    departments;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

INSERT INTO departments
VALUES(
	'd010',
    'Business Ananlysis'
);
	