--create database ThucTap
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
select
	d.madt, d.tendt
from
	detai d
join
	huongdan h
on
	d.madt = h.madt
where
	h.magv in
		(
			select magv
			from giangvien
			where hotengv = 'Tran son'
		);
-- 2.
select 
	madt
from 
	huongdan
where
	masv is null;
-- 3.
select
	g.magv, g.hotengv, k.tenkhoa
from
	giangvien g
join
	khoa k
on
	g.makhoa = k.makhoa
where
	g.magv in
			(
				select
					h.magv
				from
					giangvien g
				join
					huongdan h
				on
					g.magv = h.magv
				group by
					h.magv
				having
					count(h.masv) > 3
			);
-- 4.
select 
	madt, tendt
from 
	detai
order by
	kinhphi desc
limit 1;
-- 5.
select
	h.madt, d.tendt
from
	detai d
join
	huongdan h
on
	h.madt = d.madt
group by
	h.madt, d.tendt
having 
	count(h.masv) > 2;
-- 6.
select
	s.masv, s.hotensv, h.ketqua
from
	sinhvien s
join
	huongdan h
on
	s.masv = h.masv
where
	s.makhoa in 
			(
				select makhoa
				from khoa
				where tenkhoa = 'DIALY va QLTN'
			);

-- 7.
select
	k.tenkhoa, count(s.masv) as Sosinhvien
from
	sinhvien s
join
	khoa k
on
	s.makhoa = k.makhoa
group by
	k.makhoa
-- 8.
select
	s.*
from
	sinhvien s
join
	huongdan h
on
	s.masv = h.masv
where
	s.quequan in
			(
				select 	
					d.noidungthuctap
				from
					huongdan h
				join
					detai d
				on
					h.madt = d.madt
			);
-- 9.
select 
	s.*
from
	huongdan h
join 
	sinhvien s
on
	h.masv = s.masv
where 
	h.ketqua is null;
-- 10.
select 
	s.masv, s.hotensv
from
	huongdan h
join 
	sinhvien s
on
	h.masv = s.masv
where 
	h.ketqua = 0;