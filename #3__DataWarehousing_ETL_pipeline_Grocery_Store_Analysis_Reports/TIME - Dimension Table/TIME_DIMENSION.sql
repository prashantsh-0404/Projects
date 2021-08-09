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