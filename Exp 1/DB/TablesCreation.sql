CREATE TYPE Name AS OBJECT( fname varchar(20), lname varchar(20));  

create table Author( id varchar(10) PRIMARY KEY, author_name Name, phone_no varchar(11));

create type Publisher as object (pub_id varchar(20),pub_name varchar(20), branch varchar(30));

create type keywords as varray(30) of varchar(20);

create type author_id as VARRAY(10) of varchar(10);

create table Book(ISBN int PRIMARY KEY, title varchar(100), B_author_id author_id, category varchar(50), book_publisher Publisher,keywords keywords , price number(10,2));

create table Customer(customer_id varchar(10) PRIMARY KEY, customer_name Name,phone varchar(11));

create table Book_Sale( sale_id varchar(10) PRIMARY KEY, BS_customer_id varchar(10), BS_ISBN int, CONSTRAINT FK_BSCustomer FOREIGN KEY (BS_customer_id) REFERENCES Customer(customer_id), CONSTRAINT FK_BSISBN FOREIGN KEY (BS_ISBN) REFERENCES Book(ISBN));
