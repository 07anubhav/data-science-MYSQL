/*
As opposed to ranking window functions, value window functions returns a value that can be found in the database

- LAG()		: Returns the value from the specified field of a record that precedes(the value that lags the current value) the current row.
- LEADS()	: Returns the value from the specified field of a record that follows(the value that leads the current value) the current row.
*/

SELECT 
    emp_no, salary,
    lag (salary) over w as previous_salary,
    lead (salary) over w as previous_salary,
    salary - lag (salary) over w as diff_salary_current_previous,
    lead (salary) over w - salary as diff_salary_current_previous	 
FROM
    salaries
WHERE
    emp_no = 10001
WINDOW w AS (order by salary asc);

/*
Write a query that can extract the following information from the "employees" database:
- the salary values (in ascending order) of the contracts signed by all employees numbered between 10500 and 10600 inclusive
- a column showing the previous salary from the given ordered list
- a column showing the subsequent salary from the given ordered list
- a column displaying the difference between the current salary of a certain employee and their previous salary
- a column displaying the difference between the next salary of a certain employee and their current salary
Limit the output to salary values higher than $80,000 only.
Also, to obtain a meaningful result, partition the data by employee number.
*/
SELECT
	s.emp_no,
    s.salary,
    lag (salary) over w as previous_salary,
    lead (salary) over w as next_salary,
    salary - lag (salary) over w as previous_salary_difference,
    lead (salary) over w - salary as next_salary_difference
FROM
	salaries s
WHERE s.emp_no BETWEEN 10500 AND 10600
	AND s.salary>80000
WINDOW w AS (partition by s.emp_no order by s.salary asc);

/*
The MySQL LAG() and LEAD() value window functions can have a second argument, 
designating how many rows/steps back (for LAG()) or forth (for LEAD()) we'd like to refer to with respect to a given record.

With that in mind, create a query whose result set contains data arranged by the salary values associated to each employee number (in ascending order). 
Let the output contain the following six columns:
- the employee number
- the salary value of an employee's contract (i.e. which we’ll consider as the employee's current salary)
- the employee's previous salary
- the employee's contract salary value preceding their previous salary
- the employee's next salary
- the employee's contract salary value subsequent to their next salary
Restrict the output to the first 1000 records you can obtain.
*/
SELECT
	s.emp_no,
    s.salary as emp_current_salary,
    lag (salary) over w as emp_previous_salary,
    lag(salary, 2) over w as 1_before_previous_salary,
    lead (salary) over w as emp_next_salary,
    lead(salary, 2) over w as 1_next_previous_salary
FROM
	salaries s
WINDOW w AS (partition by s.emp_no order by salary asc)
LIMIT 1000;