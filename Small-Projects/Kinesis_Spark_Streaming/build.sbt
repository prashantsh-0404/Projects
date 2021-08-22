name := "Kinesis-test"
 
version := "1.0"
 
scalaVersion := "2.11.7"
 
libraryDependencies += "org.apache.spark" % "spark-streaming_2.10" % "1.4.1"
libraryDependencies += "org.apache.spark" % "spark-streaming-kinesis-asl_2.10" % "1.4.1"
libraryDependencies += "org.apache.spark" % "spark-sql_2.10" % "1.4.1"
libraryDependencies += "org.apache.spark" % "spark-hive_2.10" % "1.4.1"
libraryDependencies += "org.apache.spark" % "spark-hive-thriftserver_2.10" % "1.4.1"

resolvers += "Akka Repository" at "http://repo.akka.io/releases/"
