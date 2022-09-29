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
