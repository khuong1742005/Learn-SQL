create table HangSX
(
	mahangsx char(10),
	tenhang varchar(20),
	diachi varchar(30),
	sodt varchar(20),
	email varchar(30),
	primary key (mahangsx)
);
create table sanpham
(
	masp char(10),
	mahangsx char(10) references hangsx(mahangsx),
	tensp varchar(20),
	soluong int,
	mausac varchar(20),
	giaban varchar(20),
	donvitinh char(10),
	mota varchar(1000),
	primary key (masp)
);
create table nhanvien
(
	manv char(10),
	tennv varchar(20),
	gioitinh char(10),
	diachi varchar(30),
	sodt varchar(20),
	email varchar(30),
	tenphong varchar(30),
	primary key (manv)
);
create table pnhap
(
	sohdn char(10),
	ngaynhap date,
	manv char(10) references nhanvien(manv),
	primary key (sohdn)
);
create table nhap
(
	sohdn char(10) references pnhap(sohdn),
	masp char(10) references sanpham(masp),
	soluongn int,
	dongian varchar(30),
	primary key (sohdn, masp)
);
create table pxuat
(
	sohdx char(10),
	ngayxuat date,
	manv char(10) references nhanvien(manv),
	primary key (sohdx)
);
create table xuat
(
	sohdx char(10) references pxuat(sohdx),
	masp char(10) references sanpham(masp),
	soluongx int,
	primary key (sohdx, masp)
);
-- insert value
insert into hangsx
values
	('H01', 'SamSung', 'Korea', '011-08271717', 'ss@gmail.com.kr'),
	('H02', 'OPPO', 'China', '081-08626262', 'oppo@gmail.com.cn'),
	('H03', 'Vinfone', 'Việt Nam', '084-098262626', 'vf@gmail.com.vn');
insert into nhanvien
values
	('NV01', 'Nguyễn Thị Thu', 'Nữ', 'Hà Nội', '0982626521', 'thu@gmail.com', 'Kế toán'),
	('NV02', 'Lê Văn Nam', 'Nam', 'Bắc Ninh', '0972525252', 'nam2gamil.com', 'Vật tư'),
	('NV03', 'Trần Hòa Bình', 'Nữ', 'Hà Nội', '0328388388', 'hb@gmail.com', 'Kế toán');
insert into sanpham
values
	('SP01', 'H02', 'F1 Plus', 100, 'Xám', '7000000', 'Chiếc', 'Hàng cận cao cấp'),
	('SP02', 'H01', 'Galaxy Note 11', 50, 'Đỏ', '19000000', 'Chiếc', 'Hàng cao cấp'),
	('SP03', 'H02', 'F3 lite', 200, 'Nâu', '3000000', 'Chiếc', 'Hàng phổ thông'),
	('SP04', 'H03', 'Vjoy3', 200, 'Xám', '15000000', 'Chiếc', 'Hàng phổ thông'),
	('SP05', 'H01', 'Galaxy V21', 500, 'Nâu', '8000000', 'Chiếc', 'Hàng cao cấp');
insert into pnhap
values
	('N01', '02-05-2019', 'NV01'),
	('N02', '04-07-2020', 'NV02'),
	('N03', '05-17-2020', 'NV02'),
	('N04', '03-22-2020', 'NV03'),
	('N05', '07-07-2020', 'NV01');
insert into nhap
values
	('N01', 'SP02', 10, '17000000'),
	('N02', 'SP01', 30, '6000000'),
	('N03', 'SP04', 20, '12000000'),
	('N04', 'SP01', 10, '62000000'),
	('N05', 'SP05', 20, '70000000');
insert into pxuat
values
	('X01', '06-14-2020', 'NV02'),
	('X02', '03-05-2019', 'NV03'),
	('X03', '12-12-2020', 'NV01'),
	('X04', '06-02-2020', 'NV02'),
	('X05', '05-18-2020', 'NV01');
insert into xuat
values
	('X01', 'SP03', 5),
	('X02', 'SP01', 3),
	('X03', 'SP02', 1),
	('X04', 'SP03', 2),
	('X05', 'SP05', 1);
-- show all data
select * from hangsx;
select * from sanpham;
select * from nhanvien;
select * from pnhap;
select * from nhap;
select * from pxuat;
select * from xuat;

