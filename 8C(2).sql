create database DeptEmp;
create table departments
(
	departmentno int,
	departmentname char(25) not null,
	location char(25) not null,
	primary key (departmentno)
);
create table employee
(
	empno int,
	fname varchar(15) not null,
	lname varchar(15) not null,
	job varchar(25) not null, 
	hiredate date not null,
	salary numeric not null,
	commision numeric,
	departmentno int references departments(departmentno)
);
-- insert value
insert into departments
values
	(10, 'Accounting', 'Melbourne'),
	(20, 'Research', 'Adealide'),
	(30, 'Sales', 'Sydney'),
	(40, 'Operations', 'Perth');
insert into employee
values
	(1, 'John', 'Smith', 'Clerk', '12-17-1980', 800, null, 20),
	(2, 'Peter', 'Allen', 'Salesman', '02-20-1981', 1600, 300, 30),
	(3, 'Kate', 'Ward', 'Salesman', '02-22-1981', '1250', '500', 30),
	(4, 'Jack', 'Jones', 'Manager', '04-02-1981', '2975', null, 30),
	(5, 'Joe', 'Martin', 'Salesman', '09-20-1981', '1250', 1400, 30);