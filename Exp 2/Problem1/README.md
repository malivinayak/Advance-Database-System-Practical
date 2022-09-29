## Create Table

```
drop type EmpObj;
drop type Person;

/

create type Person as object(
    fname varchar(20),
    lname varchar(20),
    dob Date,
    MEMBER FUNCTION OnDate(onDate Date)
        return int) not final;
/

CREATE OR REPLACE TYPE BODY Person AS
    MEMBER FUNCTION OnDate(onDate Date) RETURN int IS
    BEGIN
        RETURN onDate - self.dob;
    END;
END;
/

create or replace type EmpObj UNDER Person (
    job varchar(50),
    salaray number,
    da number,
    doj Date,
    MEMBER FUNCTION earning RETURN number,
    OVERRIDING MEMBER FUNCTION OnDate(onDate Date)
        return int) not final;
/

CREATE OR REPLACE TYPE BODY EmpObj AS
    MEMBER FUNCTION earning RETURN number IS
    BEGIN
        RETURN self.da + self.salaray;
    END;
    OVERRIDING MEMBER FUNCTION OnDate(onDate Date)
        return int is
    BEGIN
        RETURN onDate - self.doj;
    END;
END;
/
```

## How to insert
```
insert into Employee Values(
        EmpObj(
            'Vinayak','Mali','01-JAN-2001','Student',40000,2000,'01-JUL-2019'
        )
    );
/
```

## Insertion

```
insert into Employee Values(EmpObj('Vinayak','Mali','01-JAN-2001','Student',40000,2000,'01-JUL-2019'));
insert into Employee Values(EmpObj('Aishwarya','Patil','01-Feb-2002','Student',50000,5000,'01-MAY-2019'));
insert into Employee Values(EmpObj('Abishek','Shinde','19-JAN-2002','Student',32000,1500,'01-SEP-2020'));
insert into Employee Values(EmpObj('Ram','Shinge','01-JAN-2001','Student',38000,2100,'01-JUL-2019'));
insert into Employee Values(EmpObj('Aakansha','Shinde','18-JAN-2001','Student',45000,3000,'01-AUG-2019'));
insert into Employee Values(EmpObj('Pratham','Patil','01-MAR-2001','Student',30000,4000,'01-OCT-2019'));
```


## Query

```
Select 
    CONCAT(e.fname, concat(' ',e.lname)) as EMP_Name, 
    e.DOB as Date_of_Birth, 
    e.job as Position, e.DOJ as Date_of_Joining,
    e.onDate('29-SEP-2022') as Service_Days, 
    e.earning() as Total_Earning 
from employee e
order by e.earning() DESC;
```

<details>	
  <summary><b>Click Here To See Result</b></summary>

  <br />
  <img height="" src="https://user-images.githubusercontent.com/66154908/193066072-84e38de4-8e88-4086-af8a-f6368d5a7f55.png" />
</details>
