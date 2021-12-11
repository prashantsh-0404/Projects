# Declaring External Tables in the Interactive Job Flow



CREATE EXTERNAL TABLE IF NOT EXISTS MODEL_joined_impressions (
  request_begin_time string, ad_id string, impression_id string, 
  page string, user_agent string, user_cookie string, ip_address string,
  clicked boolean 
 )
 PARTITIONED BY (day STRING, hour STRING)
 STORED AS SEQUENCEFILE
 LOCATION '${SAMPLE}/tables/joined_impressions';


MSCK REPAIR TABLE MODEL_joined_imressions;

SHOW PARTITIONS MODEL_joined_impressions;
