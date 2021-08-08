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