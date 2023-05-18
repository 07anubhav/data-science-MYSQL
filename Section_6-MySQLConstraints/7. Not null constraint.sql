create table companies
(
	company_id int auto_increment,
    company_name varchar(255) not null,
    headquarters_phone_number varchar(255),
    primary key(company_id)
);

-- To add NOT NULL constraint / To drop NULL constraint
alter table companies
change column company_name company_name varchar(255) not null;

-- To drop NOT NULL constaraint / To add NULL constarint
alter table companies
modify company_name varchar(255) null;

