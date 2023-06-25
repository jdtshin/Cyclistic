--Business Task: Discover how annual members and casual riders use Cyclistic differently.
--In other words, how do members and casual riders differ?

--=================================================================================
--TOTAL RIDES:
----Year: Annual Members
SELECT COUNT(*) as total_rides_member_2022
FROM Bike_Consolidated
WHERE member_casual = 'member' AND DATEPART(year, start_date) = '2022'

SELECT COUNT(*) as total_rides_member_2023
FROM Bike_Consolidated
WHERE member_casual = 'member' AND DATEPART(year, start_date) = '2023'

----Year: Casual Riders
SELECT COUNT(*) as total_rides_casual_2022
FROM Bike_Consolidated
WHERE member_casual = 'casual' AND DATEPART(year, start_date) = '2022'

SELECT COUNT(*) as total_rides_casual_2023
FROM Bike_Consolidated
WHERE member_casual = 'casual' AND DATEPART(year, start_date) = '2023'


--=================================================================================
----Month: Annual Members
SELECT DATENAME(month, start_date) as month, COUNT(*) as total_rides_per_month_member_2022
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'member'
GROUP BY DATENAME(month, start_date)
ORDER BY
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

SELECT DATENAME(month, start_date) as month, COUNT(*) as total_rides_per_month_member_2023
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'member'
GROUP BY DATENAME(month, start_date)
ORDER BY
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


----Month: Casual Riders
SELECT DATENAME(month, start_date) as month, COUNT(*) as total_rides_per_month_casual_2022
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'casual'
GROUP BY DATENAME(month, start_date)
ORDER BY
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

SELECT DATENAME(month, start_date) as month, COUNT(*) as total_rides_per_month_casual_2023
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'casual'
GROUP BY DATENAME(month, start_date)
ORDER BY
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


--=================================================================================
----Day of the week: Annual Members
SELECT day_of_week, COUNT(*) as total_rides_per_day_member_2022
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'member'
GROUP BY day_of_week
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

SELECT day_of_week, COUNT(*) as total_rides_per_day_member_2023
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'member'
GROUP BY day_of_week
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


----Day of the week: Casual Riders
SELECT day_of_week, COUNT(*) as total_rides_per_day_casual_2022
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'casual'
GROUP BY day_of_week
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

SELECT day_of_week, COUNT(*) as total_rides_per_day_casual_2023
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'casual'
GROUP BY day_of_week
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


--=================================================================================
----Time of day: Annual Members
SELECT day_of_week, DATEPART(hour, start_time) as time, COUNT(*) as total_rides_member_2022
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'member'
GROUP BY DATEPART(hour, start_time), day_of_week
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

SELECT day_of_week, DATEPART(hour, start_time) as time, COUNT(*) as total_rides_member_2023
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'member'
GROUP BY DATEPART(hour, start_time), day_of_week
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

----Time of day: Casual Riders
SELECT day_of_week, DATEPART(hour, start_time) as time, COUNT(*) as total_rides_casual_2022
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'casual'
GROUP BY DATEPART(hour, start_time), day_of_week
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

SELECT day_of_week, DATEPART(hour, start_time) as time, COUNT(*) as total_rides_casual_2023
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'casual'
GROUP BY DATEPART(hour, start_time), day_of_week
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


--=================================================================================
--AVERAGE TRIP DURATION
----Year: Annual Members
SELECT DATEPART(year, start_date) as year, CAST(CAST(AVG(CAST(trip_duration as FLOAT)) as DATETIME) as TIME) as average_trip_duration_member
FROM Bike_Consolidated
WHERE member_casual = 'member'
GROUP BY DATEPART(year, start_date)

----Year: Casual Riders
SELECT DATEPART(year, start_date), CAST(CAST(AVG(CAST(trip_duration as FLOAT)) as DATETIME) as TIME) as average_trip_duration_casual
FROM Bike_Consolidated
WHERE member_casual = 'casual'
GROUP BY DATEPART(year, start_date)


