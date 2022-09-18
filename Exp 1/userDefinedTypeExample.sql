 CREATE TYPE Name AS OBJECT (
    fname varchar(20),
    lname varchar(20)
  ) final;
  
  create type Address as object(
  street varchar(20),
  city varchar(20),
  zipcode varchar(20)
) not final;

drop table person;

create table person(
    id number,
    name Name,
    addres Address
);

insert into person values(1,new Name('Vinayak','Mali'), new Address('123','NewCity','4160041'));

select * from person;

select Name from person;