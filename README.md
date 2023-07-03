# Data Analysis Case Study Project: Cyclistic Bike-Share

## Introduction
Hello! My name is Justin Shin this is my Data Analysis Case Study Project. 

Link to Medium Post: [click here](https://medium.com/@jdt_shin/cyclistic-case-study-how-does-a-bike-share-navigate-speedy-success-16d6b29e5b9b)

Link to Tableau Dashboard: [click here](https://public.tableau.com/app/profile/justin.shin1499/viz/CyclisticBike-Share_16877439018650/CyclisticBike-Share)

This README file is to provide documentation of my work process, as well as a *basic* overview of the steps taken to prepare, process, and analyze the data.

Technologies used for data preparation, processing, analysis, and visualization:
* Microsoft Excel
* Microsoft SQL Server
* Tableau Public

### Note: The files SQLQuery 1-3 are my sql queries for my updated database after I normalized my data tables.

## Data Source:

This project uses Cyclistic's historical trip data. The datasets used for this project were provided by **Motivate International Inc.**. The datasets are public data that are appropriate for the purposes of this case study. 

*Note: Data Privacy issues prohibit accessing rider's personally identifiable information.*

## Data Preparation and Processing:
1. Downloaded the datasets for May 3, 2022 to June 8, 2023 from **Motivate International Inc.**.
2. Created a folder to house the files from the dataset using appropriate file-naming conventions.
3. Created subfolders for the files in order to have a copy of the original dataset.
4. Converted each .CSV file into an .XSL file to prepare for data cleaning in MS Excel.

### Microsoft Excel:
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

### Microsoft SQL Server
1. Imported the cleaned excel files into Microsoft SQL Server using the Import and Export Data (64-bit) tool.
2. Created two new table, named Bike_Consolidated and Bike_Lookup, to hold all datasets from 2022 and 2023.
3. Aggregated and inserted all datasets into the newly created tables.
4. Performed further data cleaning which I was unable to do in Excel.