--=================================================================================
----Month: Annual Members
SELECT DATEPART(year, start_date) as year, DATENAME(month, start_date) as month, CAST(CAST(AVG(CAST(trip_duration as FLOAT)) as DATETIME) as TIME) as average_trip_duration_member
FROM Bike_Consolidated
WHERE member_casual = 'member'
GROUP BY DATENAME(month, start_date), DATEPART(year, start_date)
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

----Month: Casual Riders
SELECT DATEPART(year, start_date) as year, DATENAME(month, start_date) as month, CAST(CAST(AVG(CAST(trip_duration as FLOAT)) as DATETIME) as TIME) as average_trip_duration_casual
FROM Bike_Consolidated
WHERE member_casual = 'casual'
GROUP BY DATENAME(month, start_date), DATEPART(year, start_date)
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

--=================================================================================
----Day of the week: Annual Members
SELECT DATEPART(year, start_date) as year, day_of_week, CAST(CAST(AVG(CAST(trip_duration as FLOAT)) as DATETIME) as TIME) as average_trip_duration_member
FROM Bike_Consolidated
WHERE member_casual = 'member'
GROUP BY DATEPART(year, start_date), day_of_week
ORDER BY
	DATEPART(year, start_date),
	CASE
		WHEN day_of_week = 'Sunday' THEN 1
		WHEN day_of_week = 'Monday' THEN 2
		WHEN day_of_week = 'Tuesday' THEN 3
		WHEN day_of_week = 'Wednesday' THEN 4
		WHEN day_of_week = 'Thursday' THEN 5
		WHEN day_of_week = 'Friday' THEN 6
		WHEN day_of_week = 'Saturday' THEN 7
	END ASC


----Day of the week: Casual Riders
SELECT DATEPART(year, start_date) as year, day_of_week, CAST(CAST(AVG(CAST(trip_duration as FLOAT)) as DATETIME) as TIME) as average_trip_duration_casual
FROM Bike_Consolidated
WHERE member_casual = 'casual'
GROUP BY DATEPART(year, start_date), day_of_week
ORDER BY
	DATEPART(year, start_date),
	CASE
		WHEN day_of_week = 'Sunday' THEN 1
		WHEN day_of_week = 'Monday' THEN 2
		WHEN day_of_week = 'Tuesday' THEN 3
		WHEN day_of_week = 'Wednesday' THEN 4
		WHEN day_of_week = 'Thursday' THEN 5
		WHEN day_of_week = 'Friday' THEN 6
		WHEN day_of_week = 'Saturday' THEN 7
	END ASC


--=================================================================================
--Experimenting with SQL (Attempting to get average for day and month combined)
SELECT DATEPART(year, start_date) as year, DATENAME(month, start_date) as month, day_of_week, CAST(CAST(AVG(CAST(trip_duration as FLOAT)) as DATETIME) as TIME) as average_trip_duration_member
FROM Bike_Consolidated
WHERE member_casual = 'member'
GROUP BY DATEPART(year, start_date), DATENAME(month, start_date), day_of_week
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
	END ASC,
	CASE
		WHEN day_of_week = 'Sunday' THEN 1
		WHEN day_of_week = 'Monday' THEN 2
		WHEN day_of_week = 'Tuesday' THEN 3
		WHEN day_of_week = 'Wednesday' THEN 4
		WHEN day_of_week = 'Thursday' THEN 5
		WHEN day_of_week = 'Friday' THEN 6
		WHEN day_of_week = 'Saturday' THEN 7
	END ASC


SELECT DATEPART(year, start_date) as year, DATENAME(month, start_date) as month, day_of_week, CAST(CAST(AVG(CAST(trip_duration as FLOAT)) as DATETIME) as TIME) as average_trip_duration_casual
FROM Bike_Consolidated
WHERE member_casual = 'casual'
GROUP BY DATEPART(year, start_date), DATENAME(month, start_date), day_of_week
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
	END ASC,
	CASE
		WHEN day_of_week = 'Sunday' THEN 1
		WHEN day_of_week = 'Monday' THEN 2
		WHEN day_of_week = 'Tuesday' THEN 3
		WHEN day_of_week = 'Wednesday' THEN 4
		WHEN day_of_week = 'Thursday' THEN 5
		WHEN day_of_week = 'Friday' THEN 6
		WHEN day_of_week = 'Saturday' THEN 7
	END ASC

