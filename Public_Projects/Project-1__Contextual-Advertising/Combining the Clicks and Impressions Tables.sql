# Combining the Clicks and Impressions Tables


CREATE EXTERNAL TABLE joined_impressions (
    requestBeginTime string, adId string, impressionId string, referrer string, 
      userAgent string, userCookie string, ip string, clicked Boolean
    )
    PARTITIONED BY (day string, hour string)
    STORED AS SEQUENCEFILE
    LOCATION '${OUTPUT}/joined_impressions'
  ;

CREATE TABLE tmp_impressions (
    requestBeginTime string, adId string, impressionId string, referrer string, 
    userAgent string, userCookie string, ip string
  )
  STORED AS SEQUENCEFILE;


INSERT OVERWRITE TABLE tmp_impressions 
    SELECT 
      from_unixtime(cast((cast(i.requestBeginTime as bigint) / 1000) as int)) requestBeginTime, 
      i.adId, i.impressionId, i.referrer, i.userAgent, i.userCookie, i.ip
    FROM 
      impressions i
    WHERE 
      i.dt >= '${DAY}-${HOUR}-00' and i.dt < '${NEXT_DAY}-${NEXT_HOUR}-00'
  ;

CREATE TABLE tmp_clicks (
    impressionId string
  ) STORED AS SEQUENCEFILE;

INSERT OVERWRITE TABLE tmp_clicks 
    SELECT 
      impressionId
    FROM 
      clicks c  
    WHERE 
      c.dt >= '${DAY}-${HOUR}-00' AND c.dt < '${NEXT_DAY}-${NEXT_HOUR}-20'
  ;


INSERT OVERWRITE TABLE joined_impressions PARTITION (day='${DAY}', hour='${HOUR}')
  SELECT 
    i.requestBeginTime, i.adId, i.impressionId, i.referrer, i.userAgent, i.userCookie, 
    i.ip, (c.impressionId is not null) clicked
  FROM 
    tmp_impressions i LEFT OUTER JOIN tmp_clicks c ON i.impressionId = c.impressionId
  ;
