-- create table
create table sv
(
	masv int,
	tensv varchar(50),
	que varchar(50),
	primary key (masv)
);
create table mon
(
	mamh int,
	tenmh varchar(50),
	sotc int,
	primary key (mamh)
);
create table ketqua
(
	masv int references sv(masv),
	mamh int references mon(mamh),
	diem decimal
)
-- add contraints
-- check 2 <= sotc <= 5
alter table
	mon
add constraint
	chk_gia_tri
check
	(sotc >= 2 and sotc <= 5)
-- default of sotc is 3
alter table 
	mon
alter column
	sotc
set default 
	3
-- unique of tenmh
alter table
	mon
add constraint
	unique_tenmh unique(tenmh)
-- check kq
alter table
	ketqua
add constraint
	chk_gia_tri
check
	(diem >= 0 and diem <= 10)
-- insert values
	-- table 1
insert into 
	sv
values	(123, 'Pham Van A', 'HaNoi'),
		(456, 'Pham Van B', 'ThaiBinh'),
		(789, 'Pham Van C', 'Haiphong')
	-- table 2
insert into
	mon
values	(1, 'CSDL', 5),
		(2, 'KTMT&HDH', 3),
		(3, 'TiengAnh', 4)
	-- table 3
insert into
	ketqua
values	(123, 1, 7.3),
		(123, 3, 6),
		(456, 2, 8.5),
		(456, 1, 5.3),
		(789, 3, 9),
		(789, 2, 8)
-- show all data
select * from sv
select * from mon
select * from ketqua
