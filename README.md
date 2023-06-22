# Data Analysis Case Study Project: Cyclistic Bike-Share

## Introduction
Hello there! My name is Justin Shin this is my Data Analysis Case Study Project. In this project, I will be performing the tasks of a junior data analyst in order to showcase and apply the data analysis skills and knowledge I have learned.

This README file is to provide documentation of my work process throughout the different phases of this project. 

Technologies used for this project: 
* Microsoft Excel
* Microsoft SQL Server
* Tableau Public

For simplicity, I have broken up this case study into 7 parts:
1. **Scenario** - To provide background information about the project and the company
2. **Business Task** - Identifying the business task/problem
3. **Data Source** - Disclosing the datasets used and where the datasets come from
4. **Prepare & Process** - To document the process of data preparation, data cleaning, and data manipulation for analysis purposes
5. **Analysis** - To document data discoveries and insights to address the business task/problem using Microsoft SQL Server and RStudio
6. **Visualization** - Creating interactive data visualizations using Tableau Public
7. **Recommendation** - Providing the final conclusion and recommendations based off of the analysis

*Note: This analysis case study is the capstone project for the Google Data Analytics Professional Certificate, which focuses on the bike-share company, Cyclistic.* 

## 1. Scenario:

Cyclistic is a bike-share company that features more than 5,800 bicycles and 600 docking stations throughout Chicago. Cyclistic has set itself apart from their competitors by offering a variety of options, including reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can't use a standard two-wheeled bike.

Cyclistic is a bike-share company that features a fleet of 5,824 bicycles that are geotracked and locked into a network of 692+ stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. 
Included among their fleet of bicycles are traditional bikes, reclining bikes, hand tricycles, and cargo bikes. 
The large variety of the types of bicycles offered has allowed Cyclistic to set itself apart from their competitors by making bike-share more inclusive to people with disabilities and riders who cannot use a standard two-wheeled bicycle.

Cyclistic’s marketing strategy has relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: **single-ride passes**, **full-day passes**, and **annual memberships**. 
Customers who purchase single-ride or full-day passes are referred to as *casual riders*, whereas customers who purchase annual memberships are **Cyclistic Members**.

Cyclistic has concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, the company believes that maximizing the number of annual members will be key to future growth.
As such, the company wants to understand how casual riders and annual members use Cyclistic bikes differently.



## 2. Business Task: 

**_Develop a new strategy to convert casual riders into annual members:_**

1. *Understand how annual members and casual riders differ.*
3. Understand why casual riders would buy an annual membership.
4. How to effectively use digital media to influence casual riders to becoming annual members.
5. Understand who the stakeholders are and who the audience is for this case study.



## 3. Data Source:

The datasets used for this project were provided by **Motivate International Inc.**. The datasets are public data that are appropriate for the purposes of this case study.

*Note: Data Privacy issues prohibit accessing rider's personally identifiable information. As such, I was unable to connect pass purhcases to credit card numbers to determine if casual riders lived in the Cyclistic service area or if they have purchased multiple single passes.* 

Include the data files, and the structure of the data here

ROCCC (Reliable, Original, Comprehensive, Current, Cited)



## 4. Prepare & Process

### Data Preparation and Processing:
1. Downloaded the datasets for May 3, 2022 to June 8, 2023 from **Motivate International Inc.**.
2. Created a folder to house the files from the dataset using appropriate file-naming conventions.
3. Created subfolders for the files in order to have a copy of the original dataset.
4. Converted each .CSV file into an .XSL file to prepare for data cleaning.

#### Microsoft Excel:
For each .XSL file (12 total):

1. Used Excel's Remove Duplicates function to remove any duplicates.
2. Created four new columns, labeled *start_date*, *end_date*, *start_time*, and *end_time*, to separate the date and time values in both *start_at* and *ended_at* columns.
3. Changed the data type format to **text** for the columns *ride_id*, *rideable_type*, *start_station_name*, *end_station_name*, and *member_casual*. Also changed *start_station_id* and *end_station_id* to text as some station id's included text and numbers together.
4. Changed the data type format to **number** for the columns *start_lat*, *start_lng*, *end_lat*, and *end_Lng*.
5. Changed the data type format to **date** (mm/dd/yyyy) for the columns *start_date* and *end_date*.
6. Changed the data type format to **time** (hh:mm:ss AM/PM) for the columns *start_time* and *end_time*.
7. Used Excel's Trim() function to remove any potential extra spaces on the columns *ride_id*, *rideable_type*, *start_station_name*, *start_station_id*, *end_station_name*, *end_station_id*, and *member_casual*.
8. Used Excel's Proper() function on the columns *start_station_name* and *end_station_name* to ensure proper and consistent formatting.
9. Used two conditional statements to check that the *end_date* and *end_time* were greater than the *start_date* and *start_time*. Deleted the rows that returned False. *=IF(end_date > start_date, "True", "False"), Filter "False", Delete selected rows*.
10. Created a new column, labeled *trip_duration*, to determine the duration of each bike ride -> ended_at - started_at -> formatted to hh:mm:ss.
11. Created a new column, labeled *day_of_week*, to determine the day of the week for each bike ride -> =Weekday() -> returns a number 1-7 identifying the day of the week of the date.
12. In a new column, used the conditional statement, *=IFS(A2=1, "Sunday", A2=2, "Monday", A2=3, "Tuesday", A2=4, "Wednesday", A2=5, "Thursday", A2=6, "Friday", A2=7, "Saturday")*, to change the number value returned by the Weekday() function to the corresponding day name.

