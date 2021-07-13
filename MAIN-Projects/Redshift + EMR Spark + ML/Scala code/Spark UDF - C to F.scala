
val sqlContext = new org.apache.spark.sql.hive.HiveContext(sc)

# Read weather table from hive

val rawWeatherDF = sqlContext.table("weather")

# Retrieve the header

val header = rawWeatherDF.first()

# Remove the header from the dataframe

val noHeaderWeatherDF = rawWeatherDF.filter(row => row != header)

# UDF to convert the air temperature from celsius to fahrenheit

val toFahrenheit = udf {(c: Double) => c * 9 / 5 + 32}

# Apply the UDF to maximum and minimum air temperature

val weatherDF=noHeaderWeatherDF.withColumn("new_tmin",toFahrenheit(noHeaderWeatherDF("tmin"))).withColumn("new_tmax",toFahrenheit(noHeaderWeatherDF("tmax"))).drop("tmax").drop("tmin").withColumnRenamed("new_tmax","tmax").withColumnRenamed("new_tmin","tmin")


val jdbcURL = "jdbc:redshift://redshift-cluster-1.cs4itg7hgbxx.us-east-1.redshift.amazonaws.com:5439/dev?user=shishop&password=Admin0404"

val s3TempDir = "s3://AKIAWU724ZEBG4GKJOUW:WTD8k+Ip3bmyq%2FEGfrRAn2so7PX2eOzD6vvMYLGK@projects-1992"

#val s3TempDir = "s3://AKIAWU724ZEBG4GKJOUW:WTD8k+Ip3bmyq/EGfrRAn2so7PX2eOzD6vvMYLGK@projects-1992"

#Query against the ord_flights table in Amazon Redshift
val flightsQuery = """select ID, DAY_OF_MONTH, DAY_OF_WEEK, FL_DATE, f_days_from_holiday(year, month, day_of_month) as DAYS_TO_HOLIDAY, UNIQUE_CARRIER, FL_NUM, substring(DEP_TIME, 1, 2) as DEP_HOUR, cast(DEP_DEL15 as smallint),cast(AIR_TIME as integer), cast(FLIGHTS as smallint), cast(DISTANCE as smallint) from ord_flights where origin='ORD' and cancelled = 0"""

// Create a Dataframe to hold the results of the above query
val flightsDF=sqlContext.read.format("com.databricks.spark.redshift").option("url",jdbcURL).option("tempdir",s3TempDir).option("query",flightsQuery).load()


// Join the two dataframes
val joinedDF = flightsDF.join(weatherDF, flightsDF("fl_date") === weatherDF("dt"))


joinedDF.write.format("com.databricks.spark.redshift").option("url", jdbcURL).option("dbtable", "ord_flights2").option("aws_iam_role", "arn:aws:iam::457403320578:role/redshift-EXT").option("tempdir", s3TempDir).mode("error").save()

//joinedDF.write.format("com.databricks.spark.redshift").option("temporary_aws_access_key_id", awsAccessKey).option("temporary_aws_secret_access_key", awsSecretKey).option("url", jdbcURL).option("dbtable", "ord_flights2").option("aws_iam_role", "arn:aws:iam::457403320578:role/redshift-EXT").option("tempdir", s3TempDir).mode("error").save()


joinedDF.write.format("com.databricks.spark.redshift").option("url", jdbcURL).option("dbtable", "ord_flights_spark_unload").option("aws_iam_role", "arn:aws:iam::457403320578:role/redshift-EXT").option("tempdir", s3TempDir).mode("append").save()




hadoop distcp -Dfs.s3.awsAccessKeyId=<AKIAWU724ZEBG4GKJOUW> -Dfs.s3.awsSecretAccessKey=<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> s3://origin hdfs://destinations


export AWS_ACCESS_KEY_ID=AKIAWU724ZEBG4GKJOUW
export AWS_SECRET_ACCESS_KEY=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
