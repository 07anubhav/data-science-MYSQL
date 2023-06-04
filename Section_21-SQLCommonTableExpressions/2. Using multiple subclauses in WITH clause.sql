/*
How many female employees highest contract salary values were higher that the all time company average(across all genders)
*/
/* Solution 1*/
WITH cte1 AS(
	SELECT 
		AVG(salary) AS avg_salary
	FROM
    salaries), 
    cte2 AS(
    SELECT 
		s.emp_no, MAX(s.salary) as f_highest_salary
	FROM
		salaries s
	INNER JOIN
		employees e ON e.emp_no = s.emp_no AND e.gender='F'
	GROUP BY s.emp_no)
SELECT
	SUM(
		CASE
			WHEN c2.f_highest_salary > c1.avg_salary THEN 1
            ELSE 0
		END
		) AS f_highest_salaries_above_average,
	COUNT(e.emp_no) as total_no_female_contracts
FROM
	employees e
INNER JOIN 
	cte2 c2 ON c2.emp_no=e.emp_no
CROSS JOIN
	cte1 c1;
    
/* Solution 2*/
WITH cte_avg_salary AS(
	SELECT 
		AVG(salary) AS avg_salary
	FROM
    salaries), 
    cte_f_highest_salary AS(
    SELECT 
		s.emp_no, MAX(s.salary) as f_highest_salary
	FROM
		salaries s
	INNER JOIN
		employees e ON e.emp_no = s.emp_no AND e.gender='F'
	GROUP BY s.emp_no)
SELECT
	COUNT(
		CASE
			WHEN c2.f_highest_salary > c1.avg_salary THEN c2.f_highest_salary
            ELSE NULL
		END
		) AS f_highest_salaries_above_average,
	COUNT(c2.emp_no) as total_no_female_contracts,
    CONCAT(ROUND((SUM(
		CASE
			WHEN c2.f_highest_salary > c1.avg_salary THEN 1
            ELSE 0
		END
		) / COUNT(c2.emp_no))*100,2),'%') AS '% percentage'
FROM
	employees e
INNER JOIN 
	cte_f_highest_salary c2 ON c2.emp_no=e.emp_no
CROSS JOIN
	cte_avg_salary c1;
    
/*
Use two common table expressions and a SUM() function in the SELECT statement of a query to obtain the number of male employees 
whose highest salaries have been below the all-time average.
*/
WITH cte_avg_salary AS(
	SELECT 
		AVG(salary) AS avg_salary
	FROM
    salaries), 
    cte_m_highest_salary AS(
    SELECT 
		s.emp_no, MAX(s.salary) as m_highest_salary
	FROM
		salaries s
	INNER JOIN
		employees e ON e.emp_no = s.emp_no
	WHERE e.gender='M'
	GROUP BY s.emp_no)
SELECT
	SUM(
		CASE
			WHEN c2.m_highest_salary > c1.avg_salary THEN 1
            ELSE 0
		END
		) AS m_highest_salaries_above_average,
	COUNT(c2.emp_no) as total_no_male_contracts,
    CONCAT(ROUND((SUM(
		CASE
			WHEN c2.m_highest_salary > c1.avg_salary THEN 1
            ELSE 0
		END
		) / COUNT(c2.emp_no))*100,2),'%') AS '% percentage'
FROM
	employees e
INNER JOIN 
	cte_m_highest_salary c2 ON c2.emp_no=e.emp_no
CROSS JOIN
	cte_avg_salary c1;
    
/*
Use two common table expressions and a COUNT() function in the SELECT statement of a query to obtain the number of male employees whose 
highest salaries have been below the all-time average.
*/
WITH cte_avg_salary AS(
	SELECT 
		AVG(salary) AS avg_salary
	FROM
    salaries), 
    cte_m_highest_salary AS(
    SELECT 
		s.emp_no, MAX(s.salary) as m_highest_salary
	FROM
		salaries s
	INNER JOIN
		employees e ON e.emp_no = s.emp_no AND e.gender='M'
	GROUP BY s.emp_no)
SELECT
	COUNT(
		CASE
			WHEN c2.m_highest_salary > c1.avg_salary THEN c2.m_highest_salary
            ELSE NULL
		END
		) AS m_highest_salaries_above_average,
	COUNT(c2.emp_no) as total_no_male_contracts,
    CONCAT(ROUND((SUM(
		CASE
			WHEN c2.m_highest_salary > c1.avg_salary THEN 1
            ELSE 0
		END
		) / COUNT(c2.emp_no))*100,2),'%') AS '% percentage'
FROM
	employees e
INNER JOIN 
	cte_m_highest_salary c2 ON c2.emp_no=e.emp_no
CROSS JOIN
	cte_avg_salary c1;
    

WITH cte_avg_salary AS (
	SELECT 
		AVG(salary) AS avg_salary 
	FROM 
		salaries),
	cte_m_highest_salary AS (
	SELECT 
		s.emp_no, MAX(s.salary) AS max_salary
	FROM 
		salaries s 
	JOIN 
		employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
	GROUP BY s.emp_no)
SELECT
	COUNT(
		CASE 
			WHEN c2.max_salary < c1.avg_salary THEN c2.max_salary 
            ELSE NULL 
		END) AS max_salary
FROM 
	cte_m_highest_salary c2
JOIN cte_avg_salary c1;

/*
Retrieve the highest contract salary calues of all the employees hired in 2000 or later
*/