#### Microsoft SQL Server
1. Imported the cleaned excel files into Microsoft SQL Server using the Import and Export Data (64-bit) tool.
2. Created a new table, named BikeShare_Consolidated, to hold all 12 months of data using SQL's CREATE TABLE statement.
```sql
DROP TABLE IF EXISTS BikeShare_Consolidated
CREATE TABLE BikeShare_Consolidated (
	ride_id nvarchar(255),
	rideable_type nvarchar(255),
	start_date datetime,
	end_date datetime,
	day_of_week nvarchar(255),
	start_time datetime,
	end_time datetime,
	trip_duration datetime,
	start_station_name nvarchar(255),
	start_station_id nvarchar(255),
	end_station_name nvarchar(255),
	end_station_id nvarchar(255),
	start_lat float,
	start_lng float,
	end_lat float,
	end_lng float,
	member_casual nvarchar(255)
)
```
3. Aggregated all 12 data tables using SQL's UNION operator and inserted them into the newly created table using the INSERT INTO statement.
```sql
INSERT INTO BikeShare_Consolidated (ride_id, rideable_type, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SELECT * FROM BikeShare..['2022_05$']
UNION
SELECT * FROM BikeShare..['2022_06$']
UNION
SELECT * FROM BikeShare..['2022_07$']
UNION
SELECT * FROM BikeShare..['2022_08$']
UNION
SELECT * FROM BikeShare..['2022_09$']
UNION
SELECT * FROM BikeShare..['2022_10$']
UNION
SELECT * FROM BikeShare..['2022_11$']
UNION
SELECT * FROM BikeShare..['2022_12$']
UNION
SELECT * FROM BikeShare..['2023_01$']
UNION
SELECT * FROM BikeShare..['2023_02$']
UNION
SELECT * FROM BikeShare..['2023_03$']
UNION
SELECT * FROM BikeShare..['2023_04$']
UNION
SELECT * FROM BikeShare..['2023_05$']

```
4. Performed checks to ensure that the data from all 12 months was inserted properly into the new table.
5. Deleted specific rows using SQL's DELETE statement where (1) start_station_name and start_station_id were both blank or null, (2) end_station_name and end_station_id were both blank or null, and (3) start_station_name, end_station_name, start_station_id, and end_station_id were blank.
```sql
DELETE 
FROM BikeShare_Consolidated
WHERE start_station_name = '' AND start_station_id = '' AND end_station_name = '' AND end_station_id = ''
```

```sql
DELETE
FROM BikeShare_Consolidated
WHERE start_station_name is NULL OR start_station_name = '' AND start_station_id is NULL OR start_station_id = ''
```

```sql
DELETE
FROM BikeShare_Consolidated
WHERE end_station_name is NULL OR end_station_name = '' AND end_station_id is NULL OR end_station_id = ''
```

## 5. Analysis

### Microsoft SQL Server

#### Annual Members vs. Casual Riders
1. Total Rides per month

