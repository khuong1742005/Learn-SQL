--create database QLBanHang
create table hangsx
(
	mahangsx char(10) primary key,
	tenhang char(30),
	diachi char(30),
	sodt char(10),
	email char(30)
);
create table SanPham
(
	masp char(10) primary key,
	mahangsx char(10) references hangsx(mahangsx),
	tensp char(30),
	soluong int,
	mausac char(10),
	giaban decimal(5,2),
	donvitinh char(10),
	mota char(30)
);
create table nhanvien
(
	manv int primary key,
	tennv char(30),
	gioitinh char(10),
	diachi char(30),
	sodt char(10),
	email char(30),
	tenphong char(30)
);
create table nhap
(
	sohdn int primary key,
	masp char(10) references sanpham(masp),
	soluongn int,
	dongian decimal(5,2)
);
create table pnhap
(
	sohdn int references nhap(sohdn) primary key,
	ngaynhap date,
	manv int references nhanvien(manv)
);
create table xuat
(
	sohdx int primary key,
	masp char(10) references sanpham(masp),
	soluongx int
);
create table pxuat
(
	sohdx int references xuat(sohdx),
	ngayxuat date,
	manv int references nhanvien(manv),
	primary key (sohdx)
);

-- a.
with 
test1 as
(
	select
		n.masp
	from
		nhap n
	join
		pnhap p
	on
		n.sohdn = p.sohdn
	where
		extract(year from p.ngaynhap) = 2019
	order by
		soluongn desc
	limit 10
)
select
	s.*
from	
	sanpham	s
join 
	test1 t
on
	s.masp = t.masp;
-- b.
-- c.
-- d.
with
test1 as
(
	select
		x.sohdx
	from
		sanpham s
	join
		xuat x
	on
		s.masp = x.masp
	where
		s.masp = 'SP02'
)
select 
	n.manv, n.hotennv
from
	test1 t
join
	pxuat p
on
	t.sohdx = p.sohdx
join
	nhanvien n
on
	n.manv = p.manv
where
	p.ngayxuat = '03/02/2020';
-- e
select
	s.*
from	
	sanpham	s
join 
	hangsx h
on
	s.mahangsx = h.mahangsx
where
	h.tenhang = 'Sam Sung';
-- f.
with
test1 as
(
	select
		x.sohdx
	from
		sanpham s
	join
		xuat x
	on
		s.masp = x.masp
	where
		s.tensp = 'Galaxy S'
)
select 
	n.*
from
	test1 t
join
	pxuat p
on
	t.sohdx = p.sohdx
join
	nhanvien n
on
	n.manv = p.manv
where
	extract(year from p.ngayxuat) = 2023;
-- g.
select 
	*
from
	pxuat
where
	ngayxuat = '3/2/2023';