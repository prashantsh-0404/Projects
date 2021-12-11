CREATE TABLE [dbo].[TIME_DIM](
	[Time_ID] [int] NOT NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Week_Number] [numeric](18, 0) NOT NULL,
	[Start_Date] [date] NULL,
	[End_Date] [date] NULL,
	[Special Events] [nvarchar](255) NULL,
	[Source_System_Code] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Time_ID] ASC
-------------------------------------------------------

CREATE TABLE [dbo].[STORE_DIM](
	[Store_ID] [int] NOT NULL,
	[Store_Number] [numeric](18, 0) NOT NULL,
	[Store_Name] [varchar](50) NULL,
	[Store_City] [nvarchar](255) NULL,
	[Price_Tier] [nvarchar](255) NULL,
	[Zone] [numeric](18, 0) NULL,
	[Source_System_Code] [nvarchar](40) NULL,
	[Active] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Store_ID] ASC
)
-------------------------------------------------------
CREATE TABLE [dbo].[PRODUCT_DIM](
	["Product_ID"] [int] NOT NULL,
	["UPC_Number"] [numeric](18, 0) NULL,
	["Product_Name"] [varchar](200) NULL,
	["Product_Type"] [nvarchar](50) NULL,
	["Source_System_Code"] [nvarchar](40) NULL,
	["Active"] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	["Product_ID"] ASC
)

-----------------------------------------------
CREATE TABLE [dbo].[CATEGORY_DIM](
	[Category_ID] [numeric](18, 0) NOT NULL,
	[Category_Name] [nvarchar](40) NULL,
	[Source_System_Code] [nvarchar](40) NULL,
	[Active] [numeric](1, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)

---------------------------------------------
--FACT TABLES

CREATE TABLE [dbo].[PRODUCT_SALES_FACT](
	[Product_Sales_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Time_ID] [int] NOT NULL,
	[Price] [float] NULL,
	[Quantity] [numeric](18, 0) NULL,
	[Profit_Percent_Per_Dollar] [int] NULL,
	[Sales_Promotion_Code] [varchar](50) NULL,
	[Sales] [numeric](38, 6) NULL,
	[Move] [numeric](18, 0) NULL,
	[Margin] [numeric](38, 6) NULL,
	[Gross Margin] [numeric](38, 6) NULL,
 CONSTRAINT [PK_PRODUCT_SALES_FACT] PRIMARY KEY CLUSTERED 
(
	[Product_Sales_ID] ASC
),
CONSTRAINT [FK_PRODUCT_SALES_FACT_1] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[PRODUCT_DIM] (["Product_ID"])
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT [FK_PRODUCT_SALES_FACT_2] FOREIGN KEY([Store_ID])
REFERENCES [dbo].[STORE_DIM] ([Store_ID])
ON UPDATE CASCADE
ON DELETE CASCADE,
ALTER TABLE [dbo].[PRODUCT_SALES_FACT]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_SALES_FACT_3] FOREIGN KEY([Time_ID])
REFERENCES [dbo].[TIME_DIM] ([Time_ID])
ON UPDATE CASCADE
ON DELETE CASCADE

------------------
CREATE TABLE [dbo].[CategorySales_FACT](
	[CATEGORYSALES_ID] [int] NULL,
	[Store_ID] [int] NULL,
	[Time_ID] [int] NULL,
	[Category_ID] [numeric](18, 0) NULL,
	[Sales] [numeric](18, 4) NULL
) ON [PRIMARY]
GO


