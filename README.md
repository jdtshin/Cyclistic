# Data Analysis Case Study Project: Cyclistic Bike-Share
## IN PROGRESS

## Introduction
Hello there! My name is Justin Shin this is my Data Analysis Case Study Project. In this project, I will be performing the tasks of a data analyst in order to showcase and apply the data analysis skills and knowledge I have learned.

Technologies used for this case study: 
* Microsoft Excel
* Microsoft SQL Server
* Tableau Public
* RStudio

For simplicity, I have broken up this case study into 7 parts:
1. **Scenario** - To provide background information about the project and the company
2. **Business Task** - Identifying the business task/problem
3. **Data Source** - Disclosing the datasets used and where the datasets come from
4. **Documentation** - To document the process of *data preparation*, *data cleaning*, and *data manipulation* for analysis purposes
5. **Analysis** - To document data discoveries and insights to address the business task/problem using Microsoft SQL Server and RStudio
6. **Visualization** - Creating interactive data visualizations using Tableau Public
7. **Recommendation** - Providing the final conclusion and recommendations based off of the analysis

*Note: This analysis case study is one of the capstone project options for the Google Data Analytics Professional Certificate, which focuses on the **fictional** bike-share company, Cyclistic.* 

## 1. Scenario:
Cyclistic is a bike-share company that features more than 5,800 bicycles and 600 docking stations throughout Chicago. Cyclistic has set itself apart from their competitors by offering a variety of options, including reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can't use a standard two-wheeled bike.

Cyclistic is a bike-share company that features a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. 
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


## 4. Documentation
### Data Preparation:
1. Downloaded the datasets for May 3, 2022 to June 8, 2023 from **Motivate International Inc.**.
2. Created a folder to house the files from the dataset using appropriate file-naming conventions.
3. Created subfolders for the files in order to have a copy of the original dataset.
4. Converted each .CSV file into an .XSL file to prepare for data cleaning.

### Data Cleaning:
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


**NOTE: During the data cleaning phase, I used Excel's filter function to search for blank cells, and noticed that the blank cells were located in the columns *start_station_name*, *start_station_id*, *end_station_name*, and *end_station_id*. 
However, each row contained the starting and ending latitudes and longitudes. I attempted to use use Excel's lookup (Xlookup and Vlookup) functions as well as Excel's index and match functions, but noticed that some of the latitudes and longitudes contain more than one station name. 
In other words, the coordinates provided were either not specific enough, or the stations are situated too closely that the coordinates are unable to discern which station is which. 
Without any further information or data, I was unable to determine which station name or station id was associated with the coordinates due to their being more than one station name and id for the provided coordinates. As such, I had no choice but to omit these rows from my data analysis.**


*Note: Further data cleaning will be done in SQL and R, as the datasets are too large to clean just with Excel.* 

* Check to see if started_at is greater than ended_at, remove if so
* Remove rows with blanks
* Check to see if I can fill the empty cell (If there is a station_id but no station_name, use the station_id to fill in the station_name) OR Use the Starting lat/long and Ending lat/long


#### Power Query (*Need more experience with Poer Query to get this method to work*)
1. Loaded the .CSV data folder containing all 12 datasets into Microsoft Excel using the **Power Query Editor**.
2. Performed data cleaning in the Power Query Editor (Removing blank rows, removing duplicates, formatting data types).
3. Created a new column to calculate the duration of each ride (trip_duration) using Power Query's time subtract function (ended_at - started_at = trip_duration).
4. Created a new column to determine the day of the week using Power Query's add column/date/day/day of the week function. Then converted the data type to text and used find and replace to replace the returned values of 1-7 to their corresponding days (1 = Sunday, 2 = Monday, ...).
7. Created a pivot table using the cleaned data to discover insights.


#### Microsoft SQL Server
1. Imported each month's dataset into SQL Server

#### RStudio
1. 

## 5. Analysis
### Microsoft SQL Server


## 6. Visualizations
### Tableau Public

### RStudio


## 7. Recommendations

