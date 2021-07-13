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