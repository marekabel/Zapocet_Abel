USE [master]
GO
/****** Object:  Database [Sem2-PurchaseOrders]    Script Date: 28.04.2023 8:24:27 ******/
CREATE DATABASE [Sem2-PurchaseOrders]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VOSPlzen-PO-Client', FILENAME = N'C:\Database\MSSQL\Data\VOSPlzen-PO-Client.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VOSPlzen-PO-Client_log', FILENAME = N'C:\Database\MSSQL\Data\VOSPlzen-PO-Client_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sem2-PurchaseOrders].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET  MULTI_USER 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET QUERY_STORE = OFF
GO
USE [Sem2-PurchaseOrders]
GO
/****** Object:  Table [dbo].[CompanyKeys]    Script Date: 28.04.2023 8:24:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyKeys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyKey] [int] NOT NULL,
	[CompanyHash] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CompanyKeys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderHeaders]    Script Date: 28.04.2023 8:24:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderHeaders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PoNumber] [nvarchar](10) NOT NULL,
	[CustomerName] [nvarchar](30) NOT NULL,
	[CustomerLastName] [nvarchar](30) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[CustomerEmail] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_PurchaseOrderHeaders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderItems]    Script Date: 28.04.2023 8:24:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaserOrderId] [int] NOT NULL,
	[ShopItemTitle] [nvarchar](50) NOT NULL,
	[Amount] [int] NOT NULL,
	[PricePerUnit] [float] NOT NULL,
 CONSTRAINT [PK_PurchaseOrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompanyKeys] ON 
GO
INSERT [dbo].[CompanyKeys] ([Id], [CompanyKey], [CompanyHash]) VALUES (3, 191, N'dm9zcGx6ZW5oYXNo')
GO
SET IDENTITY_INSERT [dbo].[CompanyKeys] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrderHeaders] ON 
GO
INSERT [dbo].[PurchaseOrderHeaders] ([Id], [PoNumber], [CustomerName], [CustomerLastName], [CreatedOn], [IsPaid], [CustomerEmail]) VALUES (1, N'2023-05', N'Marie', N'Stesková', CAST(N'2023-04-28T00:00:00.0000000' AS DateTime2), 1, N'steskova@vosplzen.cz')
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrderHeaders] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrderItems] ON 
GO
INSERT [dbo].[PurchaseOrderItems] ([Id], [PurchaserOrderId], [ShopItemTitle], [Amount], [PricePerUnit]) VALUES (1, 1, N'Koloběžka Kostka - Travel', 2, 6500)
GO
SET IDENTITY_INSERT [dbo].[PurchaseOrderItems] OFF
GO
ALTER TABLE [dbo].[PurchaseOrderHeaders] ADD  CONSTRAINT [DF_PurchaseOrderHeaders_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[PurchaseOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderItems_PurchaseOrderHeaders] FOREIGN KEY([PurchaserOrderId])
REFERENCES [dbo].[PurchaseOrderHeaders] ([Id])
GO
ALTER TABLE [dbo].[PurchaseOrderItems] CHECK CONSTRAINT [FK_PurchaseOrderItems_PurchaseOrderHeaders]
GO
USE [master]
GO
ALTER DATABASE [Sem2-PurchaseOrders] SET  READ_WRITE 
GO
