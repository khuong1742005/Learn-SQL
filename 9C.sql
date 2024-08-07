-- create database SINHVIEN
create table Khoa
(
	makhoa char(10) primary key,
	tenkhoa char(30),
	dienthoai char(10)
);
create table GiangVien
(
	magv int primary key,
	hotengv char(30),
	luong decimal(5,2),
	makhoa char(10) references khoa(makhoa)
);
create table SinhVien
(
	masv int primary key,
	hotensv char(30),
	makhoa char(10),
	namsinh int,
	quequan char(30)
);

--9.3
--1.
select *
from SinhVien;
--2.
select *
from SinhVien
where namsinh <= 2004;
--3.
select *
from SinhVien
where hotensv like ('Nguyen%');
--4.
select distinct quequan
from SinhVien;
--5.
select *
from GiangVien
where luong between 10000000 and 20000000;
--6.
select *
from SinhVien
order by namsinh;
--7.
select *
from SinhVien
order by namsinh desc
limit 2;
--8.
select top (30) percent * 
from GiangVien
order by luong desc;
--9.
select *
from SinhVien
where quequan not in ('Hà Nội', 'Bắc Giang', 'Lạng Sơn');
--10.
select *
from SinhVien
order by namsinh 
limit 2;
