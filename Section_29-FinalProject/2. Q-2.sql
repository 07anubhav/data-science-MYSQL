/*
Find the lowest department number encountered in the 'dept_emp' table. Then, find the highest department number.
*/
select	* from dept_emp;

select 	
	min(dept_no)
from 
	dept_emp;
 
select 	
	max(dept_no)
from 
	dept_emp;
