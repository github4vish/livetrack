
--Source staging tables creation script

/****** Object:  Table [dbo].[Categories]    Script Date: 9/28/2016 7:52:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [float] NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 9/28/2016 7:52:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [float] NOT NULL,
	[CustomerName] [nvarchar](255) NULL,
	[ContactName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[PostalCode] [float] NULL,
	[Country] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/28/2016 7:52:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [float] NOT NULL,
	[LastName] [nvarchar](255) NULL,
	[FirstName] [nvarchar](255) NULL,
	[BirthDate] [datetime] NULL,
	[Photo] [nvarchar](255) NULL,
	[Notes] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/28/2016 7:52:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [float] NOT NULL,
	[OrderID] [float] NULL,
	[ProductID] [float] NULL,
	[Quantity] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/28/2016 7:52:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [float] NOT NULL,
	[CustomerID] [float] NULL,
	[EmployeeID] [float] NULL,
	[OrderDate] [datetime] NULL,
	[ShipperID] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/28/2016 7:52:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [float] NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[SupplierID] [float] NULL,
	[CategoryID] [float] NULL,
	[Unit] [nvarchar](255) NULL,
	[Price] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 9/28/2016 7:52:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [float] NOT NULL,
	[ShipperName] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 9/28/2016 7:52:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [float] NOT NULL,
	[SupplierName] [nvarchar](255) NULL,
	[ContactName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[PostalCode] [float] NULL,
	[Country] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL
) ON [PRIMARY]

GO
