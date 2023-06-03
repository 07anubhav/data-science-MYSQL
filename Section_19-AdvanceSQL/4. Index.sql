/*
The index of a table function works like a index of a book
Index: The data is taken form a certain column of the table and is stored in a certain order in a distinct place called an index.
Composite index: Applied to multiple columns, not just a single column.
*/

CREATE INDEX i_hire_date 
ON employees(hire_date);

SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
-- ------------
	
CREATE INDEX i_composite_emp_detail
ON employees(first_name,last_name);

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Georgi'
        AND last_name = 'Facello';

/*
To show all the index in a particular table table-name then database-name
*/
SHOW INDEX FROM employees FROM employees;

/*
To drop index
*/
ALTER TABLE employees
DROP INDEX i_hire_date;

/*Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.

Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.
*/
CREATE INDEX i_salary
ON salaries (salary);

select *
from salaries
where salary>89000;
