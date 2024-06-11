USE [master]
GO
ALTER DATABASE [FSMS_NEW] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FSMS_NEW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FSMS_NEW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FSMS_NEW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FSMS_NEW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FSMS_NEW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FSMS_NEW] SET ARITHABORT OFF 
GO
ALTER DATABASE [FSMS_NEW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FSMS_NEW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FSMS_NEW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FSMS_NEW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FSMS_NEW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FSMS_NEW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FSMS_NEW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FSMS_NEW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FSMS_NEW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FSMS_NEW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FSMS_NEW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FSMS_NEW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FSMS_NEW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FSMS_NEW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FSMS_NEW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FSMS_NEW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FSMS_NEW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FSMS_NEW] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FSMS_NEW] SET  MULTI_USER 
GO
ALTER DATABASE [FSMS_NEW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FSMS_NEW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FSMS_NEW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FSMS_NEW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FSMS_NEW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FSMS_NEW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FSMS_NEW] SET QUERY_STORE = ON
GO
ALTER DATABASE [FSMS_NEW] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FSMS_NEW]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nchar](30) NOT NULL,
	[Password] [nchar](100) NOT NULL,
	[Email] [nchar](100) NOT NULL,
	[Firstname] [nchar](100) NOT NULL,
	[Lastname] [nchar](100) NOT NULL,
	[DOB] [date] NOT NULL,
	[Avatar] [nchar](100) NULL,
	[Gender] [nchar](10) NOT NULL,
	[Phonenumber] [nchar](20) NOT NULL,
	[Address] [nchar](100) NOT NULL,
	[Isactive] [bit] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[BannerID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [varbinary](max) NULL,
	[Content] [nvarchar](max) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[BannerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CustomerID] [int] NOT NULL,
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NULL,
	[TotalPrice] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartItemsID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NOT NULL,
	[ProductID] [nchar](10) NULL,
	[UnitPirce] [numeric](18, 0) NULL,
	[Quantity] [int] NULL,
	[Price] [numeric](18, 0) NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[CartItemsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nchar](100) NULL,
	[Image] [nchar](100) NULL,
	[CreateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerProfile]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerProfile](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Deliveryaddress] [nchar](100) NULL,
 CONSTRAINT [PK_CustomerProfile] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeProfile]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeProfile](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[CCCD] [nchar](10) NULL,
 CONSTRAINT [PK_EmployeeProfile] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[IsRead] [bit] NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Status] [nchar](100) NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[Createat] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[VoucherID] [nchar](10) NULL,
	[TotalPrice] [int] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderItemsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[Description] [nchar](1000) NOT NULL,
	[Price] [numeric](18, 0) NOT NULL,
	[Image] [nchar](100) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ProductTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Color] [nchar](10) NULL,
	[Size] [nchar](10) NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 6/11/2024 1:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[VoucherID] [int] IDENTITY(1,1) NOT NULL,
	[DiscountAmount] [decimal](10, 2) NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ExpiryDate] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (4, N'admin                         ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'admin@example.com                                                                                   ', N'Admin                                                                                               ', N'User                                                                                                ', CAST(N'1980-01-01' AS Date), N'admin.png                                                                                           ', N'Male      ', N'0901234567          ', N'Address 1                                                                                           ', 1, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (5, N'staff1                        ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'staff1@example.com                                                                                  ', N'Staff                                                                                               ', N'One                                                                                                 ', CAST(N'1985-01-01' AS Date), N'staff1.png                                                                                          ', N'Male      ', N'0901234568          ', N'Address 2                                                                                           ', 1, 2)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (6, N'staff2                        ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'staff2@example.com                                                                                  ', N'Staff                                                                                               ', N'Two                                                                                                 ', CAST(N'1986-01-01' AS Date), N'staff2.png                                                                                          ', N'Female    ', N'0901234569          ', N'Address 3                                                                                           ', 1, 2)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (7, N'staff3                        ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'staff3@example.com                                                                                  ', N'Staff                                                                                               ', N'Three                                                                                               ', CAST(N'1987-01-01' AS Date), N'staff3.png                                                                                          ', N'Male      ', N'0901234570          ', N'Address 4                                                                                           ', 1, 2)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (8, N'staff4                        ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'staff4@example.com                                                                                  ', N'Staff                                                                                               ', N'Four                                                                                                ', CAST(N'1988-01-01' AS Date), N'staff4.png                                                                                          ', N'Female    ', N'0901234571          ', N'Address 5                                                                                           ', 1, 2)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (9, N'shipper1                      ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'shipper1@example.com                                                                                ', N'Shipper                                                                                             ', N'One                                                                                                 ', CAST(N'1989-01-01' AS Date), N'shipper1.png                                                                                        ', N'Male      ', N'0901234572          ', N'Address 6                                                                                           ', 1, 3)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (10, N'shipper2                      ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'shipper2@example.com                                                                                ', N'Shipper                                                                                             ', N'Two                                                                                                 ', CAST(N'1990-01-01' AS Date), N'shipper2.png                                                                                        ', N'Female    ', N'0901234573          ', N'Address 7                                                                                           ', 1, 3)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (11, N'customer1                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer1@example.com                                                                               ', N'Customer                                                                                            ', N'One                                                                                                 ', CAST(N'1991-01-01' AS Date), N'customer1.png                                                                                       ', N'Male      ', N'0901234574          ', N'Address 8                                                                                           ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (12, N'customer2                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer2@example.com                                                                               ', N'Customer                                                                                            ', N'Two                                                                                                 ', CAST(N'1992-01-01' AS Date), N'customer2.png                                                                                       ', N'Female    ', N'0901234575          ', N'Address 9                                                                                           ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (13, N'customer3                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer3@example.com                                                                               ', N'Customer                                                                                            ', N'Three                                                                                               ', CAST(N'1993-01-01' AS Date), N'customer3.png                                                                                       ', N'Male      ', N'0901234576          ', N'Address 10                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (14, N'customer4                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer4@example.com                                                                               ', N'Customer                                                                                            ', N'Four                                                                                                ', CAST(N'1994-01-01' AS Date), N'customer4.png                                                                                       ', N'Female    ', N'0901234577          ', N'Address 11                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (15, N'customer5                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer5@example.com                                                                               ', N'Customer                                                                                            ', N'Five                                                                                                ', CAST(N'1995-01-01' AS Date), N'customer5.png                                                                                       ', N'Male      ', N'0901234578          ', N'Address 12                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (16, N'customer6                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer6@example.com                                                                               ', N'Customer                                                                                            ', N'Six                                                                                                 ', CAST(N'1996-01-01' AS Date), N'customer6.png                                                                                       ', N'Female    ', N'0901234579          ', N'Address 13                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (17, N'customer7                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer7@example.com                                                                               ', N'Customer                                                                                            ', N'Seven                                                                                               ', CAST(N'1997-01-01' AS Date), N'customer7.png                                                                                       ', N'Male      ', N'0901234580          ', N'Address 14                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (18, N'customer8                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer8@example.com                                                                               ', N'Customer                                                                                            ', N'Eight                                                                                               ', CAST(N'1998-01-01' AS Date), N'customer8.png                                                                                       ', N'Female    ', N'0901234581          ', N'Address 15                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (19, N'customer9                     ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer9@example.com                                                                               ', N'Customer                                                                                            ', N'Nine                                                                                                ', CAST(N'1999-01-01' AS Date), N'customer9.png                                                                                       ', N'Male      ', N'0901234582          ', N'Address 16                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (20, N'customer10                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer10@example.com                                                                              ', N'Customer                                                                                            ', N'Ten                                                                                                 ', CAST(N'2000-01-01' AS Date), N'customer10.png                                                                                      ', N'Female    ', N'0901234583          ', N'Address 17                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (21, N'customer11                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer11@example.com                                                                              ', N'Customer                                                                                            ', N'Eleven                                                                                              ', CAST(N'2001-01-01' AS Date), N'customer11.png                                                                                      ', N'Male      ', N'0901234584          ', N'Address 18                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (22, N'customer12                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer12@example.com                                                                              ', N'Customer                                                                                            ', N'Twelve                                                                                              ', CAST(N'2002-01-01' AS Date), N'customer12.png                                                                                      ', N'Female    ', N'0901234585          ', N'Address 19                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (23, N'customer13                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer13@example.com                                                                              ', N'Customer                                                                                            ', N'Thirteen                                                                                            ', CAST(N'2003-01-01' AS Date), N'customer13.png                                                                                      ', N'Male      ', N'0901234586          ', N'Address 20                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (24, N'customer14                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer14@example.com                                                                              ', N'Customer                                                                                            ', N'Fourteen                                                                                            ', CAST(N'2004-01-01' AS Date), N'customer14.png                                                                                      ', N'Female    ', N'0901234587          ', N'Address 21                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (25, N'customer15                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer15@example.com                                                                              ', N'Customer                                                                                            ', N'Fifteen                                                                                             ', CAST(N'2005-01-01' AS Date), N'customer15.png                                                                                      ', N'Male      ', N'0901234588          ', N'Address 22                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (26, N'customer16                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer16@example.com                                                                              ', N'Customer                                                                                            ', N'Sixteen                                                                                             ', CAST(N'2006-01-01' AS Date), N'customer16.png                                                                                      ', N'Female    ', N'0901234589          ', N'Address 23                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (27, N'customer17                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer17@example.com                                                                              ', N'Customer                                                                                            ', N'Seventeen                                                                                           ', CAST(N'2007-01-01' AS Date), N'customer17.png                                                                                      ', N'Male      ', N'0901234590          ', N'Address 24                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (28, N'customer18                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer18@example.com                                                                              ', N'Customer                                                                                            ', N'Eighteen                                                                                            ', CAST(N'2008-01-01' AS Date), N'customer18.png                                                                                      ', N'Female    ', N'0901234591          ', N'Address 25                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (29, N'customer19                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer19@example.com                                                                              ', N'Customer                                                                                            ', N'Nineteen                                                                                            ', CAST(N'2009-01-01' AS Date), N'customer19.png                                                                                      ', N'Male      ', N'0901234592          ', N'Address 26                                                                                          ', 1, 4)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [Email], [Firstname], [Lastname], [DOB], [Avatar], [Gender], [Phonenumber], [Address], [Isactive], [RoleID]) VALUES (30, N'customer20                    ', N'5f4dcc3b5aa765d61d8327deb882cf99                                                                    ', N'customer20@example.com                                                                              ', N'Customer                                                                                            ', N'Twenty                                                                                              ', CAST(N'2010-01-01' AS Date), N'customer20.png                                                                                      ', N'Female    ', N'0901234593          ', N'Address 27                                                                                          ', 1, 4)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (1, N'Admin                                             ')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (2, N'Staff                                             ')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (3, N'Shipper                                           ')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (4, N'Customer                                          ')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Banner] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Voucher] ADD  CONSTRAINT [DF__Voucher__Created__3C34F16F]  DEFAULT (getdate()) FOR [CreatedDate]
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
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Cart] FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Cart]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Product] FOREIGN KEY([CartID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Product]
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
ALTER TABLE [dbo].[CustomerProfile]  WITH CHECK ADD  CONSTRAINT [FK_CustomerProfile_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[CustomerProfile] CHECK CONSTRAINT [FK_CustomerProfile_Account]
GO
ALTER TABLE [dbo].[EmployeeProfile]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProfile_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[EmployeeProfile] CHECK CONSTRAINT [FK_EmployeeProfile_Account]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_CustomerProfile] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerProfile] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_CustomerProfile]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Order]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [FSMS_NEW] SET  READ_WRITE 
GO
