# Read weather table from hive

val rawWeatherDF = sqlContext.table("weather")

# Retrieve the header

val header = rawWeatherDF.first()

# Remove the header from the dataframe

val noHeaderWeatherDF = rawWeatherDF.filter(row => row != header)

# UDF to convert the air temperature from celsius to fahrenheit

val toFahrenheit = udf {(c: Double) => c * 9 / 5 + 32}

# Apply the UDF to maximum and minimum air temperature

val weatherDF = noHeaderWeatherDF.withColumn("new_tmin", toFahrenheit(noHeaderWeatherDF("tmin")))
                                     .withColumn("new_tmax", toFahrenheit(noHeaderWeatherDF("tmax")))
                                     .drop("tmax")
                                     .drop("tmin")
                                     .withColumnRenamed("new_tmax","tmax")
                                     .withColumnRenamed("new_tmin","tmin")
