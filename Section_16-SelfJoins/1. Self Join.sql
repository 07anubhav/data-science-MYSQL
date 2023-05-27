/*
If u want to combine certain rows of a table with other rows of the same table, we need self join
*/

/*
From the emp_manager table, extract the record data only of those employees who are managers as well
*/
SELECT DISTINCT
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;

-- or we can do this other way as well
SELECT DISTINCT
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager);



SELECT 
    *
FROM
    emp_manager;
    
SELECT 
    manager_no
FROM
    emp_manager;