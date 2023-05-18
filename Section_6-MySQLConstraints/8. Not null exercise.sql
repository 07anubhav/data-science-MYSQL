-- To add null constraint / To drop NOT NULL constraint
alter table companies
modify headquarters_phone_number varchar(255) null;

-- To drop null constraint / To add NOT NULL constraint
alter table companies
change headquarters_phone_number headquarters_phone_number varchar(255) not null;

