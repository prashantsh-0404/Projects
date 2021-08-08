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