create database Bank;

create table Branch(branch_name varchar(20),
branch_city varchar(30),
assets real,
primary key(branch_name));

create table BankAccount(
accno int,
branch_name varchar(20),
balance real,
primary key(accno),
foreign key(branch_name)references Branch(branch_name));

desc branch;

desc bankaccount;

create table BankCustomer(customer_name varchar(30),
customer_street varchar(3),
customer_city varchar(30),
primary key(customer_name));

create table Depositer(customer_name varchar(30),
accno int,
primary key(customer_name,accno),
foreign key(customer_name)references BankCustomer(customer_name),
foreign key(accno)references BankAccount(accno));

desc bankcustomer;

desc depositer;

create table loan(loan_number int,
branch_name varchar(30),
amount real,
primary key(loan_number),
foreign key(branch_name)references Branch(branch_name));

desc loan;

insert into branch values('&branch_name','&branch_name','&assets');
select * from branch;
desc loan;
insert into loan values('&loan_number','&branch_name','&amount');
select * from loan;

insert into BankAccount values('&accno','&branch_name','&balance');

select * from BankAccount;

insert into depositer values('&customer_name','&accno');
select * from depositer;
insert into BankCustomer values('&customer_name','&customer_street','&customer_city');

select * from BankCustomer;
alter table BankCustomer modify (customer_street varchar(30));

desc BankCustomer;

update depositer set accno = 3 where customer_name = 'Nikil';

commit;

create table borrower(customer_name varchar(30),
loan_number int,
primary key(customer_name,loan_number),
foreign key(customer_name)references BankCustomer(customer_name),
foreign key(loan_number)references loan(loan_number));

desc loan;
desc bankcustomer;
desc Borrower;

insert into borrower values('&customer_name','&loan_number');
select * from borrower;

commit;