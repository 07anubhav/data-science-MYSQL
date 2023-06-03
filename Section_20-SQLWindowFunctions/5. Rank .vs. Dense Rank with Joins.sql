SELECT
	d.dept_no,
    d.dept_name,
    dm.emp_no,
    rank () over w as dept_salary_ranking,
    s.salary,
    s.from_date as salary_from_date,
    s.to_date as salary_to_date,
    dm.from_date as dept_manager_from_date,
    dm.to_date as dept_manager_to_date
FROM
	dept_manager dm
INNER JOIN
	salaries s 
	ON dm.emp_no=s.emp_no
    AND s.from_date BETWEEN dm.from_date AND dm.to_date
    AND s.to_date BETWEEN dm.from_date AND dm.to_date
INNER JOIN
	departments d 
    ON dm.dept_no=d.dept_no
WINDOW w AS (partition by dm.dept_no order by s.salary desc);

/*
Write a query that ranks the salary values in descending order of all contracts signed by employees 
numbered between 10500 and 10600 inclusive. Let equal salary values for one and the same employee bear the same rank. 
Also, allow gaps in the ranks obtained for their subsequent rows.

Use a join on the “employees” and “salaries” tables to obtain the desired result.
*/

/*
Write a query that ranks the salary values in descending order of the following contracts from the "employees" database:
- contracts that have been signed by employees numbered between 10500 and 10600 inclusive.
- contracts that have been signed at least 4 full-years after the date when the given employee was hired in the company for the first time.
In addition, let equal salary values of a certain employee bear the same rank. Do not allow gaps in the ranks obtained for their subsequent rows.

Use a join on the “employees” and “salaries” tables to obtain the desired result.
*/