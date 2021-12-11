# MAP statement - part of producing the Feature Matrix
# transformation on our impression data to produce Boolean features

  MAP 
   MODEL_joined_impressions.user_agent, MODEL_joined_impressions.ad_id, 
   MODEL_joined_impressions.clicked
  USING 
   '${SAMPLE}/libs/split_user_agent.py' AS 
   feature, ad_id, clicked
  FROM 
    MODEL_joined_impressions
  LIMIT 10;