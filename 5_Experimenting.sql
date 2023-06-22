--===============================================================================================================================================================================================================
--With the data cleaning phase completed, it is time for the analysis phase of this project.
--Below are the SQL queries used to perform the analysis of the data in order to discover insights and address the business task.

--Understand how annual members and casual riders differ
--===============================================================================================================================================================================================================


--Look up Partition By and Over
--Look up SQL Server tutorial/SQL tutorial
--CTE and Temp tables


--=====================================================================
--Total rides per month (Member vs. Casual)
--=====================================================================
SELECT DATENAME(month, start_date) AS month, DATEPART(year, start_date) AS year, COUNT(*) as total_rides_per_month_member, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'casual' OR member_casual = 'member'
GROUP BY DATEPART(year, start_date), member_casual,  DATENAME(month, start_date)
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

--SELECT DATEPART(month, start_date) AS month, COUNT(*) as total_rides_per_month_casual
--FROM BikeShare_Consolidated
--WHERE member_casual = 'casual'
--GROUP BY DATEPART(month, start_date)
--ORDER BY DATEPART(month, start_date)



--=====================================================================
--Total Rides per day of the week (Member vs. Casual)
--=====================================================================

SELECT day_of_week, COUNT(day_of_week) AS total_rides, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'casual' or member_casual = 'member'
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

--SELECT day_of_week, COUNT(day_of_week) AS total_member
--FROM BikeShare_Consolidated
--WHERE member_casual = 'member'
--GROUP BY day_of_week
--ORDER BY 
--	CASE
--		WHEN day_of_week = 'Sunday' THEN 1
--		WHEN day_of_week = 'Monday' THEN 2
--		WHEN day_of_week = 'Tuesday' THEN 3
--		WHEN day_of_week = 'Wednesday' THEN 4
--		WHEN day_of_week = 'Thursday' THEN 5
--		WHEN day_of_week = 'Friday' THEN 6
--		WHEN day_of_week = 'Saturday' THEN 7
--	END ASC


--=====================================================================
--Average ride length, Average ride length per day of week (Member vs. Casual)
--=====================================================================

SELECT CAST(CAST(AVG(CAST(trip_duration as FLOAT)) AS DATETIME) as TIME) AS avg_ride_length, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member' OR member_casual = 'casual'
GROUP BY member_casual

--SELECT CAST(CAST(AVG(CAST(trip_duration as FLOAT)) AS DATETIME) as TIME) AS avg_ride_length_casual
--FROM BikeShare_Consolidated
--WHERE member_casual = 'casual'


SELECT member_casual, CAST(CAST(AVG(CAST(trip_duration as FLOAT)) AS DATETIME) as TIME) AS avg_ride_length_member, day_of_week
FROM BikeShare_Consolidated
WHERE member_casual = 'member' OR member_casual = 'casual'
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

--SELECT CAST(CAST(AVG(CAST(trip_duration as FLOAT)) AS DATETIME) as TIME) AS avg_ride_length_casual, day_of_week
--FROM BikeShare_Consolidated
--WHERE member_casual = 'casual'
--GROUP BY day_of_week
--ORDER BY 
--	CASE
--		WHEN day_of_week = 'Sunday' THEN 1
--		WHEN day_of_week = 'Monday' THEN 2
--		WHEN day_of_week = 'Tuesday' THEN 3
--		WHEN day_of_week = 'Wednesday' THEN 4
--		WHEN day_of_week = 'Thursday' THEN 5
--		WHEN day_of_week = 'Friday' THEN 6
--		WHEN day_of_week = 'Saturday' THEN 7
--	END ASC


--=====================================================================
--Rides during the time of day, per day of the week
--=====================================================================

SELECT day_of_week, DATEPART(hour, start_time) AS time_of_day, COUNT(*) AS number_of_riders, member_casual
FROM BikeShare_Consolidated
WHERE CAST(start_time AS TIME) between '00:00' AND '23:59' AND member_casual = 'member' OR member_casual = 'casual'
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
	



	--CASE
	--	WHEN DATEPART(hour, start_time) = 0 THEN '12:00 AM'
	--	WHEN DATEPART(hour, start_time) = 1 THEN '1:00 AM'
	--	WHEN DATEPART(hour, start_time) = 2 THEN '2:00 AM'
	--	WHEN DATEPART(hour, start_time) = 3 THEN '3:00 AM'
	--	WHEN DATEPART(hour, start_time) = 4 THEN '4:00 AM'
	--	WHEN DATEPART(hour, start_time) = 5 THEN '5:00 AM'
	--	WHEN DATEPART(hour, start_time) = 6 THEN '6:00 AM'
	--	WHEN DATEPART(hour, start_time) = 7 THEN '7:00 AM'
	--	WHEN DATEPART(hour, start_time) = 8 THEN '8:00 AM'
	--	WHEN DATEPART(hour, start_time) = 9 THEN '9:00 AM'
	--	WHEN DATEPART(hour, start_time) = 10 THEN '10:00 AM'
	--	WHEN DATEPART(hour, start_time) = 11 THEN '11:00 AM'
	--	WHEN DATEPART(hour, start_time) = 12 THEN '12:00 AM'
	--	WHEN DATEPART(hour, start_time) = 13 THEN '1:00 PM'
	--	WHEN DATEPART(hour, start_time) = 14 THEN '2:00 PM'
	--	WHEN DATEPART(hour, start_time) = 15 THEN '3:00 PM'
	--	WHEN DATEPART(hour, start_time) = 16 THEN '4:00 PM'
	--	WHEN DATEPART(hour, start_time) = 17 THEN '5:00 PM'
	--	WHEN DATEPART(hour, start_time) = 18 THEN '6:00 PM'
	--	WHEN DATEPART(hour, start_time) = 19 THEN '7:00 PM'
	--	WHEN DATEPART(hour, start_time) = 20 THEN '8:00 PM'
	--	WHEN DATEPART(hour, start_time) = 21 THEN '9:00 PM'
	--	WHEN DATEPART(hour, start_time) = 22 THEN '10:00 PM'
	--	WHEN DATEPART(hour, start_time) = 23 THEN '11:00 PM'
	--END ASC,



