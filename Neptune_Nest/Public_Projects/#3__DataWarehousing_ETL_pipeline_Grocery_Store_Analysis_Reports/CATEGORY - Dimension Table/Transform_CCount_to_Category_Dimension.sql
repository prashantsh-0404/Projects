# Transforming CCount to Category Dimension

# SQL Queries used
# SQL for creating CCOUNT

SELECT
["STORE"], ["DATE"], ["DAIRY"], ["FROZEN"], ["MEAT"],["FISH"],["WEEK"]
INTO CCOUNT_Clean_STG
FROM CCOUNT

# SQL for cleaning negative week Values

DELETE FROM CCOUNT_Clean_STG WHERE (["WEEK"] < 0)
40

# Delete stores which have NULL Value

DELETE FROM CCOUNT_Clean_STG WHERE ["STORE"] is NULL

# SQL Task for cleaning Invalid Store Values

DELETE FROM CCOUNT_Clean_STG WHERE ["STORE"] NOT IN (SELECT [Store_Number] FROM Store_DIM_TEMP)

# SQL Task for Cleaning NULL Values

DELETE FROM CCOUNT_Clean_STG WHERE (["STORE"] IS NULL) OR (["DATE"] IS NULL) OR
(["DAIRY"] IS NULL) OR (["FROZEN"] IS NULL) OR (["MEAT"] IS NULL) OR (["FISH"] IS NULL) OR
(["WEEK"] IS NULL)

# SQL Task for Cleaning Date Values

UPDATE CCOUNT_Clean_STG SET ["DATE"] = REPLACE(["DATE"], '"', '')

# SQL Task for Deleting records with Weeks Less than 1

DELETE FROM CCOUNT_Clean_STG WHERE ["WEEK"] <1

# SQL Task for Deleting records with Weeks Grater than 400

DELETE FROM CCOUNT_Clean_STG
WHERE ["WEEK"] > 400