## Table Creation

1. Type Name :
```
CREATE TYPE Name AS OBJECT( fname varchar(20), lname varchar(20));
```  

2. Table Author:
```
create table Author( id varchar(10) PRIMARY KEY, author_name Name, phone_no varchar(11));
```

3. Type Publisher:
```
create type Publisher as object (pub_id varchar(20),pub_name varchar(20), branch varchar(30));
```

4. VARRY keyword_array (in place of multiset):

```
create type keywords as varray(30) of varchar(20);
```

5. VARRAY authorID:
```
create type author_id as VARRAY(10) of varchar(10);
```

6. Table Book:
```
create table Book(ISBN int PRIMARY KEY, title varchar(100), B_author_id author_id, category varchar(50), book_publisher Publisher,keywords keywords , price number(10,2));
```

7. Table Customer:
```
create table Customer(customer_id varchar(10) PRIMARY KEY, customer_name Name,phone varchar(11));
```

8. Table Book Sale:
```
create table Book_Sale( sale_id varchar(10) PRIMARY KEY, BS_customer_id varchar(10), BS_ISBN int, CONSTRAINT FK_BSCustomer FOREIGN KEY (BS_customer_id) REFERENCES Customer(customer_id), CONSTRAINT FK_BSISBN FOREIGN KEY (BS_ISBN) REFERENCES Book(ISBN));
```


## Data Insertion

1. Author Table
```
insert into author values('A0001', new Name('Vinayak','Mali'),'9985698877'); 
insert into author values('A0002', new Name('Aishwarya','Patil'),'8569889658');
insert into author values('A0003', new Name('Abhishek','Shinde'),'8874896521');
insert into author values('A0004', new Name('Ram','Shinge'),'9966587423');
insert into author values('A0005', new Name('Pratham','Patil'),'8855654895');
insert into author values('A0006', new Name('Aakansha','Shinde'),'8855654895');
insert into author values('A0007', new Name('Elmasri', 'Ramez'),'7788564985');
insert into author values('A0008', new Name('Navathe', 'Shamkant'),'8989547866');
```

## Quires

1. How to access fname from Author Table of type name?
```
select a.author_name.fname from author a;
```

2. Print all columns including fname and lname from author table
```
select author_id as ID, (a.author_name.fname) As First_Name, (a.author_name.lname) as Last_Name, a.phone_no as Phone_Number from author a;
```

3. Print all authors whose sirname is 'Patil'
```
select author_id as ID, (a.author_name.fname) As First_Name, (a.author_name.lname) as Last_Name, a.phone_no as Phone_Number from author a where a.author_name.lname = 'Patil';
```

<hr>

2. Book Table

```
insert into book values(0133970779, 'Fundamentals of Database Systems' ,AUTHOR_ID('A0007','A0008'),'Education', publisher('P0001','Pearson Education','India'), KEYWORDS('Advance Database','ADS','Pearson','Oracle'), 593.00);
```