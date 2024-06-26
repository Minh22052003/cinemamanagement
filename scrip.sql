USE [master]
GO
/****** Object:  Database [phim]    Script Date: 11/1/2023 10:23:51 PM ******/
CREATE DATABASE [phim]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'phim', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\phim.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'phim_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\phim_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [phim] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [phim].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [phim] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [phim] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [phim] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [phim] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [phim] SET ARITHABORT OFF 
GO
ALTER DATABASE [phim] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [phim] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [phim] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [phim] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [phim] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [phim] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [phim] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [phim] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [phim] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [phim] SET  DISABLE_BROKER 
GO
ALTER DATABASE [phim] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [phim] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [phim] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [phim] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [phim] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [phim] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [phim] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [phim] SET RECOVERY FULL 
GO
ALTER DATABASE [phim] SET  MULTI_USER 
GO
ALTER DATABASE [phim] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [phim] SET DB_CHAINING OFF 
GO
ALTER DATABASE [phim] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [phim] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [phim] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [phim] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [phim] SET QUERY_STORE = OFF
GO
USE [phim]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 11/1/2023 10:23:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPhim] [int] NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayDang] [date] NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[DanhGia] [int] NOT NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 11/1/2023 10:23:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[id] [int] NOT NULL,
	[TenDanhMuc] [varchar](50) NOT NULL,
	[id_Phim] [int] NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ghe]    Script Date: 11/1/2023 10:23:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ghe](
	[ghe_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Loai_id] [int] NULL,
	[TringTrang] [bit] NOT NULL,
	[Id_phong] [int] NULL,
	[Id_Ve] [int] NULL,
	[TenGhe] [varchar](50) NULL,
 CONSTRAINT [PK_Ghe] PRIMARY KEY CLUSTERED 
(
	[ghe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichChieu]    Script Date: 11/1/2023 10:23:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichChieu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPhong] [int] NULL,
	[NgayChieu] [datetime] NOT NULL,
	[GioBatDau] [varchar](50) NOT NULL,
	[GioKetThuc] [varchar](50) NOT NULL,
	[IdPhim] [int] NULL,
 CONSTRAINT [PK_LichChieu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiGhe]    Script Date: 11/1/2023 10:23:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiGhe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiGhe] [nvarchar](max) NOT NULL,
	[GiaGhe] [float] NOT NULL,
 CONSTRAINT [PK_LoaiGhe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhim]    Script Date: 11/1/2023 10:23:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_LoaiPhim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoiDung]    Script Date: 11/1/2023 10:23:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoiDung](
	[id] [int] NOT NULL,
	[Id_binhLuan] [int] NULL,
	[Id_TaiKhoan] [int] NULL,
 CONSTRAINT [PK_NoiDung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phim]    Script Date: 11/1/2023 10:23:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenPhim] [nvarchar](max) NOT NULL,
	[AnhPhim] [nvarchar](max) NOT NULL,
	[ThoiLuong] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[TinhTrang] [bit] NOT NULL,
	[IdLoaiPhim] [int] NOT NULL,
	[DienVien] [nvarchar](max) NOT NULL,
	[DaoDien] [varchar](max) NOT NULL,
	[NgayCongChieu] [datetime] NOT NULL,
	[NgayKetThuc] [datetime] NOT NULL,
	[NamPhatHanh] [varchar](50) NULL,
	[ChatLuong] [varchar](50) NULL,
 CONSTRAINT [PK_Phim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 11/1/2023 10:23:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRapChieu] [int] NULL,
	[TenPhong] [nvarchar](max) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[TrinhTrang] [bit] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RapPhim]    Script Date: 11/1/2023 10:23:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RapPhim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenRapChieu] [nvarchar](50) NOT NULL,
	[TongSoPhong] [int] NOT NULL,
	[ThanhPho] [nvarchar](max) NULL,
	[QuanHuyen] [nvarchar](max) NULL,
	[PhuongXa] [nvarchar](max) NULL,
	[KhungGio] [nvarchar](max) NULL,
 CONSTRAINT [PK_RapChieuPhim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/1/2023 10:23:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](max) NULL,
	[MatKhau] [nvarchar](60) NULL,
	[NgayDangKy] [date] NULL,
	[TinhTrang] [bit] NULL,
	[PhanQuyen] [varchar](50) NULL,
	[id_ThongTin] [int] NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTin]    Script Date: 11/1/2023 10:23:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTin](
	[ThongTin_id] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiDung] [nvarchar](max) NULL,
	[DiaChi] [varchar](max) NULL,
	[GioiTinh] [nvarchar](max) NULL,
	[NgaySinh] [datetime] NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_ThongTin] PRIMARY KEY CLUSTERED 
