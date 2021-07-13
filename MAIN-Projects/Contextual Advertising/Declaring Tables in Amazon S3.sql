{\rtf1\ansi\ansicpg1252\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\froman\fcharset0 TimesNewRomanPS-BoldItalicMT;\f1\froman\fcharset0 TimesNewRomanPSMT;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\i\b\fs36 \cf0 # Declaring Tables in Amazon S3
\f1\i0\b0 \
\
\
CREATE EXTERNAL TABLE impressions (\
    requestBeginTime string, adId string, impressionId string, referrer string, \
    userAgent string, userCookie string, ip string\
  )\
  PARTITIONED BY (dt string)\
  ROW FORMAT \
    serde 'org.apache.hive.hcatalog.data.JsonSerDe'\
    with serdeproperties ( 'paths'='requestBeginTime, adId, impressionId, referrer, userAgent, userCookie, ip' )\
  LOCATION '$\{SAMPLE\}/tables/impressions' ;\
\
\
ALTER TABLE impressions ADD PARTITION (dt='2009-04-13-08-05') ;\
MSCK REPAIR TABLE impressions\
\
\
CREATE EXTERNAL TABLE clicks (\
    impressionId string\
  )\
  PARTITIONED BY (dt string)\
  ROW FORMAT \
    SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'\
    WITH SERDEPROPERTIES ( 'paths'='impressionId' )\
  LOCATION '$\{SAMPLE\}/tables/clicks' ;\
\
MSCK REPAIR TABLE clicks}