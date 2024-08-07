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
	sohdn int,
	masp char(10) references sanpham(masp),
	soluongn int,
	dongian decimal(5,2),
	primary key (sohdn, masp)
);
create table pnhap
(
	sohdn int references nhap(sohdn) primary key,
	ngaynhap date,
	manv int references nhanvien(manv)
);
create table xuat
(
	sohdx int,
	masp char(10) references sanpham(masp),
	soluongx int,
	primary key (sohdx, masp)
);
create table pxuat
(
	sohdx int references xuat(sohsx),
	ngayxuat date,
	manv int references nhanvien(manv),
	primary key (sohdx)
);

--a.
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
--b.
select MaSP, TenSP,SoLuong, MauSac, GiaBan, DonViTinh, MoTa
from sanpham
order by giaban;
--c.
select *
from sanpham
order by giaban
limit 2;
--d.
select *
from nhanvien
where gioitinh = 'Nữ' and tenphong = 'Kế Toán';
--e.
select *
from sanpham
where mausac = 'Đỏ' and giaban between 500000 and 10000000;
--f.
select *
from hangsx
where diachi = 'Hà Nội';
--g.
select *
from sanpham
order by soluong;
--h.
select *
from nhanvien
where gioitinh = 'Nữ' and tennv like ('Lê%');
--i.
select * 
from nhanvien
where tennv like '%Thủy';