/*
- Each query(or subquery) in SQL produces a temporary dataset
- Only the data in our default database is permanent, unless we drop some of its tables or dataset itself
Temporary result sets are:
	1. Joins
    2. Subqueries
    3. Window functions
    4. CTEs
    5. Temporary tables

- Temporary tables can be used like any other table from the default database during the MySQL session it has been created in.
- It can be dropped
- Are valid only within the scope of a MySQL session and not beyond
When temporary table is used, it is locked-for-use
	1. it can be invoked only once
    2. cannot be used with self-joins, union or union all
    3. We can do that using CTEs
*/

/*
Obtain the list containing the highest contract salary values signed by all female empoyeed who wroked in the company
*/
CREATE TEMPORARY TABLE f_highest_salaries
SELECT 
    s.emp_no, MAX(s.salary) AS f_highest_salary
FROM
    salaries s
        INNER JOIN
    employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY e.emp_no;

SELECT 
    *
FROM
    f_highest_salaries;
    
/*
Store the highest contract salary values of all male employees in a temporary table called male_max_salaries.
*/
drop table if exists male_max_salaries;

CREATE TEMPORARY TABLE male_max_salaries
SELECT 
    e.emp_no, MAX(s.salary) AS male_emp_higest_salary,e.gender
FROM
    salaries s
        INNER JOIN
    employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY e.emp_no;

select
	*
from
	male_max_salaries;