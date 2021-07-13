# Combining the Features
#  Now that we've written queries to normalize each of the feature types let's combine them into one table. We can do this using Hive's UNION operator. Keep in mind that all sub queries in the union must have the same number of columns that have the same, exact names.


  SELECT *
  FROM (
    SELECT concat('ua:', trim(lower(ua.feature))) as feature, ua.ad_id, ua.clicked
    FROM (
      MAP MODEL_joined_impressions.user_agent, MODEL_joined_impressions.ad_id, MODEL_joined_impressions.clicked
      USING '${SAMPLE}/libs/split_user_agent.py' as (feature STRING, ad_id STRING, clicked BOOLEAN)
      FROM MODEL_joined_impressions
    ) ua
   
   UNION ALL
    
   SELECT concat('ip:', regexp_extract(ip_address, '^([0-9]{1,3}\.[0-9]{1,3}).*', 1)) as feature, ad_id, clicked
   FROM MODEL_joined_impressions
    
   UNION ALL
    
   SELECT concat('page:', lower(page)) as feature, ad_id, clicked
     FROM MODEL_joined_impressions
   ) temp
   limit 50;

# Note that we had to modify the user agent query slightly. Passing data through a mapper strips the columns of their types and returns them as strings. To merge with the other tables, we need to define clicked as a Boolean.

# Index Table

CREATE TABLE feature_index (
    feature STRING,
    ad_id STRING,
    clicked_percent DOUBLE )
  STORED AS SEQUENCEFILE;


INSERT OVERWRITE TABLE feature_index
    SELECT
      temp.feature,
      temp.ad_id,
      sum(if(temp.clicked, 1, 0)) / cast(count(1) as DOUBLE) as clicked_percent
    FROM (
      SELECT concat('ua:', trim(lower(ua.feature))) as feature, ua.ad_id, ua.clicked
      FROM (
        MAP MODEL_joined_impressions.user_agent, MODEL_joined_impressions.ad_id, MODEL_joined_impressions.clicked
        USING '${SAMPLE}/libs/split_user_agent.py' as (feature STRING, ad_id STRING, clicked BOOLEAN)
      FROM MODEL_joined_impressions
    ) ua
    
    UNION ALL
    
    SELECT concat('ip:', regexp_extract(ip_address, '^([0-9]{1,3}\.[0-9]{1,3}).*', 1)) as feature, ad_id, clicked
    FROM MODEL_joined_impressions
    
    UNION ALL
    
    SELECT concat('page:', lower(page)) as feature, ad_id, clicked
    FROM MODEL_joined_impressions
  ) temp
  GROUP BY temp.feature, temp.ad_id;

cast(count(clicked = 'true') as DOUBLE)

sum(if(clicked = 'true', 1, 0))


# Applying the Heuristic
————————————————

SELECT 
    ad_id, -sum(log(if(0.0001 > clicked_percent, 0.0001, clicked_percent))) AS value
  FROM 
    feature_index
  WHERE 
    feature = 'ua:safari' OR feature = 'ua:chrome'
  GROUP BY 
    ad_id
  ORDER BY 
    value ASC
  LIMIT 100
  ;
