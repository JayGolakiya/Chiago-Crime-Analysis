# Chiago-Crime-Analysis
## Abstract
The need for analyzing the different crime dataset has significantly increased over the past few decades. It is necessary to detect the wide variety of crimes and the corresponding place of occurrences accurately. Government bodies throughout the world maintained Open Data initiatives, which is a large collection of heterogeneous dataset. This enables the government agencies to maintain the law and order of the society. The prime objective of this paper is to analyze the Chicago crime dataset to extract the significant crime information over the years. The proposed analysis is performed to bring out the crime information depending on some predetermined criteria, e.g. total crimes of different types, subtype of different crimes, crime on different places, analysis of hourly crime cases and analysis of crime cases on different location. The proposed analysis is performed in fully distributed Hadoop cluster. Moreover, we have extracted crucial minuscule statistics on weekday criminal activities. Though, chicago crime data in not too big to be analyzed on clusters but, for the learning purpose, to know about the cluster setup and learn to work in distributed environment we did this analysis. <br> (Data source - https://data.cityofchicago.org/Public-Safety/Crimes-2019/w98m-zvie)
## Objective
The objective of the project is to provide the users with different methods to analyze the crime rate of a Chicago city and give the different kind of analysis based on some parameters like Time, Location and Crime types. Which is useful to predict the crime rate in future based on some location and time. So, they can reach before incident on that place and prevent crime incident.
## Tools and Technologies
Ubuntu - 18.04.3 <br>
Java - jdk-8u201-linux-x64 <br>
Hadoop - 2.6.5 <br>
Pig - 0.16.0 <br>
## Hadoop Cluster Setup
| | Master node | Slave Node1 | Slave Node2 | Slave Node3|
|:----------:|:----------:|:-----------:|:----------:|:----------:|
| Machine Name | M1 | M2 |  M3 | M4 |
| HDFS Components | Name Node <br> Data Node | Secondary Name Node <br> Data Node | Data Node | Data Node |
| MapReduce Components | Job Tracker <br> Task Tracker | Task Tracker | Task Tracker | Task Tracker |
| Network Address | 192.168.56.11 | 192.168.56.10 | 192.168.56.12 | 192.168.56.13 |
## Analysis 
###### 1. Timeseries Analysis 
-	Total number of crime happened in each past year
- Total number of crime per month
-	Total Number of crime per day
- Total Number of crime per hour
-	Number of crime in each year of particular crime type
###### 2. Statistical Analysis 
- Description of location where the crime was happened
- Different Crime Types and criminal arrested or not
###### 3. Geospatial Analysis 
- District location and number of arrest in each district
## Data Visualizatoin
Till now we had calculated different kind of analysis. This analysis is in numeric format. It is difficult to visualize text data and make decision at a glance. For easy visualization and easy understanding by any non-technical and any person, we plotted analyzed data on different type of graphs. These graphs like Bar char, Pie chart, Line chart, etc. Based on data different kind of visualizations are prepared. For implementation of that functionalities we had used Django frame work and chart.js graph library. <br>

Django version: 2.0.7 <br>
ChartJS CDNs : <br>
https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js <br>
https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js
