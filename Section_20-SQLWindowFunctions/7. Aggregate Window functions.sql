SELECT SYSDATE();

SELECT 
    emp_no, salary, from_date, to_date
FROM
    salaries
WHERE to_date>sysdate();

SELECT 
    s1.emp_no, s.salary, s.from_date, s.to_date
FROM
    salaries s
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        salaries
    GROUP BY emp_no) AS s1 ON s.emp_no = s1.emp_no
WHERE
    s.to_date > SYSDATE()
        AND s.from_date = s1.from_date;
        
/*
Create a query that upon execution returns a result set containing the 
employee numbers, contract salary values, start, and end dates of the first ever contracts that each employee signed for the company.

To obtain the desired output, refer to the data stored in the "salaries" table.
*/
SELECT 
    s1.emp_no, s.salary, s.from_date, s.to_date
FROM
    salaries s
        JOIN
    (SELECT 
        emp_no, MIN(from_date) AS from_date
    FROM
        salaries
    GROUP BY emp_no) AS s1 ON s.emp_no = s1.emp_no
WHERE
	s.from_date = s1.from_date;
    
-- ----------------------------------------------------------------------------
SELECT
	de2.emp_no, d.dept_no, s2.salary, AVG(s2.salary) over w as average_salary_per_department
FROM
	(SELECT
		de.emp_no,de.dept_no,de.from_date,de.to_date
	FROM
		dept_emp de
	JOIN 
		(SELECT 
			emp_no,MAX(from_date) AS from_date
		FROM 
			dept_emp
		GROUP BY emp_no) de1 
	ON de1.emp_no=de.emp_no
	WHERE 
		de.to_date > SYSDATE()
        AND de.from_date=de1.from_date) de2
	JOIN
		(SELECT
			s1.emp_no,s.salary,s.from_date,s.to_date
		FROM 	
			salaries s
		JOIN 
			(SELECT
				emp_no,MAX(from_date) as from_date
			FROM
				salaries
			GROUP BY emp_no) s1 ON s.emp_no=s1.emp_no
		WHERE 
			s.to_date > sysdate()
            and s.from_date = s1.from_date) s2 on s2.emp_no=de2.emp_no
JOIN
	departments d on d.dept_no=de2.dept_no
GROUP BY de2.emp_no,d.dept_name
WINDOW w AS (partition by de2.dept_no)
ORDER BY de2.emp_no;