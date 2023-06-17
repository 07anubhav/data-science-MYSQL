/*
How many contracts have been registered in the ‘salaries’ table with duration of more than one year and 
of value higher than or equal to $100,000?
*/
select
	count(*) as contarct_more_tha_100000
from 
	salaries
where datediff(to_date,from_date)>365 and salary>100000;

select
	emp_no,datediff(to_date,from_date) as diff, to_date,from_date
from salaries;