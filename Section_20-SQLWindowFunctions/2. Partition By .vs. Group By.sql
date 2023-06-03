SELECT 
    emp_no,
    max(salary) as max_salary
FROM
    salaries
GROUP BY emp_no;

SELECT 
	emp_no,
    salary,
    ROW_NUMBER () OVER (partition by emp_no order by salary desc) AS row_num1
FROM
	salaries;

SELECT
	A.emp_no,
    MAX(salary) as max_salary 
FROM
	(SELECT
		emp_no,
        salary,
        ROW_NUMBER () OVER w AS row_num1
	FROM 
		salaries
	WINDOW w AS (partition by emp_no order by salary desc)) as A
GROUP BY emp_no;

SELECT
	A.emp_no,
    A.salary
FROM
	(SELECT
		emp_no,
        salary,
        ROW_NUMBER () OVER w AS row_num
	FROM 
		salaries
	WINDOW w AS (partition by emp_no order by salary desc)) as A
WHERE A.row_num=2;