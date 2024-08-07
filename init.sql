USE [master]
GO
/****** Object:  Database [finalldtb]    Script Date: 7/26/2024 10:29:36 PM ******/
CREATE DATABASE [finalldtb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'finalldtb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\finalldtb.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'finalldtb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\finalldtb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [finalldtb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [finalldtb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [finalldtb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [finalldtb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [finalldtb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [finalldtb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [finalldtb] SET ARITHABORT OFF 
GO
ALTER DATABASE [finalldtb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [finalldtb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [finalldtb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [finalldtb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [finalldtb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [finalldtb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [finalldtb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [finalldtb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [finalldtb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [finalldtb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [finalldtb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [finalldtb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [finalldtb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [finalldtb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [finalldtb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [finalldtb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [finalldtb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [finalldtb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [finalldtb] SET  MULTI_USER 
GO
ALTER DATABASE [finalldtb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [finalldtb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [finalldtb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [finalldtb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [finalldtb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [finalldtb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [finalldtb] SET QUERY_STORE = ON
GO
ALTER DATABASE [finalldtb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [finalldtb]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/26/2024 10:29:36 PM ******/
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
/****** Object:  Table [dbo].[Banner]    Script Date: 7/26/2024 10:29:36 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 7/26/2024 10:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[ProductTypeID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/26/2024 10:29:37 PM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 7/26/2024 10:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](2000) NULL,
	[Image] [nvarchar](1000) NULL,
	[CreateAt] [datetime] NOT NULL,
	[OrderItemID] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerProfile]    Script Date: 7/26/2024 10:29:37 PM ******/
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
/****** Object:  Table [dbo].[EmployeeProfile]    Script Date: 7/26/2024 10:29:37 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 7/26/2024 10:29:37 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 7/26/2024 10:29:37 PM ******/
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
	[Address] [nvarchar](1000) NULL,
	[FullName] [nvarchar](100) NULL,
	[Phone] [nchar](20) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 7/26/2024 10:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductTypeID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [bigint] NOT NULL,
	[TotalPrice] [bigint] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderItemsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 7/26/2024 10:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_OrderStatus_1] PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/26/2024 10:29:37 PM ******/
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
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 7/26/2024 10:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Color] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/26/2024 10:29:37 PM ******/
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
/****** Object:  Table [dbo].[Voucher]    Script Date: 7/26/2024 10:29:37 PM ******/
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
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (11, N'customer1                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer1@example.com                                                                               ', N'Customer', N'One5', CAST(N'1991-01-01' AS Date), N'customer1.png', N'Male', N'0901234574', N'Address 8', 1, 4)
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
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (31, N'khachhang', N'8605fe02afd974f6833ae37b9861c8a6', N'khach@gmail.com', N'bvcnbvc', N'hgf', CAST(N'2021-02-02' AS Date), N'z3865695908519_49c5a4ce2cdb8da89ad62ddb770f06e9.jpg', N'Female', N'0923847563', N'dfghyujik', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (32, N'khach', N'd41d8cd98f00b204e9800998ecf8427e', N'khach23@gmail.com', N'Khanh', N'Khach', CAST(N'2024-07-01' AS Date), N'z4696283198751_9301a4eed97327df2d3f086d8578d79d.jpg', N'Female', N'0923847562', N'dfghyujik', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (33, N'nhunhu', N'e10adc3949ba59abbe56e057f20f883e', N'nhu@gmail', N'dfghjk', N'dfgh', CAST(N'2024-02-13' AS Date), N'z3865695908519_49c5a4ce2cdb8da89ad62ddb770f06e9.jpg', N'Female', N'', N'', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (34, N'nhunhu', N'd41d8cd98f00b204e9800998ecf8427e', N'nhu@gmail', N'dfghjk', N'dfgh', CAST(N'2024-02-13' AS Date), N'z3865695908519_49c5a4ce2cdb8da89ad62ddb770f06e9.jpg', N'Female', N'0334556432', N'sdfghj', 1, 4)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (1, N'Summer Sale', N'https://i.pinimg.com/736x/fb/d5/1a/fbd51a8c1d6f018d1b49e9aea7f636eb.jpg', N'Get up to 50% off on summer essentials!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (2, N'New Arrivals', N'https://as1.ftcdn.net/v2/jpg/02/85/93/38/1000_F_285933897_077d15KSailGJf7pKDBTEekbX4KdR4jH.jpg', N'Explore our latest collection now available!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (3, N'Holiday Specials', N'https://as2.ftcdn.net/v2/jpg/01/30/02/17/1000_F_130021770_feVwv2u99wQIhEPNVI5K7BOFuLkkEf9j.jpg', N'Find the perfect gifts this holiday season!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (4, N'Clearance Sale', N'https://c8.alamy.com/comp/2C2J4CA/clearance-sale-banner-flyer-or-poster-design-template-2C2J4CA.jpg', N'Grab amazing deals on clearance items!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (5, N'Back to School', N'https://img.freepik.com/free-vector/hand-drawn-back-school-sales-background_23-2148210347.jpg', N'Get ready for school with our back to school offers!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (6, N'Spring Collection', N'https://cdn.create.vista.com/downloads/6f5c7326-a4ec-4961-89f0-cad3f7a88da5_1024.jpeg', N'Discover our vibrant spring collection!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (7, N'Winter Essentials', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZ4xYQRdOhjFi7mIgeQ2iF2Dj105Qal1_gwg&s', N'Stay warm with our cozy winter essentials!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (8, N'Fitness Gear Sale', N'https://hips.hearstapps.com/hmg-prod/images/amazon-overstock-outlet-fitness-equipment-may-663e2944b9f20.jpg?crop=0.5xw:1xh;center,top&resize=640:*', N'Achieve your fitness goals with our top gear!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (9, N'Tech Gadgets Expo', N'https://hips.hearstapps.com/hmg-prod/images/ces-2023-main-lead-1673304199.jpg?crop=0.5xw:1xh;center,top&resize=640:*', N'Explore the latest tech gadgets at our expo!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
INSERT [dbo].[Banner] ([BannerID], [BannerName], [Image], [Content], [IsActive], [CreateAt]) VALUES (10, N'Home Decor Deals', N'https://img.etimg.com/thumb/width-1200,height-1200,imgsize-199856,resizemode-75,msid-104379405/top-trending-products/news/amazon-great-indian-festival-2023-best-deals-on-home-decor.jpg', N'Revamp your space with our home decor deals!', 1, CAST(N'2024-06-14T11:51:01.707' AS DateTime))
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity], [ProductTypeID]) VALUES (2, 2, 3, 2)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity], [ProductTypeID]) VALUES (3, 4, 1, 22)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity], [ProductTypeID]) VALUES (2, 1, 2, 1)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity], [ProductTypeID]) VALUES (3, 3, 2, 7)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity], [ProductTypeID]) VALUES (2, 3, 4, 7)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity], [ProductTypeID]) VALUES (3, 1, 1, 1)
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity], [ProductTypeID]) VALUES (2, 1, 3, 11)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (1, N'Dress', N'')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (2, N'Polo', N'')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (3, N'T-shirt', N'')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (4, N'Shirt', N'')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (5, N'Jacket', N'')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (6, N'Blazer', N'')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (7, N'Jeans', N'')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (8, N'Shorts', N'')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (9, N'Suit', N'')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (10, N'Skirt', N'')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (11, N'Trousers', N'')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (12, N'Accessories', N'')
INSERT [dbo].[Category] ([CategoryID], [Name], [Description]) VALUES (13, N'Other', N'')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [Rating], [Comment], [Image], [CreateAt], [OrderItemID]) VALUES (1, 5, N'Very good!', N'', CAST(N'2024-07-19T17:33:12.000' AS DateTime), 25)
INSERT [dbo].[Comment] ([CommentID], [Rating], [Comment], [Image], [CreateAt], [OrderItemID]) VALUES (2, 4, N'Very good!', N'', CAST(N'2024-07-19T17:33:12.000' AS DateTime), 26)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerProfile] ON 

INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (1, 11, N'123 Main St, Anytown, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (2, 12, N'456 Elm St, Anycity, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (3, 13, N'789 Oak St, Anyvillage, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (4, 14, N'321 Pine St, Anyhamlet, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (5, 15, N'654 Cedar St, Anysuburb, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (6, 16, N'987 Maple St, Anycountryside, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (7, 17, N'135 Birch St, Anyplace, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (8, 18, N'246 Walnut St, Anyborough, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (9, 19, N'579 Ash St, Anycity, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (10, 20, N'802 Spruce St, Anytown, USA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ')
INSERT [dbo].[CustomerProfile] ([CustomerID], [AccountID], [Deliveryaddress]) VALUES (11, 21, N'263 Ninh Kieu, CanTho, Vietnam')
SET IDENTITY_INSERT [dbo].[CustomerProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeProfile] ON 

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

INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (21, CAST(N'2024-06-14T10:00:00.000' AS DateTime), N'New collection launch event scheduled for next month.', 14)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (22, CAST(N'2024-06-14T11:30:00.000' AS DateTime), N'Reminder: Staff meeting on Friday to discuss store renovations.', 14)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (23, CAST(N'2024-06-14T12:45:00.000' AS DateTime), N'Upcoming promotion: 20% off on all summer dresses.', 14)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (24, CAST(N'2024-06-14T13:15:00.000' AS DateTime), N'Customer feedback: Many requests for more plus-size options.', 14)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (25, CAST(N'2024-06-14T14:00:00.000' AS DateTime), N'Reminder: Stock check and inventory update due next week.', 14)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (26, CAST(N'2024-06-14T15:30:00.000' AS DateTime), N'New staff policy: Dress code updated for summer season.', 14)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (27, CAST(N'2024-06-14T16:45:00.000' AS DateTime), N'Sales report: Last week saw a 15% increase in online sales.', 14)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (28, CAST(N'2024-06-14T17:30:00.000' AS DateTime), N'Product review: Best-selling items from the spring collection.', 14)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (29, CAST(N'2024-06-14T18:00:00.000' AS DateTime), N'Holiday schedule: Store will be closed on July 4th for Independence Day.', 14)
INSERT [dbo].[Notification] ([NotificationID], [DateCreated], [Content], [EmployeeID]) VALUES (30, CAST(N'2024-06-14T19:00:00.000' AS DateTime), N'Marketing update: New social media campaign launched today.', 14)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (1, 1, N'Delivering', 990000, CAST(N'2024-06-17T18:22:30.000' AS DateTime), 1, N'B', N'1', N'123 Đường Lê Lợi, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (2, 1, N'Returns', 1295000, CAST(N'2024-06-19T03:21:12.000' AS DateTime), NULL, N'A', NULL, N'456 Đường Trường Chinh, Phường 15, Quận Tân Bình, Thành phố Hồ Chí Minh, Việt Nam                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (3, 1, N'Delivered', 760000, CAST(N'2024-06-20T09:20:00.000' AS DateTime), NULL, N'A', NULL, N'789 Đường Điện Biên Phủ, Phường Đa Kao, Quận 1, Thành phố Hồ Chí Minh, Việt Nam                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (4, 1, N'Pending', 200000, CAST(N'2024-06-29T05:24:24.000' AS DateTime), NULL, N'A', NULL, N'123 Đường Lê Lợi, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (5, 1, N'Pending', 1378000, CAST(N'2024-06-29T23:23:45.000' AS DateTime), NULL, N'A', NULL, N'123 Đường Lê Lợi, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (6, 1, N'Processing', 1939000, CAST(N'2024-07-02T08:54:09.000' AS DateTime), NULL, N'A', NULL, N'123 Đường Lê Lợi, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (30, 1, N'Pending', 570000, CAST(N'2024-07-25T15:05:41.000' AS DateTime), NULL, N'A', N'', N'àdsafds                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (31, 1, N'Pending', 364000, CAST(N'2024-07-25T15:08:24.000' AS DateTime), 1, N'A', N'', N'124, Long Thanh, Tien Giang, Viet Nam                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (32, 1, N'Pending', 854900, CAST(N'2024-07-25T15:29:45.000' AS DateTime), 7, N'A', N'', N'Home                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (33, 1, N'Pending', 1153000, CAST(N'2024-07-25T15:43:03.000' AS DateTime), 5, N'A', N'', N'124, Le Dai Hanh, Phuong 15, Quan 10, Ho Chi Minh                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (34, 1, N'Pending', 569800, CAST(N'2024-07-25T15:50:17.000' AS DateTime), 6, N'A', N'', N'152, Dien Bien Phu, Phuong 10, Quan 5, HCM                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (35, 1, N'Cancel', 363000, CAST(N'2024-07-25T15:51:28.000' AS DateTime), 2, N'A', N'', N'124, Le Dai Hanh, Phuong 15, Quan 10, Ho Chi Minh                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (36, 2, N'Delivered', 1174000, CAST(N'2024-03-07T19:25:31.000' AS DateTime), NULL, N'B', N'2', N'175 Nguyen van Cu - Ninh Kieu - CanTho                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (37, 1, N'Cancel', 729900, CAST(N'2024-07-26T09:00:30.000' AS DateTime), 7, N'A', N'', N'Address                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'Customer One', N'0901234574          ')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Status], [TotalPrice], [Createat], [VoucherID], [PaymentMethod], [PaymentID], [Address], [FullName], [Phone]) VALUES (38, 1, N'Cancel', 1015000, CAST(N'2024-07-26T17:31:35.000' AS DateTime), NULL, N'A', N'', N'Address New', N'Customer One5', N'0901234574          ')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (21, 1, 1, 1, 2, 285000, 570000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (22, 1, 5, 18, 1, 420000, 420000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (23, 2, 2, 3, 3, 365000, 1095000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (24, 2, 6, 32, 1, 200000, 200000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (25, 3, 3, 16, 1, 300000, 300000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (26, 3, 4, 23, 2, 230000, 460000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (27, 4, 9, 71, 1, 200000, 200000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (28, 5, 8, 57, 2, 289000, 578000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (29, 5, 10, 75, 1, 200000, 200000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (30, 5, 6, 32, 3, 200000, 600000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (31, 6, 16, 101, 5, 544000, 2720000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (32, 6, 20, 110, 3, 555000, 1665000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (70, 30, 1, 11, 2, 285000, 570000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (71, 31, 2, 4, 1, 365000, 365000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (72, 32, 1, 11, 3, 285000, 855000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (73, 33, 8, 56, 4, 289000, 1156000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (74, 34, 1, 13, 1, 285000, 285000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (75, 34, 1, 12, 1, 285000, 285000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (76, 35, 2, 2, 1, 365000, 365000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (77, 36, 26, NULL, 1, 532000, 532000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (78, 36, 38, NULL, 2, 321000, 321000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (79, 37, 2, 3, 2, 365000, 730000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (80, 38, 1, 11, 1, 285000, 285000)
INSERT [dbo].[OrderItems] ([OrderItemsID], [OrderID], [ProductID], [ProductTypeID], [Quantity], [UnitPrice], [TotalPrice]) VALUES (81, 38, 2, 3, 2, 365000, 730000)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([OrderStatusID], [Time], [Status], [EmployeeID], [OrderID]) VALUES (1, CAST(N'2024-06-18T08:34:18.000' AS DateTime), N'Processing', 15, 1)
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Time], [Status], [EmployeeID], [OrderID]) VALUES (2, CAST(N'2024-06-18T15:28:45.000' AS DateTime), N'Delivering', 18, 1)
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Time], [Status], [EmployeeID], [OrderID]) VALUES (3, CAST(N'2024-06-19T09:31:53.000' AS DateTime), N'Processing', 18, 2)
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Time], [Status], [EmployeeID], [OrderID]) VALUES (4, CAST(N'2024-06-20T07:51:37.000' AS DateTime), N'Delivering', 17, 2)
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Time], [Status], [EmployeeID], [OrderID]) VALUES (5, CAST(N'2024-06-20T18:04:18.000' AS DateTime), N'Processing', 16, 3)
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Time], [Status], [EmployeeID], [OrderID]) VALUES (6, CAST(N'2024-06-21T09:14:58.000' AS DateTime), N'Delivering', 18, 3)
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Time], [Status], [EmployeeID], [OrderID]) VALUES (7, CAST(N'2024-06-25T10:24:39.000' AS DateTime), N'Returns', 20, 2)
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Time], [Status], [EmployeeID], [OrderID]) VALUES (8, CAST(N'2024-06-26T18:55:11.000' AS DateTime), N'Delivered', 19, 3)
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Time], [Status], [EmployeeID], [OrderID]) VALUES (9, CAST(N'2024-07-03T13:26:43.000' AS DateTime), N'Processing', 16, 6)
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Time], [Status], [EmployeeID], [OrderID]) VALUES (10, CAST(N'2024-07-07T06:23:17.000' AS DateTime), N'Processing', 16, 36)
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Time], [Status], [EmployeeID], [OrderID]) VALUES (11, CAST(N'2024-07-07T16:23:17.000' AS DateTime), N'Delivering', 17, 36)
INSERT [dbo].[OrderStatus] ([OrderStatusID], [Time], [Status], [EmployeeID], [OrderID]) VALUES (12, CAST(N'2024-07-10T14:43:07.000' AS DateTime), N'Delivered', 19, 36)
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (1, N'White dress open shoulder puff', N'DETAILS :
-Material: TAFTA
-The color: white, pink, black
-The standard design of the standard form, the skirt is wearing 2 styles
-The careful, meticulous sewing line
-The simple and beautiful design skirt is suitable for girls to go out, walk, at home or party, extremely luxurious travel', 285000, N'dress1.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (2, N'Two -wire dress with a bow', N'Skirts - Female dress design is an indispensable style in your closet. By a skirt - fishtail dress, spread skirt ... is always your optimal choice in luxurious parties. Coffee with friends or when walking around ...', 365000, N'dress2.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (3, N'Lady`s Party Dress with Bow Sleeves', N'Women`s Party Dress with Bow, 2-layer design, with chest padding - Material: Taffa - Color: White, Black, Pink', 300000, N'dress3.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (4, N'Nemo Dress', N'Nemo Dress - Cute layered choker and 2-strap party dress
	  	   	   Super cute layered party dress with choker neck, girls!
This dress is perfect for parties, the fabric is thick and 2 layers of chiffon.
This dress is suitable for all skin types and body shapes, auntieeeee', 230000, N'dress4.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (5, N'Catchy Flared Sleeve Chiffon Dress with Tassels', N'CATCHY Store is a place that can ensure the muse about PRICE - QUALITY - PRESTIGE with DIVERSE - TRENDY - TIMELY designs. The house always listens and optimizes all products for the ladies. Coming to the house, you will have more choices in daily dressing from sexy, luxurious, cute, office, comfortable at home,... see more Silk Chiffon Dress with Flared Sleeves and Tassels - Catchy, Party Dress with 2 Straps and Pretty Layered Skirt, Fluffy Princess Dress ', 420000, N'dress5.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (6, N'Tassel Strapless Dress with Rose Collar and Padded Cups', N'Damn, the dress is beautiful, you guys are really serious.
I thought it wasn`t pretty, but the dress is unexpectedly beautiful.
dress with chest pad
Stretchy dress suitable for sexy ladies
will support the shopp should buy you ladies are very beautifulmm', 200000, N'dress6.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (7, N'Silk maxi dress with floral collar can be worn in 2 styles', N'Silk maxi dress with floral collar can be worn in 2 styles, super cute ruffled flared design for ladies to attend parties, go to the beach ', 540000, N'dress7.jpg', 1, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (8, N'BASIC SYMBOL men`s polo shirt', N'POLOMANOR`s return policy and conditions:

    + Commitment to product quality and design as shown in the image.

    + Commitment to return goods within 30 days.

    + Goods must be new and unused

    + Product is defective due to transportation and manufacturer', 289000, N'polo1.jpg', 2, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (9, N'POLO T-shirt', N'SEELU Polo Shirt Details
- Material: 100% Cotton, absorbs sweat quickly, cool and comfortable in summer

- The product still has the original tags, extremely luxurious (see video on product photo).

-Basic goes well with Jeans, Kaki, Shorts. Wearing it on the street, traveling or to parties brings classy confidence to customers.', 200000, N'polo2.jpg', 2, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (10, N'SEELU POLO T-shirt', N'SEELU Polo Shirt Details
- Material: 100% Cotton, absorbs sweat quickly, cool and comfortable in summer

- The product still has the original tags, extremely luxurious (see video on product photo).

-Basic goes well with Jeans, Kaki, Shorts. Wearing it on the street, traveling or to parties brings classy confidence to customers.', 200000, N'polo3.jpg', 2, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (11, N'T-shirt POLO BEAR 194 Plain Unisex', N'Polo Shirt Details
- Material: 100% Cotton, absorbs sweat quickly, cool and comfortable in summer

- The product still has the original tags, extremely luxurious (see video on product photo).

-Basic goes well with Jeans, Kaki, Shorts. Wearing it on the street, traveling or to parties brings classy confidence to customers.', 324000, N'polo4.jpg', 2, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (12, N'LOCAL BRAND The Weird Unisex', N'T-Shirt Details
- Material: 100% Cotton, absorbs sweat quickly, cool and comfortable in summer

- The product still has the original tags, extremely luxurious (see video on product photo).

-Basic goes well with Jeans, Kaki, Shorts. Wearing it on the street, traveling or to parties brings classy confidence to customers.', 345000, N't1.jpg', 3, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (13, N'Unisex t-shirt for men and women', N'T-Shirt Details
- Material: 100% Cotton, absorbs sweat quickly, cool and comfortable in summer

- The product still has the original tags, extremely luxurious (see video on product photo).

-Basic goes well with Jeans, Kaki, Shorts. Wearing it on the street, traveling or to parties brings classy confidence to customers.', 198000, N't2.jpg', 3, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (14, N'Lovely Round Neck T-Shirt', N'*Note:

- Please send the shop a clip of your returned packaging, a consultant will confirm and proceed to create a return order for you.', 234000, N't3.jpg', 3, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (15, N'Soothing Round Neck T-Shirt - Cream Cotton', N'*Note:

- Please send the shop a clip of your returned packaging, a consultant will confirm and proceed to create a return order for you.', 224000, N't4.jpg', 3, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (16, N'8YO SUMMER PARTY Embroidered T-Shirt Soft', N'+ Material: PREMIUM COTTON - The more you wear, the more comfortable it is

+ Soft - Smooth - Cool - No shedding - Anti-shrinkage

+ The collar is thicker, the collar is 3cm thick, but still comfortable to wear and not rough. The shape is more beautiful, the neck is not stretched

+ Color: Black / Cream / Gray / Pink / Blue

+ Pattern: Full body icon embroidery

+ Origin: Vietnam.', 544000, N't5.jpg', 3, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (17, N'JBAGY Pastel', N'#jbagy #ao #somi #nam #nu #formrong #unisex #pastel #den #trang ', 545000, N'tt1.jpg', 4, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (18, N'HIGH QUALITY HANDSOME LONG-SLEEVED', N'The detail information of product:

-- The fabric feels smooth, does not fray, wrinkle or pill.

-- Neck and armrests are made of high quality material, no fear of peeling.

-- Extremely standard Body Shape, hugs the shoulders, extremely youthful and stylish, suitable for all situations including going out and going to work.', 305000, N'tt2.jpg', 4, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (19, N'Ladylike black bow tie shirt', N'Ladylike black strap shirt_888 Color: pink brown, white Size: Freesize The shirt is extremely pretty. Super cool to wear on Tet #aosomi #aotieuthu #aophoino', 287000, N'tt3.jpg', 4, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (20, N'AM76 VERY PRETTY ', N'MATERIAL: Soft, shiny, light-weight SATIN SILK

SIZE CHART:

- Size S: 40 -46kg: Chest 88cm. Sleeve length 54.5cm. Shoulder 36cm. Shirt length 60cm

- Size M: 46-54KG: Chest 90cm. Shoulder 38cm. Shirt length 62cm

- Size L: 55- 60 KG: Chest 96cm. Shoulder 40cm. Shirt length 64cm

Depending on different body shapes, choosing the right size may not be 100% accurate based on weight and height.

There are 5 colors that flatter the skin and are easy to coordinate with other clothes: white, black, navy blue, smoky gray and brown. Now there are new colors and many other colors will be released (depending on customer preferences - The shop looks forward to receiving contributions from KiRas beloved customers).

Satin fabric does not stretch.', 555000, N'tt4.jpg', 4, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (21, N'wrinkle-resistant, absorbent, basic color palette, easy to coordinate ', N'MATERIAL: Soft, shiny, light-weight SATIN SILK

SIZE CHART:

- Size S: 40 -46kg: Chest 88cm. Sleeve length 54.5cm. Shoulder 36cm. Shirt length 60cm

- Size M: 46-54KG: Chest 90cm. Shoulder 38cm. Shirt length 62cm

- Size L: 55- 60 KG: Chest 96cm. Shoulder 40cm. Shirt length 64cm

Depending on different body shapes, choosing the right size may not be 100% accurate based on weight and height.

There are 5 colors that flatter the skin and are easy to coordinate with other clothes: white, black, navy blue, smoky gray and brown. Now there are new colors and many other colors will be released (depending on customer preferences - The shop looks forward to receiving contributions from KiRas beloved customers).

Satin fabric does not stretch.', 555000, N'tt5.jpg', 4, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (22, N'Local Brand HAPPYSTORE1998 long-sleeved ', N' Long-sleeved women`s shirt made of sand silk Local Brand HAPPYSTORE1998, Korean style women`s shirt in pastel colors PRODUCT INFORMATION: Long-sleeved women`s shirt, Korean style women`s shirt - Material: Korean sand silk has drape and is very wrinkle-resistant - Color: includes 11 youthful, dynamic and individual tones ', 234000, N'tt6.jpg', 4, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (23, N'Daily Me local brand croptop hoodie zip short loose  ', N'PRODUCT INFORMATION

- Product name: Hoodie zip fleece croptop form

- Form: Croptop, wide, loose sleeves, 2 layers. 2-layer hat. 2-layer shirt. 2 inside pockets, 2 outside pockets

- Use sunscreen, go to school, chill out when the weather is "a little chilly" is suitable

- Shirt size: FREESIZE under (1m65 + 70kg) (Depending on height and weight, chat with the shop for more detailed advice)

- The zipper changes every batch.', 234000, N'a1.jpg', 5, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (24, N'Windbreaker jacket made of high-quality', N'Beautiful fabric, no pilling, no shrinkage, soft, smooth, thick, absorbs sweat extremely quickly, super cool to wear.

Unisex windbreaker jacket with excellent UV protection.', 234000, N'a2.jpg', 5, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (25, N'Pandax Studio bomber jacket', N'Product manual

- The first time you bring it home, just rinse it with cold water and let it dry to ensure the print on the product does not peel off.

- Wash only after 3 days of receiving the product

- Remember to turn the product (pants/shirt) inside out when washing and do not soak.

- Do not machine wash for the first 2 weeks

- When drying, turn inside out and do not dry directly under sunlight.

', 234000, N'a3.jpg', 5, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (26, N' Blazer, long, loose, solid color, thick 2-layer fabric, Korean style - Tiktik', N'Size is for reference only, depending on body measurements and different fabric materials, there will be certain differences. Please inbox the shop for more accurate advice.

- Designs:

+ Long Blazer design, vest collar with 2 side pockets, elegant autumn style for women.

+ Blazers can be worn as outerwear or mixed with many suitable outfits in many different situations from office parties, dates to important events and parties.

+ Shirt has youthful color scheme, high color fastness.

+ Products are guaranteed with quality production process with sturdy seams, meticulous in every detail.', 532000, N'b1.jpg', 6, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (27, N'Men`s blazer chumi 2 layers thick loose form unisex', N'blazer chumi 2 layers thick loose form unisex ad006 - Soft, smooth, cool wool fabric, loose form, suitable for many body shapes. - Blazer was born not only to serve work meetings but also to go out, walk around the street because it is not too stiff like a vest but more polite than T-shirts with jeans. ', 600000, N'b2.jpg', 6, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (28, N'wide-leg straight pants made of soft, smooth jeans', N' For products with many models, colors, and sizes. Please order the correct model, color, and size of the product on the system to avoid confusion.', 349000, N'j1.jpg', 7, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (29, N'stretchy flared jeans, women`s straight-leg jeans', N' Ladies, rest assured that the product is beautiful and standard, flattering the waist and body ', 353000, N'j2.jpg', 7, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (30, N' Plain Khaki Pants High Waist White Jeans ', N' Ladies, rest assured that the product is beautiful and standard, flattering the waist and body ', 353000, N'j3.jpg', 7, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (31, N'Pants High Jeans ', N' Ladies, rest assured that the product is beautiful and standard, flattering the waist and body ', 353000, N'j4.jpg', 7, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (32, N'JBAGY men`s shorts', N'Material: Cotton khaki, slightly stretchy for a comfortable feel when wearing

Color: Black/ Navy Blue/ White/ Cream/ Beige/ Gray

Size: M/L/XL/2XL ', 193000, N's1.jpg', 8, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (33, N'Women`s Shorts with Folded Hem', N'Beautiful women`s folded-hem shorts in stock to welcome the summer of love

Wholesale in bulk

Available

Snow rain fabric l1 is soft, cool to wear, has a beautiful shape, and has a very stylish hem.

The hot trend color palette is extremely pretty. Buy all the colors for a bright week.', 298000, N's2.jpg', 8, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (34, N'(Big size up to 3XL) Women`s A-line jean shorts', N'ADO JEANS - FACTORY PURCHASE SOLUTION

COMMITMENT TO RETURN WITHIN 7 DAYS!', 214000, N's3.jpg', 8, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (35, N'ZF.CLUB Unisex Elastic Waistband Shorts', N'PRODUCT DESCRIPTION

ZF.CLUB Unisex Elastic Waistband Shorts Korean Style, Basic Form Shorts, High Quality Snow Rain Material [SC]', 124000, N's4.jpg', 8, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (36, N'Middle-aged Men`s Vest Made of Korean Imported Tweed Fabric', N'PRODUCT INFORMATION

- Made in Viet Nam

- Brand: Tien Thinh Vest

- Material: Imported Korean tweed

- 1-pleated pants, 3-6 cm waistband design

- Colors: Dark blue, Cow brown, Cream sand, Moss brown, Charcoal black, Stone gray, Sand yellow

- Size: S/M/L/XL/2XL/3XL', 792000, N'u1.jpg', 9, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (37, N'Long jumpsuit with straight leg, vest collar', N'Free return policy when the product is of poor quality and not the same as the picture, wrong size, quantity.', 792000, N'u2.jpg', 9, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (38, N'UNDERCOOL Tennis Pleated Skirt High Waist Tennis Skirt Snow Rain', N'UNDERCOOL High Waist Pleated Tennis Skirt Snow Skirt with protective shorts inside the skirt
Color: Black / White / Beige / Brown / Gray / Charcoal', 321000, N'v1.jpg', 10, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (39, N'High-Quality Mango Women`s Slit Office Skirt, Basic, Elegant, Light Skirt ', N' Girls, quickly choose your favorite color to freely wear beautiful clothes!', 221000, N'v2.jpg', 10, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (40, N'Long skirt past the knee with ruffled waist, diagonal hem, hiding belly, Korean style ', N' A-line long skirt with ruffled waist and diagonal hem to hide the belly, luxurious Korean style for dating - cute office skirt for parties and gala time. A-line long skirt with ruffled waist is an indispensable item in every girl`s wardrobe. With the advantage of being easy to wear and easy to coordinate with many different types of shirts, in just a flash you will have a very pretty and stylish outfit to go out. ', 643200, N'v3.jpg', 10, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (41, N'Wide Leg Pants', N' Cool Linen Fabric, Beautiful, Super Hot, Many Colors, High Waist From Xinh ', 329200, N'q1.jpg', 11, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (42, N'Wide leg pants with side pockets and bow ties on both sides', N' Wide-leg pants: are pants with straight, relatively wide legs. This style of pants is very popular with ladies because it brings a feeling of comfort and effectively conceals large calves and curved legs.  ', 329200, N'q2.jpg', 12, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (43, N'[KL.Studio] Beautiful Heavy Grade 1 Pearl Necklace', N'KL.Studio specializes in providing fashion accessories with extremely good quality and thoughtful, dedicated service: enthusiastic advice, extremely beautiful and neat packaging, fast delivery (express HCM) Models: bow necklace, elegant white necklace, pearl necklace, pearl necklace of many sizes, artificial pearl necklace 1m5 or 1m8 long, pearl necklace, CC necklace, stone necklace, crystal necklace, pearl necklace with ao dai, elegant classic pearl necklace set, pearl necklace with drop string, long pearl necklace with stones, modern pearl choker, pearl necklace, pearl necklace, camellia... ', 329200, N'1.jpg', 13, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Description], [Price], [Image], [CategoryID], [IsActive]) VALUES (44, N'Retro Vintage style bow hair clip, classic, luxurious and cute ', N'PRODUCT INFORMATION

? Product name: Retro Vintage style bow hair clip, classic, luxurious and cute for women - Annie T4-8

? Name and address of the organization/individual responsible for the product: Annie Accessories - 566 Nguyen Trai, Ward 8, District 5.

? Material: Tweed bow, high quality felt, silk, stainless steel.', 329200, N'2.jpg', 13, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (1, 1, N'White', N'XL', 0)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (2, 2, N'White', N'S', 1)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (3, 2, N'Black', N'S', 18)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (4, 2, N'Black', N'M', 18)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (5, 2, N'Black', N'L', 43)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (6, 3, N'Black', N'S', 23)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (7, 3, N'Black', N'L', 12)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (8, 3, N'White', N'S', 12)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (9, 3, N'White', N'M', 5)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (10, 3, N'White', N'L', 22)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (11, 1, N'White', N'S', 33)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (12, 1, N'White', N'M', 55)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (13, 1, N'White', N'L', 97)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (14, 3, N'Pink', N'L', 2)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (15, 3, N'Pink', N'S', 3)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (16, 3, N'Pink', N'M', 1)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (17, 5, N'White', N'S', 16)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (18, 5, N'White', N'M', 21)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (19, 5, N'White', N'L', 2)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (20, 3, N'Black', N'M', 29)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (21, 5, N'Black', N'L', 22)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (22, 4, N'Black', N'S', 21)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (23, 4, N'Black', N'M', 36)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (24, 4, N'Black', N'L', 24)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (25, 4, N'White', N'S', 21)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (26, 4, N'White', N'M', 36)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (27, 4, N'White', N'L', 24)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (28, 5, N'Black', N'S', 26)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (29, 5, N'Black', N'M', 96)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (30, 5, N'Black', N'XL', 2)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (31, 6, N'Black', N'S', 9)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (32, 6, N'Black', N'M', 16)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (33, 6, N'Black', N'L', 32)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (34, 7, N'White', N'S', 9)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (35, 7, N'White', N'M', 16)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (36, 7, N'White', N'L', 32)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (37, 7, N'Yellow', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (38, 7, N'Yellow', N'M', 11)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (39, 7, N'Yellow', N'L', 9)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (40, 8, N'Black', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (41, 8, N'Black', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (42, 8, N'Black', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (43, 8, N'White', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (44, 8, N'White', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (45, 8, N'White', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (46, 8, N'Brown', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (47, 8, N'Brown', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (48, 8, N'Brown', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (49, 8, N'Pink', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (50, 8, N'Pink', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (51, 8, N'Pink', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (52, 8, N'Blue', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (53, 8, N'Blue', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (54, 8, N'Blue', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (55, 8, N'Grey', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (56, 8, N'Grey', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (57, 8, N'Grey', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (58, 8, N'Nude', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (59, 8, N'Nude', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (60, 8, N'Nude', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (61, 9, N'Nude', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (62, 9, N'Nude', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (63, 9, N'Nude', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (64, 9, N'Black', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (65, 9, N'Black', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (66, 9, N'Black', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (67, 9, N'White', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (68, 9, N'White', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (69, 9, N'White', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (70, 9, N'Green', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (71, 9, N'Green', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (72, 9, N'Green', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (73, 10, N'Green', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (74, 10, N'Green', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (75, 10, N'Green', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (76, 10, N'Black', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (77, 10, N'Black', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (78, 10, N'Black', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (79, 10, N'White', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (80, 10, N'White', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (81, 10, N'White', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (82, 10, N'Brown', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (83, 10, N'Brown', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (84, 10, N'Brown', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (85, 11, N'Brown', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (86, 11, N'Brown', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (87, 11, N'Brown', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (88, 11, N'White', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (89, 11, N'White', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (90, 11, N'White', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (91, 11, N'Black', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (92, 11, N'Black', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (93, 11, N'Black', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (94, 11, N'Blue', N'S', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (95, 11, N'Blue', N'M', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (96, 11, N'Blue', N'L', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (97, 12, N'Black', N'Freesize', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (98, 13, N'Black', N'Freesize', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (99, 14, N'Black', N'Freesize', 92)
GO
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (100, 15, N'Black', N'Freesize', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (101, 16, N'Black', N'Freesize', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (102, 12, N'White', N'Freesize', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (103, 13, N'White', N'Freesize', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (104, 14, N'White', N'Freesize', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (105, 15, N'White', N'Freesize', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (106, 16, N'White', N'Freesize', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (107, 17, N'White', N'Freesize', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (108, 18, N'White', N'Freesize', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (109, 19, N'White', N'Freesize', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (110, 20, N'White', N'Freesize', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (111, 17, N'Black', N'Freesize', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (112, 18, N'Black', N'Freesize', 41)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (113, 19, N'Black', N'Freesize', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (114, 20, N'Black', N'Freesize', 92)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (115, 21, N'Pink', N'Freesize', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (116, 21, N'Blue', N'Freesize', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (117, 21, N'Nude', N'Freesize', 42)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductID], [Color], [Size], [Quantity]) VALUES (118, 21, N'Yellow', N'Freesize', 42)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (1, N'Admin                                             ')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (2, N'Employee                                          ')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (3, N'Shipper                                           ')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (4, N'Customer                                          ')
GO
SET IDENTITY_INSERT [dbo].[Voucher] ON 

INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (1, 1000, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.150' AS DateTime), 49, 50000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (2, 2000, 20, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.150' AS DateTime), 99, 100000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (3, 500, NULL, CAST(N'2024-07-23T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.150' AS DateTime), 30, 30000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (4, 1500, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.150' AS DateTime), 70, 70000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (5, 3000, 25, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.153' AS DateTime), 119, 150000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (6, 200, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.153' AS DateTime), 19, 20000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (7, 100, 15, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.153' AS DateTime), 8, 5000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (8, 800, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.153' AS DateTime), 40, 40000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (9, 1200, NULL, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.153' AS DateTime), 60, 60000)
INSERT [dbo].[Voucher] ([VoucherID], [DiscountAmount], [DiscountPercentage], [ExpiryDate], [IsActive], [CreatedDate], [Quantity], [MinimumPrice]) VALUES (10, 4000, 30, CAST(N'2024-12-31T00:00:00.000' AS DateTime), 1, CAST(N'2024-06-14T11:50:17.153' AS DateTime), 150, 2000000)
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
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_ProductType]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_OrderItems] FOREIGN KEY([OrderItemID])
REFERENCES [dbo].[OrderItems] ([OrderItemsID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_OrderItems]
GO
ALTER TABLE [dbo].[CustomerProfile]  WITH CHECK ADD  CONSTRAINT [FK_CustomerProfile_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[CustomerProfile] CHECK CONSTRAINT [FK_CustomerProfile_Account]
GO
ALTER TABLE [dbo].[EmployeeProfile]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProfile_Account] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[EmployeeProfile] CHECK CONSTRAINT [FK_EmployeeProfile_Account]
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
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_ProductType]
GO
ALTER TABLE [dbo].[OrderStatus]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatus_EmployeeProfile] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeProfile] ([EmployeeID])
GO
ALTER TABLE [dbo].[OrderStatus] CHECK CONSTRAINT [FK_OrderStatus_EmployeeProfile]
GO
ALTER TABLE [dbo].[OrderStatus]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatus_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderStatus] CHECK CONSTRAINT [FK_OrderStatus_Order]
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
ALTER DATABASE [finalldtb] SET  READ_WRITE 
GO
