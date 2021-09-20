import org.apache.log4j.{Level, Logger}
import org.apache.spark.sql.SparkSession

object FlightSample {
  def main(args: Array[String]) {

    //Setting the logging to ERROR
    Logger.getLogger("org.apache.spark").setLevel(Level.ERROR)
    Logger.getLogger("org.apache.spark.storage.BlockManager").setLevel(Level.ERROR)

    val OutputLocation = args(0)

    val session = SparkSession.builder().appName("Flights Example").getOrCreate()

    val df = session.read.parquet("s3://us-east-1.elasticmapreduce.samples/flightdata/input/")

    //Parquet files can also be registered as tables and then used in SQL statements.
    df.createOrReplaceTempView("flights")

    //Top 10 airports with the most departures since 2000
    val topDepartures = session.sql("SELECT origin, count(*) AS total_departures FROM flights WHERE year >= '2000' GROUP BY origin ORDER BY total_departures DESC LIMIT 10")
    topDepartures.write.csv(s"$OutputLocation/top_departures")

    val shortDepDelay = session.sql("SELECT origin, count(depDelay) as cnt FROM flights WHERE depDelay >= '15' AND year >= '2000' GROUP BY origin ORDER BY cnt DESC LIMIT 10")
    shortDepDelay.write.json(s"$OutputLocation/top_short_delays")

    //Top 10 airports with the most departure delays over 60 minutes since 2000
    val longDepDelay = session.sql("SELECT origin, count(depDelay) AS total_delays FROM flights WHERE depDelay > '60' AND year >= '2000' GROUP BY origin ORDER BY total_delays DESC LIMIT 10")
    longDepDelay.write.parquet(s"$OutputLocation/top_long_delays")

    //Top 10 airports with the most departure cancellations since 2000
    val topCancel = session.sql("SELECT origin, count(cancelled) AS total_cancellations FROM flights WHERE cancelled = '1' AND year >= '2000' GROUP BY origin ORDER BY total_cancellations DESC LIMIT 10")
    topCancel.write.csv(s"$OutputLocation/top_cancellations")

    //Rank of the worst quarter of the year for departure cancellations
    val quarterCancel = session.sql("SELECT quarter, count(cancelled) AS total_cancellations FROM flights WHERE cancelled = '1' GROUP BY quarter ORDER BY total_cancellations DESC LIMIT 10")
    quarterCancel.write.csv(s"$OutputLocation/rank_quarter_cancellations")

    //Top 10 most popular flight routes since 2000
    val popularFlights = session.sql("SELECT origin, dest, count(*) AS total_flights FROM flights WHERE year >= '2000' GROUP BY origin, dest ORDER BY total_flights DESC LIMIT 10")
    popularFlights.write.csv(s"$OutputLocation/popular_flights")
  }
}
