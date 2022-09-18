# Advance Database System

## Oracle Express Edition:
* Password - $PASSWORD
* path - ```c:\app\Dell\product\21c\```
* Multimedia container database : ```localhost:1521```
* Plugable database: ```localhost:1521/XEPDB1```
* EM Express URL: `https://localhost:5500/em`

Q. How to start the lsnrctl (Listener Control) ? <br>
>  lsnrctl start <br>
>  lsnrctl status <br>

## SQL Plus: <br>
* Username - / as sysdba or connect as sysdba
* connect sys/$PASSWORD@localhost:1521/XEPDB1 as sysdba;

Q. How to create new User/Database:
> ```create user $USERNAME identified by $USERPASSWORD default tablespace users quota unlimited on users;``` <br>
>
> **Example** - create user demouser identified by Pass123 default tablespace users quota unlimited on users;

Q. How to grant a session permissios ? <br>
> ```grant create session to $USERNAME;``` <br>
> ```grant create session, create table to $USERNAME;``` <br>
> ```grant create type to $USERNAME;``` <br>

Note - While creating user if there is issue then alter session as <br>
> ```alter session set "_ORACLE_SCRIPT"=true; ```

Q. How to Connect a user:
> ```connect $USERNAME/$USERPASSWORD@localhost:1521/XEPDB1;```

Q. How to drop a created user ? 
> DROP USER Vinayak CASCADE;

Q. How to stop and start Data base services ?
> Go to services and find the oracleserviceXE and the start or stop
