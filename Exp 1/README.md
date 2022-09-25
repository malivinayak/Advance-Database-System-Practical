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

### 1. Author Table
```
insert into author values('A0001', new Name('Elmasri', 'Ramez'),'7788564985');
insert into author values('A0002', new Name('Navathe', 'Shamkant'),'8989547866');
insert into author values('A0003', new Name('Arundhati', 'Roy'),'8959686859');
```

### Quires

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

### 2. Book Table

```
insert into book values(0133970779, 'Fundamentals of Database Systems' ,AUTHOR_ID('A0001','A0002'),'Education', publisher('P0001','Pearson Education','India'), KEYWORDS('Advance Database','ADS','Pearson','Oracle'), 593.00);
insert into book values(978000225586, 'The God of Small Things' ,AUTHOR_ID('A0003'),'Literary Fiction', publisher('P0002','IndiaInk, India','India'), KEYWORDS('Love Laws','ADS','Booker Prize','childhood','Society'), 800.00);
```

### Quires

1. List all titles in book and include ISBN number, Author First and last name of first author of book.
```
create or replace function ext(p_varray_in author_id)
    return varchar
    is
    v_ext varchar(20);
    begin
    v_ext := p_varray_in(1);
    return v_ext;
    end;
/
select b.title as Title, b.ISBN as ISBN_Number, a.id as ID ,a.AUTHOR_NAME.fname as First_Name, a.AUTHOR_NAME.lname as Last_Name 
    from author a, book b 
    where a.id in (select ext(b.b_author_id) from book b);
```

2. List all titles in book and include ISBN number, Author First and last name
```
select b.title as Title, b.ISBN as ISBN_Number, a.id as ID ,a.AUTHOR_NAME.fname as First_Name, a.AUTHOR_NAME.lname as Last_Name 
    from author a, book b 
    where a.id in (
        SELECT COLUMN_VALUE b_author_id  
        FROM TABLE (b_author_id)
    );
```
3. List all titles in book and include ISBN number and Author First & last name **as combined Full_Name**
```
select b.title as Title, b.ISBN as ISBN_Number, a.id as ID , CONCAT(CONCAT(a.AUTHOR_NAME.fname, ' '),a.AUTHOR_NAME.lname) as Full_Name 
    from author a, book b 
    where a.id in (
        SELECT COLUMN_VALUE b_author_id  
        FROM TABLE (b_author_id)
    );
```
> Note : CONCAT function can only take 2 Parameters or Arguments, So, for three Parameters or Arguments i.e. Str1 , space, str 2 we used 2 concat 

4. List all titles in book and include ISBN number and Author First & last name as combined Full_Name **Using Name Type**
```
select b.title as Title, b.ISBN as ISBN_Number, a.id as ID , Name(a.AUTHOR_NAME.fname, a.AUTHOR_NAME.lname) as Full_Name 
    from author a, book b 
    where a.id in (
        SELECT COLUMN_VALUE b_author_id  
        FROM TABLE (b_author_id)
    );
```


<hr><hr>

## 3. Customer Table

```
insert into Customer values('C0001',new name('Abhishek','Shinde'),'8656487895');
insert into Customer values('C0002',new name('Ram','Shinge'),'7848568925');
insert into Customer values('C0003',new name('Aakansha','Shinde'),'9090231546');
insert into Customer values('C0004',new name('Pratham','Patil'),'7848561523');
insert into Customer values('C0013',new Name('Vinayak','Mali'),'8080121357');
insert into Customer values('C0012',new Name('Aishwarya','Patil'),'8080131275');
```




<hr><hr>

## 4. Book Sale

```
insert into book_sale values('S0001','C0013',978000225586);
insert into book_sale values('S0002','C0012',978000225586);
insert into book_sale values('S0003','C0002',0133970779);
insert into book_sale values('S0004','C0013',0133970779);
insert into book_sale values('S0005','C0004',978000225586);
```
### Queries

1. List All the Customer who have purchased book with 'Pearson Education'
```
select CONCAT(CONCAT(c.Customer_NAME.fname, ' '),c.Customer_NAME.lname) as Customer_Name, c.phone as Phone_Number, b.title
    from book_sale BS, customer c, book b
    where b.book_publisher.PUB_NAME in 'Pearson Education' and BS.BS_customer_id = c.customer_id and BS.BS_ISBN = B.ISBN;
```
