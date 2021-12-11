CREATE TABLE [dbo].[WEEK_DECODE](
	[Week] [float] NULL,
	[Start] [datetime] NULL,
	[End] [datetime] NULL,
	[Special Events] [nvarchar](255) NULL
)

CREATE TABLE [dbo].[Store](
	[Store] [numeric](18, 0) NULL,
	[City] [nvarchar](255) NULL,
	[Price Tier] [nvarchar](255) NULL,
	[Zone] [numeric](18, 0) NULL,
	[Zip Code] [numeric](5, 0) NULL,
	[Address] [nvarchar](255) NULL
) 



CREATE TABLE [dbo].[CategoryDIMStaging](
	[Category_Name] [nvarchar](255) NULL,
	[Sales] [numeric](18, 4) NULL,
	["STORE"] [numeric](18, 0) NULL,
	["DATE"] [varchar](50) NULL,
	["WEEK"] [numeric](18, 0) NULL
)

CREATE TABLE [dbo].[CCOUNT](
	["STORE"] [numeric](18, 0) NOT NULL,
	["DATE"] [varchar](50) NULL,
	["FROZEN"] [numeric](18, 4) NULL,
	["MEAT"] [numeric](18, 4) NULL,
	["FISH"] [numeric](18, 4) NULL,
	["DAIRY"] [numeric](18, 4) NULL,
	["WEEK"] [numeric](18, 0) NULL
) 

