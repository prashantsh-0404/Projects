# SQL Queries for Staging and Data Warehouse area

# Staging

# WEEK_DECODE

CREATE TABLE [dbo].[WEEK_DECODE](
[Week] [float] NULL,
[Start] [datetime] NULL,
[End] [datetime] NULL,
[Special Events] [nvarchar](255) NULL
)

# Store

CREATE TABLE [dbo].[Store](
[Store] [numeric](18, 0) NULL,
[City] [nvarchar](255) NULL,
[Price Tier] [nvarchar](255) NULL,
[Zone] [numeric](18, 0) NULL,
[Zip Code] [numeric](5, 0) NULL,
[Address] [nvarchar](255) NULL
)

# CategoryDIMStaging

CREATE TABLE [dbo].[CategoryDIMStaging](
[Category_Name] [nvarchar](255) NULL,
[Sales] [numeric](18, 4) NULL,
53
["STORE"] [numeric](18, 0) NULL,
["DATE"] [varchar](50) NULL,
["WEEK"] [numeric](18, 0) NULL
)

# CCOUNT

CREATE TABLE [dbo].[CCOUNT](
["STORE"] [numeric](18, 0) NOT NULL,
["DATE"] [varchar](50) NULL,
["FROZEN"] [numeric](18, 4) NULL,
["MEAT"] [numeric](18, 4) NULL,
["FISH"] [numeric](18, 4) NULL,
["DAIRY"] [numeric](18, 4) NULL,
["WEEK"] [numeric](18, 0) NULL
)

# CCOUNT_Clean_STG

CREATE TABLE [dbo].[CCOUNT_Clean_STG](
["STORE"] [numeric](18, 0) NOT NULL,
["DATE"] [varchar](50) NULL,
["DAIRY"] [numeric](18, 4) NULL,
["FROZEN"] [numeric](18, 4) NULL,
["MEAT"] [numeric](18, 4) NULL,
["FISH"] [numeric](18, 4) NULL,
["WEEK"] [numeric](18, 0) NULL
)

# Movement_WBJC

CREATE TABLE [dbo].[Movement_WBJC](
["STORE"] [varchar](50) NULL,
["UPC"] [varchar](50) NULL,
["WEEK"] [varchar](50) NULL,
["MOVE"] [varchar](50) NULL,
["QTY"] [varchar](50) NULL,
["PRICE"] [varchar](50) NULL,
["SALE"] [varchar](50) NULL,
["PROFIT"] [varchar](50) NULL,
["OK"] [varchar](50) NULL
)

# Movement_WCIG

CREATE TABLE [dbo].[Movement_WCIG](
["STORE"] [varchar](50) NULL,
["UPC"] [varchar](50) NULL,
["WEEK"] [varchar](50) NULL,
["MOVE"] [varchar](50) NULL,
["QTY"] [varchar](50) NULL,
["PRICE"] [varchar](50) NULL,
["SALE"] [varchar](50) NULL,
["PROFIT"] [varchar](50) NULL,
["OK"] [varchar](50) NULL
)

# Movement_WCSO

CREATE TABLE [dbo].[Movement_WCSO](
["STORE"] [varchar](50) NULL,
["UPC"] [varchar](50) NULL,
["WEEK"] [varchar](50) NULL,
["MOVE"] [varchar](50) NULL,
["QTY"] [varchar](50) NULL,
["PRICE"] [varchar](50) NULL,
["SALE"] [varchar](50) NULL,
["PROFIT"] [varchar](50) NULL,
["OK"] [varchar](50) NULL
)

# Movement_WSDR

CREATE TABLE [dbo].[Movement_WSDR](
[STORE] [varchar](50) NULL,
[UPC] [varchar](50) NULL,
[WEEK] [varchar](50) NULL,
[MOVE] [varchar](50) NULL,
[QTY] [varchar](50) NULL,
[PRICE] [varchar](50) NULL,
[SALE] [varchar](50) NULL,
[PROFIT] [varchar](50) NULL,
[OK] [varchar](50) NULL
)

# Movement_WTNA

CREATE TABLE [dbo].[Movement_WTNA](
["STORE"] [varchar](50) NULL,
["UPC"] [varchar](50) NULL,
["WEEK"] [varchar](50) NULL,
["MOVE"] [varchar](50) NULL,
["QTY"] [varchar](50) NULL,
["PRICE"] [varchar](50) NULL,
["SALE"] [varchar](50) NULL,
["PROFIT"] [varchar](50) NULL,
["OK"] [varchar](50) NULL
)

