/*
EXISTS:
- check whether certain row values are found within a subquery
- this check is conducted row by row
- it return a boolean value (true or false)
*/

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no)
ORDER BY e.first_name;

/*
Select the entire information for all employees whose job title is “Assistant Engineer”. 
*/
SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            e.emp_no = t.emp_no
                AND t.title = 'Assistant Engineer');