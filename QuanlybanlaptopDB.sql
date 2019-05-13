USE [master]
GO
/****** Object:  Database [CongNgheWeb]    Script Date: 4/23/2019 10:01:48 PM ******/
CREATE DATABASE [CongNgheWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CongNgheWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CongNgheWeb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CongNgheWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CongNgheWeb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CongNgheWeb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CongNgheWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CongNgheWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CongNgheWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CongNgheWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CongNgheWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CongNgheWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [CongNgheWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CongNgheWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CongNgheWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CongNgheWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CongNgheWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CongNgheWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CongNgheWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CongNgheWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CongNgheWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CongNgheWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CongNgheWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CongNgheWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CongNgheWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CongNgheWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CongNgheWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CongNgheWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CongNgheWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CongNgheWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CongNgheWeb] SET  MULTI_USER 
GO
ALTER DATABASE [CongNgheWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CongNgheWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CongNgheWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CongNgheWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CongNgheWeb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CongNgheWeb]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 4/23/2019 10:01:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[TenDangNhap] [nchar](10) NOT NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_ADMIN] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietNhapKho]    Script Date: 4/23/2019 10:01:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietNhapKho](
	[ChiTietNhapKhoID] [int] NOT NULL,
	[NhapKhoID] [int] NULL,
	[SanPhamID] [int] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_ChiTietNhapKho] PRIMARY KEY CLUSTERED 
