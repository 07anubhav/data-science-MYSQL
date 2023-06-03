/*
Find out the lowest salary value each employee has ever signed a contract for. 
To obtain the desired output, use a subquery containing a window function,
as well as a window specification introduced with the help of the WINDOW keyword.

Also, to obtain the desired result set, refer only to data from the “salaries” table.
*/

SELECT
	a.emp_no,
    min(a.salary) as min_salary
FROM	
	(SELECT 
		emp_no,
        salary,
        row_number () over w as row_num
	FROM
		salaries
	WINDOW w AS (partition by emp_no order by salary)) AS a
    GROUP BY a.emp_no;
    
/*
Again, find out the lowest salary value each employee has ever signed a contract for. 
Once again, to obtain the desired output, use a subquery containing a window function. This time, however, 
introduce the window specification in the field list of the given subquery.
*/
SELECT
	a.emp_no,
    min(a.salary) as min_salary
FROM	
	(SELECT 
		emp_no,
        salary,
        row_number () over (partition by emp_no order by salary) as row_num
	FROM
		salaries) AS a
    GROUP BY a.emp_no;
    
/*
Once again, find out the lowest salary value each employee has ever signed a contract for. 
This time, to obtain the desired output, avoid using a window function. Just use an aggregate function and a subquery.
*/
SELECT
	a.emp_no,
    min(a.salary) as min_salary
FROM	
	(SELECT 
		emp_no,
        salary
	FROM
		salaries) AS a
	GROUP BY emp_no;
    
/*
Once more, find out the lowest salary value each employee has ever signed a contract for. 
To obtain the desired output, use a subquery containing a window function, 
as well as a window specification introduced with the help of the WINDOW keyword. 
Moreover, obtain the output without using a GROUP BY clause in the outer query.
*/
SELECT
	a.emp_no,
    a.salary
FROM	
	(SELECT 
		emp_no,
        salary,
        row_number () over w as row_num
	FROM
		salaries
	WINDOW w as (partition by emp_no order by salary asc)) AS a
    WHERE row_num=1;
    
/*
Find out the second-lowest salary value each employee has ever signed a contract for. 
To obtain the desired output, use a subquery containing a window function, 
as well as a window specification introduced with the help of the WINDOW keyword. 
Moreover, obtain the desired result set without using a GROUP BY clause in the outer query.
*/
SELECT
	a.emp_no,
    a.salary
FROM	
	(SELECT 
		emp_no,
        salary,
        row_number () over w as row_num
	FROM
		salaries
	WINDOW w as (partition by emp_no order by salary asc)) AS a
    WHERE row_num=2;