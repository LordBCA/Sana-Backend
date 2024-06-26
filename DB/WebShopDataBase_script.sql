USE [master]
GO
/****** Object:  Database [WebShop]    Script Date: 4/17/2024 9:49:59 PM ******/
CREATE DATABASE [WebShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WebShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WebShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebShop] SET RECOVERY FULL 
GO
ALTER DATABASE [WebShop] SET  MULTI_USER 
GO
ALTER DATABASE [WebShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebShop', N'ON'
GO
ALTER DATABASE [WebShop] SET QUERY_STORE = OFF
GO
USE [WebShop]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/17/2024 9:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/17/2024 9:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/17/2024 9:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 4/17/2024 9:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/17/2024 9:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[Image] [varchar](200) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductXrefProductCategory]    Script Date: 4/17/2024 9:49:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductXrefProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ProductXrefProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (1, N'Diego', N'Bocanegra', N'diego_bocanegra@hotmail.com', N'+57 3117572710')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Email], [PhoneNumber]) VALUES (2, N'Myriam', N'Ramirez', N'myriam_ramirez@gmail.com', N'+57 3217994912')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([Id], [Description]) VALUES (1, N'Electronics')
INSERT [dbo].[ProductCategories] ([Id], [Description]) VALUES (2, N'Computers')
INSERT [dbo].[ProductCategories] ([Id], [Description]) VALUES (3, N'Smart Home')
INSERT [dbo].[ProductCategories] ([Id], [Description]) VALUES (4, N'Movies & Television')
INSERT [dbo].[ProductCategories] ([Id], [Description]) VALUES (5, N'Pet Supplies')
INSERT [dbo].[ProductCategories] ([Id], [Description]) VALUES (6, N'Software')
INSERT [dbo].[ProductCategories] ([Id], [Description]) VALUES (7, N'Video Games')
INSERT [dbo].[ProductCategories] ([Id], [Description]) VALUES (8, N'Clothes')
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Code], [Title], [Description], [Price], [Stock], [Image]) VALUES (1, N'CSRM750', N'CORSAIR 750W 80 Plus Gold', N'CORSAIR 750W 80 Plus Gold Fully Modular ATX Power Supply, White - RM Series', CAST(109.99 AS Decimal(18, 2)), 10, N'https://m.media-amazon.com/images/I/61NrhNxWPLL.__AC_SY300_SX300_QL70_FMwebp_.jpg')
INSERT [dbo].[Products] ([Id], [Code], [Title], [Description], [Price], [Stock], [Image]) VALUES (2, N'XR80L2024', N'BRAVIA XR A80L OLED 4K HDR ', N'Sony 55 Inch BRAVIA XR A80L OLED 4K HDR Google TV SU-WL855 Ultra Slim Wall-Mount Bracket', CAST(949.99 AS Decimal(18, 2)), 6, N'https://m.media-amazon.com/images/I/91W-FzCF3UL.__AC_SX300_SY300_QL70_FMwebp_.jpg')
INSERT [dbo].[Products] ([Id], [Code], [Title], [Description], [Price], [Stock], [Image]) VALUES (3, N'PS5US1124', N'PlayStation 5 Slim', N'PlayStation 5 Digital Edition – Marvel’s Spider-Man 2 Bundle (Slim)', CAST(399.99 AS Decimal(18, 2)), 15, N'https://m.media-amazon.com/images/I/71rWPpdhwgL._SL1500_.jpg')
INSERT [dbo].[Products] ([Id], [Code], [Title], [Description], [Price], [Stock], [Image]) VALUES (4, N'MSFTOF2023', N'OfficeSuite Home & Business', N'OfficeSuite Home & Business - Lifetime License - Documents, Sheets, Slides, PDF, Mail & Calendar for Windows', CAST(79.99 AS Decimal(18, 2)), 4, N'https://m.media-amazon.com/images/I/61CYCXmy0pL._AC_UY327_FMwebp_QL65_.jpg')
INSERT [dbo].[Products] ([Id], [Code], [Title], [Description], [Price], [Stock], [Image]) VALUES (5, N'AMZDOT2022', N'Echo Dot (5th Gen, 2022)', N'Echo Dot (5th Gen, 2022 release) | International Version with US Power Adaptor | Smart speaker with Alexa | Charcoal', CAST(49.99 AS Decimal(18, 2)), 25, N'https://m.media-amazon.com/images/I/71xoR4A6q-L._AC_UY327_FMwebp_QL65_.jpg')
INSERT [dbo].[Products] ([Id], [Code], [Title], [Description], [Price], [Stock], [Image]) VALUES (6, N'APP15PRO512', N'Apple iPhone 15 Pro (512 GB)', N'Apple iPhone 15 Pro (512 GB) - Natural Titanium | [Locked] | Boost Infinite plan required starting at $60/mo.', CAST(899.99 AS Decimal(18, 2)), 2, N'https://m.media-amazon.com/images/I/81ENMk6KsJL._AC_UY327_FMwebp_QL65_.jpg')
INSERT [dbo].[Products] ([Id], [Code], [Title], [Description], [Price], [Stock], [Image]) VALUES (7, N'APPPOD2GN', N'Apple AirPods (2nd Generation)', N'Apple AirPods (2nd Generation) Wireless Ear Buds, Bluetooth Headphones with Lightning Charging Case Included', CAST(149.99 AS Decimal(18, 2)), 8, N'https://m.media-amazon.com/images/I/61SUj2aKoEL._AC_UY327_FMwebp_QL65_.jpg')
INSERT [dbo].[Products] ([Id], [Code], [Title], [Description], [Price], [Stock], [Image]) VALUES (8, N'PMAFERRRED', N'PUMA Scuderia Ferrari - Shield', N'PUMA Scuderia Ferrari - Shield Hoody - Men', CAST(99.99 AS Decimal(18, 2)), 6, N'https://m.media-amazon.com/images/I/71meFqc5B9L._AC_SX679_.jpg')
INSERT [dbo].[Products] ([Id], [Code], [Title], [Description], [Price], [Stock], [Image]) VALUES (9, N'SKYI5RTX4060', N'Skytech Gaming Nebula Gaming PC Desktop', N'Skytech Gaming Nebula Gaming PC Desktop – Intel Core i5 13400F 2.5 GHz, NVIDIA RTX 4060, 1TB NVME SSD, 16GB DDR4 RAM 3200', CAST(1069.99 AS Decimal(18, 2)), 1, N'https://m.media-amazon.com/images/I/61INtCQzv2L._AC_UY327_FMwebp_QL65_.jpg')
INSERT [dbo].[Products] ([Id], [Code], [Title], [Description], [Price], [Stock], [Image]) VALUES (10, N'SGT8TBUSB3', N'Seagate Expansion 8TB External Hard Drive', N'Seagate Expansion 8TB External Hard Drive HDD - USB 3.0, with Rescue Data Recovery Services (STKP8000400)', CAST(114.99 AS Decimal(18, 2)), 10, N'https://m.media-amazon.com/images/I/61NF1FZUYUL._AC_UY327_FMwebp_QL65_.jpg')
INSERT [dbo].[Products] ([Id], [Code], [Title], [Description], [Price], [Stock], [Image]) VALUES (11, N'DOG4STND2', N'Elevated Dog Bowls, 4 Height Adjustable Raised Dog Bowl Stand', N'Elevated Dog Bowls, 4 Height Adjustable Raised Dog Bowl Stand with 2 Thick 50oz Stainless Steel Dog Food Bowls', CAST(19.99 AS Decimal(18, 2)), 3, N'https://m.media-amazon.com/images/I/71EeQMpFkHL._AC_UL480_FMwebp_QL65_.jpg')
INSERT [dbo].[Products] ([Id], [Code], [Title], [Description], [Price], [Stock], [Image]) VALUES (12, N'BED24ORTH24', N'Bed Orthopedic for Dogs', N'Bedsure Orthopedic Bed for Medium Dogs - Waterproof Dog Sofa Bed Medium, Supportive Foam Pet Couch with Removable Washable Cover, Waterproof, Grey', CAST(39.99 AS Decimal(18, 2)), 7, N'https://m.media-amazon.com/images/I/61djdF9UnnL._AC_UL480_FMwebp_QL65_.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductXrefProductCategory] ON 

INSERT [dbo].[ProductXrefProductCategory] ([Id], [ProductId], [ProductCategoryId]) VALUES (1, 1, 2)
INSERT [dbo].[ProductXrefProductCategory] ([Id], [ProductId], [ProductCategoryId]) VALUES (2, 2, 4)
INSERT [dbo].[ProductXrefProductCategory] ([Id], [ProductId], [ProductCategoryId]) VALUES (3, 3, 7)
INSERT [dbo].[ProductXrefProductCategory] ([Id], [ProductId], [ProductCategoryId]) VALUES (4, 4, 2)
INSERT [dbo].[ProductXrefProductCategory] ([Id], [ProductId], [ProductCategoryId]) VALUES (5, 5, 3)
INSERT [dbo].[ProductXrefProductCategory] ([Id], [ProductId], [ProductCategoryId]) VALUES (6, 6, 1)
INSERT [dbo].[ProductXrefProductCategory] ([Id], [ProductId], [ProductCategoryId]) VALUES (7, 7, 1)
INSERT [dbo].[ProductXrefProductCategory] ([Id], [ProductId], [ProductCategoryId]) VALUES (8, 8, 8)
INSERT [dbo].[ProductXrefProductCategory] ([Id], [ProductId], [ProductCategoryId]) VALUES (9, 9, 2)
INSERT [dbo].[ProductXrefProductCategory] ([Id], [ProductId], [ProductCategoryId]) VALUES (10, 10, 2)
INSERT [dbo].[ProductXrefProductCategory] ([Id], [ProductId], [ProductCategoryId]) VALUES (11, 11, 5)
INSERT [dbo].[ProductXrefProductCategory] ([Id], [ProductId], [ProductCategoryId]) VALUES (12, 12, 5)
INSERT [dbo].[ProductXrefProductCategory] ([Id], [ProductId], [ProductCategoryId]) VALUES (13, 2, 7)
SET IDENTITY_INSERT [dbo].[ProductXrefProductCategory] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[ProductXrefProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductXrefProductCategory_ProductCategories] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([Id])
GO
ALTER TABLE [dbo].[ProductXrefProductCategory] CHECK CONSTRAINT [FK_ProductXrefProductCategory_ProductCategories]
GO
ALTER TABLE [dbo].[ProductXrefProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductXrefProductCategory_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductXrefProductCategory] CHECK CONSTRAINT [FK_ProductXrefProductCategory_Products]
GO
USE [master]
GO
ALTER DATABASE [WebShop] SET  READ_WRITE 
GO