--SELECT COUNT(*) AS number_of_riders, day_of_week
--FROM BikeShare_Consolidated
--WHERE CAST(start_time AS TIME) between '05:00' AND '09:00' AND member_casual = 'casual'
--GROUP BY day_of_week
--ORDER BY 
--	CASE
--		WHEN day_of_week = 'Sunday' THEN 1
--		WHEN day_of_week = 'Monday' THEN 2
--		WHEN day_of_week = 'Tuesday' THEN 3
--		WHEN day_of_week = 'Wednesday' THEN 4
--		WHEN day_of_week = 'Thursday' THEN 5
--		WHEN day_of_week = 'Friday' THEN 6
--		WHEN day_of_week = 'Saturday' THEN 7
--	END ASC

--=====================================================================
--Starting and ending locations? Most concentrated area/location of use? Member vs Casual
--=====================================================================

SELECT TOP 100 start_station_name, start_lat, start_lng, COUNT(start_station_name) AS total_start, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member' OR member_casual = 'casual'
GROUP BY start_station_name, start_lat, start_lng, member_casual
ORDER BY COUNT(start_station_name) DESC

--SELECT TOP 10 start_station_name, start_lat, start_lng, COUNT(start_station_name) AS total_start, member_casual
--FROM BikeShare_Consolidated
--WHERE member_casual = 'casual'
--GROUP BY start_station_name, start_lat, start_lng, member_casual
--ORDER BY COUNT(start_station_name) DESC



SELECT TOP 100 end_station_name, end_lat, end_lng, COUNT(end_station_name) AS total_end, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member' OR member_casual = 'casual'
GROUP BY end_station_name, end_lat, end_lng, member_casual
HAVING COUNT(end_station_name) >= 1000
ORDER BY COUNT(end_station_name) DESC

--SELECT TOP 10 end_station_name, end_lat, end_lng, COUNT(end_station_name) AS total_end, member_casual
--FROM BikeShare_Consolidated
--WHERE member_casual = 'casual'
--GROUP BY end_station_name, end_lat, end_lng, member_casual
--ORDER BY COUNT(end_station_name) DESC



--=====================================================================
--Which type of bike is used? Used more? Used less? Member vs. Casual
--=====================================================================

SELECT rideable_type, COUNT(ride_id) AS total_rides
FROM BikeShare_Consolidated
GROUP BY rideable_type

SELECT rideable_type, COUNT(ride_id) AS total_rides, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member' OR member_casual = 'casual'
GROUP BY rideable_type, member_casual

--SELECT rideable_type, COUNT(ride_id) AS total_rides, member_casual
--FROM BikeShare_Consolidated
--WHERE member_casual = 'casual'
--GROUP BY rideable_type, member_casual

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

----SELECT CAST(trip_duration AS TIME) AS ride_length, rideable_type, COUNT(rideable_type) AS total_rides, member_casual, day_of_week
----FROM BikeShare_Consolidated
----WHERE CAST(trip_duration AS TIME) between '00:01:00' AND '03:00:00'
----GROUP BY day_of_week, rideable_type, member_casual, CAST(trip_duration AS TIME)
----ORDER BY CAST(trip_duration AS TIME) DESC,
----	CASE
----		WHEN day_of_week = 'Sunday' THEN 1
----		WHEN day_of_week = 'Monday' THEN 2
----		WHEN day_of_week = 'Tuesday' THEN 3
----		WHEN day_of_week = 'Wednesday' THEN 4
----		WHEN day_of_week = 'Thursday' THEN 5
----		WHEN day_of_week = 'Friday' THEN 6
----		WHEN day_of_week = 'Saturday' THEN 7
----	END ASC

--SELECT rideable_type, COUNT(rideable_type) AS total, trip_duration, member_casual
--FROM BikeShare_Consolidated
--WHERE CAST(trip_duration as TIME) < '00:15:00'
--GROUP BY rideable_type, trip_duration, member_casual
--ORDER BY trip_duration DESC

--SELECT rideable_type, COUNT(rideable_type) AS total, trip_duration
--FROM BikeShare_Consolidated
--WHERE CAST(trip_duration as TIME) between '00:15:00' AND '01:00:00'
--GROUP BY rideable_type, trip_duration
--ORDER BY trip_duration DESC


