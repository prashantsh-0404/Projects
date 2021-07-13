create table ord_flights
(
ID              bigint identity(0,1),
YEAR            smallint,
QUARTER     smallint,
MONTH           smallint,
DAY_OF_MONTH        smallint,
DAY_OF_WEEK     smallint,

FL_DATE     date,
UNIQUE_CARRIER  varchar(10),
AIRLINE_ID      int,
CARRIER     varchar(4),
TAIL_NUM        varchar(8),
FL_NUM      varchar(4),

ORIGIN_AIRPORT_ID   smallint,
ORIGIN      varchar(5),
ORIGIN_CITY_NAME    varchar(35),

ORIGIN_STATE_ABR    varchar(2),
ORIGIN_STATE_NM     varchar(50),
ORIGIN_WAC      varchar(2),
DEST_AIRPORT_ID smallint,

DEST            varchar(5),
DEST_CITY_NAME  varchar(35),
DEST_STATE_ABR  varchar(2),

DEST_STATE_NM   varchar(50),
DEST_WAC        varchar(2),
CRS_DEP_TIME        smallint,

DEP_TIME        varchar(6),
DEP_DELAY       numeric(22,6),
DEP_DELAY_NEW   numeric(22,6),
DEP_DEL15       numeric(22,6),
DEP_DELAY_GROUP smallint,
DEP_TIME_BLK        varchar(15),
TAXI_OUT        numeric(22,6),
TAXI_IN         numeric(22,6),
CRS_ARR_TIME        numeric(22,6),
ARR_TIME        varchar(6),
ARR_DELAY       numeric(22,6),
ARR_DELAY_NEW   numeric(22,6),
ARR_DEL15       numeric(22,6),
ARR_DELAY_GROUP     smallint,
ARR_TIME_BLK        varchar(15),
CANCELLED       numeric(22,6),
DIVERTED        numeric(22,6),
CRS_ELAPSED_TIME    numeric(22,6),
ACTUAL_ELAPSED_TIME numeric(22,6),
AIR_TIME        numeric(22,6),
FLIGHTS     numeric(22,6),
DISTANCE        numeric(22,6),
DISTANCE_GROUP  numeric(22,6),
CARRIER_DELAY   numeric(22,6),
WEATHER_DELAY   numeric(22,6),
NAS_DELAY       numeric(22,6),
SECURITY_DELAY  numeric(22,6),
LATE_AIRCRAFT_DELAY numeric(22,6),
primary key (id)
);





-- Copy all flight data for Dec 2013 and 2014 from S3 bucket


copy ord_flights
FROM 's3://projects0404/Spark-Redshift/flight/FLIGHT_DATA_ONTIME_REPORTING.csv'
region 'us-west-2'
iam_role 'arn:aws:iam::457403320578:role/redshift-EXT'
csv
IGNOREHEADER 1
dateformat 'auto'
