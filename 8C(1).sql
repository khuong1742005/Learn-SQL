create database MarkManagement;
create table students
(
	studentid varchar(12),
	studentname varchar(25) not null,
	dateofbirth date,
	email varchar(40),
	phone varchar(12),
	class varchar(10),
	primary key (studentid)
);
create table subjects
(
	subjectid varchar(10),
	subjectname varchar(25) not null,
	primary key (subjectid)
);
create table mark
(
	studentid varchar(12) references students(studentid),
	subjectid varchar(10) references subjects(subjectid),
	date date,
	theory int,
	practical int,
	primary key (studentid, subjectid)
);
-- insert value
insert into students
values
	('AV0807005', 'Mai Trung Hiếu', '11/10/1989', 'trunghieu@yahoo.com', '0904115115', 'AV1'),
	('AV0807006', 'Nguyễn Quý Hùng', '2/12/1988', 'quyhung@yahoo.com', '0955667787', 'AV2'),
	('AV0807007', 'Đỗ Đắc Huỳnh', '2/1/1990', 'dachuynh@yahoo.com', '0988574747', 'AV2'),
	('AV0807009', 'An Đăng Khuê', '6/3/1986', 'dangkhue@yahoo.com', '0986757463', 'AV1'),
	('AV0807010', 'Nguyễn T. Tuyết Lan', '12/7/1989', 'tuyetlan@yahoo.com', '0983310342', 'AV2'),
	('AV0807011', 'Đinh Phụng Long', '2/12/1990', 'phunglong@yahoo.com', '', 'AV1'),
	('AV0807012', 'Nguyễn Tuấn Nam', '2/3/1990', 'tuannam@yahoo.com', '', 'AV1');
insert into subjects
values
	('S001', 'SQL'),
	('S002', 'JavaSimplefield'),
	('S003', 'Active Sever Page');
insert into mark
values
	('AV0807005', 'S001', '6/5/2008', 8, 25),
	('AV0807006', 'S002', '6/5/2008', 16, 30),
	('AV0807007', 'S001', '6/5/2008', 10, 25),
	('AV0807009', 'S003', '6/5/2008', 7, 13),
	('AV0807010', 'S003', '6/5/2008', 9, 16),
	('AV0807011', 'S002', '6/5/2008', 8, 30),
	('AV0807012', 'S001', '6/5/2008', 7, 31),
	('AV0807005', 'S002', '6/6/2008', 12, 11),
	('AV0807010', 'S001', '6/6/2008', 7, 6);	