--=================================================================================
--TYPE OF BIKES USED
----Year: Annual Members
SELECT DATEPART(year, start_date) as year, rideable_type, COUNT(*) as total_rides
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'member'
GROUP BY DATEPART(year, start_date), rideable_type

SELECT DATEPART(year, start_date) as year, rideable_type, COUNT(*) as total_rides
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'member'
GROUP BY DATEPART(year, start_date), rideable_type

----Year: Casual Riders
SELECT DATEPART(year, start_date) as year, rideable_type, COUNT(*) as total_rides
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'casual'
GROUP BY DATEPART(year, start_date), rideable_type

SELECT DATEPART(year, start_date) as year, rideable_type, COUNT(*) as total_rides
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'casual'
GROUP BY DATEPART(year, start_date), rideable_type


----Month: Annual Members
SELECT DATEPART(year, start_date), DATENAME(month, start_date), rideable_type, COUNT(*) as total_rides
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'member'
GROUP BY DATEPART(year, start_date), DATENAME(month, start_date), rideable_type
ORDER BY
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

SELECT DATEPART(year, start_date), DATENAME(month, start_date), rideable_type, COUNT(*) as total_rides
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'member'
GROUP BY DATEPART(year, start_date), DATENAME(month, start_date), rideable_type
ORDER BY
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


----Month: Casual Riders
SELECT DATEPART(year, start_date), DATENAME(month, start_date), rideable_type, COUNT(*) as total_rides
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'casual'
GROUP BY DATEPART(year, start_date), DATENAME(month, start_date), rideable_type
ORDER BY
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

SELECT DATEPART(year, start_date), DATENAME(month, start_date), rideable_type, COUNT(*) as total_rides
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'casual'
GROUP BY DATEPART(year, start_date), DATENAME(month, start_date), rideable_type
ORDER BY
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


--=================================================================================
--STARTING STATION
----Year: Annual Members
SELECT TOP 10 DATEPART(year, start_date) as year, start_station_name, COUNT(*) as total_rides_from_station
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'member'
GROUP BY DATEPART(year, start_date), start_station_name
ORDER BY COUNT(*) DESC

SELECT TOP 10 DATEPART(year, start_date) as year, start_station_name, COUNT(*) as total_rides_from_station
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'member'
GROUP BY DATEPART(year, start_date), start_station_name
ORDER BY COUNT(*) DESC


----Year: Casual Riders
SELECT TOP 10 DATEPART(year, start_date) as year, start_station_name, COUNT(*) as total_rides_from_station
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'casual'
GROUP BY DATEPART(year, start_date), start_station_name
ORDER BY COUNT(*) DESC

SELECT TOP 10 DATEPART(year, start_date) as year, start_station_name, COUNT(*) as total_rides_from_station
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'casual'
GROUP BY DATEPART(year, start_date), start_station_name
ORDER BY COUNT(*) DESC


--=================================================================================
--ENDING STATION
----Year: Annual Members
SELECT TOP 10 DATEPART(year, start_date) as year, end_station_name, COUNT(*) as total_rides_from_station
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'member'
GROUP BY DATEPART(year, start_date), end_station_name
ORDER BY COUNT(*) DESC

SELECT TOP 10 DATEPART(year, start_date) as year, end_station_name, COUNT(*) as total_rides_from_station
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'member'
GROUP BY DATEPART(year, start_date), end_station_name
ORDER BY COUNT(*) DESC


----Year: Casual Riders
SELECT TOP 10 DATEPART(year, start_date) as year, end_station_name, COUNT(*) as total_rides_from_station
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2022' AND member_casual = 'casual'
GROUP BY DATEPART(year, start_date), end_station_name
ORDER BY COUNT(*) DESC

SELECT TOP 10 DATEPART(year, start_date) as year, end_station_name, COUNT(*) as total_rides_from_station
FROM Bike_Consolidated
WHERE DATEPART(year, start_date) = '2023' AND member_casual = 'casual'
GROUP BY DATEPART(year, start_date), end_station_name
ORDER BY COUNT(*) DESC



