DROP TABLE IF EXISTS f_highest_salaries;

CREATE TEMPORARY TABLE f_highest_salaries
SELECT 
    s.emp_no, MAX(s.salary) AS f_highest_salary
FROM
    salaries s
        INNER JOIN
    employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY e.emp_no
LIMIT 10;

/* JOIN */
WITH cte AS(
	SELECT 
		s.emp_no, MAX(s.salary) AS f_highest_salary
	FROM
		salaries s
	INNER JOIN
		employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
	GROUP BY e.emp_no
    LIMIT 10)
SELECT
	* 
FROM 
	f_highest_salaries f1
JOIN
	cte c;
    
/* UNION */
WITH cte AS(
	SELECT 
		s.emp_no, MAX(s.salary) AS f_highest_salary
	FROM
		salaries s
	INNER JOIN
		employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
	GROUP BY e.emp_no
    LIMIT 10)
SELECT
	* 
FROM 
	f_highest_salaries f1
UNION ALL
SELECT 
	*
FROM
	cte;
    
-- -------------
CREATE TEMPORARY TABLE dates
SELECT
	NOW() AS current_date_time,
    DATE_SUB(NOW(), INTERVAL 1 MONTH) AS a_month_earlier,
    DATE_SUB(NOW(), INTERVAL -1 YEAR) AS a_year_later;
    
SELECT 
    *
FROM
    dates;
    
WITH cte AS(
	SELECT
	NOW() AS current_date_time,
    DATE_SUB(NOW(), INTERVAL 1 MONTH) AS a_month_earlier,
    DATE_SUB(NOW(), INTERVAL -1 YEAR) AS a_year_later)
SELECT 
	*
FROM
	dates d1 
JOIN 
	cte c;
    
WITH cte AS(
	SELECT
	NOW() AS current_date_time,
    DATE_SUB(NOW(), INTERVAL 1 MONTH) AS a_month_earlier,
    DATE_SUB(NOW(), INTERVAL -1 YEAR) AS a_year_later)
SELECT 
	*
FROM
	dates d1 
UNION ALL 
SELECT 
	*
FROM
	cte c; 
	