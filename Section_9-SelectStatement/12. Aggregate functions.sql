/*
Aggregate functions are applied on multiple rows of a single column of a table and return an output of single values
They ignore null values unless told not to	
1. COUNT(): count number of not-null records in a field
2. SUM(): sum of all not-null values in a column
3. MIN(): return the min value from the entire list
4. MAX(): return the max value from the entire list
5.AVG(): calculate the avg of all non-null values belonging to a certain column of a table
*/

SELECT 
    COUNT(emp_no)
FROM
    employees;
    
SELECT 
    COUNT(DISTINCT (first_name))
FROM
    employees;
    
SELECT 
    *
FROM
    salaries;

SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= 100000;
    
SELECT 
    COUNT(*)
FROM
    dept_manager;