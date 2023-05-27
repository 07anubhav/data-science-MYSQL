select *
from departments_dup;

ALTER TABLE departments_dup
DROP COLUMN dept_manager;

ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL; 

INSERT INTO departments_dup(dept_name)
VALUES
	('Public Relations');

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';
    
DROP TABLE IF EXISTS dept_manager_dup;

select * from dept_manager;

CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

INSERT INTO dept_manager_dup
select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES 
	(999904, '2017-01-01'),
	(999905, '2017-01-01'),
	(999906, '2017-01-01'),
	(999907, '2017-01-01');

DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)
VALUES('Public Relations');

DELETE FROM departments_dup
WHERE
    dept_no = 'd002'; 