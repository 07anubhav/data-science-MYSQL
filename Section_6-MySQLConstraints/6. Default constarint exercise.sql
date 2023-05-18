create table companies
(
	company_id varchar(255),
    company_name varchar(255),
    headquarters_phone_number varchar(255)
);

-- To add Unique key
alter table companies
add unique key(headquarters_phone_number);

-- To add default constraint
alter table companies
change column company_name company_name varchar(255) default 'X';

drop table companies;