(
	[ThongTin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ve]    Script Date: 11/1/2023 10:23:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ve](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTaiKhoan] [int] NULL,
	[IdRap] [int] NULL,
	[NgayDat] [datetime2](7) NULL,
	[GiaVe] [decimal](18, 2) NULL,
	[Id_LichChieu] [int] NULL,
	[Soluong] [int] NULL,
 CONSTRAINT [PK_Ve] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ghe] ON 

INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (1, 1, 1, 1, 21, N'A1')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (2, 1, 0, 1, NULL, N'A2')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (4, 1, 0, 1, NULL, N'A4')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (5, 1, 1, 1, 15, N'A5')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (6, 2, 0, 1, NULL, N'A6')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (7, 2, 0, 1, NULL, N'A7')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (8, 2, 1, 1, 22, N'A8')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (10, 1, 0, 1, NULL, N'9A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (12, 1, 0, 1, NULL, N'8A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (13, 1, 0, 1, NULL, N'7A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (14, 1, 0, 1, NULL, N'6A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (15, 1, 1, 1, 10, N'5A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (16, 2, 0, 1, NULL, N'4A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (18, 2, 0, 1, NULL, N'2A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (19, 2, 0, 1, NULL, N'1A')
INSERT [dbo].[Ghe] ([ghe_id], [Loai_id], [TringTrang], [Id_phong], [Id_Ve], [TenGhe]) VALUES (21, 2, 0, 1, NULL, N'AA')
SET IDENTITY_INSERT [dbo].[Ghe] OFF
GO
SET IDENTITY_INSERT [dbo].[LichChieu] ON 

INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (1, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (2, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'20:20', N'21:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (3, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'21-20', N'11:50', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (4, 1, CAST(N'2021-12-22T00:00:00.000' AS DateTime), N'10:30', N'11:30', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (5, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'21-20', N'11:50', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (6, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (7, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (8, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (9, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (10, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (11, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'20:20', N'21:20', NULL)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (12, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', 4)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (13, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'20:20', N'21:20', 4)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (14, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'21-20', N'11:50', 3)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (15, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', 11)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (16, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'21-20', N'11:50', 4)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (17, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', 3)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (18, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'21-20', N'11:50', 4)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (19, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', 5)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (20, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', 5)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (21, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', 2)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (22, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', 2)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (23, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', 2)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (24, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', 2)
INSERT [dbo].[LichChieu] ([Id], [IdPhong], [NgayChieu], [GioBatDau], [GioKetThuc], [IdPhim]) VALUES (25, 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'19:30', N'20:20', 3)
SET IDENTITY_INSERT [dbo].[LichChieu] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiGhe] ON 

INSERT [dbo].[LoaiGhe] ([Id], [TenLoaiGhe], [GiaGhe]) VALUES (1, N'Vip', 95000)
INSERT [dbo].[LoaiGhe] ([Id], [TenLoaiGhe], [GiaGhe]) VALUES (2, N'Thường', 45000)
SET IDENTITY_INSERT [dbo].[LoaiGhe] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiPhim] ON 

INSERT [dbo].[LoaiPhim] ([Id], [TenLoai]) VALUES (1, N'Hành Động')
INSERT [dbo].[LoaiPhim] ([Id], [TenLoai]) VALUES (2, N'Siêu Anh Hung')
INSERT [dbo].[LoaiPhim] ([Id], [TenLoai]) VALUES (3, N'Hoạt Hình')
INSERT [dbo].[LoaiPhim] ([Id], [TenLoai]) VALUES (4, N'Kinh Dị')
SET IDENTITY_INSERT [dbo].[LoaiPhim] OFF
GO
SET IDENTITY_INSERT [dbo].[Phim] ON 

INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (2, N' Người Hùng Tia Chớp', N'Tiachop.jpg', 121, N'Người Hùng Tia Chớp Phần 8 Mùa thứ tám của loạt phim truyền hình siêu anh hùng Mỹ The Flash , dựa trên nhân vật Barry Allen / Flash của DC Comics , được công chiếu lần đầu trên The CW vào ngày 16 tháng 11 năm 2021. Phim lấy bối cảnh ở Arrowverse , chia sẻ tính liên tục với phần còn lại loạt phim truyền hình về vũ trụ, và là phần phụ của Arrow . Phần này được sản xuất bởi Berlanti Productions , Warner Bros. Television và DC Entertainment , với Eric Wallace làm người dẫn chương trình', 0, 3, N' Grant Gustin, Candice Patton, Danielle', N' Greg Berlanti,', CAST(N'2021-12-16T00:00:00.000' AS DateTime), CAST(N'2021-12-29T00:00:00.000' AS DateTime), N'2021', N'FULL HD VIETSUB')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (3, N'Người Dơi', N'p.jpg', 231, N'Người Dơi Trong năm thứ hai chiến đấu với tội phạm, Batman phát hiện ra tham nhũng ở thành phố Gotham , nơi kết nối với gia đình của chính anh ta trong khi đối mặt với một kẻ giết người hàng loạt được gọi là Riddler .', 1, 1, N'Robert Pattinson, Zoë Kravitz, Colin Farrell,', N'Matt Reeves,', CAST(N'2022-01-11T00:00:00.000' AS DateTime), CAST(N'2022-06-23T00:00:00.000' AS DateTime), N'2022', N'full hd')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (4, N'Injustice', N'juccuyu.jpg', 123, N'Injustice Trên một Trái đất thay thế, Joker lừa Superman giết Lois Lane, điều này gây ra một cơn thịnh nộ trong anh hùng. Superman quyết định nắm quyền kiểm soát Trái đất, Batman và các đồng minh của anh ta sẽ phải cố gắng ngăn chặn anh ta.', 1, 1, N'Gillian Jacobs, Laura Bailey,', N': Matt Peters,', CAST(N'2021-12-24T00:00:00.000' AS DateTime), CAST(N'2021-12-29T00:00:00.000' AS DateTime), N'2021', N'HD')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (5, N'Liên Minh Công Lý: Phiên bản của Zack Snyder', N'LienMinhCL2021.jpg', 242, N'Liên Minh Công Lý: Phiên bản của Zack Snyder Năm nghìn năm trước, Darkseid và đội quân Parademon của anh ta cố gắng chinh phục Trái đất bằng cách sử dụng ba Hộp Mẹ . Họ bị đánh bại bởi một liên minh của Các vị thần già , Amazons , người Atlantis , con người và Green Lantern , để lại những Hộp Mẹ, được giấu riêng biệt. Hiện tại, cái chết của Superman [b] đã kích hoạt lại Boxes, thu hút Steppenwolf , trung úy thất sủng của Darkseid. Steppenwolf đặt mục tiêu giành lại sự ưu ái của Darkseid bằng cách thu thập các hộp để tạo thành "The Unity", biến Trái đất thành một bản sao của Apokolips, quê hương của họ.', 1, 1, N'Jared Leto, Henry Cavill, Ray Porter, Sergi', N'Zack Snyder,', CAST(N'2021-12-23T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), N'2021', N'HD ')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (6, N'Suicide Squad: Biệt Đội Cảm Tử 2', N'bietDoiCamTu.jpg', 132, N'Suicide Squad: Biệt Đội Cảm Tử 2 Theo lệnh của sĩ quan tình báo Amanda Waller , mười ba tù nhân từ trại giam Belle Reve — cựu bác sĩ tâm thần Harley Quinn ; Nanaue lai ăn thịt người ; Thuyền trưởng tên trộm người Úc Boomerang ; sát thủ Bloodsport ; Nhà tạo hòa bình cực đoan bạo lực ; metahumans TDK . và Polka-Dot Man ; hacker máy tính Savant ; lính đánh thuê Blackguard ; cựu vận động viên Olympic Javelin ; chiến binh ngoài hành tinh Mongal ; tên cướp điều khiển chuột Ratcher 2 ; và Chồn hình người ăn thịt đồng loại—Đ', 1, 2, N'John Cena, Margot Robbie, Pete Davidson,', N'James Gunn,', CAST(N'2021-11-30T00:00:00.000' AS DateTime), CAST(N'2022-01-06T00:00:00.000' AS DateTime), N'2021', N'HD')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (7, N' Biệt Đội Cảm Tử', N'bietDoiCamTu1.jpg', 123, N'Biệt Đội Cảm Tử Trong phim "Biệt Đội Cảm Tử" Suicide Squad là bộ phim được chuyển thể từ truyện tranh DC Comics xoay quanh một đội tội phạm bao gồm những siêu phản diện. Có thể kể đến như Joker, Deadshot, Captain Boomerang, Slipknot, Katana, The Enchantress, Killer Croc, Rick Flag ... và cô nàng "người tình của Joker". Harley Quinn. Họ buộc phải làm việc cho Amanda Waller, một nhân vật quyền lực trong chính phủ. Tất cả những tên tội phạm này đều từng là kẻ thù của Batman.
Xem Biệt Đội Cảm Tử 2', 1, 2, N'Ben Affleck, Will Smith, Jared Leto, Margot', N'David Ayer,', CAST(N'2021-12-09T00:00:00.000' AS DateTime), CAST(N'2021-12-22T00:00:00.000' AS DateTime), N'2016', N'HD')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (8, N' Siêu Anh Hùng Phá Hoại', N'sieuanhPhahoa.jpg', 124, N'Siêu Anh Hùng Phá Hoại (Phần 2) Siêu Anh Hùng Phá Hoại (Phần 2)
1 Trong khi các quan chức Hoa Kỳ thảo luận về những siêu nhân phục vụ với Giám đốc điều hành của Vought Stan Edgar, Noir giết Naqib ở Trung Đông và Homelander chủ trì đám tang của Translucent. Giờ đây, những kẻ đào tẩu bị truy nã với Butcher bị buộc tội giết Stillwell, Hughie ẩn náu dưới một Cửa hàng cầm đồ cùng với Milk, Frenchie và Kimiko trong khi Butcher mất tích. Họ biết rằng một tên khủng bố siêu mạnh v', 1, 2, N'Karl Urban, Jack Quaid, Antony Starr, Erin Moriarty, Dominique Mcelligott, Jessie T. Usher, Laz Alonso, Chace Crawford, Tomer Capon, Nathan Mitchell, Shantel Vansanten, Elisabeth Shue, Aya Cash, Laila Robins, Nicola Correia-Damude, Cameron Crovetti, Karen Fukuhara, C,', N'Eric Kripke,', CAST(N'2021-12-30T00:00:00.000' AS DateTime), CAST(N'2021-12-06T00:00:00.000' AS DateTime), NULL, N'2020')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (9, N'Aquaman: Đế vương Atlantis', N'Alantic.jpg', 123, N'Aquaman: Đế vương Atlantis Aquaman (2017) Arthur Curry biết rằng anh là người thừa kế vương quốc dưới nước Atlantis, anh phải đứng lên lãnh đạo người dân của mình và trở thành anh hùng của thế giới.
Sau các sự kiện của Justice League, Arthur Curry / Aquaman trở lại biển và bắt đầu đảm nhận quyền thừa kế vương quốc Atlantis dưới sự cố vấn của Công chúa Mera. Tuy nhiên, đế chế huyền thoại nhiều năm ẩn mình dưới đáy biển sâu Atlantics sắp trỗi dậy khi Orm quyết tâm chinh phục 7 chủng tộc dưới đáy đại dương để tiêu diệt toàn bộ sự sống trên trái đất. Giữa biển xanh cuộn sóng dữ dội nhất, Aquaman sẽ đương đầu với mọi thứ như thế nào để bảo vệ quê hương và thế giới?', 0, 2, N' Dolph Lundgren, Jason Momoa, Amber Heard', N'James Wan,', CAST(N'2021-12-14T00:00:00.000' AS DateTime), CAST(N'2022-01-04T00:00:00.000' AS DateTime), N'2018', N'HD')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (10, N' Huyền Thoại Rồng Đen: Scorpion Báo Thù', N'huyyenThoaiRD.jpg', 123, N'Huyền Thoại Rồng Đen: Scorpion Báo Thù Tại Nhật Bản , đại kiện tướng Shirai Ryu Hanzo Hasashi và cậu con trai nhỏ Satoshi bị phục kích trên đường về nhà bởi một vài ninja từ gia tộc đối thủ Lin Kuei. Hasashi giết tất cả bọn họ sau khi phát hiện ra Lin Kuei đã tàn sát phần còn lại của Shirai Ryu, bao gồm cả vợ Harumi. Sub-Zero của Lin Kuei xuất hiện, sử dụng khả năng đóng băng của mình để kiềm chế Hanzo trong băng và sau đó giết chết Satoshi. Sau đó, anh ta đâm Hanzo qua cổ bằng một cột băng, giết chết anh ta. Sâu bên dưới sâu thẳm của Netherrealm, Hasashi được hồi sinh một cách bí ẩn và gặp gỡ thầy phù thủy Quan C', 1, 4, N'ennifer Carpenter, Joel Mchale, Ike Amadi, Steve Blum, Artt Butler, Darin De Paul, Robin Atkin Downes, Grey Griffin, Kevin Michael Richardson, Jordan Rodrigues, Patrick Seitz, Fred Tatasciore, Dave B. Mitchell,', N'dc', CAST(N'2021-12-22T00:00:00.000' AS DateTime), CAST(N'2021-12-14T00:00:00.000' AS DateTime), N'2020', N'HD')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (11, N' Batman: Kỵ Sĩ Bóng Đêm', N'kisibongdem.jpg', 152, N'Batman: Kỵ Sĩ Bóng Đêm Kỵ sỹ bóng đêm (The Dark Knight) là một bộ phim siêu anh hùng do Christopher Nolan làm đạo diễn và đồng kịch bản năm 2008. Dựa trên nhân vật Batman của hãng truyện tranh DC Comics, bộ phim này là một phần của loạt 3 phim Batman do Christopher Nolan đạo diễn và là phần tiếp theo của bộ phim Huyền thoại Người Dơi (Batman Begins) sản xuất năm 2005. Christian Bale tiếp tục thủ vai chính Batman trong phim. Bộ phim tập trung vào cuộc chiến giữa Batman và kẻ thù mới: Joker (Heath Ledger), mối quan hệ của anh với c', 1, 4, N'Christian Bale, Heath Ledger,', N'Christopher Nolan,', CAST(N'2021-12-02T00:00:00.000' AS DateTime), CAST(N'2021-12-29T00:00:00.000' AS DateTime), N'2020', N'HD')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (12, N' Người Dơi Xuất Hiện', N'nguoiGioiXh.jpg', 123, N'Người Dơi Xuất Hiện Batman Begins là bộ phim siêu anh hùng dựa trên nhân vật giả tưởng trong truyện tranh của DC Comics là Batman, được đạo diễn bởi Christopher Nolan. Với Christian Bale trong vai Batman cùng với dàn diễn viên Michael Caine, Liam Neeson, Katie Holmes, Gary Oldman, và Morgan Freeman. Phim reboot lại series phim về Batman, kể câu chuyện về nguồn gốc nhân vật, từ nỗi sợ hãi ban đầ', 1, 4, N'Michael Caine, Christian Bale,', N'Christopher Nolan,', CAST(N'2021-12-07T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), N'2005', N'HD')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (13, N'LEGO DC Liên Minh Công Lý: Đại Chiến Thiên Hà', N'lego.jpg', 123, N'LEGO DC Liên Minh Công Lý: Đại Chiến Thiên Hà Justice League: Brainiac Machine, Lego DC Comics Super Heroes: Justice League Cosmic Clash 2016 Liệu Justice League có thể chống lại cỗ máy làm cong thời gian? Cho đến nay, Justice League đã chiến thắng mọi kẻ thù dám tuyên chiến với chúng. Lần này, họ phải đối mặt với Brainiac, một cỗ máy bất khả xâm phạm cực kỳ thông minh đang làm hại tất cả sự sống trên thế giới. Brainiac đã gửi Superman, Wonder Woman và Green Lantern đến những nơi khác nhau trong những thời điểm khác nhau, còn Batman và The Flash đang cố gắng thiết lập lại Justice League và chống lại cỗ má', 1, 3, N'Troy Baker, Nolan North, Grey Griffin,', N'Rick Morales,', CAST(N'2021-12-03T00:00:00.000' AS DateTime), CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'2016', N'HD')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (14, N' Người Đàn Ông Thép', N'danOngThe.jpg', 124, N'Người Đàn Ông Thép Man of Steel, Man Of Steel, Super Man of Steel (Siêu Nhân) - Man of Steel xoay quanh câu chuyện về một chàng trai trẻ tên là Clark Kent, anh ta là một người ngoài hành tinh được đưa đến Trái Đất và được một cặp vợ chồng bắt lấy. Jonathan - Martha nuôi dưỡng. Khi Trái đất bị tấn công bởi các thế lực siêu nhiên, Clark Kent trở thành anh hùng Superman bảo vệ người dân.', 1, 2, N'Henry Cavill, Amy Adams, Michael Shannon,', N': Zack Snyder,', CAST(N'2021-12-05T00:00:00.000' AS DateTime), CAST(N'2021-12-29T00:00:00.000' AS DateTime), N'2021', N'HD')
INSERT [dbo].[Phim] ([Id], [TenPhim], [AnhPhim], [ThoiLuong], [MoTa], [TinhTrang], [IdLoaiPhim], [DienVien], [DaoDien], [NgayCongChieu], [NgayKetThuc], [NamPhatHanh], [ChatLuong]) VALUES (27, N'Minh Vip', N'2205.png', 12, N'Minh dcm tuyệt vời', 1, 2, N'Minh,Tỉnh,Nam', N'Minh', CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(N'2023-11-18T00:00:00.000' AS DateTime), N'2023', N'Vip')
SET IDENTITY_INSERT [dbo].[Phim] OFF
GO
SET IDENTITY_INSERT [dbo].[Phong] ON 

INSERT [dbo].[Phong] ([Id], [IdRapChieu], [TenPhong], [SoLuong], [TrinhTrang], [MoTa]) VALUES (1, 2, N'Phong Vip', 13, 1, N'Phòng Cao Cấp')
INSERT [dbo].[Phong] ([Id], [IdRapChieu], [TenPhong], [SoLuong], [TrinhTrang], [MoTa]) VALUES (2, 6, N'Phòng VIP', 12, 1, N'ákjfusufbasfsafsafsa')
SET IDENTITY_INSERT [dbo].[Phong] OFF
GO
SET IDENTITY_INSERT [dbo].[RapPhim] ON 

INSERT [dbo].[RapPhim] ([Id], [TenRapChieu], [TongSoPhong], [ThanhPho], [QuanHuyen], [PhuongXa], [KhungGio]) VALUES (1, N'Cinestar Quốc Thanh ', 12, N'HCM', N'Q9', NULL, NULL)
INSERT [dbo].[RapPhim] ([Id], [TenRapChieu], [TongSoPhong], [ThanhPho], [QuanHuyen], [PhuongXa], [KhungGio]) VALUES (2, N'DCINE Bến Thành ', 12, N'HN', N'Mỹ Đình', NULL, NULL)
INSERT [dbo].[RapPhim] ([Id], [TenRapChieu], [TongSoPhong], [ThanhPho], [QuanHuyen], [PhuongXa], [KhungGio]) VALUES (4, N'Galaxy Nguyễn Du', 12, N'HCM', N'q1', NULL, NULL)
INSERT [dbo].[RapPhim] ([Id], [TenRapChieu], [TongSoPhong], [ThanhPho], [QuanHuyen], [PhuongXa], [KhungGio]) VALUES (5, N'Rap Đông Đa', 12, N'HN', N'HN', NULL, NULL)
INSERT [dbo].[RapPhim] ([Id], [TenRapChieu], [TongSoPhong], [ThanhPho], [QuanHuyen], [PhuongXa], [KhungGio]) VALUES (6, N'Rap Hoang Mai', 12, N'Hà Nội', N'Long Biên', N'Xa ss', N'7:30-21:29')
SET IDENTITY_INSERT [dbo].[RapPhim] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (1, N'admin@gmail.com', N'12345678', CAST(N'2020-09-12' AS Date), 1, N'MANAGA', 1)
INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (8, N'test343434@gmail.com', N'1234', CAST(N'2021-12-04' AS Date), 1, N'USER', 1)
INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (12, N'3434', N'user1@gmail.com', CAST(N'2022-01-25' AS Date), 0, N'USER', NULL)
INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (13, N'minh', N'22', CAST(N'2023-10-24' AS Date), 1, N'USER', NULL)
INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (14, N'nam', N'1', CAST(N'2023-10-24' AS Date), 1, N'USER', NULL)
INSERT [dbo].[TaiKhoan] ([Id], [TenDangNhap], [MatKhau], [NgayDangKy], [TinhTrang], [PhanQuyen], [id_ThongTin]) VALUES (15, N'minh@gmail.com', N'22', CAST(N'2023-10-24' AS Date), 1, N'USER', 8)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongTin] ON 

INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (1, N'Nguyyễn Van A', N'HCM', N'Nam', CAST(N'2020-12-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (2, N'Nguy?n Van c', N'HN', N'n?', CAST(N'2020-12-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (3, N'1313213', N'12321321', N'nam', CAST(N'2020-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (4, N'username1@gmail.com', NULL, NULL, CAST(N'2022-01-21T11:24:22.393' AS DateTime), N'username1@gmail.com')
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (5, N'test@gmail.com', NULL, NULL, CAST(N'2022-01-25T20:47:49.280' AS DateTime), N'test@gmail.com')
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (6, N'aaaa@gmail.com', NULL, NULL, CAST(N'2022-01-25T20:54:30.207' AS DateTime), N'aaaa@gmail.com')
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (7, N'user1@gmail.com', NULL, NULL, CAST(N'2022-01-25T21:13:07.863' AS DateTime), N'user1@gmail.com')
INSERT [dbo].[ThongTin] ([ThongTin_id], [TenNguoiDung], [DiaChi], [GioiTinh], [NgaySinh], [Email]) VALUES (8, N'minh@gmail.com', N'HD', N'nam', CAST(N'2003-05-22T00:00:00.000' AS DateTime), N'minh@gmail.com')
SET IDENTITY_INSERT [dbo].[ThongTin] OFF
GO
SET IDENTITY_INSERT [dbo].[Ve] ON 

INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (1, 1, 2, CAST(N'2021-12-02T10:03:26.3158384' AS DateTime2), CAST(380000.00 AS Decimal(18, 2)), 2, 4)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (2, 1, 2, CAST(N'2021-12-02T15:08:16.7137483' AS DateTime2), CAST(135000.00 AS Decimal(18, 2)), 5, 3)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (3, 1, 1, CAST(N'2021-12-02T15:12:52.8394296' AS DateTime2), CAST(285000.00 AS Decimal(18, 2)), 6, 3)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (4, 1, 1, CAST(N'2021-12-02T15:15:12.2346701' AS DateTime2), CAST(285000.00 AS Decimal(18, 2)), 7, 3)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (5, 1, 1, CAST(N'2021-12-02T15:18:40.1135625' AS DateTime2), CAST(760000.00 AS Decimal(18, 2)), 8, 8)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (6, 1, 1, CAST(N'2021-12-02T15:21:06.5262622' AS DateTime2), CAST(285000.00 AS Decimal(18, 2)), 9, 3)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (7, 1, 1, CAST(N'2021-12-02T15:23:42.7930850' AS DateTime2), CAST(380000.00 AS Decimal(18, 2)), 10, 4)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (8, 1, 1, CAST(N'2021-12-02T15:36:11.9764559' AS DateTime2), CAST(190000.00 AS Decimal(18, 2)), 11, 2)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (9, 1, 2, CAST(N'2021-12-02T22:47:27.6051112' AS DateTime2), CAST(380000.00 AS Decimal(18, 2)), 12, 4)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (10, 8, 2, CAST(N'2021-12-04T11:32:22.9313867' AS DateTime2), CAST(285000.00 AS Decimal(18, 2)), 13, 3)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (15, 12, 2, CAST(N'2022-01-25T21:13:29.9692121' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 18, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (16, 12, 1, CAST(N'2022-01-25T21:27:33.7369392' AS DateTime2), CAST(285000.00 AS Decimal(18, 2)), 19, 3)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (21, 15, 4, CAST(N'2023-10-24T22:12:53.5654740' AS DateTime2), CAST(95000.00 AS Decimal(18, 2)), 24, 1)
INSERT [dbo].[Ve] ([Id], [IdTaiKhoan], [IdRap], [NgayDat], [GiaVe], [Id_LichChieu], [Soluong]) VALUES (22, 15, 1, CAST(N'2023-10-25T18:33:35.6506020' AS DateTime2), CAST(135000.00 AS Decimal(18, 2)), 25, 3)
SET IDENTITY_INSERT [dbo].[Ve] OFF
GO
ALTER TABLE [dbo].[Phong] ADD  CONSTRAINT [DF__Phong__Daxoa__4BAC3F29]  DEFAULT (CONVERT([bit],(0),(0))) FOR [TrinhTrang]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_Phim] FOREIGN KEY([IdPhim])
REFERENCES [dbo].[Phim] ([Id])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_Phim]
GO
ALTER TABLE [dbo].[DanhMuc]  WITH CHECK ADD  CONSTRAINT [FK_DanhMuc_Phim] FOREIGN KEY([id_Phim])
REFERENCES [dbo].[Phim] ([Id])
GO
ALTER TABLE [dbo].[DanhMuc] CHECK CONSTRAINT [FK_DanhMuc_Phim]
GO
ALTER TABLE [dbo].[Ghe]  WITH CHECK ADD  CONSTRAINT [FK_Ghe_LoaiGhe] FOREIGN KEY([Loai_id])
REFERENCES [dbo].[LoaiGhe] ([Id])
GO
ALTER TABLE [dbo].[Ghe] CHECK CONSTRAINT [FK_Ghe_LoaiGhe]
GO
ALTER TABLE [dbo].[Ghe]  WITH CHECK ADD  CONSTRAINT [FK_Ghe_Phong] FOREIGN KEY([Id_phong])
REFERENCES [dbo].[Phong] ([Id])
GO
ALTER TABLE [dbo].[Ghe] CHECK CONSTRAINT [FK_Ghe_Phong]
GO
ALTER TABLE [dbo].[Ghe]  WITH CHECK ADD  CONSTRAINT [FK_Ghe_Ve] FOREIGN KEY([Id_Ve])
REFERENCES [dbo].[Ve] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ghe] CHECK CONSTRAINT [FK_Ghe_Ve]
GO
ALTER TABLE [dbo].[LichChieu]  WITH CHECK ADD  CONSTRAINT [FK_LichChieu_Phim] FOREIGN KEY([IdPhim])
REFERENCES [dbo].[Phim] ([Id])
GO
ALTER TABLE [dbo].[LichChieu] CHECK CONSTRAINT [FK_LichChieu_Phim]
GO
ALTER TABLE [dbo].[LichChieu]  WITH CHECK ADD  CONSTRAINT [FK_LichChieu_Phong] FOREIGN KEY([IdPhong])
REFERENCES [dbo].[Phong] ([Id])
GO
ALTER TABLE [dbo].[LichChieu] CHECK CONSTRAINT [FK_LichChieu_Phong]
GO
ALTER TABLE [dbo].[NoiDung]  WITH CHECK ADD  CONSTRAINT [FK_Bl_TK] FOREIGN KEY([Id_binhLuan])
REFERENCES [dbo].[BinhLuan] ([Id])
GO
ALTER TABLE [dbo].[NoiDung] CHECK CONSTRAINT [FK_Bl_TK]
GO
ALTER TABLE [dbo].[NoiDung]  WITH CHECK ADD  CONSTRAINT [FK_TK_BL] FOREIGN KEY([Id_TaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([Id])
GO
ALTER TABLE [dbo].[NoiDung] CHECK CONSTRAINT [FK_TK_BL]
GO
ALTER TABLE [dbo].[Phim]  WITH CHECK ADD  CONSTRAINT [FK_Phim_LoaiPhim] FOREIGN KEY([IdLoaiPhim])
REFERENCES [dbo].[LoaiPhim] ([Id])
GO
ALTER TABLE [dbo].[Phim] CHECK CONSTRAINT [FK_Phim_LoaiPhim]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_Rap] FOREIGN KEY([IdRapChieu])
REFERENCES [dbo].[RapPhim] ([Id])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_Rap]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_ThongTin] FOREIGN KEY([id_ThongTin])
REFERENCES [dbo].[ThongTin] ([ThongTin_id])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_ThongTin]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_LichChieu] FOREIGN KEY([Id_LichChieu])
REFERENCES [dbo].[LichChieu] ([Id])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_LichChieu]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_Rap] FOREIGN KEY([IdRap])
REFERENCES [dbo].[RapPhim] ([Id])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_Rap]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_TaiKhoan] FOREIGN KEY([IdTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_TaiKhoan]
GO
USE [master]
GO
ALTER DATABASE [phim] SET  READ_WRITE 
GO
