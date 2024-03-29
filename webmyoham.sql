USE [WebMyPham]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Avartar] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Point] [int] NULL,
	[Birthday] [datetime] NULL,
	[Gender] [tinyint] NULL,
	[RoleId] [int] NULL,
	[AccountTypeId] [int] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[AccountTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED 
(
	[AccountTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](max) NULL,
	[Ward] [nvarchar](max) NULL,
	[District] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[AccountId] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Discount_percent] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[UseNumber] [int] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromUserId] [int] NULL,
	[ToUserId] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[IsFromUserId] [bit] NULL,
	[IsToUserId] [bit] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oder_Items]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oder_Items](
	[OderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Oder_Items] PRIMARY KEY CLUSTERED 
(
	[OderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oders]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oders](
	[OdersId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[Total] [decimal](18, 0) NULL,
	[CreateDay] [datetime] NULL,
	[AddressId] [int] NULL,
	[DiscountId] [int] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Oders] PRIMARY KEY CLUSTERED 
(
	[OdersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[PaymentMethodsId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentsId] [int] IDENTITY(1,1) NOT NULL,
	[OdersId] [int] NULL,
	[PaymentMethodsId] [int] NULL,
	[Amount] [decimal](18, 0) NULL,
	[PaymentDate] [datetime] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Image1] [nvarchar](max) NULL,
	[Image2] [nvarchar](max) NULL,
	[Image3] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Product_InventoryId] [int] NULL,
	[ProductTypeId] [int] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_Inventorys]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Inventorys](
	[Product_InventoryId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[QuantitySold] [int] NULL,
 CONSTRAINT [PK_Product_Inventory] PRIMARY KEY CLUSTERED 
(
	[Product_InventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt_Products]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt_Products](
	[Receipt_ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Image] [nvarchar](max) NULL,
	[CreateDay] [datetime2](7) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Receipt_Products] PRIMARY KEY CLUSTERED 
(
	[Receipt_ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments](
	[ShipmentsId] [int] IDENTITY(1,1) NOT NULL,
	[OdersId] [int] NULL,
	[TrackingNumber] [nvarchar](max) NULL,
	[ShippingMethodsId] [int] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Shipments] PRIMARY KEY CLUSTERED 
(
	[ShipmentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingMethods]    Script Date: 1/21/2024 8:29:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingMethods](
	[ShippingMethodsId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ShippingFee] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ShippingMethods] PRIMARY KEY CLUSTERED 
(
	[ShippingMethodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240107122318_init', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240108055230_Productadd', N'6.0.25')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240113095329_init', N'6.0.25')
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountId], [UserName], [Password], [Avartar], [Email], [FullName], [Phone], [Point], [Birthday], [Gender], [RoleId], [AccountTypeId], [Status]) VALUES (1, N'Admin', N'4297f44b13955235245b2497399d7a93', N'Admin.jpg', N'nguyenchikhang85@gmail.com', N'Admin', N'123123', NULL, CAST(N'2024-01-02T15:44:00.000' AS DateTime), 1, 1, NULL, 1)
INSERT [dbo].[Accounts] ([AccountId], [UserName], [Password], [Avartar], [Email], [FullName], [Phone], [Point], [Birthday], [Gender], [RoleId], [AccountTypeId], [Status]) VALUES (5, N'Huyen6', N'4297f44b13955235245b2497399d7a93', N'huyen6.jpg', N'q@gmail.com', N'Khanglcc', N'123123', 1400, CAST(N'2023-12-31T15:57:00.000' AS DateTime), 1, 3, 2, 1)
INSERT [dbo].[Accounts] ([AccountId], [UserName], [Password], [Avartar], [Email], [FullName], [Phone], [Point], [Birthday], [Gender], [RoleId], [AccountTypeId], [Status]) VALUES (6, N'khanglaoca1', N'4297f44b13955235245b2497399d7a93', N'UserDemo.jpg', N'1@gmail.com', N'Khanglcc11111', N'123123', 0, CAST(N'2024-01-02T12:53:00.000' AS DateTime), 1, 3, 1, 1)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountType] ON 

INSERT [dbo].[AccountType] ([AccountTypeId], [Name]) VALUES (1, N'Bạc')
INSERT [dbo].[AccountType] ([AccountTypeId], [Name]) VALUES (2, N'Vàng')
INSERT [dbo].[AccountType] ([AccountTypeId], [Name]) VALUES (3, N'Kim Cương')
INSERT [dbo].[AccountType] ([AccountTypeId], [Name]) VALUES (4, N'Vip')
SET IDENTITY_INSERT [dbo].[AccountType] OFF
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressId], [Street], [Ward], [District], [City], [Country], [AccountId]) VALUES (1, N'a', N'b', N'c', N'd', N'gggg', 5)
INSERT [dbo].[Address] ([AddressId], [Street], [Ward], [District], [City], [Country], [AccountId]) VALUES (2, N'aa', N'bb', NULL, NULL, NULL, 5)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([DiscountId], [Name], [Code], [Description], [Discount_percent], [Quantity], [UseNumber], [Status]) VALUES (1, N'Giảm giá nè', N'abc', N'mã giảm giá ', CAST(15000 AS Decimal(18, 0)), 40, 0, 1)
SET IDENTITY_INSERT [dbo].[Discounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (2, 5, 1, N'a', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (3, 5, 1, N'b', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (4, 6, 1, N'c', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (5, 6, 1, N'bbbb', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (6, 5, 1, N'aaaa', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (7, 1, 5, N'hahaha', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (8, 1, 5, N'hahahanef ', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (9, 5, 1, N'aaaaa', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (10, 1, 5, N'ấdasdasdasdas', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (11, 5, 1, N'a', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (12, 1, 5, N'a', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (13, 1, 5, N'a', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (14, 1, 5, N'a', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (15, 1, 5, N'a', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (16, 5, 1, N'a', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (17, 5, 1, N'a', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (18, 1, 5, N'Dm', 1, 1, 1)
INSERT [dbo].[Messages] ([Id], [FromUserId], [ToUserId], [Content], [IsFromUserId], [IsToUserId], [Status]) VALUES (19, 5, 1, N'a', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (1, 2, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (1, 3, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (1, 4, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (4, 2, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (4, 3, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (5, 2, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (6, 3, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (6, 4, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (6, 5, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (7, 2, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (8, 7, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (9, 2, 2)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (10, 3, 2)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (10, 4, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (11, 4, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (11, 9, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (12, 9, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (13, 8, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (14, 8, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (15, 8, 1)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (16, 4, 2)
INSERT [dbo].[Oder_Items] ([OderId], [ProductId], [Quantity]) VALUES (16, 8, 1)
GO
SET IDENTITY_INSERT [dbo].[Oders] ON 

INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (1, 5, CAST(1968000 AS Decimal(18, 0)), CAST(N'2024-01-13T17:11:10.067' AS DateTime), 1, 1, 4)
INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (4, 5, CAST(1309000 AS Decimal(18, 0)), CAST(N'2024-01-13T17:13:04.973' AS DateTime), 1, NULL, 4)
INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (5, 5, CAST(650000 AS Decimal(18, 0)), CAST(N'2024-01-13T17:13:19.057' AS DateTime), 1, NULL, 3)
INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (6, 5, CAST(1917000 AS Decimal(18, 0)), CAST(N'2024-01-13T17:13:35.353' AS DateTime), 1, NULL, 3)
INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (7, 5, CAST(650000 AS Decimal(18, 0)), CAST(N'2024-01-13T17:21:30.387' AS DateTime), 1, NULL, 5)
INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (8, 1, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (9, 5, CAST(1330000 AS Decimal(18, 0)), CAST(N'2024-01-15T11:52:29.223' AS DateTime), 1, NULL, 5)
INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (10, 5, CAST(1947000 AS Decimal(18, 0)), CAST(N'2024-01-19T16:06:19.810' AS DateTime), 1, NULL, 5)
INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (11, 5, CAST(1228000 AS Decimal(18, 0)), CAST(N'2024-01-21T11:50:07.997' AS DateTime), 1, NULL, 5)
INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (12, 5, CAST(629000 AS Decimal(18, 0)), CAST(N'2024-01-21T11:52:00.720' AS DateTime), 1, NULL, 2)
INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (13, 5, CAST(829000 AS Decimal(18, 0)), CAST(N'2024-01-21T11:55:58.167' AS DateTime), 1, NULL, 2)
INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (14, 5, CAST(829000 AS Decimal(18, 0)), CAST(N'2024-01-21T11:57:09.947' AS DateTime), 1, NULL, 2)
INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (15, 5, CAST(829000 AS Decimal(18, 0)), CAST(N'2024-01-21T11:59:09.220' AS DateTime), 1, NULL, 2)
INSERT [dbo].[Oders] ([OdersId], [AccountId], [Total], [CreateDay], [AddressId], [DiscountId], [Status]) VALUES (16, 5, CAST(1987060 AS Decimal(18, 0)), CAST(N'2024-01-21T17:03:55.530' AS DateTime), 1, NULL, 2)
SET IDENTITY_INSERT [dbo].[Oders] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 

INSERT [dbo].[PaymentMethods] ([PaymentMethodsId], [Name], [Description]) VALUES (1, N'COD', N'Nhận hàng và thanh toán bằng tiền mặt')
INSERT [dbo].[PaymentMethods] ([PaymentMethodsId], [Name], [Description]) VALUES (2, N'VNPay', N'Thanh toán Online')
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentsId], [OdersId], [PaymentMethodsId], [Amount], [PaymentDate], [Status]) VALUES (1, 1, 1, CAST(1908000 AS Decimal(18, 0)), CAST(N'2024-01-13T17:07:15.457' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentsId], [OdersId], [PaymentMethodsId], [Amount], [PaymentDate], [Status]) VALUES (5, 4, 1, CAST(1309000 AS Decimal(18, 0)), CAST(N'2024-01-13T17:13:04.973' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentsId], [OdersId], [PaymentMethodsId], [Amount], [PaymentDate], [Status]) VALUES (6, 5, 1, CAST(650000 AS Decimal(18, 0)), CAST(N'2024-01-13T17:13:19.057' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentsId], [OdersId], [PaymentMethodsId], [Amount], [PaymentDate], [Status]) VALUES (7, 6, 1, CAST(1917000 AS Decimal(18, 0)), CAST(N'2024-01-13T17:13:35.353' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentsId], [OdersId], [PaymentMethodsId], [Amount], [PaymentDate], [Status]) VALUES (8, 7, 1, CAST(650000 AS Decimal(18, 0)), CAST(N'2024-01-13T17:21:30.387' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentsId], [OdersId], [PaymentMethodsId], [Amount], [PaymentDate], [Status]) VALUES (9, 9, 1, CAST(1330000 AS Decimal(18, 0)), CAST(N'2024-01-15T11:52:29.223' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentsId], [OdersId], [PaymentMethodsId], [Amount], [PaymentDate], [Status]) VALUES (19, 11, 2, CAST(1228000 AS Decimal(18, 0)), CAST(N'2024-01-21T11:50:07.997' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentsId], [OdersId], [PaymentMethodsId], [Amount], [PaymentDate], [Status]) VALUES (20, 12, 2, CAST(629000 AS Decimal(18, 0)), CAST(N'2024-01-21T11:52:00.720' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentsId], [OdersId], [PaymentMethodsId], [Amount], [PaymentDate], [Status]) VALUES (21, 13, 2, CAST(829000 AS Decimal(18, 0)), CAST(N'2024-01-21T11:55:58.167' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentsId], [OdersId], [PaymentMethodsId], [Amount], [PaymentDate], [Status]) VALUES (22, 14, 2, CAST(829000 AS Decimal(18, 0)), CAST(N'2024-01-21T11:57:09.947' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentsId], [OdersId], [PaymentMethodsId], [Amount], [PaymentDate], [Status]) VALUES (23, 15, 2, CAST(829000 AS Decimal(18, 0)), CAST(N'2024-01-21T11:59:09.220' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentsId], [OdersId], [PaymentMethodsId], [Amount], [PaymentDate], [Status]) VALUES (25, NULL, 2, CAST(813020 AS Decimal(18, 0)), CAST(N'2024-01-21T12:04:06.280' AS DateTime), 1)
INSERT [dbo].[Payments] ([PaymentsId], [OdersId], [PaymentMethodsId], [Amount], [PaymentDate], [Status]) VALUES (28, 16, 2, CAST(1987060 AS Decimal(18, 0)), CAST(N'2024-01-21T17:03:55.530' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (2, N'Son MAC', N'son-mac.jpg', N'son-mac1.jpg', NULL, NULL, N'dịch vụ cá nhân ', 650000, 2, 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (3, N'MAC Runway Hit', N'mac-runway-hit.jpg', NULL, NULL, NULL, N'Son chính hãn', 659000, 3, 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (4, N'Son MAC Retro Matte Liquid Lipcolour', N'son-mac-retro-matte-liquid-lipcolour.jpg', NULL, NULL, NULL, N'Son chính hãn', 599000, 4, 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (5, N'MAC Whirl', N'mac-whirl.jpg', NULL, NULL, NULL, N'Son chính hãn', 659000, 5, 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (6, N'Son MAC Matte Lipstick', N'son-mac-matte-lipstick.png', NULL, NULL, NULL, N'Son MAC Matte Lipstick là dòng son bình dân được sản xuất bởi thương hiệu mỹ phẩm nổi tiếng MAC Cosmetics. Những thỏi son này được biết đến với kết cấu phong phú, mượt mà và độ lì lâu trôi. Chúng có nhiều sắc thái khác nhau, từ màu đỏ và hồng cổ điển đến màu đậm và rực rỡ, phục vụ cho nhiều sở thích và tông màu da khác nhau.', 659000, 6, 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (7, N'Son MAC Retro Matte', N'son-mac-retro-matte.jpg', NULL, NULL, NULL, N'Được quảng cáo lẫn revew là dòng son lì nhất của Mac, với độ bám dính lên tới 8 giờ đồng hồ, bất chấp ăn uống, không làm khô hay lộ vân môi. Nhưng thực tế chỉ ghi nhận độ bám màu tốt của sản phẩm đúng chuẩn trên 8 giờ đồng hồ. Nhưng việc không gây khô môi là không đúng, thậm chí nó cực kì khô môi, son có kết cấu rất cứng nếu đánh trực tiếp từ thỏi có thể làm đau môi của bạn. Do đó, khi dùng son nên lấy thông qua cọ là tốt nhất. Son có 12 màu tất cả: Ruby Woo, All Fired Up, Relentlessly Red, Dangerous, Runway Hit, Steady Going, Flat Out Fabulous, Fixed on Drama, Riri Boy, Heaux, Riri Woo.', 599000, 7, 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (8, N'Son MAC Retro Matte Liquid ', N'son-mac-retro-matte-liquid.jpg', NULL, NULL, NULL, N'Hãy khoan nói tới màu sắc, chúng ta hãy nói tới thiết kế ấn tượng của vỏ son. Có thể nói đây là “kiểu áo mới” khá khác lạ so với những vỏ son khác của Mac. Không phải là dáng đạn thông thường, mà Mac đã chọn một dáng vỏ hình đồng hồ cát, có phần đầu nắp, đáy phình to và thắt ở giữa. Tuy nhiên dáng vẻ mới này chỉ giúp Mac tăng độ đa dạng, tạo điểm nhấn phân biệt các loại son, còn phần nắp thiết kế dài, rất bất tiện trong việc mở, đóng, lơ đễnh một chút sẽ làm sứt son ngay.', 799000, 8, 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (9, N'Son MAC Ulitimate', N'son-mac-ulitimate.jpg', NULL, NULL, NULL, N'Hãy khoan nói tới màu sắc, chúng ta hãy nói tới thiết kế ấn tượng của vỏ son. Có thể nói đây là “kiểu áo mới” khá khác lạ so với những vỏ son khác của Mac. Không phải là dáng đạn thông thường, mà Mac đã chọn một dáng vỏ hình đồng hồ cát, có phần đầu nắp, đáy phình to và thắt ở giữa. Tuy nhiên dáng vẻ mới này chỉ giúp Mac tăng độ đa dạng, tạo điểm nhấn phân biệt các loại son, còn phần nắp thiết kế dài, rất bất tiện trong việc mở, đóng, lơ đễnh một chút sẽ làm sứt son ngay.Hãy khoan nói tới màu sắc, chúng ta hãy nói tới thiết kế ấn tượng của vỏ son. Có thể nói đây là “kiểu áo mới” khá khác lạ so với những vỏ son khác của Mac. Không phải là dáng đạn thông thường, mà Mac đã chọn một dáng vỏ hình đồng hồ cát, có phần đầu nắp, đáy phình to và thắt ở giữa. Tuy nhiên dáng vẻ mới này chỉ giúp Mac tăng độ đa dạng, tạo điểm nhấn phân biệt các loại son, còn phần nắp thiết kế dài, rất bất tiện trong việc mở, đóng, lơ đễnh một chút sẽ làm sứt son ngay.', 599000, 9, 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (10, N'Nước tẩy trang 3 in 1 LOreal Micellar làm sạch sâu chai 400ml', N'nuoc-tay-trang-3-in-1-loreal-micellar-lam-sach-sau-chai-400ml.jpg', NULL, NULL, NULL, N'Nước tẩy trang chính hãng thương hiệu nước tẩy trang Loreal của Pháp là bước chăm sóc da quan trọng. Nước tẩy trang 3 in 1 L''Oréal Micellar làm sạch sâu 400ml tẩy sạch lớp trang điểm đậm, bền màu, khó trôi và hút sạch cặn trang điểm, bụi bẩn, dầu thừa mà không lấy đi độ ẩm tự nhiên', 199000, 10, 2, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (11, N'Nước Tẩy Trang La Roche-Posay Dành Cho Da Nhạy Cảm Water Ultra Sensitive Skin 200ml', N'nuoc-tay-trang-la-roche-posay-danh-cho-da-nhay-cam-water-ultra-sensitive-skin-200ml.jpg', NULL, NULL, NULL, N'Công nghệ đột phá Glyco Micellar mang lại hiệu quả làm sạch sâu vượt trội giúp lấy đi bụi bẩn, bã nhờn và lớp trang điểm nhưng vẫn an toàn cho làn da nhạy cảm. Làm sạch đến 99% lớp trang điểm, 70% mascara và các hạt bụi siêu nhỏ có trong khói xe và môi trường ô nhiễm chỉ sau một lượt bông cotton*. Chứa nước khoáng La Roche-Posay có nồng độ Selenium tự nhiên cao, với đặc tính làm dịu da, giảm kích ứng và chống oxi hóa, giúp bảo vệ da trước môi trường ô nhiễm. Cung cấp độ ẩm với Glycerin, giảm thiểu ma sát gây tổn thương da trong quá trình làm sạch. Mang lại làn da sạch mịn màng, thoáng nhẹ sau khi sử dụng.', 199000, 11, 2, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (12, N'Nước Tẩy Trang SVR Sebiaclear Eau Micellaire', N'nuoc-tay-trang-svr-sebiaclear-eau-micellaire.jpg', NULL, NULL, NULL, N'Nước Tẩy Trang SVR Sebiaclear Eau Micellaire chứa hoạt chất Gluconolactone giúp làm sạch và loại bỏ lớp trang điểm, thậm chí là lớp trang điểm không thấm nước. Với công thức cực kỳ dịu nhẹ cho da, nước tẩy trang SVR được đánh giá lành tính cho mọi làn da, đặc biệt là làn da mụn và da nhạy cảm.', 365000, 12, 2, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (13, N'NƯỚC TẨY TRANG GARNIER XANH dành cho da dầu, mụn, nhạy cảm', N'nuoc-tay-trang-garnier-xanh-danh-cho-da-dau-mun-nhay-cam.jpg', NULL, NULL, NULL, N'NƯỚC TẨY TRANG GARNIER XANH 🗺 Xuất xứ: Nga ✔ Dung tích: 400ml 👉 Dành cho da hỗn hợp thiên dầu nhạy cảm.a 💕 Ưu điểm: ✔ Gồm Disodium EDTA giúp tăng cường hiệu quả ổn định độ pH ho sản phẩm. ✔ Thành phần dịu nhẹ, không chứa cồn, không chất tạo mùi, tạo màu. ✔ Giúp loại sạch bụi bẩn và lớp trang điểm lâu trôi. ✔ Mang đến độ ẩm cần thiết cho da. 💕 Cách sử dụng: Lắc đều trước khi sử d', 129000, 13, 2, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (14, N'Nước Tẩy Trang SVR ', N'nuoc-tay-trang-svr.jpg', NULL, NULL, NULL, N'NƯỚC TẨY TRANG GARNIER XANH 🗺 Xuất xứ: Nga ✔ Dung tích: 400ml 👉 Dành cho da hỗn hợp thiên dầu nhạy cảm.a 💕 Ưu điểm: ✔ Gồm Disodium EDTA giúp tăng cường hiệu quả ổn định độ pH ho sản phẩm. ✔ Thành phần dịu nhẹ, không chứa cồn, không chất tạo mùi, tạo màu. ✔ Giúp loại sạch bụi bẩn và lớp trang điểm lâu trôi. ✔ Mang đến độ ẩm cần thiết cho da. 💕 Cách sử dụng: Lắc đều trước khi sử d', 199000, 14, 2, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (15, N'Nước Tẩy Trang Innisfree Green Tea Pure Cleansing Water – Nước Tẩy Trang Hàn Quốc', N'nuoc-tay-trang-innisfree-green-tea-pure-cleansing-water-nuoc-tay-trang-han-quoc.jpg', NULL, NULL, NULL, N'Với đặc tính dịu nhẹ nước tẩy trang innisfree loại bỏ tạp chất, bụi bẩn trên da, cung cấp  độ ẩm giúp nuôi dưỡng da từ sâu bên trong. Chiết xuất từ rễ trà xanh làm giàu saponin giúp giữ nước cho da ngay cả sau khi rửa mặt. Nước tẩy trang cho da dầu innisfree không chứa các thành phần  gây kích ứng cho da giúp da luôn mềm mịn, tươi sáng. Sản phẩm phù hợp với tất cả loại da kể da dầu và da nhạy cảm.', 333000, 15, 2, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (16, N'Nước Tẩy Trang Garnier Xanh giúp sạch Da Tối Ưu PV312 – Nước Tẩy Trang Cho Da Dầu', N'nuoc-tay-trang-garnier-xanh-giup-sach-da-toi-uu-pv312-nuoc-tay-trang-cho-da-dau.jpg', NULL, NULL, NULL, N'Nước Tẩy Trang Garnier xanh là dòng sản phẩm tẩy trang thế hệ mới ứng dụng công nghệ Micellar Technology của Garnier laboratory phù hợp cho da dầu, mụn và da nhạy cảm. Với giá thành siêu hợp lý thì sản phẩm này chắc sẽ là lựa chọn hoàn hảo cho các cô nàng da dầu.', 320000, 16, 2, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (17, N'Nước Tẩy Trang Bioderma – Nước Tẩy Trang Cho Da dầu', N'nuoc-tay-trang-bioderma-nuoc-tay-trang-cho-da-dau.jpg', NULL, NULL, NULL, N'Bioderma là hãng dược mỹ phẩm nổi tiếng của Pháp được nhiều người tin dùng và ưa chuộng. Nước tẩy trang Bioderma được hãng ví như là một thứ dung dịch kỳ diệu nhẹ nhàng loại bỏ lớp makeup, các vết bẩn trên da.', 155000, 17, 2, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (18, N'Bút kẻ mắt COCUTE dạng lỏng chống nước lâu trôi 3.5g', N'but-ke-mat-cocute-dang-long-chong-nuoc-lau-troi-35g.jpg', NULL, NULL, NULL, N'Đặc trưng:  Cẩn thận phác thảo đường kẻ mắt đẹp, làm cho đôi mắt của bạn trông đẹp hơn, công thức chống thấm nước, giữ trên khuôn mặt mà không bị ảnh hưởng bởi chớp mắt và đổ mồ hôi, sợ hãi, bối rối trong mọi tình huống, có thể được sử dụng nhiều lần.  Use method: 1: Use your finger to gently lift the eyelids and apply it to the gaps of eyelashes. After drawing, the trace of eye makeup is not clear, and the eyes are naturally brightened and refreshed. 2: Eyeliner fills the gap between the root of the eyelashes and extends naturally.  Xuất xứ：Trung Quốc Expiry date:3 years NET：3.5g', 60000, 18, 4, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Image], [Image1], [Image2], [Image3], [Description], [Price], [Product_InventoryId], [ProductTypeId], [Status]) VALUES (19, N'CỌ TRANG ĐIỂM (BRUSHES)', N'co-trang-diem-brushes.jpg', NULL, NULL, NULL, N'Dù bộ mỹ phẩm trang điểm bạn có cao cấp đến đâu, giá trị của nó cũng sẽ giảm nếu thiếu đi cây đũa thần – cọ trang điểm. Một bộ cọ trang điểm cơ bản dành cho các cô nàng mới “nhập môn” nên có ít nhất 6 món: cọ tán kem nền, cọ đánh phấn phủ, cọ đánh má hồng, cọ tán màu mắt, cọ quạt dành cho phấn bắt sáng, cọ tạo khối. Nếu sở hữu những cây cọ tốt được làm từ lông tự nhiên, cọ sẽ giúp hút phấn và tán đều các loại mỹ phẩm.  Không còn xa lạ với tín đồ làm đẹp, bộ cọ của E.L.F – thương hiệu mỹ phẩm bình dân luôn nằm trong top sự lựa chọn. Bao gồm 6 món cơ bản và hữu dụng, hội chị em mới tập tành makeup sẽ dễ dàng hơn trong quá trình trang điểm.', 199000, 19, 5, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Products_Inventorys] ON 

INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (1, 0, 0)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (2, 11, 11)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (3, 111, 18)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (4, 30, 15)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (5, 123, 0)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (6, 11, 0)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (7, 11, 0)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (8, 20, 8)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (9, 50, 3)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (10, 11, 0)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (11, 20, 0)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (12, 21, 0)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (13, 23, 0)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (14, 25, 0)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (15, 23, 0)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (16, 20, 0)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (17, 100, 0)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (18, 43, 0)
INSERT [dbo].[Products_Inventorys] ([Product_InventoryId], [Quantity], [QuantitySold]) VALUES (19, 10, 0)
SET IDENTITY_INSERT [dbo].[Products_Inventorys] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([ProductTypeId], [Name], [Description], [Status]) VALUES (1, N'Son', N'Mỹ phẩm', 1)
INSERT [dbo].[ProductTypes] ([ProductTypeId], [Name], [Description], [Status]) VALUES (2, N'Tẩy trang', N'Mỹ phẩm tẩy trang', 1)
INSERT [dbo].[ProductTypes] ([ProductTypeId], [Name], [Description], [Status]) VALUES (3, N'Kem trộn', N'Mỹ phẩm Kem', 1)
INSERT [dbo].[ProductTypes] ([ProductTypeId], [Name], [Description], [Status]) VALUES (4, N'Trang điểm mắt', N'Trang điểm mắt', 1)
INSERT [dbo].[ProductTypes] ([ProductTypeId], [Name], [Description], [Status]) VALUES (5, N'Trang điểm mặt', N'Trang điểm mặt', 1)
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipt_Products] ON 

INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (2, 5, 123, CAST(199000 AS Decimal(18, 0)), N'mac-whirl112024-14800-pm.jpg', CAST(N'2024-01-01T13:48:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (3, 3, 111, CAST(123123 AS Decimal(18, 0)), N'mac-runway-hit112024-75900-pm.jpg', CAST(N'2024-01-01T19:59:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (4, 4, 30, CAST(300000 AS Decimal(18, 0)), N'son-mac-retro-matte-liquid-lipcolour12312023-80000-pm.jpg', CAST(N'2023-12-31T20:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (5, 2, 11, CAST(200000 AS Decimal(18, 0)), N'son-mac112024-80300-pm.jpg', CAST(N'2024-01-01T20:03:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (6, 6, 11, CAST(200000 AS Decimal(18, 0)), N'son-mac-matte-lipstick112024-80400-pm.jpg', CAST(N'2024-01-01T20:04:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (7, 7, 11, CAST(199000 AS Decimal(18, 0)), N'son-mac-retro-matte112024-80500-pm.jpg', CAST(N'2024-01-01T20:05:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (8, 9, 50, CAST(200000 AS Decimal(18, 0)), N'son-mac-ulitimate112024-80500-pm.jpg', CAST(N'2024-01-01T20:05:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (9, 8, 20, CAST(200000 AS Decimal(18, 0)), N'son-mac-retro-matte-liquid-112024-80600-pm.jpg', CAST(N'2024-01-01T20:06:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (10, 10, 11, CAST(100000 AS Decimal(18, 0)), N'nuoc-tay-trang-3-in-1-loreal-micellar-lam-sach-sau-chai-400ml12312023-80600-pm.jpg', CAST(N'2023-12-31T20:06:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (11, 11, 20, CAST(100000 AS Decimal(18, 0)), N'nuoc-tay-trang-la-roche-posay-danh-cho-da-nhay-cam-water-ultra-sensitive-skin-200ml112024-80800-pm.jpg', CAST(N'2024-01-01T20:08:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (12, 12, 21, CAST(199000 AS Decimal(18, 0)), N'nuoc-tay-trang-svr-sebiaclear-eau-micellaire112024-80800-pm.jpg', CAST(N'2024-01-01T20:08:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (13, 13, 23, CAST(123123 AS Decimal(18, 0)), N'nuoc-tay-trang-garnier-xanh-danh-cho-da-dau-mun-nhay-cam112024-80800-pm.jpg', CAST(N'2024-01-01T20:08:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (14, 19, 10, CAST(100000 AS Decimal(18, 0)), N'co-trang-diem-brushes12312023-80900-pm.jpg', CAST(N'2023-12-31T20:09:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (15, 18, 43, CAST(12000 AS Decimal(18, 0)), N'but-ke-mat-cocute-dang-long-chong-nuoc-lau-troi-35g112024-81000-pm.jpg', CAST(N'2024-01-01T20:10:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (16, 17, 100, CAST(100000 AS Decimal(18, 0)), N'nuoc-tay-trang-bioderma-nuoc-tay-trang-cho-da-dau112024-81600-pm.jpg', CAST(N'2024-01-01T20:16:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (17, 16, 20, CAST(100000 AS Decimal(18, 0)), N'nuoc-tay-trang-garnier-xanh-giup-sach-da-toi-uu-pv312-nuoc-tay-trang-cho-da-dau112024-81600-pm.jpg', CAST(N'2024-01-01T20:16:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (18, 15, 23, CAST(123123 AS Decimal(18, 0)), N'nuoc-tay-trang-innisfree-green-tea-pure-cleansing-water-nuoc-tay-trang-han-quoc112024-81600-pm.jpg', CAST(N'2024-01-01T20:16:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Receipt_Products] ([Receipt_ProductId], [ProductId], [Quantity], [Price], [Image], [CreateDay], [Status]) VALUES (19, 14, 25, CAST(100000 AS Decimal(18, 0)), N'nuoc-tay-trang-svr-112024-81700-pm.jpg', CAST(N'2024-01-01T20:17:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Receipt_Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (2, N'Nhân Viên')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (3, N'Khách Hàng')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipments] ON 

INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (1, 1, N'oDV5CIWCZBoC9PvgFIko', 1, 1)
INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (5, 4, N'0opqldGczykYYpqKrmua', 1, 1)
INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (6, 5, N'L7PDjY5vfGeQR5q5IA79', 1, 2)
INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (7, 6, N'jiNTeZGZiKaPU1bBjGQX', 1, 1)
INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (8, 7, N'ajXZD9A1zRos83BYEApw', 1, 1)
INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (9, 9, N'edVg82pd7cyjeykxEz4w', 1, 1)
INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (18, 10, N'SRIOBBvk9in9g1iaTIdm', 1, 1)
INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (19, 11, N'KGsfRX2EoVCIwwrZpzQu', 1, 1)
INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (20, 12, N'UwqnCEwvi77tgKkZeS6V', 1, 1)
INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (21, 13, N'lzlHd3PxAzyTRB9uwz7e', 1, 1)
INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (22, 14, N'QQXv6uE95IJXDYN8WIw2', 1, 1)
INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (23, 15, N'ukYq0DZ4uJUfbwtRAPQx', 1, 1)
INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (25, NULL, N'VrsSweVgBZCkX9gLQ50M', 1, 1)
INSERT [dbo].[Shipments] ([ShipmentsId], [OdersId], [TrackingNumber], [ShippingMethodsId], [Status]) VALUES (28, 16, N'jk3V6iGjfzmal6cop50M', 1, 1)
SET IDENTITY_INSERT [dbo].[Shipments] OFF
GO
SET IDENTITY_INSERT [dbo].[ShippingMethods] ON 

INSERT [dbo].[ShippingMethods] ([ShippingMethodsId], [Name], [Description], [ShippingFee]) VALUES (1, N'Bưu điện', N'Giao hàng ViettelPost', CAST(30000 AS Decimal(18, 0)))
INSERT [dbo].[ShippingMethods] ([ShippingMethodsId], [Name], [Description], [ShippingFee]) VALUES (2, N'Giao hàng tiết kiệm', N'Đơn vị vận chuyển giao hàng tiết kiệm', CAST(35000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ShippingMethods] OFF
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountType] FOREIGN KEY([AccountTypeId])
REFERENCES [dbo].[AccountType] ([AccountTypeId])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Account_AccountType]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Account]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Accounts_FromUserId] FOREIGN KEY([FromUserId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Accounts_FromUserId]
GO
ALTER TABLE [dbo].[Oder_Items]  WITH CHECK ADD  CONSTRAINT [FK_Oder_Items_Oders] FOREIGN KEY([OderId])
REFERENCES [dbo].[Oders] ([OdersId])
GO
ALTER TABLE [dbo].[Oder_Items] CHECK CONSTRAINT [FK_Oder_Items_Oders]
GO
ALTER TABLE [dbo].[Oder_Items]  WITH CHECK ADD  CONSTRAINT [FK_Oder_Items_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Oder_Items] CHECK CONSTRAINT [FK_Oder_Items_Product]
GO
ALTER TABLE [dbo].[Oders]  WITH CHECK ADD  CONSTRAINT [FK_Oders_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[Oders] CHECK CONSTRAINT [FK_Oders_Account]
GO
ALTER TABLE [dbo].[Oders]  WITH CHECK ADD  CONSTRAINT [FK_Oders_Discount] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discounts] ([DiscountId])
GO
ALTER TABLE [dbo].[Oders] CHECK CONSTRAINT [FK_Oders_Discount]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Oders] FOREIGN KEY([OdersId])
REFERENCES [dbo].[Oders] ([OdersId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Oders]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PaymentMethods] FOREIGN KEY([PaymentMethodsId])
REFERENCES [dbo].[PaymentMethods] ([PaymentMethodsId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_PaymentMethods]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product_Inventory] FOREIGN KEY([Product_InventoryId])
REFERENCES [dbo].[Products_Inventorys] ([Product_InventoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_Product_Inventory]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([ProductTypeId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[Receipt_Products]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Product_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Receipt_Products] CHECK CONSTRAINT [FK_Receipt_Product_Product]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Oders] FOREIGN KEY([OdersId])
REFERENCES [dbo].[Oders] ([OdersId])
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_Oders]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_ShippingMethods] FOREIGN KEY([ShippingMethodsId])
REFERENCES [dbo].[ShippingMethods] ([ShippingMethodsId])
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_ShippingMethods]
GO
