--CREATE DATABASE ACCOUNTANT_MANAGEMENT
--USE ACCOUNTANT_MANAGEMENT
--DROP DATABASE ACCOUNTANT_MANAGEMENT
set dateformat dmy
create table NhaSanXuat
(
	MaNSX int not null primary key identity,
	TenNSX nvarchar(255),
	DiaChi nvarchar(255),
	SDT varchar(12)
)
create table LoaiSanPham
(
	MaLoaiSP int primary key identity,
	TenLoaiSP nvarchar(MAX),
)
create table SanPham
(
	MaSP int not null primary key identity,
	TenSP nvarchar(255),
	HinhAnh nvarchar(MAX),
	DonGia decimal(18,0),
	SoLuongTon int,
	DaBan int,
	MaNSX int,
	MaLoaiSP int,
	foreign key (MaNSX) references NhaSanXuat(MaNSX) on delete cascade,
	foreign key (MaLoaiSP) references LoaiSanPham(MaLoaiSP),
)
create table NhanVien
(
	MaNV nvarchar(30) primary key not null,
	HoTen nvarchar(100),
	DiaChi nvarchar(255),
	NgaySinh datetime,
	ChucVu nvarchar(50),
	Luong int,
	SoDienThoai nvarchar(20),
)
create table TaiKhoan
(
	MaTK int identity primary key not null,
	TK nvarchar(50),
	MK varchar(50),
	MaNV nvarchar(30),
	Quyen nvarchar(10),
	TrangThai nvarchar(10),
	foreign key (MaNV) references NhanVien(MaNV) on delete cascade
)
create table KhachHang
(
	MaKH int identity primary key not null,
	Hoten nvarchar(255),
	DiaChi nvarchar(255),
	NgaySinh datetime,
	SoDienThoai nvarchar(20),
)
create table PhieuNhap
(
	MaPN int not null primary key identity,
	MaNSX int,
	NgayNhap datetime,
	foreign key (MaNSX) references NhaSanXuat(MaNSX) on delete cascade
)
create table ChiTietPhieuNhap
(
	MaChiTietPN int not null primary key identity,
	MaPN int,
	MaSP int,
	DonGiaNhap decimal(18,0),
	SoLuongNhap int,
	foreign key (MaPN) references PhieuNhap(MaPN) on delete cascade,
	foreign key (MaSP) references SanPham(MaSP)
)
create table HoaDon
(
	MaHD nvarchar(10) primary key not null,
	NgayBan datetime,
	MaKH int,
	MaNV nvarchar(30),
	TongTien decimal(18,0),
	foreign key (MaKH) references KhachHang(MaKH) on delete cascade,
	foreign key (MaNV) references NhanVien(MaNV) on delete cascade,
)
create table ChiTietHoaDon
(
	MaCTHD int identity primary key not null,
	MaHD nvarchar(10),
	MaSP int,
	TenSP nvarchar(255),
	SoLuong int,
	DonGia decimal(18,0),
	foreign key (MaHD) references HoaDon(MaHD) on delete cascade,
	foreign key (MaSP) references SanPham(MaSP) on delete cascade,
)



insert into NhanVien values('U001',N'Nguyen Luu Tri',N'District 7','22/08/2001',N'Accountant','7000000','0936433424')

insert into TaiKhoan values('tri','123','U001','User','Offline')
insert into TaiKhoan values('admin','123',null,'Admin','Offline')

insert into KhachHang values(N'John Wick',N'TPHCM','24/12/2001','0934553228')
insert into KhachHang values(N'Bill',N'Hanoi','21/07/2001','0961122322')
insert into KhachHang values(N'Jeff',N'Los Angeles','09/03/2001','0912345678')

insert into NhaSanXuat values(N'DRINK PROVIDER CO.',N'LOS ANGELES','0986234411')

insert into LoaiSanPham values(N'Nước ngọt')
insert into LoaiSanPham values(N'Bia')
insert into LoaiSanPham values(N'Rượu')
insert into LoaiSanPham values(N'Sữa')
insert into LoaiSanPham values(N'Nước lọc')

insert into SanPham values(N'Coca Cola',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\coca.jpg',10000,100,20,1,1)
insert into SanPham values(N'Pepsi',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\pepsi.jpg',11000,100,20,1,1)
insert into SanPham values(N'7UP',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\7up.jpg',12000,100,20,1,1)
insert into SanPham values(N'Heineken',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\heineken.jpg',14000,100,20,1,2)
insert into SanPham values(N'Tiger',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\coca.jpg',15000,100,20,1,2)
insert into SanPham values(N'Bia Sài Gòn',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\bsg.jpg',17000,100,20,1,2)
insert into SanPham values(N'Vodka',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\vodka.jpg',100000,100,20,1,3)
insert into SanPham values(N'Champagne',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\champagne.jpg',200000,100,20,1,3)
insert into SanPham values(N'Rượu đế',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\Ruoude.jpg',320000,100,20,1,3)
insert into SanPham values(N'Vinamilk',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\vinamilk.jpg',7000,100,20,1,4)
insert into SanPham values(N'Dutch Lady',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\dutch.jpg',8000,100,20,1,4)
insert into SanPham values(N'Lothamilk',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\lotha.jpg',12000,100,20,1,4)
insert into SanPham values(N'Lavie',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\lavie.jpg',5000,100,20,1,5)
insert into SanPham values(N'Aquafina',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\aqua.jpg',6000,100,20,1,5)
insert into SanPham values(N'Dasani',N'C:\Users\Admin\Desktop\SE_FP_G9\Source\QuanLyBanHang\Resources\dasani.jpg',6000,100,20,1,5)

insert into HoaDon values('HD001','05/01/2022',1,'U001',10000)
insert into HoaDon values('HD002','05/01/2022',2,'U001',320000)
insert into HoaDon values('HD003','05/01/2022',3,'U001',12000)

insert into ChiTietHoaDon values('HD001',5,N'Coca Cola',3,10000)
insert into ChiTietHoaDon values('HD002',6,N'Rượu đế',1,320000)
insert into ChiTietHoaDon values('HD003',2,N'Dasani',2,12000)