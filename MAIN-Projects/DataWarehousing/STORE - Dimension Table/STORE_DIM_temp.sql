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