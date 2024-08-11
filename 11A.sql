-- create database THUCTAP
create table Khoa
(
	Makhoa char(10) primary key,
	tenkhoa varchar(30),
	dienthai char(10)
);
create table GiangVien
(
	magv int primary key,
	hotengv varchar(30),
	luong decimal(5,2),
	makhoa char(10) references khoa(makhoa)
);
create table sinhvien
(
	masv int primary key,
	hotensv varchar(30),
	namsinh int,
	quequan varchar(30),
	makhoa char(30) references khoa(makhoa)
);
create table detai 
(
	madt char(10) primary key,
	tendt varchar(30),
	kinhphi int,
	noidungthuctap varchar(30)
);
create table huongdan
(
	masv int references sinhvien(masv),
	madt char(10) references detai(madt),
	magv int references giangvien (magv),
	ketqua decimal(5,2)
);

-- 1.
select * from giangvien;
-- 2.
select 
	g.magv, g.hotengv, k.tenkhoa
from
	giangvien g
join
	khoa k
on
	g.makhoa = k.makhoa
where 
	k.tenkhoa in ('DIA LY va QLTN');
-- 3.
select 
	count(distinct s.masv) as sosinhvien
from
	sinhvien s
join
	khoa k
on
	s.makhoa = k.makhoa
where 
	k.tenkhoa in ('COONG NGHE SINH HOC');
-- 4.
select 
	s.masv, s.hotensv, (2024 - s.namsinh) as tuoi
from
	sinhvien s
join
	khoa k
on
	s.makhoa = k.makhoa
where 
	k.tenkhoa in ('TOAN');
-- 5.
select 
	count(distinct magv) as sogiangvien
from
	giangvien g
join
	khoa k
on
	g.makhoa = k.makhoa
where 
	k.tenkhoa in ('COONG NGHE SINH HOC');
-- 6.
select
	s.*
from 
	huongdan h
join
	sinhvien s
on
	h.masv = s.masv
where
	h.madt is null;
-- 7.
select
	k.makhoa, k.tenkhoa, count(g.magv) as sogiangvien
from
	khoa k
join
	giangvien g
on
	k.makhoa = g.makhoa
group by
	k.makhoa;
-- 8.
select 
	k.dienthai
from
	khoa k
join
	sinhvien s
on
	k.makhoa = s.makhoa
where
	s.hotensv = 'Le van son';