Annual Member
```sql
SELECT DATENAME(month, start_date) AS month, DATEPART(year, start_date) AS year, COUNT(*) as total_rides_per_month_member, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member'
GROUP BY DATEPART(year, start_date), DATENAME(month, start_date), member_casual
ORDER BY
	DATEPART(year, start_date),
	CASE
		WHEN DATENAME(month, start_date) = 'January' THEN 1
		WHEN DATENAME(month, start_date) = 'February' THEN 2
		WHEN DATENAME(month, start_date) = 'March' THEN 3
		WHEN DATENAME(month, start_date) = 'April' THEN 4
		WHEN DATENAME(month, start_date) = 'May' THEN 5
		WHEN DATENAME(month, start_date) = 'June' THEN 6
		WHEN DATENAME(month, start_date) = 'July' THEN 7
		WHEN DATENAME(month, start_date) = 'August' THEN 8
		WHEN DATENAME(month, start_date) = 'September' THEN 9
		WHEN DATENAME(month, start_date) = 'October' THEN 10
		WHEN DATENAME(month, start_date) = 'November' THEN 11
		WHEN DATENAME(month, start_date) = 'December' THEN 12
	END ASC
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/1_TotalRidesMember.PNG)

Casual Rider
```sql
SELECT DATENAME(month, start_date) AS month, DATEPART(year, start_date) AS year, COUNT(*) as total_rides_per_month_member, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member'
GROUP BY DATEPART(year, start_date), DATENAME(month, start_date), member_casual
ORDER BY
	DATEPART(year, start_date),
	CASE
		WHEN DATENAME(month, start_date) = 'May' THEN 1
		WHEN DATENAME(month, start_date) = 'June' THEN 2
		WHEN DATENAME(month, start_date) = 'July' THEN 3
		WHEN DATENAME(month, start_date) = 'August' THEN 4
		WHEN DATENAME(month, start_date) = 'September' THEN 5
		WHEN DATENAME(month, start_date) = 'October' THEN 6
		WHEN DATENAME(month, start_date) = 'November' THEN 7
		WHEN DATENAME(month, start_date) = 'December' THEN 8
		WHEN DATENAME(month, start_date) = 'January' THEN 9
		WHEN DATENAME(month, start_date) = 'February' THEN 10
		WHEN DATENAME(month, start_date) = 'March' THEN 11
		WHEN DATENAME(month, start_date) = 'April' THEN 12
	END ASC
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/1_TotalRidesCasual.PNG)

2. Total Rides per day of the week (Annual Members vs. Casual Riders)

Annual Member
```sql
SELECT day_of_week, COUNT(*) AS total_rides, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member'
GROUP BY day_of_week, member_casual
ORDER BY 
	CASE
		WHEN day_of_week = 'Sunday' THEN 1
		WHEN day_of_week = 'Monday' THEN 2
		WHEN day_of_week = 'Tuesday' THEN 3
		WHEN day_of_week = 'Wednesday' THEN 4
		WHEN day_of_week = 'Thursday' THEN 5
		WHEN day_of_week = 'Friday' THEN 6
		WHEN day_of_week = 'Saturday' THEN 7
	END ASC
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/2_TotalRidesPerDayMember.PNG)

Casual Rider
```sql
SELECT day_of_week, COUNT(*) AS total_rides, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'casual'
GROUP BY day_of_week, member_casual
ORDER BY 
	CASE
		WHEN day_of_week = 'Sunday' THEN 1
		WHEN day_of_week = 'Monday' THEN 2
		WHEN day_of_week = 'Tuesday' THEN 3
		WHEN day_of_week = 'Wednesday' THEN 4
		WHEN day_of_week = 'Thursday' THEN 5
		WHEN day_of_week = 'Friday' THEN 6
		WHEN day_of_week = 'Saturday' THEN 7
	END ASC
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/2_TotalRidesPerDayCasual.PNG)



3. Average ride length (Annual Members vs. Casual Riders)

Annual Member
```sql
SELECT CAST(CAST(AVG(CAST(trip_duration as FLOAT)) AS DATETIME) as TIME) AS avg_ride_length, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member'
GROUP BY member_casual
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/AvgRideLengthMember.PNG)

Casual Rider
```sql
SELECT CAST(CAST(AVG(CAST(trip_duration as FLOAT)) AS DATETIME) as TIME) AS avg_ride_length, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'casual'
GROUP BY member_casual
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/AvgRideLengthCasual.PNG)

4. Average ride length per day of the week (Annual Members vs. Casual Riders)

Annual Member
```sql
SELECT member_casual, CAST(CAST(AVG(CAST(trip_duration as FLOAT)) AS DATETIME) as TIME) AS avg_ride_length_member, day_of_week
FROM BikeShare_Consolidated
WHERE member_casual = 'member'
GROUP BY day_of_week, member_casual
ORDER BY 
	CASE
		WHEN day_of_week = 'Sunday' THEN 1
		WHEN day_of_week = 'Monday' THEN 2
		WHEN day_of_week = 'Tuesday' THEN 3
		WHEN day_of_week = 'Wednesday' THEN 4
		WHEN day_of_week = 'Thursday' THEN 5
		WHEN day_of_week = 'Friday' THEN 6
		WHEN day_of_week = 'Saturday' THEN 7
	END ASC
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/AvgRideLengthPerDayMember.PNG)

Casual Rider
```sql
SELECT member_casual, CAST(CAST(AVG(CAST(trip_duration as FLOAT)) AS DATETIME) as TIME) AS avg_ride_length_member, day_of_week
FROM BikeShare_Consolidated
WHERE member_casual = 'casual'
GROUP BY day_of_week, member_casual
ORDER BY 
	CASE
		WHEN day_of_week = 'Sunday' THEN 1
		WHEN day_of_week = 'Monday' THEN 2
		WHEN day_of_week = 'Tuesday' THEN 3
		WHEN day_of_week = 'Wednesday' THEN 4
		WHEN day_of_week = 'Thursday' THEN 5
		WHEN day_of_week = 'Friday' THEN 6
		WHEN day_of_week = 'Saturday' THEN 7
	END ASC
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/AvgRideLengthPerDayCasual.PNG)