---------------
CREATE TABLE [dbo].[CCOUNT_Clean_STG](
	["STORE"] [numeric](18, 0) NOT NULL,
	["DATE"] [varchar](50) NULL,
	["DAIRY"] [numeric](18, 4) NULL,
	["FROZEN"] [numeric](18, 4) NULL,
	["MEAT"] [numeric](18, 4) NULL,
	["FISH"] [numeric](18, 4) NULL,
	["WEEK"] [numeric](18, 0) NULL
)
-----------------------------------------------
CREATE TABLE [dbo].[DEMO](
	["MMID"] [varchar](50) NULL,
	["NAME"] [varchar](50) NULL,
	["CITY"] [varchar](50) NULL,
	["ZIP"] [varchar](50) NULL,
	["LAT"] [varchar](50) NULL,
	["LONG"] [varchar](50) NULL,
	["WEEKVOL"] [varchar](50) NULL,
	["STORE"] [varchar](50) NULL,
	["SCLUSTER"] [varchar](50) NULL,
	["ZONE"] [varchar](50) NULL,
	["AGE9"] [varchar](50) NULL,
	["AGE60"] [varchar](50) NULL,
	["ETHNIC"] [varchar](50) NULL,
	["EDUC"] [varchar](50) NULL,
	["NOCAR"] [varchar](50) NULL,
	["INCOME"] [varchar](50) NULL,
	["INCSIGMA"] [varchar](50) NULL,
	["GINI"] [varchar](50) NULL,
	["HSIZEAVG"] [varchar](50) NULL,
	["HSIZE1"] [varchar](50) NULL,
	["HSIZE2"] [varchar](50) NULL,
	["HSIZE34"] [varchar](50) NULL,
	["HSIZE567"] [varchar](50) NULL,
	["HH3PLUS"] [varchar](50) NULL,
	["HH4PLUS"] [varchar](50) NULL,
	["HHSINGLE"] [varchar](50) NULL,
	["HHLARGE"] [varchar](50) NULL,
	["WORKWOM"] [varchar](50) NULL,
	["SINHOUSE"] [varchar](50) NULL,
	["DENSITY"] [varchar](50) NULL,
	["HVAL150"] [varchar](50) NULL,
	["HVAL200"] [varchar](50) NULL,
	["HVALMEAN"] [varchar](50) NULL,
	["SINGLE"] [varchar](50) NULL,
	["RETIRED"] [varchar](50) NULL,
	["UNEMP"] [varchar](50) NULL,
	["WRKCH5"] [varchar](50) NULL,
	["WRKCH17"] [varchar](50) NULL,
	["NWRKCH5"] [varchar](50) NULL,
	["NWRKCH17"] [varchar](50) NULL,
	["WRKCH"] [varchar](50) NULL,
	["NWRKCH"] [varchar](50) NULL,
	["WRKWCH"] [varchar](50) NULL,
	["WRKWNCH"] [varchar](50) NULL,
	["TELEPHN"] [varchar](50) NULL,
	["MORTGAGE"] [varchar](50) NULL,
	["NWHITE"] [varchar](50) NULL,
	["POVERTY"] [varchar](50) NULL,
	["SHPCONS"] [varchar](50) NULL,
	["SHPHURR"] [varchar](50) NULL,
	["SHPAVID"] [varchar](50) NULL,
	["SHPKSTR"] [varchar](50) NULL,
	["SHPUNFT"] [varchar](50) NULL,
	["SHPBIRD"] [varchar](50) NULL,
	["SHOPINDX"] [varchar](50) NULL,
	["SHPINDX"] [varchar](50) NULL,
	["GROUP1"] [varchar](50) NULL,
	["GROUP2"] [varchar](50) NULL,
	["GROUP3"] [varchar](50) NULL,
	["GROUP4"] [varchar](50) NULL,
	["GROUP5"] [varchar](50) NULL,
	["GROUP6"] [varchar](50) NULL,
	["GROUP7"] [varchar](50) NULL,
	["GROUP8"] [varchar](50) NULL,
	["GROUP9"] [varchar](50) NULL,
	["GROUP10"] [varchar](50) NULL,
	["GROUP11"] [varchar](50) NULL,
	["GROUP12"] [varchar](50) NULL,
	["SELAS1"] [varchar](50) NULL,
	["SELAS2"] [varchar](50) NULL,
	["SELAS3"] [varchar](50) NULL,
	["SELAS4"] [varchar](50) NULL,
	["SELAS5"] [varchar](50) NULL,
	["SELAS6"] [varchar](50) NULL,
	["SELAS7"] [varchar](50) NULL,
	["SELAS8"] [varchar](50) NULL,
	["SELAS9"] [varchar](50) NULL,
	["SELAS10"] [varchar](50) NULL,
	["SELAS11"] [varchar](50) NULL,
	["SELAS12"] [varchar](50) NULL,
	["SELAS13"] [varchar](50) NULL,
	["SELAS14"] [varchar](50) NULL,
	["SELAS15"] [varchar](50) NULL,
	["SELAS16"] [varchar](50) NULL,
	["SELAS17"] [varchar](50) NULL,
	["SELAS18"] [varchar](50) NULL,
	["SELAS19"] [varchar](50) NULL,
	["SELAS20"] [varchar](50) NULL,
	["SELAS21"] [varchar](50) NULL,
	["SELAS22"] [varchar](50) NULL,
	["SELAS23"] [varchar](50) NULL,
	["SELAS24"] [varchar](50) NULL,
	["SEELAS1"] [varchar](50) NULL,
	["SEELAS2"] [varchar](50) NULL,
	["SEELAS3"] [varchar](50) NULL,
	["SEELAS4"] [varchar](50) NULL,
	["SEELAS5"] [varchar](50) NULL,
	["SEELAS6"] [varchar](50) NULL,
	["SEELAS7"] [varchar](50) NULL,
	["SEELAS8"] [varchar](50) NULL,
	["SEELAS9"] [varchar](50) NULL,
	["SEELAS10"] [varchar](50) NULL,
	["SEELAS11"] [varchar](50) NULL,
	["SEELAS12"] [varchar](50) NULL,
	["SEELAS13"] [varchar](50) NULL,
	["SEELAS14"] [varchar](50) NULL,
	["SEELAS15"] [varchar](50) NULL,
	["SEELAS16"] [varchar](50) NULL,
	["SEELAS17"] [varchar](50) NULL,
	["SEELAS18"] [varchar](50) NULL,
	["SEELAS19"] [varchar](50) NULL,
	["SEELAS20"] [varchar](50) NULL,
	["SEELAS21"] [varchar](50) NULL,
	["SEELAS22"] [varchar](50) NULL,
	["SEELAS23"] [varchar](50) NULL,
	["SEELAS24"] [varchar](50) NULL,
	["SELASALL"] [varchar](50) NULL,
	["STORENO"] [varchar](50) NULL,
	["URBAN"] [varchar](50) NULL,
	["CUBDIST"] [varchar](50) NULL,
	["CUBVOL"] [varchar](50) NULL,
	["CUBID"] [varchar](50) NULL,
	["OMNIDIST"] [varchar](50) NULL,
	["OMNIVOL"] [varchar](50) NULL,
	["OMNIID"] [varchar](50) NULL,
	["DDIST1"] [varchar](50) NULL,
	["DDIST2"] [varchar](50) NULL,
	["DDIST3"] [varchar](50) NULL,
	["DDIST4"] [varchar](50) NULL,
	["DDIST5"] [varchar](50) NULL,
	["DDIST6"] [varchar](50) NULL,
	["DDIST7"] [varchar](50) NULL,
	["DDIST8"] [varchar](50) NULL,
	["DDIST9"] [varchar](50) NULL,
	["DDIST10"] [varchar](50) NULL,
	["DCVOL1"] [varchar](50) NULL,
	["DCVOL2"] [varchar](50) NULL,
	["DCVOL3"] [varchar](50) NULL,
	["DCVOL4"] [varchar](50) NULL,
	["DCVOL5"] [varchar](50) NULL,
	["DCVOL6"] [varchar](50) NULL,
	["DCVOL7"] [varchar](50) NULL,
	["DCVOL8"] [varchar](50) NULL,
	["DCVOL9"] [varchar](50) NULL,
	["DCVOL10"] [varchar](50) NULL,
	["DCID1"] [varchar](50) NULL,
	["DCID2"] [varchar](50) NULL,
	["DCID3"] [varchar](50) NULL,
	["DCID4"] [varchar](50) NULL,
	["DCID5"] [varchar](50) NULL,
	["DCID6"] [varchar](50) NULL,
	["DCID7"] [varchar](50) NULL,
	["DCID8"] [varchar](50) NULL,
	["DCID9"] [varchar](50) NULL,
	["DCID10"] [varchar](50) NULL,
	["TTIME1"] [varchar](50) NULL,
	["TTIME2"] [varchar](50) NULL,
	["TTIME3"] [varchar](50) NULL,
	["TTIME4"] [varchar](50) NULL,
	["TTIME5"] [varchar](50) NULL,
	["TTIME6"] [varchar](50) NULL,
	["TTIME7"] [varchar](50) NULL,
	["TTIME8"] [varchar](50) NULL,
	["TTIME9"] [varchar](50) NULL,
	["TTIME10"] [varchar](50) NULL,
	["TCVOL1"] [varchar](50) NULL,
	["TCVOL2"] [varchar](50) NULL,
	["TCVOL3"] [varchar](50) NULL,
	["TCVOL4"] [varchar](50) NULL,
	["TCVOL5"] [varchar](50) NULL,
	["TCVOL6"] [varchar](50) NULL,
	["TCVOL7"] [varchar](50) NULL,
	["TCVOL8"] [varchar](50) NULL,
	["TCVOL9"] [varchar](50) NULL,
	["TCVOL10"] [varchar](50) NULL,
	["TCID1"] [varchar](50) NULL,
	["TCID2"] [varchar](50) NULL,
	["TCID3"] [varchar](50) NULL,
	["TCID4"] [varchar](50) NULL,
	["TCID5"] [varchar](50) NULL,
	["TCID6"] [varchar](50) NULL,
	["TCID7"] [varchar](50) NULL,
	["TCID8"] [varchar](50) NULL,
	["TCID9"] [varchar](50) NULL,
	["TCID10"] [varchar](50) NULL,
	["LSELAS1"] [varchar](50) NULL,
	["LSELAS2"] [varchar](50) NULL,
	["LSELAS3"] [varchar](50) NULL,
	["LSELAS4"] [varchar](50) NULL,
	["LSELAS5"] [varchar](50) NULL,
	["LSELAS6"] [varchar](50) NULL,
	["LSELAS7"] [varchar](50) NULL,
	["LSELAS8"] [varchar](50) NULL,
	["LSELAS9"] [varchar](50) NULL,
	["LSELAS10"] [varchar](50) NULL,
	["LSELAS11"] [varchar](50) NULL,
	["LSELAS12"] [varchar](50) NULL,
	["LSELAS13"] [varchar](50) NULL,
	["LSELAS14"] [varchar](50) NULL,
	["LSELAS15"] [varchar](50) NULL,
	["LSELAS16"] [varchar](50) NULL,
	["LSELAS17"] [varchar](50) NULL,
	["LSELAS18"] [varchar](50) NULL,
	["LSELAS19"] [varchar](50) NULL,
	["LSELAS20"] [varchar](50) NULL,
	["LSELAS21"] [varchar](50) NULL,
	["LSELAS22"] [varchar](50) NULL,
	["PERCENT"] [varchar](50) NULL,
	["LIFT1"] [varchar](50) NULL,
	["RATIO1"] [varchar](50) NULL,
	["LIFT2"] [varchar](50) NULL,
	["RATIO2"] [varchar](50) NULL,
	["LIFT3"] [varchar](50) NULL,
	["RATIO3"] [varchar](50) NULL,
	["LIFT4"] [varchar](50) NULL,
	["RATIO4"] [varchar](50) NULL,
	["LIFT5"] [varchar](50) NULL,
	["RATIO5"] [varchar](50) NULL,
	["LIFT6"] [varchar](50) NULL,
	["RATIO6"] [varchar](50) NULL,
	["LIFT7"] [varchar](50) NULL,
	["RATIO7"] [varchar](50) NULL,
	["LIFT8"] [varchar](50) NULL,
	["RATIO8"] [varchar](50) NULL,
	["LIFT9"] [varchar](50) NULL,
	["RATIO9"] [varchar](50) NULL,
	["LIFT10"] [varchar](50) NULL,
	["RATIO10"] [varchar](50) NULL,
	["LIFT11"] [varchar](50) NULL,
	["RATIO11"] [varchar](50) NULL,
	["LIFT12"] [varchar](50) NULL,
	["RATIO12"] [varchar](50) NULL,
	["LIFT13"] [varchar](50) NULL,
	["RATIO13"] [varchar](50) NULL,
	["LIFT14"] [varchar](50) NULL,
	["RATIO14"] [varchar](50) NULL,
	["LIFT15"] [varchar](50) NULL,
	["RATIO15"] [varchar](50) NULL,
	["LIFT16"] [varchar](50) NULL,
	["RATIO16"] [varchar](50) NULL,
	["LIFT17"] [varchar](50) NULL,
	["RATIO17"] [varchar](50) NULL,
	["LIFT18"] [varchar](50) NULL,
	["RATIO18"] [varchar](50) NULL,
	["LIFT19"] [varchar](50) NULL,
	["RATIO19"] [varchar](50) NULL,
	["LIFT20"] [varchar](50) NULL,
	["RATIO20"] [varchar](50) NULL,
	["LIFT21"] [varchar](50) NULL,
	["RATIO21"] [varchar](50) NULL,
	["LIFT22"] [varchar](50) NULL,
	["RATIO22"] [varchar](50) NULL,
	["LIFT23"] [varchar](50) NULL,
	["RATIO23"] [varchar](50) NULL,
	["UELAS1"] [varchar](50) NULL,
	["UTELS1"] [varchar](50) NULL,
	["UNETA1"] [varchar](50) NULL,
	["WELAS1"] [varchar](50) NULL,
	["WTELS1"] [varchar](50) NULL,
	["WNETA1"] [varchar](50) NULL,
	["UELAS2"] [varchar](50) NULL,
	["UTELS2"] [varchar](50) NULL,
	["UNETA2"] [varchar](50) NULL,
	["WELAS2"] [varchar](50) NULL,
	["WTELS2"] [varchar](50) NULL,
	["WNETA2"] [varchar](50) NULL,
	["UELAS3"] [varchar](50) NULL,
	["UTELS3"] [varchar](50) NULL,
	["UNETA3"] [varchar](50) NULL,
	["WELAS3"] [varchar](50) NULL,
	["WTELS3"] [varchar](50) NULL,
	["WNETA3"] [varchar](50) NULL,
	["UELAS4"] [varchar](50) NULL,
	["UTELS4"] [varchar](50) NULL,
	["UNETA4"] [varchar](50) NULL,
	["WELAS4"] [varchar](50) NULL,
	["WTELS4"] [varchar](50) NULL,
	["WNETA4"] [varchar](50) NULL,
	["UELAS5"] [varchar](50) NULL,
	["UTELS5"] [varchar](50) NULL,
	["UNETA5"] [varchar](50) NULL,
	["WELAS5"] [varchar](50) NULL,
	["WTELS5"] [varchar](50) NULL,
	["WNETA5"] [varchar](50) NULL,
	["UELAS6"] [varchar](50) NULL,
	["UTELS6"] [varchar](50) NULL,
	["UNETA6"] [varchar](50) NULL,
	["WELAS6"] [varchar](50) NULL,
	["WTELS6"] [varchar](50) NULL,
	["WNETA6"] [varchar](50) NULL,
	["UELAS7"] [varchar](50) NULL,
	["UTELS7"] [varchar](50) NULL,
	["UNETA7"] [varchar](50) NULL,
	["WELAS7"] [varchar](50) NULL,
	["WTELS7"] [varchar](50) NULL,
	["WNETA7"] [varchar](50) NULL,
	["UELAS8"] [varchar](50) NULL,
	["UTELS8"] [varchar](50) NULL,
	["UNETA8"] [varchar](50) NULL,
	["WELAS8"] [varchar](50) NULL,
	["WTELS8"] [varchar](50) NULL,
	["WNETA8"] [varchar](50) NULL,
	["UELAS9"] [varchar](50) NULL,
	["UTELS9"] [varchar](50) NULL,
	["UNETA9"] [varchar](50) NULL,
	["WELAS9"] [varchar](50) NULL,
	["WTELS9"] [varchar](50) NULL,
	["WNETA9"] [varchar](50) NULL,
	["UELAS10"] [varchar](50) NULL,
	["UTELS10"] [varchar](50) NULL,
	["UNETA10"] [varchar](50) NULL,
	["WELAS10"] [varchar](50) NULL,
	["WTELS10"] [varchar](50) NULL,
	["WNETA10"] [varchar](50) NULL,
	["UELAS11"] [varchar](50) NULL,
	["UTELS11"] [varchar](50) NULL,
	["UNETA11"] [varchar](50) NULL,
	["WELAS11"] [varchar](50) NULL,
	["WTELS11"] [varchar](50) NULL,
	["WNETA11"] [varchar](50) NULL,
	["UELAS12"] [varchar](50) NULL,
	["UTELS12"] [varchar](50) NULL,
	["UNETA12"] [varchar](50) NULL,
	["WELAS12"] [varchar](50) NULL,
	["WTELS12"] [varchar](50) NULL,
	["WNETA12"] [varchar](50) NULL,
	["UELAS13"] [varchar](50) NULL,
	["UTELS13"] [varchar](50) NULL,
	["UNETA13"] [varchar](50) NULL,
	["WELAS13"] [varchar](50) NULL,
	["WTELS13"] [varchar](50) NULL,
	["WNETA13"] [varchar](50) NULL,
	["UELAS14"] [varchar](50) NULL,
	["UTELS14"] [varchar](50) NULL,
	["UNETA14"] [varchar](50) NULL,
	["WELAS14"] [varchar](50) NULL,
	["WTELS14"] [varchar](50) NULL,
	["WNETA14"] [varchar](50) NULL,
	["UELAS15"] [varchar](50) NULL,
	["UTELS15"] [varchar](50) NULL,
	["UNETA15"] [varchar](50) NULL,
	["WELAS15"] [varchar](50) NULL,
	["WTELS15"] [varchar](50) NULL,
	["WNETA15"] [varchar](50) NULL,
	["UELAS16"] [varchar](50) NULL,
	["UTELS16"] [varchar](50) NULL,
	["UNETA16"] [varchar](50) NULL,
	["WELAS16"] [varchar](50) NULL,
	["WTELS16"] [varchar](50) NULL,
	["WNETA16"] [varchar](50) NULL,
	["UELAS17"] [varchar](50) NULL,
	["UTELS17"] [varchar](50) NULL,
	["UNETA17"] [varchar](50) NULL,
	["WELAS17"] [varchar](50) NULL,
	["WTELS17"] [varchar](50) NULL,
	["WNETA17"] [varchar](50) NULL,
	["UELAS18"] [varchar](50) NULL,
	["UTELS18"] [varchar](50) NULL,
	["UNETA18"] [varchar](50) NULL,
	["WELAS18"] [varchar](50) NULL,
	["WTELS18"] [varchar](50) NULL,
	["WNETA18"] [varchar](50) NULL,
	["UELAS19"] [varchar](50) NULL,
	["UTELS19"] [varchar](50) NULL,
	["UNETA19"] [varchar](50) NULL,
	["WELAS19"] [varchar](50) NULL,
	["WTELS19"] [varchar](50) NULL,
	["WNETA19"] [varchar](50) NULL,
	["UELAS20"] [varchar](50) NULL,
	["UTELS20"] [varchar](50) NULL,
	["UNETA20"] [varchar](50) NULL,
	["WELAS20"] [varchar](50) NULL,
	["WTELS20"] [varchar](50) NULL,
	["WNETA20"] [varchar](50) NULL,
	["UELAS21"] [varchar](50) NULL,
	["UTELS21"] [varchar](50) NULL,
	["UNETA21"] [varchar](50) NULL,
	["WELAS21"] [varchar](50) NULL,
	["WTELS21"] [varchar](50) NULL,
	["WNETA21"] [varchar](50) NULL,
	["UELAS22"] [varchar](50) NULL,
	["UTELS22"] [varchar](50) NULL,
	["UNETA22"] [varchar](50) NULL,
	["WELAS22"] [varchar](50) NULL,
	["WTELS22"] [varchar](50) NULL,
	["WNETA22"] [varchar](50) NULL,
	["UELAS23"] [varchar](50) NULL,
	["UTELS23"] [varchar](50) NULL,
	["UNETA23"] [varchar](50) NULL,
	["WELAS23"] [varchar](50) NULL,
	["WTELS23"] [varchar](50) NULL,
	["WNETA23"] [varchar](50) NULL,
	["NELAS1"] [varchar](50) NULL,
	["NELAS2"] [varchar](50) NULL,
	["NELAS3"] [varchar](50) NULL,
	["NELAS4"] [varchar](50) NULL,
	["NELAS5"] [varchar](50) NULL,
	["NELAS6"] [varchar](50) NULL,
	["NELAS7"] [varchar](50) NULL,
	["NELAS8"] [varchar](50) NULL,
	["NELAS9"] [varchar](50) NULL,
	["NELAS10"] [varchar](50) NULL,
	["NELAS11"] [varchar](50) NULL,
	["NELAS12"] [varchar](50) NULL,
	["NELAS13"] [varchar](50) NULL,
	["NELAS14"] [varchar](50) NULL,
	["NELAS15"] [varchar](50) NULL,
	["NELAS16"] [varchar](50) NULL,
	["NELAS17"] [varchar](50) NULL,
	["NELAS18"] [varchar](50) NULL,
	["NEELAS1"] [varchar](50) NULL,
	["NEELAS2"] [varchar](50) NULL,
	["NEELAS3"] [varchar](50) NULL,
	["NEELAS4"] [varchar](50) NULL,
	["NEELAS5"] [varchar](50) NULL,
	["NEELAS6"] [varchar](50) NULL,
	["NEELAS7"] [varchar](50) NULL,
	["NEELAS8"] [varchar](50) NULL,
	["NEELAS9"] [varchar](50) NULL,
	["NEELAS10"] [varchar](50) NULL,
	["NEELAS11"] [varchar](50) NULL,
	["NEELAS12"] [varchar](50) NULL,
	["NEELAS13"] [varchar](50) NULL,
	["NEELAS14"] [varchar](50) NULL,
	["NEELAS15"] [varchar](50) NULL,
	["NEELAS16"] [varchar](50) NULL,
	["NEELAS17"] [varchar](50) NULL,
	["NEELAS18"] [varchar](50) NULL,
	["MELAS1"] [varchar](50) NULL,
	["MELAS2"] [varchar](50) NULL,
	["MELAS3"] [varchar](50) NULL,
	["MELAS4"] [varchar](50) NULL,
	["MELAS5"] [varchar](50) NULL,
	["MELAS6"] [varchar](50) NULL,
	["MELAS7"] [varchar](50) NULL,
	["MELAS8"] [varchar](50) NULL,
	["MELAS9"] [varchar](50) NULL,
	["MELAS10"] [varchar](50) NULL,
	["MELAS11"] [varchar](50) NULL,
	["MELAS12"] [varchar](50) NULL,
	["MELAS13"] [varchar](50) NULL,
	["MELAS14"] [varchar](50) NULL,
	["MELAS15"] [varchar](50) NULL,
	["MELAS16"] [varchar](50) NULL,
	["MELAS17"] [varchar](50) NULL,
	["MELAS18"] [varchar](50) NULL,
	["MEELAS1"] [varchar](50) NULL,
	["MEELAS2"] [varchar](50) NULL,
	["MEELAS3"] [varchar](50) NULL,
	["MEELAS4"] [varchar](50) NULL,
	["MEELAS5"] [varchar](50) NULL,
	["MEELAS6"] [varchar](50) NULL,
	["MEELAS7"] [varchar](50) NULL,
	["MEELAS8"] [varchar](50) NULL,
	["MEELAS9"] [varchar](50) NULL,
	["MEELAS10"] [varchar](50) NULL,
	["MEELAS11"] [varchar](50) NULL,
	["MEELAS12"] [varchar](50) NULL,
	["MEELAS13"] [varchar](50) NULL,
	["MEELAS14"] [varchar](50) NULL,
	["MEELAS15"] [varchar](50) NULL,
	["MEELAS16"] [varchar](50) NULL,
	["MEELAS17"] [varchar](50) NULL,
	["MEELAS18"] [varchar](50) NULL,
	["I"] [varchar](50) NULL,
	["DOMVOL"] [varchar](50) NULL,
	["COMPCUB"] [varchar](50) NULL,
	["COMPNEAR"] [varchar](50) NULL,
	["COMPBY"] [varchar](50) NULL,
	["COMPFAR"] [varchar](50) NULL,
	["DRTIME1"] [varchar](50) NULL,
	["DRTIME2"] [varchar](50) NULL,
	["DRTIME3"] [varchar](50) NULL,
	["DRTIME4"] [varchar](50) NULL,
	["DRTIME5"] [varchar](50) NULL,
	["DRVOL1"] [varchar](50) NULL,
	["DRVOL2"] [varchar](50) NULL,
	["DRVOL3"] [varchar](50) NULL,
	["DRVOL4"] [varchar](50) NULL,
	["DRVOL5"] [varchar](50) NULL,
	["DRWVOL1"] [varchar](50) NULL,
	["DRWVOL2"] [varchar](50) NULL,
	["DRWVOL3"] [varchar](50) NULL,
	["DRWVOL4"] [varchar](50) NULL,
	["DRWVOL5"] [varchar](50) NULL,
	["SSTRDIST"] [varchar](50) NULL,
	["SSTRVOL"] [varchar](50) NULL,
	["CPDIST1"] [varchar](50) NULL,
	["CPDIST2"] [varchar](50) NULL,
	["CPDIST3"] [varchar](50) NULL,
	["CPDIST4"] [varchar](50) NULL,
	["CPDIST5"] [varchar](50) NULL,
	["CPVOL1"] [varchar](50) NULL,
	["CPVOL2"] [varchar](50) NULL,
	["CPVOL3"] [varchar](50) NULL,
	["CPVOL4"] [varchar](50) NULL,
	["CPVOL5"] [varchar](50) NULL,
	["CPWVOL1"] [varchar](50) NULL,
	["CPWVOL2"] [varchar](50) NULL,
	["CPWVOL3"] [varchar](50) NULL,
	["CPWVOL4"] [varchar](50) NULL,
	["CPWVOL5"] [varchar](50) NULL,
	["FARTHEST"] [varchar](50) NULL,
	["DTDIST"] [varchar](50) NULL,
	["DTVOL"] [varchar](50) NULL,
	["DTWVOL"] [varchar](50) NULL,
	["DTCOMP"] [varchar](50) NULL,
	["PRICLOW"] [varchar](50) NULL,
	["PRICMED"] [varchar](50) NULL,
	["PRICHIGH"] [varchar](50) NULL
)
-------------------------------------------------
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
-----------------------------------------------------
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
------------------------------------------------------
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
------------------------------------------------------
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
------------------------------------------------------------
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
---------------------------------------------------------
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
--------------------------------------------------------
CREATE TABLE [dbo].[Store](
	[Store] [numeric](18, 0) NULL,
	[City] [nvarchar](255) NULL,
	[Price Tier] [nvarchar](255) NULL,
	[Zone] [numeric](18, 0) NULL,
	[Zip Code] [numeric](5, 0) NULL,
	[Address] [nvarchar](255) NULL
)
---------------------------------------------------------
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
----------------------------------------------------------
CREATE TABLE [dbo].[UPCBJC](
	["COM_CODE"] [varchar](50) NULL,
	["UPC"] [varchar](50) NULL,
	["DESCRIP"] [varchar](50) NULL,
	["SIZE"] [varchar](50) NULL,
	["CASE"] [varchar](50) NULL,
	["NITEM"] [varchar](50) NULL
)
-----------------------------------------------------------
----------------------------------------------------------
CREATE TABLE [dbo].[UPCSDR](
	["COM_CODE"] [varchar](50) NULL,
	["UPC"] [varchar](50) NULL,
	["DESCRIP"] [varchar](50) NULL,
	["SIZE"] [varchar](50) NULL,
	["CASE"] [varchar](50) NULL,
	["NITEM"] [varchar](50) NULL
)
-----------------------------------------------------------
----------------------------------------------------------
CREATE TABLE [dbo].[UPCCIG](
	["COM_CODE"] [varchar](50) NULL,
	["UPC"] [varchar](50) NULL,
	["DESCRIP"] [varchar](50) NULL,
	["SIZE"] [varchar](50) NULL,
	["CASE"] [varchar](50) NULL,
	["NITEM"] [varchar](50) NULL
)
-----------------------------------------------------------
----------------------------------------------------------
CREATE TABLE [dbo].[UPCCSO](
	["COM_CODE"] [varchar](50) NULL,
	["UPC"] [varchar](50) NULL,
	["DESCRIP"] [varchar](50) NULL,
	["SIZE"] [varchar](50) NULL,
	["CASE"] [varchar](50) NULL,
	["NITEM"] [varchar](50) NULL
)
-----------------------------------------------------------
----------------------------------------------------------
CREATE TABLE [dbo].[UPCTNA](
	["COM_CODE"] [varchar](50) NULL,
	["UPC"] [varchar](50) NULL,
	["DESCRIP"] [varchar](50) NULL,
	["SIZE"] [varchar](50) NULL,
	["CASE"] [varchar](50) NULL,
	["NITEM"] [varchar](50) NULL
)
-----------------------------------------------------------



