use 1612wipro;

select * from persons order by personId Desc;
insert into persons values(3,'b','divya',26,'Banglore');
insert into persons values(5,'a','kavyaraj',27,'Banglore');
insert into persons values(2,'s','sahana',24);
alter table persons add address varchar(255);
select * from persons;
select * from persons order by address,LastName desc;
select * from persons where address='banglore' order by personId desc;
select * from persons where address='banglore' order by personId desc limit 1;

create table staff(
staffName varchar(255),
staffId int primary key not null,
age int,
allowance int,
salary float);


insert into staff values('abc',1,22,400,4000.0);
insert into staff values('ram',2,23,500,5000.0);
insert into staff values('pallavi',3,24,600,7000.0);
insert into staff values('kavya',4,25,700,8000.0);
insert into staff values('bhavana',5,26,800,9000.0);
select * from staff;

alter table staff1 change age staffAge int;
delete from staff where staffId=1;
set autocommit=0;
rollback;
select * from staff;
set autocommit=0;
delete from staff where staffId=2;
rollback;
select * from staff;

create table account(
acc_id int primary key,
acc_name varchar(255),
balance int);

insert into account values(1,'ajay',7000);

insert into account values(2,'ravi',8000);

insert into account values(3,'raj',9000);
select * from account;
update account set balance=balance+3000 where acc_id=1;
set autocommit=0;
savepoint credit_done;
update account set balance=balance-3000 where acc_id=2;
rollback to credit_done;
set autocommit=1;
select * from account;
drop database college_db;
CREATE DATABASE college_DB;
USE college_DB;
 

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);
 
INSERT INTO students VALUES
(1, 'Arjun', 75),
(2, 'Meera', 82),
(3, 'Rohit', 68);

START TRANSACTION;
UPDATE students SET marks = marks + 10 WHERE student_name = 'Meera';
COMMIT;

SET autocommit = 0;


UPDATE students SET marks = marks - 6 WHERE student_id = 3;
ROLLBACK;
select * from students;

UPDATE students SET marks = marks + 10 WHERE student_name = 'Arjun';
set autocommit=0;
SAVEPOINT student;

UPDATE students SET marks = marks + 6 WHERE student_name = 'Meera';
rollback to student;
commit;

create user 'wipro'@'localhost' identified by 'test123';
select user,host from mysql.user;
 grant select on college_db.students to 'wipro'@'localhost';
 grant all privileges on college_db.* to  'wipro'@'localhost';
 grant insert,update on college_db.students to 'wipro'@'localhost';
 flush privileges;
 show grants for 'wipro'@'localhost';
 
 
REVOKE UPDATE
ON college_db.students
FROM 'wipro'@'localhost';
 
REVOKE ALL PRIVILEGES
ON college_db.*
FROM 'wipro'@'localhost';
 
FLUSH PRIVILEGES;
 
DROP USER 'wipro'@'localhost';
use 1612wipro;

 
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept VARCHAR(20),
    salary INT
);
 
select * from employees;
 
INSERT INTO employees VALUES
(1, 'Amit', 'HR', 30000),
(2, 'Ravi', 'IT', 50000),
(3, 'Neha', 'IT', 70000),
(4, 'Meena', 'HR', 40000),
(5, 'Arjun', 'Finance', 60000);
 
select COUNT(*) as total_employees
from employees;
 
select COUNT(*) as IT_COUNT
from employees
where dept = 'IT';
 
select SUM(salary) as total_salary
from employees;
 
select dept, SUM(salary) as dept_salary
from employees
GROUP BY dept;
 
select AVG(salary) as dept_salary
from employees;
 
 
select dept, AVG(salary) as avg_salary
from employees
GROUP BY dept;

select MIN(salary) as lowest_salary
from employees;
 

select MAX(salary) as highest_salary
from employees;
 
select dept, MAX(salary) as max_salary
from employees
GROUP BY dept;

 
CREATE TABLE employees1 (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT,
    bonus INT,
    dept VARCHAR(20)
);
 
INSERT INTO employees1 VALUES
(1, 'Amit', 25000, NULL, 'HR'),
(2, 'Ravi', 40000, 5000, 'IT'),
(3, 'Neha', 60000, NULL, 'Finance'),
(4, 'Meena', 80000, 10000, 'IT');
 
SELECT * FROM employees1;
 
 
select emp_name, salary,
case
	when salary < 30000 then 'low'
    when salary between 30000 and 60000 then 'Medium'
    else 'high'
END as salary_level
from employees1;
 
select * 
from employees1
where
case 
	when dept = 'IT' then salary > 50000
    else salary > 30000
END;
 
update employees1
set bonus =
case
	when salary >= 60000 then 10000
    else 5000
END;
 
SELECT * FROM employees1;
 
select emp_name,
if(salary >= 50000, 'Eligible' , 'Not eligible')  as status
from employees1;
 
select emp_name,
IF (bonus is null, salary * 0.05 , bonus) as final_bonus
from employees1;
 
select emp_name,
ifnull(bonus, 0 ) as  bonus_amount
from employees1;
 
 
 
 
 
 



