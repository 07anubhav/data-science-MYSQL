/*
The 'OVER' clause relates to the window over which the function evaluation will occur. It will lead to a window specification (there we will define
how we want to organise the rows where the ROW_NUMBER() function will be providing rank values)

	  Window specification				| 		Action
# NONE=an empty over clause				|# ROW_NUMBER() will perform the relevant evaluations on all the rows=a single partition
# containing PARTITION BY   			|# the data will be organised into partitions
# containing ORDER BY 					|# arrange the values in asc or desc order

SQL Server categorizes the window functions into mainly three types:
# Aggregate Window Functions: 
These functions operated on multiple rows and Examples of such functions are SUM(), MAX(), MIN(), AVG(), COUNT(), etc.

# Ranking Window Functions: 
These functions ranks each row of a partition in a table. Example of such functions are RANK(), DENSE_RANK(), ROW_NUMBER(), NTILE(), etc.

# Value Window Functions: 
These functions are locally represented by a power series. Example of such functions are LAG(), LEAD(), FIRST_VALUE(), LAST_VALUE(), etc.
*/
SELECT 
	emp_no,
    salary,
-- This is called a WINDOW FUNCTION
    ROW_NUMBER() OVER () AS row_num
FROM salaries;

SELECT 
	emp_no,
    salary,
-- inside the OVER clause we have WINDOW SPECIFICATION
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM salaries;

/*
Write a query that upon execution, assigns a row number to all managers we have information for in the "employees" database 
(regardless of their department).

Let the numbering disregard the department the managers have worked in. 
Also, let it start from the value of 1. Assign that value to the manager with the lowest employee number.
*/
SELECT
	emp_no,
    dept_no,
    ROW_NUMBER() OVER (order by emp_no asc) AS row_num
FROM
	dept_manager;

/*
Write a query that upon execution, assigns a sequential number for each employee number registered in the "employees" table. 
Partition the data by the employee's first name and order it by their last name in ascending order (for each partition).
*/
SELECT 
    emp_no, 
    first_name, 
    last_name,
    ROW_NUMBER() OVER (PARTITION BY first_name ORDER BY last_name ASC) AS row_num
FROM
    employees;
    
/*
Obtain a result set containing the salary values each manager has signed a contract for. To obtain the data, refer to the "employees" database.

Use window functions to add the following two columns to the final output:

- a column containing the row number of each row from the obtained dataset, starting from 1.

- a column containing the sequential row numbers associated to the rows for each manager, 
where their highest salary has been given a number equal to the number of rows in the given partition, and their lowest - the number 1.

Finally, while presenting the output, make sure that the data has been ordered by the values in the first of the row number columns, 
and then by the salary values for each partition in ascending order.
*/
SELECT 
    dm.emp_no,
    s.salary,
    ROW_NUMBER() OVER (PARTITION BY dm.emp_no ORDER BY s.salary ASC) AS row_num1,
    ROW_NUMBER() OVER (PARTITION BY dm.emp_no ORDER BY s.salary DESC) AS row_num2
FROM
    dept_manager dm
    INNER JOIN
	salaries s
    on dm.emp_no=s.emp_no;

/*
MySQL Window function syntax (!!! NOT MOSTLY USED !!!)
*/
SELECT 
emp_no,salary,
ROW_NUMBER() OVER w AS row_num1
FROM 
salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

/*
Write a query that provides row numbers for all workers from the "employees" table, 
partitioning the data by their first names and ordering each partition by their employee number in ascending order.
*/
SELECT
	emp_no,
	first_name,
	last_name,
	ROW_NUMBER () OVER w AS row_num1
FROM 
	employees
WINDOW w AS (PARTITION BY first_name ORDER BY emp_no ASC);