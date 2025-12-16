use 1612wipro;

create  table Employee(
EmployeeId int,
EnployeeName varchar(255),
EmployeeDept varchar(255),
salary float,
Designation varchar(255)
);

select * from Employee;

create table Customer(
CustomerId int,
CustomerName varchar(255),
CustomerAddress varchar(255),
CustomerEmail varchar(255)
);

create table customer1(
customerId int not null primary key,
customerName varchar(255) not null,
email varchar(255) not null unique,
customerAge int not null check(customerAge >18),
storeId int default 0
);

insert into customer1 values(1,'bhavana','bhavana@gmail.com',15,2);
insert into customer1 values(2,'bhavana_s','bhavanas@gmail.com',22);
select * from customer1;

create table persons(
personId int primary key,
LastName varchar(255),
firstName varchar(255),
age float);

insert into persons values('1','S','bhavana','22');

create table orders(
orderId int not null primary key,
orderNumber int not null,
personId int,
foreign key(personId) references persons(personId));

insert into orders values('1','10','1');

select * from orders;

alter table customer add customerAge int;
select * from customer;
alter table customer1 modify storeId decimal;
alter table customer1 drop storeId;
drop table customer;
truncate table customer1;
select * from customer1;
update customer1 set customerName='sahana' where customerId=2;
update customer1 set customerName='bhavana',email='bhavanas438@gmail.com' where customerId=2;
select * from customer1;
insert into customer1 values(3,'sahana','sahana@gmail.com',22);
insert into customer1 values(4,'divya','divya@gmail.com',23);
insert into customer1 values(5,'kavya','kavya@gmail.com',23);
delete from customer1 where customerId=3;
select customerName from customer1;
select * from customer1 where customerAge='23';
select * from customer1 where customerId in(2,5);
select * from customer1 where customerId between 2 and 5;
select customerName from customer1 where customerName like 'b%';
SET SQL_SAFE_UPDATES = 0;

create database StudentRepo;
create table student(
stuId int primary key not null,
stuName varchar(255),
stuClass varchar(255) not null,
stuMark int not null,
stuGender varchar(255));

INSERT INTO student VALUES
(1, 'John Deo', 'Four', 75, 'female'),
(2, 'Max Ruin', 'Three', 85, 'male'),
(3, 'Arnold', 'Three', 55, 'male'),
(4, 'Krish Star', 'Four', 60, 'female'),
(5, 'John Mike', 'Four', 60, 'female'),
(6, 'Alex John', 'Four', 55, 'male'),
(7, 'My John Rob', 'Five', 78, 'male'),
(8, 'Asruid', 'Five', 85, 'male'),
(9, 'Tes Qry', 'Six', 78, 'male'),
(10, 'Big John', 'Four', 55, 'female');

UPDATE student
SET stuMark = 70
WHERE stuName = 'Arnold';

delete from student where stuName='Tes Qry';

select * from student order by stuMark desc;

SELECT count(*) as female_count
FROM student
WHERE stuGender = 'female';

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    stuname VARCHAR(50),
    department VARCHAR(30),
    age INT,
    marks INT
);
insert into students values(1,'bhavana','ise',22,90);
INSERT INTO students VALUES
(2, 'sahana', 'cse', 21, 98),
(3, 'Neha', 'Mech', 22, 82),
(4, 'Divya', 'ece', 19, 90);

insert into students(student_id, stuname, department,age,marks)values(5,'kavya','eee',24,null);


INSERT INTO students (student_id, stuname, department)
VALUES (6, 'Ramya', 'CSE');

INSERT INTO students VALUES (7, 'Raj', 'ECE', 21, 85);

SELECT * FROM students;

SELECT stuname,department from students;
SELECT * FROM students WHERE department = 'CSE';

SELECT * FROM students WHERE marks > 70;

SELECT * FROM students WHERE age BETWEEN 18 AND 22;

SELECT * FROM students ORDER BY marks DESC;

SELECT COUNT(*)  FROM students;

UPDATE students SET marks = 88 WHERE student_id = 2;
UPDATE students SET marks = marks + 5 where 1;
select * from students;
UPDATE students SET department = 'cse' WHERE student_id = 3;
UPDATE students SET marks = 0 WHERE marks IS NULL;
UPDATE students SET age = 22 WHERE department = 'ECE';

DELETE FROM students WHERE student_id = 6;
DELETE FROM students WHERE marks < 40;
DELETE FROM students WHERE department = 'MECH';

CREATE DATABASE college_db;
USE college_db;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18)
);
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students VALUES
(1, 'John Doe', 'john@gmail.com', 20),
(2, 'Alice Smith', 'alice@gmail.com', 22);

INSERT INTO Courses VALUES
(101, 'Database Systems', 1),
(102, 'Operating Systems', 2);

UPDATE Students
SET age = 21
WHERE student_id = 1;

DELETE FROM Courses
WHERE course_id = 102;
















