
# Category_dimension_table_creation

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