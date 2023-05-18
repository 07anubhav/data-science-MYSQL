create table customers
(
	customer_id int auto_increment, 
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
    primary key(customer_id)
);

-- To add Default constraints to existing column
alter table customers
change column number_of_complaints number_of_complaints int default 0;

-- To insert value in table
insert into customers
(first_name,last_name,gender)
values
('Peter','Figaro','M');

-- To drop default constraint
alter table customers
alter column number_of_complaints drop default;

select * from customers;