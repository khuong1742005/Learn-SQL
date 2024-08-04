create database SINHVIEN
-- creat table
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
	makhoa char(10) references khoa(makhoa),
	namsinh int,
	quequan char(30)
);

-- 1.
select * 
from 
	SinhVien
order by 
	namsinh;
-- 2.
select *
from
	SinhVien
order by
	namsinh desc
limit 2;
-- 3.
select 	*
from
	GiangVien 
order by
	luong
limit 
	ceil ((select count(*) from GiangVien) * 0.3);
-- 4.
select *
from 	
	SinhVien
where
	quequan not in ('Hà Nội', 'Bắc Giang', 'Lạng Sơn');
-- 5.
select *
from 
	GiangVien
order by
	luong
limit 2;
-- 6.
select *
from 
	GiangVien
where
	luong in
	(
		select 
			luong
		from
			GiangVien
		order by
			luong desc
		limit 1
	);
-- 7.
select * 
from 
	SinhVien
where 
	quequan = 'Hà Nam';
-- 8.
select * 
from
	SinhVien
order by
	namsinh
limit 1;
-- 9.
select *
from
	SinhVien
where 
	makhoa = null;
-- 10.
select *
from
	GiangVien
where
	makhoa = null;