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