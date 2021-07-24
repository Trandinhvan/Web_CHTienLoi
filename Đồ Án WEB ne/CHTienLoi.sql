CREATE DATABASE PTPM_CHTIENLOI
GO
USE PTPM_CHTIENLOI
CREATE TABLE [dbo].[_TK_Admin]
(
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	CONSTRAINT PK_AD PRIMARY KEY(Username),
)

CREATE TABLE [dbo].[KhachHang]
(
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[DienThoai] [varchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	CONSTRAINT PK_KH PRIMARY KEY(MaKH),
)

CREATE TABLE [dbo].[Loai]
(
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	CONSTRAINT PK_LOAI PRIMARY KEY(MaLoai),
)
CREATE TABLE [dbo].[NhaSanXuat]
(
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [varbinary](50) NULL,
	[Email] [varbinary](50) NULL,
	CONSTRAINT PK_NSX PRIMARY KEY(MaNSX),
)
CREATE TABLE [dbo].[SanPham]
(
	[MaSanPham] [int] NOT NULL,
	[TenSanPham] [nvarchar](max) NULL,
	[GiaBan] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
	[NgayCapNhat] [datetime] NULL,
	[AnhBia] [nvarchar](max) NULL,
	[SoLuongTon] [int] NULL,
	[MaLoai] [int] NULL,
	[MaNSX] [int] NULL,
	CONSTRAINT PK_SanPham PRIMARY KEY(MaSanPham),
)
ALTER TABLE SanPham ADD CONSTRAINT FK_SP_LOAI FOREIGN KEY(MaLoai) REFERENCES Loai(MaLoai)
ALTER TABLE SanPham ADD CONSTRAINT FK_SP_NSX FOREIGN KEY(MaNSX) REFERENCES NhaSanXuat(MaNSX)

CREATE TABLE [dbo].[DonHang]
(
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayGiao] [datetime] NULL,
	[NgayDat] [datetime] NULL,
	[DaThanhToan] [bit] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[MaKH] [int] NULL,
	CONSTRAINT PK_DH PRIMARY KEY(MaDonHang),
)
ALTER TABLE DonHang ADD CONSTRAINT FK_DH_KH FOREIGN KEY(MaKH) REFERENCES KhachHang(MaKH)

CREATE TABLE [dbo].[ChiTietDonHang]
(
	[MaDonHang] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
	CONSTRAINT PK_CTDH PRIMARY KEY(MaDonHang,MaSanPham),
)

ALTER TABLE ChiTietDonHang ADD CONSTRAINT FK_CTDH_DH FOREIGN KEY(MaDonHang) REFERENCES DonHang(MaDonHang)
ALTER TABLE ChiTietDonHang ADD CONSTRAINT FK_CTDH_SP FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham)

INSERT INTO _TK_Admin
VALUES('ADMIN','123456')

SELECT * FROM KhachHang

SET DATEFORMAT DMY
SET IDENTITY_INSERT [dbo].[KhachHang] ON 
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (1, N'Trần Đình Văn', '19/06/1999', N'Nam', N'123456798', N'Ad', N'123', N'A@gmail.com', N'PY')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF

SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (1, N'Sữa')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (2, N'Đồ ăn vặt')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (3, N'Dụng cụ học tập')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (4, N'Nước giải khát')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (5, N'Trái cây')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (6, N'Vật dụng cá nhân')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (7, N'Mì tôm')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (8, N'Bia')
SET IDENTITY_INSERT [dbo].[Loai] OFF

SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai], [Email]) VALUES (1, N'VINAMILK', NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai], [Email]) VALUES (2, N'DUTCH LADY', NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai], [Email]) VALUES (3, N'NUTIFOOD', NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai], [Email]) VALUES (4, N'TCL', NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai], [Email]) VALUES (5, N'SUNTORY PEPSICO', NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai], [Email]) VALUES (6, N'Tân Hiệp Phát', NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai], [Email]) VALUES (7, N'Lavie', NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai], [Email]) VALUES (8, N'Sabeco', NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai], [Email]) VALUES (9, N'Heineken', NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai], [Email]) VALUES (10, N'CocaCola', NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai], [Email]) VALUES (11, N'CAMPUS', NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai], [Email]) VALUES (13, N'BURGUR KING', NULL, NULL, NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai], [Email]) VALUES (12, N'MCDONALS', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF

INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (1, N'Sữa chua Vinamilk',25000, N'Được sản xuất theo công nghệ lên men tự nhiên với Canxi và vitamin D3 cho hệ xương chắc khỏe.', '10/07/2021',N'suachuvinamilk.jpg', 200, 1, 1)
INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (2, N'Sữa Vinamilk',7000, N'Sữa tươi Vinamilk được sản xuất tại Việt Nam đạt chuẩn vệ sinh an toàn thực phẩm.','10/07/2021',N'vinamilk.jpg', 200, 1, 1)
INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (3, N'Sting',25000, N'Nước giải khát String, giải tỏa cơn khát.', '10/07/2021',N'sting.jpg', 200, 4, 6)
INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (4, N'Coca',7000, N'Nước uống coca sản phẩm bán chạy số 1 thế giới.','10/07/2021',N'coca.jpg', 200, 4, 10)

INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (5, N'Sữa chua Dutch Lady',22000, N'Được sản xuất theo công nghệ lên men tự nhiên với Canxi và vitamin D3 cho hệ xương chắc khỏe.', '10/07/2021',N'suachuaducklady.png', 200, 1, 2)

INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (6, N'Sữa tươi Dutch Lady',6000, N'Sữa tươi Dutch Lady được sản xuất tại Việt Nam đạt chuẩn vệ sinh an toàn thực phẩm.', '10/07/2021',N'suachuaducklady.png', 200, 1, 2)


INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (7, N'Bia Heineken',22000, N'Bia Heineken, sản phẩm đến từ châu Âu, bia ngon nhất.', '10/07/2021',N'heineken.jpg', 200, 8, 9)



INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (8, N'Bia Tiger Nâu',18000, N'Bia Tiger Nâu, Bia công nghệ Đức ngon nhất hiện tại.', '10/07/2021',N'tigernau.jpg', 200, 8, 9)

INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (9, N'Nước Fanta Cam',6000, N'Nước ngọt Fanta vị cam, nguyên liệu tự liên.', '10/07/2021',N'fantacam.jpg', 200, 4, 10)
INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (11, N'Nước Fanta Nho',6000, N'Nước ngọt Fanta vị nho nguyên liệu tự liên.', '10/07/2021',N'fantanho.jpg', 200, 4, 10)

INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (10, N'Sprite',6000, N'Nước ngọt Sprite, nước uống giải tỏa cơn khát.', '10/07/2021',N'sprite.jpg', 200, 4, 10)

INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (12, N'Hamburgur Macdonals',50000, N'Hamburger thịt bò, sản phẩm bán chạy nhất MCDonal', '10/07/2021',N'mcdonalhamburgur.jpg', 200, 2, 12)
INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (13, N'Hamburgur gà',50000, N'Hamburger thịt gà, sản phẩm bán chạy nhất Burgur King', '10/07/2021',N'hamburgur.jpg', 200, 2, 13)

INSERT INTO [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaNSX]) 
VALUES (14, N'Vở Campus kẻ ngang',10000, N'Vở Campus kẻ ngang, sản phẩm chất lượng nhất.', '10/07/2021',N'vocampus.jpg', 200, 3, 11)