(
	[ChiTietNhapKhoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 4/23/2019 10:01:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanPham](
	[ChitietID] [int] NOT NULL,
	[SanPhamID] [int] NULL,
	[Model] [nvarchar](50) NULL,
	[CPU] [nchar](50) NULL,
	[CPUspeed] [nvarchar](50) NULL,
	[HDisk] [nvarchar](50) NULL,
	[KichThuocMan] [nvarchar](50) NULL,
	[DoPhanGiai] [nvarchar](50) NULL,
	[TrongLuong] [float] NULL,
	[RAM] [nchar](50) NULL,
 CONSTRAINT [PK_ChiTietSanPham] PRIMARY KEY CLUSTERED 
(
	[ChitietID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietXuatKho]    Script Date: 4/23/2019 10:01:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietXuatKho](
	[ChiTietXuatKhoID] [int] NOT NULL,
	[XuatKhoID] [int] NULL,
	[SanPhamID] [int] NULL,
	[SoLuong] [int] NULL,
	[TongTien] [money] NULL,
 CONSTRAINT [PK_ChiTietXuatKho] PRIMARY KEY CLUSTERED 
(
	[ChiTietXuatKhoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 4/23/2019 10:01:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[DanhMucID] [int] NOT NULL,
	[TenDanhMuc] [nchar](50) NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[DanhMucID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 4/23/2019 10:01:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[KhuyenMaiID] [int] NOT NULL,
	[TenKhuyenMai] [nvarchar](50) NULL,
	[TuNgay] [date] NULL,
	[DenNgay] [date] NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[KhuyenMaiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhapKho]    Script Date: 4/23/2019 10:01:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhapKho](
	[NhapKhoID] [int] NOT NULL,
	[NgayNhap] [date] NULL,
 CONSTRAINT [PK_NhapKho] PRIMARY KEY CLUSTERED 
(
	[NhapKhoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 4/23/2019 10:01:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[SanPhamID] [int] NOT NULL,
	[DanhMucID] [int] NULL,
	[KhuyenMaiID] [int] NULL,
	[TenSanPham] [nchar](50) NULL,
	[HinhAnh] [nchar](30) NULL,
	[Giá] [money] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[SanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER]    Script Date: 4/23/2019 10:01:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[UserID] [int] NOT NULL,
	[Password] [nchar](15) NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[SDT] [nchar](13) NULL,
	[email] [nchar](30) NULL,
	[DiaChi] [nvarchar](50) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[XuatKho]    Script Date: 4/23/2019 10:01:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XuatKho](
	[XuatKhoID] [int] NOT NULL,
	[UserID] [int] NULL,
	[NgayDat] [date] NULL,
 CONSTRAINT [PK_XuatKho] PRIMARY KEY CLUSTERED 
(
	[XuatKhoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChiTietNhapKho] ([ChiTietNhapKhoID], [NhapKhoID], [SanPhamID], [SoLuong]) VALUES (1, 1, 2, 5)
INSERT [dbo].[ChiTietNhapKho] ([ChiTietNhapKhoID], [NhapKhoID], [SanPhamID], [SoLuong]) VALUES (2, 2, 5, 2)
INSERT [dbo].[ChiTietNhapKho] ([ChiTietNhapKhoID], [NhapKhoID], [SanPhamID], [SoLuong]) VALUES (3, 3, 3, 4)
INSERT [dbo].[ChiTietNhapKho] ([ChiTietNhapKhoID], [NhapKhoID], [SanPhamID], [SoLuong]) VALUES (4, 4, 4, 5)
INSERT [dbo].[ChiTietNhapKho] ([ChiTietNhapKhoID], [NhapKhoID], [SanPhamID], [SoLuong]) VALUES (5, 3, 6, 6)
INSERT [dbo].[ChiTietNhapKho] ([ChiTietNhapKhoID], [NhapKhoID], [SanPhamID], [SoLuong]) VALUES (6, 2, 3, 2)
INSERT [dbo].[ChiTietNhapKho] ([ChiTietNhapKhoID], [NhapKhoID], [SanPhamID], [SoLuong]) VALUES (7, 5, 5, 6)
INSERT [dbo].[ChiTietNhapKho] ([ChiTietNhapKhoID], [NhapKhoID], [SanPhamID], [SoLuong]) VALUES (8, 6, 3, 8)
INSERT [dbo].[ChiTietNhapKho] ([ChiTietNhapKhoID], [NhapKhoID], [SanPhamID], [SoLuong]) VALUES (9, 7, 7, 3)
INSERT [dbo].[ChiTietNhapKho] ([ChiTietNhapKhoID], [NhapKhoID], [SanPhamID], [SoLuong]) VALUES (10, 8, 9, 5)
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (1, 1, N'7490', N'8th Gen Intel® Core™ i7 8650U                     ', N'1.9GHz up to 4.2GHz', N'HDD 1TB', N'14 ', N'Full HD (1920 x 1080)', 1.4, N'4GB                                               ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (2, 2, N'42LT740017', N'Intel® Core™ i5 8350U                             ', N'1.70GHz upto 3.60GHz', N'256GB M.2 SSD', N'15.6 ', N'1920x1080', 1.4, N'8GB DDR4 (Còn 1 khe)                              ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (3, 3, N'X302LA ', N'8th Gen Intel® Core™ i7 8650U Processor           ', N'1.9GHz up to 4.2GHz', N'HDD 512GB', N'14 ', N'1920 x 1080', 1.2, N'16GB 2400MHz DDR4                                 ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (4, 4, N'DXDIAG', N'Intel® Core™ i7 8650U Processor                   ', N'1.9GHz up to 4.2GHz', N'256GB SSD', N'14 ', N'1024x768', 1.4, N'8GB 2400MHz DDR4                                  ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (5, 5, N'AU1IGH', N'Intel® Core™ i7-8565U                             ', N'1.80 upto 4.60GHz', N'256GB PCIe SSD', N'13.3 ', N'1366x768', 1.46, N'8GB DDR4 2666MHz                                  ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (6, 6, N'20M5S01200', N'Intel Core i5-8250U                               ', N'1.60GHz Upto 3.40GHz', N'256GB PCIe SSD ', N'13.3', N'1366x768', 1.46, N'4GB DDR4 2400MHz                                  ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (7, 7, N'20LWS00C00', N'Intel® Core™ i5-8250U                             ', N'1.60GHz up to 3.40GHz', N'1TB', N'15.6', N'1920x1080', 2, N'      8GB DDR4  bus 2400MHz                       ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (8, 8, N'20M5S01500', N'Intel Core i5-8250U                               ', N'1.6GHz Upto 3.4GHz', N'256GB PCIe SSD ', N'13.3', N'1920x1080', 1.46, N'4GB DDR4 2400MHz                                  ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (9, 9, N'2GV27PA', N'Intel Core i5-8250U                               ', N'1.6GHz Upto 3.4GHz', N'256GB PCIe SSD', N'13.3', N'1920x1080', 1.46, N'4GB DDR4 2400MHz                                  ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (10, 10, N'5JN09PA', N'Intel® Core™ i3-8145U Processor                   ', N'2.1GHz up to 3.90 GHz', N'1TB SATA 5400rpm', N'14.0', N'1920x1080', 1.6, N'4GB onboard DDR4 24000MHz                         ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (11, 11, N'3MR84PA', N' CPU	Intel® Core™ i5-8250U                        ', N'1.60GHz upto 3.40GHz', N'1TB SATA 5400rpm', N'14.0', N'1920x1080', 1.63, N'4GB DDR4  bus 2400MHz                             ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (12, 12, N'5JL24PA', N'Intel® Core™ i5-8265U                             ', N'1.6GHz up to 3.9GHz', N'1TB 5400 rpm SATA', N'15.6', N'1920 x 1080', 1.85, N'4GB DDR4 (1 x 4GB) bus 2400MHz                    ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (13, 13, N'A4127T', N'Intel® Core™ i5-8265U                             ', N'1.60 upto 3.90GHz', N'512GB SSD M.2 PCIe', N'13.3', N'1920 x 1080', 1.09, N'8GB LPDDR3 2133 MHz                               ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (14, 14, N'A4117T', N'Intel® Core™ i5-8265U                             ', N'1.60 upto 3.90GHz', N'512GB SSD M.2 PCIe', N'13.3', N'1920 x 1080', 1.09, N'8GB LPDDR3 2133 MHz                               ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (15, 15, N'A4184T', N'Intel® Core™ i5-8265U                             ', N'1.60 upto 3.90GHz', N'512GB SSD M.2 PCIe', N'13.3', N'1920 x 1080', 1.09, N'8GB LPDDR3 2133 MHz                               ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (16, 16, N'A9027T', N'Intel® Core™ i7-8565U                             ', N'1.80GHz Up to 4.60 GHz', N'512GB SSD M.2 PCIe', N'15.6', N'1920 x 1080', 1.59, N'8GB LPDDR3 2133 MHz                               ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (17, 17, N'NX.H7QSV.002', N'Intel® Core™ i7-8565U                             ', N'1.80 upto 4.60GHz', N'256GB SSD PCIe', N'15.6', N'1920*1080', 0.99, N'8GB DDR4 bus 2400MHz                              ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (18, 18, N'NX.H69SV.002', N'Intel® Core™ i7-8565U                             ', N'1.80 upto 4.60GHz', N'256GB SSD PCIe', N'15.6', N'1920*1080', 0.99, N'8GB DDR4 bus 2400MHz                              ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (19, 19, N'NX.H3ZSV.002', N'Intel® Core i5-8250U                              ', N'1.60GHz upto 3.40GHz', N'256GB SSD PCIe', N'13.3', N'1920*1080', 1.35, N'4GB DDR4                                          ')
INSERT [dbo].[ChiTietSanPham] ([ChitietID], [SanPhamID], [Model], [CPU], [CPUspeed], [HDisk], [KichThuocMan], [DoPhanGiai], [TrongLuong], [RAM]) VALUES (20, 20, N'NX.GZCSV.005', N'Intel® Core i7-8550U Processor                    ', N'1.80 GHz up to 4.00 GHz', N'128GB SSD', N'15.6', N'1920*1080', 1.7, N'8GB DDR4                                          ')
INSERT [dbo].[ChiTietXuatKho] ([ChiTietXuatKhoID], [XuatKhoID], [SanPhamID], [SoLuong], [TongTien]) VALUES (1, 1, 1, 2, NULL)
INSERT [dbo].[ChiTietXuatKho] ([ChiTietXuatKhoID], [XuatKhoID], [SanPhamID], [SoLuong], [TongTien]) VALUES (2, 2, 2, 3, NULL)
INSERT [dbo].[ChiTietXuatKho] ([ChiTietXuatKhoID], [XuatKhoID], [SanPhamID], [SoLuong], [TongTien]) VALUES (3, 3, 3, 4, NULL)
INSERT [dbo].[ChiTietXuatKho] ([ChiTietXuatKhoID], [XuatKhoID], [SanPhamID], [SoLuong], [TongTien]) VALUES (4, 4, 4, 5, NULL)
INSERT [dbo].[ChiTietXuatKho] ([ChiTietXuatKhoID], [XuatKhoID], [SanPhamID], [SoLuong], [TongTien]) VALUES (5, 5, 6, 6, NULL)
INSERT [dbo].[ChiTietXuatKho] ([ChiTietXuatKhoID], [XuatKhoID], [SanPhamID], [SoLuong], [TongTien]) VALUES (6, 8, 3, 7, NULL)
INSERT [dbo].[ChiTietXuatKho] ([ChiTietXuatKhoID], [XuatKhoID], [SanPhamID], [SoLuong], [TongTien]) VALUES (7, 7, 5, 2, NULL)
INSERT [dbo].[ChiTietXuatKho] ([ChiTietXuatKhoID], [XuatKhoID], [SanPhamID], [SoLuong], [TongTien]) VALUES (8, 6, 7, 6, NULL)
INSERT [dbo].[ChiTietXuatKho] ([ChiTietXuatKhoID], [XuatKhoID], [SanPhamID], [SoLuong], [TongTien]) VALUES (9, 2, 2, 7, NULL)
INSERT [dbo].[ChiTietXuatKho] ([ChiTietXuatKhoID], [XuatKhoID], [SanPhamID], [SoLuong], [TongTien]) VALUES (10, 1, 8, 1, NULL)
INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc]) VALUES (1, N'dell                                              ')
INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc]) VALUES (2, N'lenovo                                            ')
INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc]) VALUES (3, N'hp                                                ')
INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc]) VALUES (4, N'hp                                                ')
INSERT [dbo].[DanhMuc] ([DanhMucID], [TenDanhMuc]) VALUES (5, N'acer                                              ')
INSERT [dbo].[NhapKho] ([NhapKhoID], [NgayNhap]) VALUES (1, CAST(N'1998-08-20' AS Date))
INSERT [dbo].[NhapKho] ([NhapKhoID], [NgayNhap]) VALUES (2, CAST(N'2007-02-15' AS Date))
INSERT [dbo].[NhapKho] ([NhapKhoID], [NgayNhap]) VALUES (3, CAST(N'2016-02-28' AS Date))
INSERT [dbo].[NhapKho] ([NhapKhoID], [NgayNhap]) VALUES (4, CAST(N'2017-08-11' AS Date))
INSERT [dbo].[NhapKho] ([NhapKhoID], [NgayNhap]) VALUES (5, CAST(N'2019-05-19' AS Date))
INSERT [dbo].[NhapKho] ([NhapKhoID], [NgayNhap]) VALUES (6, CAST(N'2019-04-30' AS Date))
INSERT [dbo].[NhapKho] ([NhapKhoID], [NgayNhap]) VALUES (7, CAST(N'2018-03-08' AS Date))
INSERT [dbo].[NhapKho] ([NhapKhoID], [NgayNhap]) VALUES (8, CAST(N'2017-11-20' AS Date))
INSERT [dbo].[NhapKho] ([NhapKhoID], [NgayNhap]) VALUES (9, CAST(N'2019-04-23' AS Date))
INSERT [dbo].[NhapKho] ([NhapKhoID], [NgayNhap]) VALUES (10, NULL)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (1, 1, NULL, N'DELL VOSTRO V5481 V4I5227W                        ', N'~/img/dell_1.jpg              ', 17560000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (2, 1, NULL, N'DELL INSPIRON 5480A P92G001                       ', N'~/img/dell_2.jpg              ', 17590000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (3, 1, NULL, N'DELL INSPIRON 3467 M20NR3                         ', N'~/img/dell_3.jpg              ', 9290000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (4, 1, NULL, N'DELL LATITUDE                                     ', N'~/img/dell_4.jpg              ', 13790000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (5, 2, NULL, N'LENOVO THINKPAD L390 20NRS00500                   ', N'~/img/lenovo_1.jpg            ', 23890000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (6, 2, NULL, N'LENOVO THINKPAD L390 20NRS00100                   ', N'~/img/lenovo_2.jpg            ', 19290000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (7, 2, NULL, N'LENOVO THINKPAD L380 20M5S01200                   ', N'~/img/lenovo_3.jpg            ', 22990000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (8, 3, NULL, N'HP 15-DA0358TU 6KD02PA                            ', N'~/img/lenovo_4.jpg            ', 7190000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (9, 3, NULL, N'HP 15-DA1030TX 5NM13PA                            ', N'~/img/hp_1.jpg                ', 17590000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (10, 3, NULL, N'HP-14CK1004TU 5QH84PA                             ', N'~/img/hp_2.jpg                ', 12990000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (11, 3, NULL, N'HP 15-DA0036TX 4ME78PA                            ', N'~/img/hp_3.jpg                ', 16790000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (12, 4, NULL, N'ASUS F560UD-BQ055T                                ', N'~/img/hp_4.jpg                ', 16890000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (13, 4, NULL, N'ASUS F560UD-BQ400T                                ', N'~/img/asus_1.jpg              ', 14690000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (14, 4, NULL, N'ASUS F570ZD-E4297T                                ', N'~/img/asus_2.jpg              ', 16990000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (15, 4, NULL, N'ASUS E203NA-FD088T                                ', N'~/img/asus_3.jpg              ', 5690000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (16, 5, NULL, N'ACER SWIFT 5 SF515-51T-71Q1 NX.H7QSV.002          ', N'~/img/asus_4.jpg              ', 33290000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (17, 5, NULL, N'ACER SWIFT 5 SF514-53T-51EX NX.H7KSV.001          ', N'~/img/acer_1.jpg              ', 25990000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (18, 5, NULL, N'ACER SWIFT 5 SF514-53T-720R NX.H7HSV.002          ', N'~/img/acer_2.jpg              ', 27890000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (19, 5, NULL, N'ACER SWIFT 3 SF314-52-39CV NX.GNUSV.007 SILVER    ', N'~/img/acer_4.jpg              ', 13590000.0000)
INSERT [dbo].[SanPham] ([SanPhamID], [DanhMucID], [KhuyenMaiID], [TenSanPham], [HinhAnh], [Giá]) VALUES (20, 2, NULL, N'HP-14CK1004TU 5QH84PA                             ', N'~/img/acer_3.jpg              ', 12990000.0000)
INSERT [dbo].[USER] ([UserID], [Password], [TenKhachHang], [SDT], [email], [DiaChi]) VALUES (1, N'6789           ', N'Nguyễn Đình Cương', N'+84903278431 ', N'cuongdinh98hn@gmail.com       ', N'Hà Nội')
INSERT [dbo].[USER] ([UserID], [Password], [TenKhachHang], [SDT], [email], [DiaChi]) VALUES (2, N'8439           ', N'Phạm Tuấn Ngọc', N'+84932783292 ', N'ngoctreamngan@gmail.com       ', N'Hoài Đức')
INSERT [dbo].[USER] ([UserID], [Password], [TenKhachHang], [SDT], [email], [DiaChi]) VALUES (3, N'7483           ', N'Phạm Khắc Tư', N'+84927846721 ', N'tudungduong@gmail.com         ', N'Hải Hậu')
INSERT [dbo].[USER] ([UserID], [Password], [TenKhachHang], [SDT], [email], [DiaChi]) VALUES (4, N'1129           ', N'Nguyễn Thị Tươi', N'+84399027888 ', N'khongsonang@gmail.com         ', N'Hà Nam')
INSERT [dbo].[USER] ([UserID], [Password], [TenKhachHang], [SDT], [email], [DiaChi]) VALUES (5, N'4378           ', N'Đào Văn Tùng', N'+84387922020 ', N'tung69@gmail.com              ', N'Thanh Hóa')
INSERT [dbo].[USER] ([UserID], [Password], [TenKhachHang], [SDT], [email], [DiaChi]) VALUES (6, N'1903           ', N'Nguyễn Thị Trang', N'+8412345823  ', N'tranglangthang@gmail.com      ', N'Đông Anh')
INSERT [dbo].[USER] ([UserID], [Password], [TenKhachHang], [SDT], [email], [DiaChi]) VALUES (7, N'5748           ', N'Hoàng Châu Phi', N'+8489438134  ', N'trangsang@gmail.com           ', N'Sa Mạc')
INSERT [dbo].[USER] ([UserID], [Password], [TenKhachHang], [SDT], [email], [DiaChi]) VALUES (8, N'1203           ', N'Đinh La Thăng', N'+8432984721  ', N'thangthamnhung@gmail.com      ', N'Hà Nội')
INSERT [dbo].[USER] ([UserID], [Password], [TenKhachHang], [SDT], [email], [DiaChi]) VALUES (9, N'5832           ', N'Bạc Thị Hà', N'+8489237451  ', N'hatuthi@gmail.com             ', N'Bắc Kạn')
INSERT [dbo].[USER] ([UserID], [Password], [TenKhachHang], [SDT], [email], [DiaChi]) VALUES (10, N'4320           ', N'Nguyễn Khương Mạnh', N'+8401847812  ', N'manhdan@gmail.com             ', N'Hải Hậu')
INSERT [dbo].[XuatKho] ([XuatKhoID], [UserID], [NgayDat]) VALUES (1, 1, CAST(N'2018-02-11' AS Date))
INSERT [dbo].[XuatKho] ([XuatKhoID], [UserID], [NgayDat]) VALUES (2, 2, CAST(N'2019-03-22' AS Date))
INSERT [dbo].[XuatKho] ([XuatKhoID], [UserID], [NgayDat]) VALUES (3, 3, CAST(N'2019-03-08' AS Date))
INSERT [dbo].[XuatKho] ([XuatKhoID], [UserID], [NgayDat]) VALUES (4, 4, CAST(N'2019-03-26' AS Date))
INSERT [dbo].[XuatKho] ([XuatKhoID], [UserID], [NgayDat]) VALUES (5, 5, CAST(N'2019-01-01' AS Date))
INSERT [dbo].[XuatKho] ([XuatKhoID], [UserID], [NgayDat]) VALUES (6, 3, CAST(N'2018-12-25' AS Date))
INSERT [dbo].[XuatKho] ([XuatKhoID], [UserID], [NgayDat]) VALUES (7, 4, CAST(N'2018-11-20' AS Date))
INSERT [dbo].[XuatKho] ([XuatKhoID], [UserID], [NgayDat]) VALUES (8, 6, CAST(N'2019-05-01' AS Date))
INSERT [dbo].[XuatKho] ([XuatKhoID], [UserID], [NgayDat]) VALUES (9, 7, CAST(N'2019-01-23' AS Date))
INSERT [dbo].[XuatKho] ([XuatKhoID], [UserID], [NgayDat]) VALUES (10, 8, CAST(N'2018-12-31' AS Date))
ALTER TABLE [dbo].[ChiTietNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietNhapKho_NhapKho] FOREIGN KEY([NhapKhoID])
REFERENCES [dbo].[NhapKho] ([NhapKhoID])
GO
ALTER TABLE [dbo].[ChiTietNhapKho] CHECK CONSTRAINT [FK_ChiTietNhapKho_NhapKho]
GO
ALTER TABLE [dbo].[ChiTietNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietNhapKho_SanPham] FOREIGN KEY([SanPhamID])
REFERENCES [dbo].[SanPham] ([SanPhamID])
GO
ALTER TABLE [dbo].[ChiTietNhapKho] CHECK CONSTRAINT [FK_ChiTietNhapKho_SanPham]
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSanPham_SanPham] FOREIGN KEY([SanPhamID])
REFERENCES [dbo].[SanPham] ([SanPhamID])
GO
ALTER TABLE [dbo].[ChiTietSanPham] CHECK CONSTRAINT [FK_ChiTietSanPham_SanPham]
GO
ALTER TABLE [dbo].[ChiTietXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietXuatKho_SanPham] FOREIGN KEY([XuatKhoID])
REFERENCES [dbo].[SanPham] ([SanPhamID])
GO
ALTER TABLE [dbo].[ChiTietXuatKho] CHECK CONSTRAINT [FK_ChiTietXuatKho_SanPham]
GO
ALTER TABLE [dbo].[ChiTietXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietXuatKho_XuatKho] FOREIGN KEY([XuatKhoID])
REFERENCES [dbo].[XuatKho] ([XuatKhoID])
GO
ALTER TABLE [dbo].[ChiTietXuatKho] CHECK CONSTRAINT [FK_ChiTietXuatKho_XuatKho]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMuc] FOREIGN KEY([DanhMucID])
REFERENCES [dbo].[DanhMuc] ([DanhMucID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DanhMuc]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_KhuyenMai] FOREIGN KEY([KhuyenMaiID])
REFERENCES [dbo].[KhuyenMai] ([KhuyenMaiID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_KhuyenMai]
GO
ALTER TABLE [dbo].[XuatKho]  WITH CHECK ADD  CONSTRAINT [FK_XuatKho_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[USER] ([UserID])
GO
ALTER TABLE [dbo].[XuatKho] CHECK CONSTRAINT [FK_XuatKho_USER]
GO
USE [master]
GO
ALTER DATABASE [CongNgheWeb] SET  READ_WRITE 
GO
