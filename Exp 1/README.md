## Table Creation

1. Type Name :
`CREATE TYPE Name AS OBJECT( fname varchar(20), lname varchar(20));`  

2. Table Author:
`create table Author( id varchar(10) PRIMARY KEY, author_name Name, phone_no varchar(11));`

3. Type Publisher
`create type Publisher as object (pub_id varchar(20),pub_name varchar(20), branch varchar(30));`

4. VARRY keyword_array (in place of multiset)
`create type keywords as varray(30) of varchar(20);`

5. VARRAY authorID:
`create type author_id as VARRAY(10) of varchar(10);`

6. Table Book:
`create table Book(ISBN int PRIMARY KEY, title varchar(100), B_author_id author_id, category varchar(50), book_publisher Publisher,keywords keywords , price number(10,2));`

7. Table Customer:
`create table Customer(customer_id varchar(10) PRIMARY KEY, customer_name Name,phone varchar(11));`

8. Table Book Sale
`create table Book_Sale( sale_id varchar(10) PRIMARY KEY, BS_customer_id varchar(10), BS_ISBN int, CONSTRAINT FK_BSCustomer FOREIGN KEY (BS_customer_id) REFERENCES Customer(customer_id), CONSTRAINT FK_BSISBN FOREIGN KEY (BS_ISBN) REFERENCES Book(ISBN));`

