/*
Consider the employees' contracts that have been signed after the 1st of January 2000 and terminated before the 1st of January 2002 
(as registered in the "dept_emp" table).

Create a MySQL query that will extract the following information about these employees:
- Their employee number
- The salary values of the latest contracts they have signed during the suggested time period
- The department they have been working in (as specified in the latest contract they've signed during the suggested time period)
- Use a window function to create a fourth field containing the average salary paid in the department the employee was last working 
in during the suggested time period. Name that field "average_salary_per_department".

Note1: This exercise is not related neither to the query you created nor to the output you obtained while 
solving the exercises after the previous lecture.

Note2: Now we are asking you to practically create the same query as the one we worked on during the video lecture; 
the only difference being to refer to contracts that have been valid within the period between the 1st of January 2000 and the 1st of January 2002.

Note3: We invite you solve this task after assuming that the "to_date" values stored in the "salaries" and "dept_emp"
tables are greater than the "from_date" values stored in these same tables. If you doubt that, you could include a couple of lines in your code to ensure that this is the case anyway!

Hint: If you've worked correctly, you should obtain an output containing 200 rows.
*/