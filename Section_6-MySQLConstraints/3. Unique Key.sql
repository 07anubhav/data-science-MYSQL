create table customers
(
	customer_id int, 
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
    primary key(customer_id),
    unique key(email_address)
);

-- To drop unique key
alter table customers
drop index email_address;