5. Time of day the bikes are used (Annual Members vs. Casual Riders)
```sql
SELECT day_of_week, DATEPART(hour, start_time) AS time_of_day, COUNT(*) AS number_of_riders, member_casual
FROM BikeShare_Consolidated
WHERE CAST(start_time AS TIME) between '00:00' AND '23:00' AND member_casual = 'member' OR member_casual = 'casual'
GROUP BY DATEPART(hour, start_time), day_of_week, member_casual
ORDER BY 
	DATEPART(hour, start_time),
	CASE
		WHEN day_of_week = 'Sunday' THEN 1
		WHEN day_of_week = 'Monday' THEN 2
		WHEN day_of_week = 'Tuesday' THEN 3
		WHEN day_of_week = 'Wednesday' THEN 4
		WHEN day_of_week = 'Thursday' THEN 5
		WHEN day_of_week = 'Friday' THEN 6
		WHEN day_of_week = 'Saturday' THEN 7
	END ASC
```

6. Most frequently used stations (Annual Members vs. Casual Riders)
Top 10 Starting Stations:
```sql
SELECT TOP 10 start_station_name, start_lat, start_lng, COUNT(start_station_name) AS total_start, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member'
GROUP BY start_station_name, start_lat, start_lng, member_casual
ORDER BY COUNT(start_station_name) DESC
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/6_Top10StartMember.PNG)

```sql
SELECT TOP 10 start_station_name, start_lat, start_lng, COUNT(start_station_name) AS total_start, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'casual'
GROUP BY start_station_name, start_lat, start_lng, member_casual
ORDER BY COUNT(start_station_name) DESC
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/6_Top10StartCasual.PNG)

Top 10 Ending Stations:
```sql
SELECT TOP 10 end_station_name, end_lat, end_lng, COUNT(end_station_name) AS total_end, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member'
GROUP BY end_station_name, end_lat, end_lng, member_casual
ORDER BY COUNT(end_station_name) DESC
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/6_Top10EndMember.PNG)

```sql
SELECT TOP 10 end_station_name, end_lat, end_lng, COUNT(end_station_name) AS total_end, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'casual'
GROUP BY end_station_name, end_lat, end_lng, member_casual
ORDER BY COUNT(end_station_name) DESC
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/6_Top10EndCasual.PNG)

7. Types of bikes used (Annual Members vs. Casual Riders)
```sql
SELECT rideable_type, COUNT(ride_id) AS total_rides
FROM BikeShare_Consolidated
GROUP BY rideable_type
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/7_BikeTypeUsed.PNG)

```sql
SELECT rideable_type, COUNT(ride_id) AS total_rides, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member' OR member_casual = 'casual'
GROUP BY rideable_type, member_casual
```
![alt_text](https://github.com/jdtshin/Cyclistic/blob/main/Output/7_BikeTypeUsedMC.PNG)

```sql
SELECT DATEPART(minute, trip_duration) AS minute, rideable_type, COUNT(rideable_type) AS total_rides, member_casual, day_of_week
FROM BikeShare_Consolidated
WHERE CAST(trip_duration AS TIME) between '00:01:00' AND '00:59:00'
GROUP BY day_of_week, rideable_type, member_casual, DATEPART(minute, trip_duration)
ORDER BY DATEPART(minute, trip_duration) DESC, 
	CASE
		WHEN day_of_week = 'Sunday' THEN 1
		WHEN day_of_week = 'Monday' THEN 2
		WHEN day_of_week = 'Tuesday' THEN 3
		WHEN day_of_week = 'Wednesday' THEN 4
		WHEN day_of_week = 'Thursday' THEN 5
		WHEN day_of_week = 'Friday' THEN 6
		WHEN day_of_week = 'Saturday' THEN 7
	END ASC
```


## 6. Visualizations
### Tableau Public
Link to the Cyclistic Dashboard created using Tableau Public: https://public.tableau.com/app/profile/justin.shin1499/viz/CyclisticCaseStudy_16873019224940/Dashboard1

## 7. Recommendations
 


