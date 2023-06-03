/*
MySQL window fnction:
- They all acquire the use of OVER clause.
- The rank values they provide are always assigned sequentially
- The first rank is always equal to the integer 1 and the subsequent rank values grows incrementally by 1, except for the duplicate reocrds potentially

RANK() 		: The focus is on the number of values we have in our output
DENSE_RANK(): The focus is on the ranking of the values itself

RANK() and DENSE_RANK() are only useful when applied on ordered partition (=partitions defined by the use of the ORDER BY clause).
*/

SELECT
	emp_no,salary,
    row_number () over w as row_num
FROM
	salaries
WINDOW w AS (partition by emp_no order by salary desc); 

SELECT 
    emp_no, COUNT(salary) - COUNT(DISTINCT (salary)) AS diff
FROM
    salaries
GROUP BY emp_no
HAVING diff > 0
ORDER BY emp_no;

SELECT
	emp_no,salary,
    row_number () over w as row_num
FROM
	salaries
WHERE emp_no=11839
WINDOW w AS (partition by emp_no order by salary desc); 

/*
RANK function
*/
SELECT
	emp_no,salary,
    rank () over w as rank_num
FROM
	salaries
WHERE emp_no=11839
WINDOW w AS (partition by emp_no order by salary desc); 

/*
DENSE_RANK function
*/
SELECT
	emp_no,salary,
    dense_rank () over w as rank_num
FROM
	salaries
WHERE emp_no=11839
WINDOW w AS (partition by emp_no order by salary desc); 

/*
Write a query containing a window function to obtain all salary values that employee number 10560 has ever signed a contract for.

Order and display the obtained salary values from highest to lowest.
*/
SELECT
	emp_no,
    salary,
    row_number () over w as row_num
FROM salaries
WHERE emp_no=10560
WINDOW w AS (partition by emp_no order by salary desc);

/*
Write a query that upon execution, displays the number of salary contracts that each manager has ever signed while working in the company.
*/
SELECT
	dm.emp_no,
    count(s.salary) as number_of_contract
FROM salaries s
INNER JOIN
dept_manager dm
ON dm.emp_no=s.emp_no
GROUP BY dm.emp_no
ORDER BY dm.emp_no;


/*
Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has ever signed a contract for. 
Use a window function to rank all salary values from highest to lowest in a way that equal salary values bear the same rank and that gaps 
in the obtained ranks for subsequent rows are allowed.
*/
SELECT
	emp_no,
    salary,
    rank () over w as row_num
FROM salaries
WHERE emp_no=10560
WINDOW w AS (partition by emp_no order by salary desc);

SELECT
	emp_no,
    salary,
    dense_rank () over w as row_num
FROM salaries
WHERE emp_no=10560
WINDOW w AS (partition by emp_no order by salary desc);