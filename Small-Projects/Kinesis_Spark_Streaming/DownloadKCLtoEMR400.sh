#!/bin/bash

# This is a simple bootstrap for downloading Spark-Streaming libraries for Kinesis and KCL in to EMR 4.0.0 clusters.

cd /usr/lib/hadoop
sudo wget http://central.maven.org/maven2/org/apache/spark/spark-streaming-kinesis-asl_2.10/1.4.1/spark-streaming-kinesis-asl_2.10-1.4.1.jar
sudo wget http://central.maven.org/maven2/com/amazonaws/amazon-kinesis-client/1.2.1/amazon-kinesis-client-1.2.1.jar

