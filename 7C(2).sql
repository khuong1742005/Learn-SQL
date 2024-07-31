create table CongTy
(
	MaCT int,
	TenCT varchar(50),
	TrangThai varchar(50),
	ThanhPho varchar(50),
	primary key (MaCT)
)
create table SanPham
(
	masanpham int,
	Tensanpham varchar(50),
	mausac varchar(50),
	gia varchar(50),
	soluongco int,
	primary key (masanpham)
)
create table Cungung
(
	mact int references CongTy(mact),
	masanpham int references SanPham(masanpham),
	soluongban int
)
-- default of mau is 'do'
alter table 
	Sanpham
alter column 
	mausac 
set default 'do'
-- tensanpham is unique 
alter table 
	SanPham
add constraint 
	unique_tensanpham unique(tensanpham)
-- check soluongban must be greater than 0
alter table 
	cungung
add constraint 
	chk_gia_tri 
check 
	(soluongban > 0)
-- insert value to table
	--table 1
insert into 
	CongTy
values 	(123 , 'Cong Ty A', 'Mo Cua', 'HaNoi'),
		(456 , 'Cong Ty B', 'Dong Cua', 'DaNang'),
		(789 , 'Cong Ty C', 'Mo Cua', 'HoChiMinh')
	--table 2
insert into 
	SanPham
values 	(11 , 'Hang 1', '', '30$', '3'),
		(22 , 'Hang 2', 'Xanh', '20$', '4'),
		(33 , 'Hang 3', 'vang', '10$', '5')
	--table 3
insert into
	cungung   
values	(123, 11, 3),
		(456, 22, 4),
		(789, 33, 5),
		(123, 22, 6),
		(456, 11, 7),
		(789, 22, 8),
-- show all data from table
select * from congty
select * from sanpham order by masanpham
select * from cungung

