SELECT ABS(-18);
SELECT MOD(8,2);
SELECT ROUND(1234.4);
SELECT CEIL(18.5);
SELECT FLOOR(45.6);
SELECT FLOOR(-45.6);

SELECT POW(8,2);
SELECT UPPER('india');
 SELECT LOWER('INDIA');
 SELECT LENGTH('wipro');
 
SELECT SUBSTR('BENGALURU',4,3);
SELECT REPLACE('PENTAGON','PEN','HEX');
select trim(' hi ');
select concat('hello ' , ' bhavana');

SELECT CURDATE();
SELECT YEAR('2022-03-05');

SELECT MONTH(CURDATE());
select datediff('2025-01-10','2025-01-01');

CREATE DATABASE funcDB;
USE funcDB;
 
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT,
    join_date DATE,
    dept VARCHAR(20)
);
 
INSERT INTO employees VALUES
(1, 'Amit', 30000, '2021-05-10', 'HR'),
(2, 'Ravi', 50000, '2020-03-15', 'IT'),
(3, 'Neha', 70000, '2019-07-20', 'Finance'),
(4, 'Meena', 60000, '2022-01-12', 'IT');
 select upper(emp_name)as upper_emp_name from employees;
 select emp_name,length(emp_name)as name_length from employees;
 select curdate();
 SELECT emp_name,TIMESTAMPDIFF(YEAR, join_date, CURRENT_DATE) AS years_of_experience;
 SELECT emp_name,YEAR(CURRENT_DATE) - YEAR(join_date) AS experience FROM employees;
select count(*) as total_employee from employees;
select avg(salary)as avg_sal from employees;
select dept,sum(salary)as total_salary from employees group by dept;
select max(salary)as max_sal from employees where dept='IT';

select emp_name,salary,
case
    when salary <= 30000 then 'low'
    when salary between 30000 and 50000 then 'moderate'
    else 'high'
end as 'sal_category' from employees;    

select emp_name, salary,
case
	when salary >= 60000 THEN salary * 0.10
	else salary * 0.05
end as bonus_amount
from employees;

create table customers(
cust_name varchar(255),

email varchar(255),
address varchar(255));

insert into customers(cust_name,email,address)values('bhavana','bhavana@gmail.com','banglore');
insert into customers(cust_name,email,address)values('sahana','sahana@gmail.com','banglore');
insert into customers(cust_name,email,address)values('kavya','bhavana@gmail.com','mysore');
SELECT * FROM customers;
select cust_name,email from customers where address='banglore';



create table orders(
order_id int,
name varchar(255),
amount decimal(10,2));
set autocommit=0;
start transaction;
insert into orders values(1,'abc',3000.0);
savepoint o1;
insert into orders values(2,'efg',4000.0);
savepoint o2;
insert into orders values(3,'raj',5000.0);
savepoint o3;
rollback to o2;
select * from orders;
commit;















