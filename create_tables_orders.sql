if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Priority]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Priority]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Customer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Customer]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeliveryType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DeliveryType]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Product]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Product]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Region]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Region]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ContainerType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ContainerType]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Time]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Time]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Orders]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Orders]
GO

CREATE TABLE s23917.dbo.Priority (
 IdPriority int IDENTITY(1,1) PRIMARY KEY,
 IdPriorityT int NOT NULL,
 PriorityName varchar(50) NOT NULL,
)
GO

CREATE TABLE s23917.dbo.Customer (
 IdCustomer int IDENTITY(1,1) PRIMARY KEY,
 IdCustomerT int NOT NULL,
 CustomerFullName varchar(255) NOT NULL,
 CustomerSegment varchar(255) NOT NULL,
)
GO

CREATE TABLE s23917.dbo.DeliveryType (
 IdDeliveryType int IDENTITY(1,1) PRIMARY KEY,
 IdDeliveryTypeT int NOT NULL,
 DeliveryName varchar(50) NOT NULL,
)
GO

CREATE TABLE s23917.dbo.Product (
 IdProduct int IDENTITY(1,1) PRIMARY KEY,
 IdProductT int NOT NULL,
 ProductName varchar(255) NOT NULL,
 ProductCategory varchar(255) NOT NULL,
)
GO

CREATE TABLE s23917.dbo.Region (
 IdRegion int IDENTITY(1,1) PRIMARY KEY,
 IdRegionT int NOT NULL,
 RegionName varchar(255) NOT NULL,
)
GO

CREATE TABLE s23917.dbo.ContainerType (
 IdContainerType int IDENTITY(1,1) PRIMARY KEY,
 IdContainerTypeT int NOT NULL,
 ContainerName varchar(50) NOT NULL,
)
GO

CREATE TABLE s23917.dbo.Time (
 IdTime int identity(1,1) PRIMARY KEY,
 IdTimeT int NOT NULL,
 Data date NOT NULL,
 Day numeric(2) NOT NULL,
 Month numeric(2) NOT NULL,
 Quarter numeric(1) NOT NULL,
 Year numeric(4) NOT NULL,
)
GO

CREATE TABLE s23917.dbo.Orders (
 IdOrders
 IdPriority int NOT NULL,
 IdCustomer int NOT NULL,
 IdDeliveryType  int NOT NULL,
 IdProduct int NOT NULL,
 IdRegion int NOT NULL,
 IdContainerType int NOT NULL,
 IdTime int NOT NULL,
 TotalSale numeric(18, 2) NOT NULL,
 ProductsNumber numeric(10) NOT NULL,
 PRIMARY KEY(IdPriority, IdCustomer, IdDeliveryType, IdProduct, IdRegion, IdContainerType,IdTime)
)
GO

ALTER TABLE s23917.dbo.Orders
ADD CONSTRAINT fk_priority
FOREIGN KEY(IdPriority) REFERENCES s23917.dbo.Priority
GO

ALTER TABLE s23917.dbo.Orders
ADD CONSTRAINT fk_customer
FOREIGN KEY(IdCustomer) REFERENCES s23917.dbo.Customer
GO

ALTER TABLE s23917.dbo.Orders
ADD CONSTRAINT fk_delivery
FOREIGN KEY(IdDeliveryType) REFERENCES s23917.dbo.DeliveryType
GO

ALTER TABLE s23917.dbo.Orders
ADD CONSTRAINT fk_product
FOREIGN KEY(IdProduct) REFERENCES s23917.dbo.Product
GO

ALTER TABLE s23917.dbo.Orders
ADD CONSTRAINT fk_region
FOREIGN KEY(IdRegion) REFERENCES s23917.dbo.Region
GO

ALTER TABLE s23917.dbo.Orders
ADD CONSTRAINT fk_container
FOREIGN KEY(IdContainerType) REFERENCES s23917.dbo.ContainerType
GO

ALTER TABLE s23917.dbo.Orders
ADD CONSTRAINT fk_time
FOREIGN KEY(IdTime) REFERENCES s23917.dbo.Time
GO

CREATE TABLE s23917.dbo.PrioritySt (
 IdPriorityT  int NOT NULL PRIMARY KEY,
 PriorityName varchar(50) NOT NULL,
)
GO

CREATE TABLE s23917.dbo.DeliveryTypeSt (
 IdDeliveryTypeT int NOT NULL PRIMARY KEY,
 DeliveryName varchar(50) NOT NULL,
)
GO


CREATE TABLE s23917.dbo.CustomerSt (
 IdCustomerT int NOT NULL PRIMARY KEY,
 CustomerFullName varchar(255) NOT NULL,
 CustomerSegment varchar(255) NOT NULL,
)
GO

CREATE TABLE s23917.dbo.RegionSt (
 IdRegionT int NOT NULL PRIMARY KEY,
 RegionName varchar(255) NOT NULL,
)
GO

CREATE TABLE s23917.dbo.ContainerTypeSt (
 IdContainerTypeT int NOT NULL PRIMARY KEY,
 ContainerName varchar(50) NOT NULL,
)
GO

CREATE TABLE s23917.dbo.TimeSt (
 IdTimeT int NOT NULL PRIMARY KEY,
 Data date NOT NULL,
 Day numeric(2) NOT NULL,
 Month numeric(2) NOT NULL,
 Quarter numeric(1) NOT NULL,
 Year numeric(4) NOT NULL,
)
GO

CREATE TABLE s23917.dbo.ProductSt (
 IdProductT int NOT NULL PRIMARY KEY,
 ProductName varchar(255) NOT NULL,
 ProductCategory varchar(255) NOT NULL,
)
GO

CREATE TABLE [s23917].[dbo].[OrdersSt](
[IdPriorityT] [int] NOT NULL,
[IdDeliveryTypeT] [int] NOT NULL,
[Data] [date] NOT NULL,
[IdCustomerT] [int] NOT NULL,
[IdRegionT] [int] NOT NULL,
[IdContainerTypeT] [int] NOT NULL,
[IdProductT] [int] NOT NULL,
[TotalSale] [numeric](18, 2) NOT NULL,
[ProductsNumber] [numeric](10, 0) NOT NULL,
CONSTRAINT [PK_OrdersSt] PRIMARY KEY
(
[IdPriorityT] ,
[IdDeliveryTypeT] ,
[Data],
[IdCustomerT],
[IdRegionT],
[IdContainerTypeT],
[IdProductT]
))
GO