# ProductSales_STG

CREATE TABLE [dbo].[ProductSales_STG](
[ProductSalesID] [int] NULL,
[UPC] [numeric](18, 0) NULL,
[STORE] [numeric](18, 0) NULL,
[WEEK] [numeric](18, 0) NULL,
[MOVE] [numeric](18, 0) NULL,
[QTY] [numeric](18, 0) NULL,
[PRICE] [float] NULL,
["SALE"] [varchar](50) NULL,
["PROFIT"] [varchar](50) NULL,
[Sales] [numeric](38, 6) NULL,
[Margin] [numeric](38, 6) NULL,
[Gross Margin] [numeric](38, 6) NULL,
[Product_Type] [nvarchar](20) NULL
)

# Store

CREATE TABLE [dbo].[Store](
[Store] [numeric](18, 0) NULL,
[City] [nvarchar](255) NULL,
[Price Tier] [nvarchar](255) NULL,
[Zone] [numeric](18, 0) NULL,
[Zip Code] [numeric](5, 0) NULL,
[Address] [nvarchar](255) NULL
)

# Store_DIM_TEMP

CREATE TABLE [dbo].[Store_DIM_TEMP](
[Store_ID] [int] NULL,
[Store_Number] [numeric](18, 0) NULL,
[Store_Name] [varchar](50) NULL,
[Store_City] [nvarchar](255) NULL,
[Price_Tier] [nvarchar](255) NULL,
[Zone] [numeric](18, 0) NULL,
[Source_System_Code] [nvarchar](40) NULL,
[Active] [int] NULL
)

# UPCBJC

CREATE TABLE [dbo].[UPCBJC](
["COM_CODE"] [varchar](50) NULL,
["UPC"] [varchar](50) NULL,
["DESCRIP"] [varchar](50) NULL,
["SIZE"] [varchar](50) NULL,
["CASE"] [varchar](50) NULL,
["NI

# UPCSDR

CREATE TABLE [dbo].[UPCSDR](
["COM_CODE"] [varchar](50) NULL,
["UPC"] [varchar](50) NULL,
["DESCRIP"] [varchar](50) NULL,
["SIZE"] [varchar](50) NULL,
["CASE"] [varchar](50) NULL,
["NITEM"] [varchar](50) NULL
)

# UPCCIG

CREATE TABLE [dbo].[UPCCIG](
["COM_CODE"] [varchar](50) NULL,
["UPC"] [varchar](50) NULL,
["DESCRIP"] [varchar](50) NULL,
["SIZE"] [varchar](50) NULL,
["CASE"] [varchar](50) NULL,
["NITEM"] [varchar](50) NULL
)

# UPCCSO

CREATE TABLE [dbo].[UPCCSO](
["COM_CODE"] [varchar](50) NULL,
["UPC"] [varchar](50) NULL,
["DESCRIP"] [varchar](50) NULL,
["SIZE"] [varchar](50) NULL,
["CASE"] [varchar](50) NULL,
["NITEM"] [varchar](50) NULL
)

# UPCTNA

CREATE TABLE [dbo].[UPCTNA](
["COM_CODE"] [varchar](50) NULL,
["UPC"] [varchar](50) NULL,
["DESCRIP"] [varchar](50) NULL,
["SIZE"] [varchar](50) NULL,
["CASE"] [varchar](50) NULL,
["NITEM"] [varchar](50) NULL
)

# DATAWAREHOUSE TABLES

# TIME_DIM

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
)
)

# STORE_DIM

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
))

# PRODUCT_DIM

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
)

# CATEGORY_DIM

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
)

# PRODUCT_SALES_FACT

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
ALTER TABLE [dbo].[PRODUCT_SALES_FACT] WITH CHECK ADD CONSTRAINT [FK_PRODUCT_SALES_FACT_3] FOREIGN KEY([Time_ID])
REFERENCES [dbo].[TIME_DIM] ([Time_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
)

# CATEGORYSALES_FACT

CREATE TABLE [dbo].[CategorySales_FACT](
[CATEGORYSALES_ID] [int] NOT NULL PRIMARY KEY,
[Store_ID] [int] NOT NULL FOREIGN KEY REFERENCES [STORE_DIM]([Store_ID]),
[Time_ID] [int]NOT NULL FOREIGN KEY REFERENCES [TIME_DIM]([Time_ID]),
[Category_ID] [numeric](18, 0) NOT NULL FOREIGN KEY REFERENCES [CATEGORY_DIM]([Category_ID]),
[Sales] [numeric](18, 4) NULL
);