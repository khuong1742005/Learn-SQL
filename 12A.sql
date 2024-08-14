-- create database QLBanHang
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
	sohdx int references xuat(sohdx) primary key,
	ngayxuat date,
	manv int references nhanvien(manv)
);


-- a.
select *
from sanpham;
select *
from hangsx;
select *
from nhanvien;
select *
from nhap;
select *
from pnhap;
select *
from xuat;
select *
from pxuat;
-- b.
select MaSP, TenSP,SoLuong, MauSac, GiaBan, DonViTinh, MoTa
from sanpham
order by giaban desc;
-- c.
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
-- d.
select *
from
	nhanvien
where
	gioitinh = 'Nữ' and tenphong = 'Kế toán';
-- e.
-- f.
-- g.
select
	p.*
from
	nhap n
join
	sanpham p
on
	n.masp = p.masp
where
	n.sohdn in 
			(
				select
					p.sohdn
				from
					pnhap p
				join
					nhanvien nv
				on
					p.manv = nv.manv
				where
					nv.tennv = 'Nguyễn Cẩm Tú'
					and
					p.ngaynhap = '12/02/2023'
			);
-- h.
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
		s.tensp = 'Galaxy S7'
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
	extract(year from p.ngayxuat) = 2023
	and
	extract(month from p.ngayxuat) = 9;
-- i.
select
	n.*
from
	nhanvien n
join
	pxuat p
on
	n.manv = p.manv
where
	p.sohdx is null;
-- j
select
	n.*
from
	sanpham n
join
	xuat p
on
	n.masp = p.masp
where
	p.sohdx is null;
-- k
with test1 as
(
	select masp
	from sanpham
	order by giaban desc
	limit 1
)
select
	s.*
from
	sanpham s
join
	test1 t
on
	t.masp = s.masp;
	

