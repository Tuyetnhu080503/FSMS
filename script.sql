USE [master]
GO
/****** Object:  Database [finaldtb]    Script Date: 6/24/2024 9:17:53 PM ******/
CREATE DATABASE [finaldtb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'finaldtb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\finaldtb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'finaldtb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\finaldtb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [finaldtb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [finaldtb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [finaldtb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [finaldtb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [finaldtb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [finaldtb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [finaldtb] SET ARITHABORT OFF 
GO
ALTER DATABASE [finaldtb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [finaldtb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [finaldtb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [finaldtb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [finaldtb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [finaldtb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [finaldtb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [finaldtb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [finaldtb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [finaldtb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [finaldtb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [finaldtb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [finaldtb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [finaldtb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [finaldtb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [finaldtb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [finaldtb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [finaldtb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [finaldtb] SET  MULTI_USER 
GO
ALTER DATABASE [finaldtb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [finaldtb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [finaldtb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [finaldtb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [finaldtb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [finaldtb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [finaldtb] SET QUERY_STORE = ON
GO
ALTER DATABASE [finaldtb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [finaldtb]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Firstname] [nvarchar](100) NOT NULL,
	[Lastname] [nvarchar](100) NOT NULL,
	[DOB] [date] NOT NULL,
	[Avatar] [nvarchar](100) NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Phonenumber] [nvarchar](15) NOT NULL,
	[Address] [nvarchar](2000) NOT NULL,
	[Isactive] [bit] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[BannerID] [int] IDENTITY(1,1) NOT NULL,
	[BannerName] [varchar](255) NOT NULL,
	[Image] [nvarchar](500) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BannerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](2000) NULL,
	[Image] [nvarchar](1000) NULL,
	[CreateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerProfile]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerProfile](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Deliveryaddress] [nvarchar](1000) NULL,
 CONSTRAINT [PK_CustomerProfile] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeProfile]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeProfile](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[CCCD] [nvarchar](50) NULL,
	[EmployeeCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EmployeeProfile] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Content] [nvarchar](4000) NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Status] [nvarchar](100) NOT NULL,
	[TotalPrice] [bigint] NOT NULL,
	[Createat] [datetime] NOT NULL,
	[VoucherID] [int] NULL,
	[PaymentMethod] [nvarchar](100) NULL,
	[PaymentID] [nvarchar](100) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [bigint] NOT NULL,
	[TotalPrice] [bigint] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderItemsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[Description] [nvarchar](3000) NOT NULL,
	[Price] [bigint] NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductID] [int] NOT NULL,
	[Color] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[Name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 6/24/2024 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[VoucherID] [int] IDENTITY(1,1) NOT NULL,
	[DiscountAmount] [int] NOT NULL,
	[DiscountPercentage] [int] NULL,
	[ExpiryDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Quantity] [int] NULL,
	[MinimumPrice] [int] NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (4, N'admin                         ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'admin@example.com                                                                                   ', N'Admin                                                                                               ', N'User                                                                                                ', CAST(N'1980-01-01' AS Date), N'admin.png                                                                                           ', N'Male      ', N'901234567', N'Address 1                                                                                           ', 1, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (5, N'staff1                        ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'staff1@example.com                                                                                  ', N'Staff                                                                                               ', N'One                                                                                                 ', CAST(N'1985-01-01' AS Date), N'staff1.png                                                                                          ', N'Male      ', N'901234568', N'Address 2                                                                                           ', 1, 2)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (6, N'staff2                        ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'staff2@example.com                                                                                  ', N'Staff                                                                                               ', N'Two                                                                                                 ', CAST(N'1986-01-01' AS Date), N'staff2.png                                                                                          ', N'Female    ', N'901234569', N'Address 3                                                                                           ', 1, 2)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (7, N'staff3                        ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'staff3@example.com                                                                                  ', N'Staff                                                                                               ', N'Three                                                                                               ', CAST(N'1987-01-01' AS Date), N'staff3.png                                                                                          ', N'Male      ', N'901234570', N'Address 4                                                                                           ', 1, 2)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (8, N'staff4                        ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'staff4@example.com                                                                                  ', N'Staff                                                                                               ', N'Four                                                                                                ', CAST(N'1988-01-01' AS Date), N'staff4.png                                                                                          ', N'Female    ', N'901234571', N'Address 5                                                                                           ', 1, 2)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (9, N'shipper1                      ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'shipper1@example.com                                                                                ', N'Shipper                                                                                             ', N'One                                                                                                 ', CAST(N'1989-01-01' AS Date), N'shipper1.png                                                                                        ', N'Male      ', N'901234572', N'Address 6                                                                                           ', 1, 3)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (10, N'shipper2                      ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'shipper2@example.com                                                                                ', N'Shipper                                                                                             ', N'Two                                                                                                 ', CAST(N'1990-01-01' AS Date), N'shipper2.png                                                                                        ', N'Female    ', N'901234573', N'Address 7                                                                                           ', 1, 3)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (11, N'customer1                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer1@example.com                                                                               ', N'Customer', N'One5', CAST(N'1991-01-01' AS Date), N'2.png', N'Male', N'0901234574', N'Address 8', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (12, N'customer2                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer2@example.com                                                                               ', N'Customer                                                                                            ', N'Two                                                                                                 ', CAST(N'1992-01-01' AS Date), N'customer2.png                                                                                       ', N'Female    ', N'901234575', N'Address 9                                                                                           ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (13, N'customer3                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer3@example.com                                                                               ', N'Customer                                                                                            ', N'Three                                                                                               ', CAST(N'1993-01-01' AS Date), N'customer3.png                                                                                       ', N'Male      ', N'901234576', N'Address 10                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (14, N'customer4                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer4@example.com                                                                               ', N'Customer                                                                                            ', N'Four                                                                                                ', CAST(N'1994-01-01' AS Date), N'customer4.png                                                                                       ', N'Female    ', N'901234577', N'Address 11                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (15, N'customer5                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer5@example.com                                                                               ', N'Customer                                                                                            ', N'Five                                                                                                ', CAST(N'1995-01-01' AS Date), N'customer5.png                                                                                       ', N'Male      ', N'901234578', N'Address 12                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (16, N'customer6                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer6@example.com                                                                               ', N'Customer                                                                                            ', N'Six                                                                                                 ', CAST(N'1996-01-01' AS Date), N'customer6.png                                                                                       ', N'Female    ', N'901234579', N'Address 13                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (17, N'customer7                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer7@example.com                                                                               ', N'Customer                                                                                            ', N'Seven                                                                                               ', CAST(N'1997-01-01' AS Date), N'customer7.png                                                                                       ', N'Male      ', N'901234580', N'Address 14                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (18, N'customer8                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer8@example.com                                                                               ', N'Customer                                                                                            ', N'Eight                                                                                               ', CAST(N'1998-01-01' AS Date), N'customer8.png                                                                                       ', N'Female    ', N'901234581', N'Address 15                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (19, N'customer9                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer9@example.com                                                                               ', N'Customer                                                                                            ', N'Nine                                                                                                ', CAST(N'1999-01-01' AS Date), N'customer9.png                                                                                       ', N'Male      ', N'901234582', N'Address 16                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (20, N'customer10                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer10@example.com                                                                              ', N'Customer                                                                                            ', N'Ten                                                                                                 ', CAST(N'2000-01-01' AS Date), N'customer10.png                                                                                      ', N'Female    ', N'901234583', N'Address 17                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (21, N'customer11                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer11@example.com                                                                              ', N'Customer                                                                                            ', N'Eleven                                                                                              ', CAST(N'2001-01-01' AS Date), N'customer11.png                                                                                      ', N'Male      ', N'901234584', N'Address 18                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (22, N'customer12                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer12@example.com                                                                              ', N'Customer                                                                                            ', N'Twelve                                                                                              ', CAST(N'2002-01-01' AS Date), N'customer12.png                                                                                      ', N'Female    ', N'901234585', N'Address 19                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (23, N'customer13                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer13@example.com                                                                              ', N'Customer                                                                                            ', N'Thirteen                                                                                            ', CAST(N'2003-01-01' AS Date), N'customer13.png                                                                                      ', N'Male      ', N'901234586', N'Address 20                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (24, N'customer14                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer14@example.com                                                                              ', N'Customer                                                                                            ', N'Fourteen                                                                                            ', CAST(N'2004-01-01' AS Date), N'customer14.png                                                                                      ', N'Female    ', N'901234587', N'Address 21                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (25, N'customer15                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer15@example.com                                                                              ', N'Customer                                                                                            ', N'Fifteen                                                                                             ', CAST(N'2005-01-01' AS Date), N'customer15.png                                                                                      ', N'Male      ', N'901234588', N'Address 22                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (26, N'customer16                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer16@example.com                                                                              ', N'Customer                                                                                            ', N'Sixteen                                                                                             ', CAST(N'2006-01-01' AS Date), N'customer16.png                                                                                      ', N'Female    ', N'901234589', N'Address 23                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (27, N'customer17                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer17@example.com                                                                              ', N'Customer                                                                                            ', N'Seventeen                                                                                           ', CAST(N'2007-01-01' AS Date), N'customer17.png                                                                                      ', N'Male      ', N'901234590', N'Address 24                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (28, N'customer18                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer18@example.com                                                                              ', N'Customer                                                                                            ', N'Eighteen                                                                                            ', CAST(N'2008-01-01' AS Date), N'customer18.png                                                                                      ', N'Female    ', N'901234591', N'Address 25                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (29, N'customer19                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer19@example.com                                                                              ', N'Customer                                                                                            ', N'Nineteen                                                                                            ', CAST(N'2009-01-01' AS Date), N'customer19.png                                                                                      ', N'Male      ', N'901234592', N'Address 26                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (30, N'customer20                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer20@example.com                                                                              ', N'Customer                                                                                            ', N'Twenty                                                                                              ', CAST(N'2010-01-01' AS Date), N'customer20.png                                                                                      ', N'Female    ', N'901234593', N'Address 27                                                                                          ', 1, 4)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (1, N'Summer Sale', N'summer_sale.jpg', N'Get up to 50% off on summer essentials!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (2, N'New Arrivals', N'new_arrivals.jpg', N'Explore our latest collection now available!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (3, N'Holiday Specials', N'holiday_specials.jpg', N'Find the perfect gifts this holiday season!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (4, N'Clearance Sale', N'clearance_sale.jpg', N'Grab amazing deals on clearance items!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (5, N'Back to School', N'back_to_school.jpg', N'Get ready for school with our back to school offers!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (6, N'Spring Collection', N'spring_collection.jpg', N'Discover our vibrant spring collection!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (7, N'Winter Essentials', N'winter_essentials.jpg', N'Stay warm with our cozy winter essentials!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (8, N'Fitness Gear Sale', N'fitness_sale.jpg', N'Achieve your fitness goals with our top gear!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (9, N'Tech Gadgets Expo', N'tech_gadgets_expo.jpg', N'Explore the latest tech gadgets at our expo!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (10, N'Home Decor Deals', N'home_decor_deals.jpg', N'Revamp your space with our home decor deals!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity]) VALUES (1, 1, 2)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity]) VALUES (1, 3, 1)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity]) VALUES (2, 2, 3)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity]) VALUES (3, 4, 1)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity]) VALUES (2, 1, 1)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity]) VALUES (1, 2, 2)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity]) VALUES (3, 3, 2)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity]) VALUES (1, 4, 3)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity]) VALUES (2, 3, 1)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity]) VALUES (3, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (1, N'Electronics                   ', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (2, N'Clothing                      ', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (3, N'Books                         ', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (4, N'Home Appliances               ', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (5, N'Sports                        ', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (6, N'Beauty and Personal Care      ', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (7, N'Furniture                     ', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (8, N'Toys and Games                ', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (9, N'Automotive                    ', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (10, N'Pet Supplies                  ', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [ProductID], [CustomerID], [Rating], [Comment], [Image], [CreateAt]) VALUES (1, 1, 1, 4, N'Good product overall.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', NULL, CAST(N'2024-06-14T12:09:42.793' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [ProductID], [CustomerID], [Rating], [Comment], [Image], [CreateAt]) VALUES (2, 2, 2, 5, N'Perfect fit and high quality material.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', NULL, CAST(N'2024-06-14T12:09:42.797' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [ProductID], [CustomerID], [Rating], [Comment], [Image], [CreateAt]) VALUES (3, 3, 3, 3, N'Average product, could be better.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', NULL, CAST(N'2024-06-14T12:09:42.797' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [ProductID], [CustomerID], [Rating], [Comment], [Image], [CreateAt]) VALUES (4, 4, 4, 4, N'Nice design but delivery took longer than expected.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', NULL, CAST(N'2024-06-14T12:09:42.797' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [ProductID], [CustomerID], [Rating], [Comment], [Image], [CreateAt]) VALUES (5, 5, 5, 5, N'Absolutely love it! Best purchase ever.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', NULL, CAST(N'2024-06-14T12:09:42.797' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [ProductID], [CustomerID], [Rating], [Comment], [Image], [CreateAt]) VALUES (6, 1, 2, 5, N'Excellent service and fast shipping.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', NULL, CAST(N'2024-06-14T12:09:42.797' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [ProductID], [CustomerID], [Rating], [Comment], [Image], [CreateAt]) VALUES (7, 3, 1, 2, N'Disappointed with the size, too small.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', NULL, CAST(N'2024-06-14T12:09:42.797' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [ProductID], [CustomerID], [Rating], [Comment], [Image], [CreateAt]) VALUES (8, 2, 3, 4, N'Great color and comfortable to wear.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', NULL, CAST(N'2024-06-14T12:09:42.797' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [ProductID], [CustomerID], [Rating], [Comment], [Image], [CreateAt]) VALUES (9, 4, 5, 3, N'Average quality, expected better.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', NULL, CAST(N'2024-06-14T12:09:42.800' AS DateTime))
INSERT [dbo].[Comment] ([CommentID], [ProductID], [CustomerID], [Rating], [Comment], [Image], [CreateAt]) VALUES (10, 5, 4, 5, N'Highly recommended! Exactly as described.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', NULL, CAST(N'2024-06-14T12:09:42.800' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerProfile] ON 

INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (1, 1, N'123 Main St, Anytown, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (2, 2, N'456 Elm St, Anycity, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (3, 3, N'789 Oak St, Anyvillage, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (4, 4, N'321 Pine St, Anyhamlet, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (5, 5, N'654 Cedar St, Anysuburb, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (6, 6, N'987 Maple St, Anycountryside, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (7, 7, N'135 Birch St, Anyplace, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (8, 8, N'246 Walnut St, Anyborough, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (9, 9, N'579 Ash St, Anycity, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (10, 10, N'802 Spruce St, Anytown, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ')
SET IDENTITY_INSERT [dbo].[CustomerProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeProfile] ON 

INSERT [dbo].[EmployeeProfile] ([EmployeeID], [AccountID], [CCCD], [EmployeeCode]) VALUES (11, 1, N'1234567890', N'EMP001    ')
INSERT [dbo].[EmployeeProfile] ([EmployeeID], [AccountID], [CCCD], [EmployeeCode]) VALUES (12, 2, N'0987654321', N'EMP002    ')
INSERT [dbo].[EmployeeProfile] ([EmployeeID], [AccountID], [CCCD], [EmployeeCode]) VALUES (13, 3, N'9876543210', N'EMP003    ')
INSERT [dbo].[EmployeeProfile] ([EmployeeID], [AccountID], [CCCD], [EmployeeCode]) VALUES (14, 4, N'0123456789', N'EMP004    ')
INSERT [dbo].[EmployeeProfile] ([EmployeeID], [AccountID], [CCCD], [EmployeeCode]) VALUES (15, 5, N'5432109876', N'EMP005    ')
INSERT [dbo].[EmployeeProfile] ([EmployeeID], [AccountID], [CCCD], [EmployeeCode]) VALUES (16, 6, N'8765432109', N'EMP006    ')
INSERT [dbo].[EmployeeProfile] ([EmployeeID], [AccountID], [CCCD], [EmployeeCode]) VALUES (17, 7, N'2345678901', N'EMP007    ')
INSERT [dbo].[EmployeeProfile] ([EmployeeID], [AccountID], [CCCD], [EmployeeCode]) VALUES (18, 8, N'6789012345', N'EMP008    ')
INSERT [dbo].[EmployeeProfile] ([EmployeeID], [AccountID], [CCCD], [EmployeeCode]) VALUES (19, 9, N'3456789012', N'EMP009    ')
INSERT [dbo].[EmployeeProfile] ([EmployeeID], [AccountID], [CCCD], [EmployeeCode]) VALUES (20, 10, N'9012345678', N'EMP010    ')
SET IDENTITY_INSERT [dbo].[EmployeeProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (21, CAST(N'2024-06-14T10:00:00.000' AS DateTime), N'New collection launch event scheduled for next month.', 11)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (22, CAST(N'2024-06-14T11:30:00.000' AS DateTime), N'Reminder: Staff meeting on Friday to discuss store renovations.', 12)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (23, CAST(N'2024-06-14T12:45:00.000' AS DateTime), N'Upcoming promotion: 20% off on all summer dresses.', 13)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (24, CAST(N'2024-06-14T13:15:00.000' AS DateTime), N'Customer feedback: Many requests for more plus-size options.', 14)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (25, CAST(N'2024-06-14T14:00:00.000' AS DateTime), N'Reminder: Stock check and inventory update due next week.', 15)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (26, CAST(N'2024-06-14T15:30:00.000' AS DateTime), N'New staff policy: Dress code updated for summer season.', 16)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (27, CAST(N'2024-06-14T16:45:00.000' AS DateTime), N'Sales report: Last week saw a 15% increase in online sales.', 17)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (28, CAST(N'2024-06-14T17:30:00.000' AS DateTime), N'Product review: Best-selling items from the spring collection.', 18)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (29, CAST(N'2024-06-14T18:00:00.000' AS DateTime), N'Holiday schedule: Store will be closed on July 4th for Independence Day.', 19)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (30, CAST(N'2024-06-14T19:00:00.000' AS DateTime), N'Marketing update: New social media campaign launched today.', 20)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID]) VALUES (1, 1, N'Pending                                                                                             ', 25000, CAST(N'2024-06-14T11:55:18.400' AS DateTime), NULL, N'C', NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID]) VALUES (2, 2, N'Processing                                                                                          ', 35000, CAST(N'2024-06-14T11:55:18.400' AS DateTime), NULL, N'B', NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID]) VALUES (3, 3, N'Completed                                                                                           ', 45000, CAST(N'2024-06-14T11:55:18.400' AS DateTime), 1, N'A', N'101')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID]) VALUES (4, 4, N'Pending                                                                                             ', 55000, CAST(N'2024-06-14T11:55:18.400' AS DateTime), 2, N'B', N'102')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID]) VALUES (5, 5, N'Processing                                                                                          ', 65000, CAST(N'2024-06-14T11:55:18.403' AS DateTime), 3, N'A', N'103')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID]) VALUES (6, 6, N'Completed                                                                                           ', 75000, CAST(N'2024-06-14T11:55:18.403' AS DateTime), NULL, N'C', NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID]) VALUES (7, 7, N'Pending                                                                                             ', 85000, CAST(N'2024-06-14T11:55:18.403' AS DateTime), NULL, N'B', NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID]) VALUES (8, 8, N'Processing                                                                                          ', 95000, CAST(N'2024-06-14T11:55:18.403' AS DateTime), 4, N'A', N'104')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID]) VALUES (9, 9, N'Completed                                                                                           ', 105000, CAST(N'2024-06-14T11:55:18.407' AS DateTime), 5, N'C', N'105')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID]) VALUES (10, 10, N'Pending                                                                                             ', 115000, CAST(N'2024-06-14T11:55:18.407' AS DateTime), NULL, N'B', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (21, 1, 1, 2, 50, 100)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (22, 1, 5, 1, 80, 80)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (23, 2, 2, 3, 120, 360)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (24, 2, 6, 1, 65, 65)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (25, 3, 3, 1, 150, 150)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (26, 3, 4, 2, 90, 180)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (27, 4, 9, 1, 50, 50)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (28, 5, 8, 2, 150, 300)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (29, 5, 10, 1, 80, 80)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (30, 5, 6, 3, 65, 195)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (1, N'Floral Maxi Dress', N'Elegant floral print maxi dress with V-neckline and flowy silhouette', 15000000, N'floral_maxi_dress.jpg                                                                               ', 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (2, N'Men s Linen Shirt', N'Classic linen shirt formen, perfectfor summerdays', 8000000, N'mens_linen_shirt.jpg                                                                                ', 2)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (3, N'HighWaisted Wide-Leg Pants', N'Stylishhigh-waisted pantswith wide legs, idealfor bothcasual and formal wear', 12000000, N'wide_leg_pants.jpg                                                                                  ', 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (4, N'Women s PlatformSandals', N'Trendyplatform sandalswith adjustable straps and cushioned insole', 10000000, N'platform_sandals.jpg                                                                                ', 4)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (5, N'Leather Biker Jacket', N'Classic black leather biker jacket withquilted details and zippered pockets', 25000000, N'leather_biker_jacket.jpg                                                                            ', 5)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (6, N'Silk Scarf', N'Luxurious silk scarf with intricate floral patterns, perfect for adding elegance to any outfit', 5000000, N'silk_scarf.jpg                                                                                      ', 6)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (7, N'Pleated Midi Skirt', N'Chic pleated midi skirt in pastel color, suitable for various occasions', 9000000, N'pleated_midi_skirt.jpg                                                                              ', 7)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (8, N'Women s One-Piece Swimsuit', N'Stylish one-piece swimsuit with halter neckline and ruched detailing', 7000000, N'one_piece_swimsuit.jpg                                                                              ', 8)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (9, N'Fedora Hat', N'Classic fedora hat made from wool felt, suitable for all seasons', 6000000, N'fedora_hat.jpg                                                                                      ', 9)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID]) VALUES (10, N'Men s Jogging Pants', N'Comfortable jogging pantsfor men, designedfor performance and style', 11000000, N'mens_jogging_pants.jpg                                                                              ', 10)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductType] ([ProductID], [Color], [Size], [Quantity]) VALUES (1, N'Blue      ', N'M         ', 20)
INSERT [dbo].[ProductType] ([ProductID], [Color], [Size], [Quantity]) VALUES (2, N'White     ', N'L         ', 15)
INSERT [dbo].[ProductType] ([ProductID], [Color], [Size], [Quantity]) VALUES (3, N'Black     ', N'S         ', 25)
INSERT [dbo].[ProductType] ([ProductID], [Color], [Size], [Quantity]) VALUES (4, N'Brown     ', N'38        ', 30)
INSERT [dbo].[ProductType] ([ProductID], [Color], [Size], [Quantity]) VALUES (5, N'Black     ', N'M         ', 10)
INSERT [dbo].[ProductType] ([ProductID], [Color], [Size], [Quantity]) VALUES (6, N'Red       ', NULL, 50)
INSERT [dbo].[ProductType] ([ProductID], [Color], [Size], [Quantity]) VALUES (7, N'Pink      ', N'XS        ', 18)
INSERT [dbo].[ProductType] ([ProductID], [Color], [Size], [Quantity]) VALUES (8, N'Blue      ', N'M         ', 20)
INSERT [dbo].[ProductType] ([ProductID], [Color], [Size], [Quantity]) VALUES (9, N'Gray      ', N'One Size  ', 12)
INSERT [dbo].[ProductType] ([ProductID], [Color], [Size], [Quantity]) VALUES (10, N'Black     ', N'L         ', 22)
GO
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (1, N'Admin                                             ')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (2, N'Employee                                          ')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (3, N'Shipper                                           ')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (4, N'Customer                                          ')
GO
SET IDENTITY_INSERT [dbo].[Voucher] ON 

INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (1, 1000, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.150' AS DateTime), 50, 50000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (2, 2000, 20, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.150' AS DateTime), 100, 100000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (3, 500, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.150' AS DateTime), 30, 30000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (4, 1500, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.150' AS DateTime), 70, 70000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (5, 3000, 25, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.153' AS DateTime), 120, 150000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (6, 200, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.153' AS DateTime), 20, 20000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (7, 100, 15, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.153' AS DateTime), 10, 5000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (8, 800, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.153' AS DateTime), 40, 40000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (9, 1200, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.153' AS DateTime), 60, 60000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (10, 4000, 30, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.153' AS DateTime), 150, 200000)
SET IDENTITY_INSERT [dbo].[Voucher] OFF
GO
ALTER TABLE [dbo].[Banner] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Banner] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_CustomerProfile] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerProfile] ([CustomerID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_CustomerProfile]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_CustomerProfile] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerProfile] ([CustomerID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_CustomerProfile]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_EmployeeProfile] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeProfile] ([EmployeeID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_EmployeeProfile]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_CustomerProfile] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerProfile] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_CustomerProfile]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Voucher] FOREIGN KEY([VoucherID])
REFERENCES [dbo].[Voucher] ([VoucherID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Voucher]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Order]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Product1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Product1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_Product]
GO
USE [master]
GO
ALTER DATABASE [finaldtb] SET  READ_WRITE 
GO
