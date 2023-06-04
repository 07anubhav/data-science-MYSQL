/*
In SQL, every query-and sometimes part of a query or subquery-produces a result or a temporary dataset
- CTE	: Common Table Expression is a tool for obtaining such temporary result sets that exist within the execution of a given query
In other words, the temporary results that cannot be referred to in a  query other than the once they've been created in.
- We can use CTE in SELECT, INSERT, UPDATE and DELETE statements
- CTE is also known as named subqueries
- A CTE can be referred multiple times within a query
- We can refer to a CTE defined earlier within a given WITH clause. We cannot refer to one that has been defined after
*/

WITH cte_1 AS(
	SELECT AVG(salary) AS avg_salary FROM salaries)
SELECT
	SUM(
		CASE
			WHEN s.salary > c.avg_salary THEN 1
            ELSE 0
		END) AS no_of_salaries_above_average,
	COUNT(s.salary) AS total_no_of_salary_contracts
FROM 
	salaries s
INNER JOIN
	employees e ON e.emp_no=s.emp_no
CROSS JOIN
	cte_1 c
WHERE e.gender='F';

/*
Use a CTE (a Common Table Expression) and a SUM() function in the SELECT statement in a query to find out how many male employees have never 
signed a contract with a salary value higher than or equal to the all-time company salary average.
*/
WITH cte AS(
	SELECT AVG(salary) avg_salary FROM salaries)
SELECT
	SUM(
		CASE
			WHEN s.salary < c.avg_salary THEN 1
            ELSE 0
		END) AS no_of_salaries_below_average,
	COUNT(salary) AS no_of_salary_contracts
FROM 
	salaries s
INNER JOIN 
	employees e ON e.emp_no=s.emp_no
CROSS JOIN
	cte c
WHERE e.gender='M';

/*
Use a CTE (a Common Table Expression) and (at least one) COUNT() function in the SELECT statement of a query to find out 
how many male employees have never signed a contract with a salary value higher than or equal to the all-time company salary average.
*/
WITH cte AS(
	SELECT AVG(salary) avg_salary FROM salaries)
SELECT
	COUNT(
		CASE
			WHEN s.salary < c.avg_salary THEN s.salary
            ELSE NULL
		END) AS no_of_salaries_below_average,
	COUNT(salary) AS no_of_salary_contracts
FROM 
	salaries s
INNER JOIN 
	employees e ON e.emp_no=s.emp_no
CROSS JOIN
	cte c
WHERE e.gender='M';
	
/*
Use MySQL joins (and don’t use a Common Table Expression) in a query to find out how many male employees have never 
signed a contract with a salary value higher than or equal to the all-time company salary average 
(i.e. to obtain the same result as in the previous exercise).
*/
SELECT 
    SUM(CASE
        WHEN s.salary < a.avg_salary THEN 1
        ELSE 0
    END) AS no_salaries_below_avg,
    COUNT(s.salary) AS no_of_salary_contracts
FROM
    (SELECT 
        AVG(salary) AS avg_salary
    FROM
        salaries s) a
	INNER JOIN
    salaries s
	INNER JOIN
    employees e ON e.emp_no = s.emp_no
WHERE e.gender = 'M';

/*
Use a cross join in a query to find out how many male employees have never signed a contract with a salary value 
higher than or equal to the all-time company salary average (i.e. to obtain the same result as in the previous exercise).
*/
WITH cte AS (
SELECT AVG(salary) AS avg_salary FROM salaries)
SELECT 
    SUM(CASE
        WHEN s.salary < c.avg_salary THEN 1
        ELSE 0
    END) AS no_salaries_below_avg_w_sum,
    COUNT(s.salary) AS no_of_salary_contracts
FROM
    salaries s
INNER JOIN
    employees e ON s.emp_no = e.emp_no
CROSS JOIN
    cte c
WHERE e.gender='M'