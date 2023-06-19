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
SELECT DATEPART(month, start_date) AS month, COUNT(*) as total_rides_per_month_member
FROM BikeShare_Consolidated
WHERE member_casual = 'member'
GROUP BY DATEPART(month, start_date)
ORDER BY DATEPART(month, start_date)

SELECT DATEPART(month, start_date) AS month, COUNT(*) as total_rides_per_month_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'casual'
GROUP BY DATEPART(month, start_date)
ORDER BY DATEPART(month, start_date)

--Note: Would OVER (PARTITION BY) be a better solution here?

--=====================================================================
--Total Rides per day of the week (Member vs. Casual)
--=====================================================================

SELECT day_of_week, COUNT(day_of_week) AS total_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'casual'
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

SELECT day_of_week, COUNT(day_of_week) AS total_member
FROM BikeShare_Consolidated
WHERE member_casual = 'member'
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


--=====================================================================
--Average ride length, Average ride length per day of week (Member vs. Casual)
--=====================================================================

SELECT CAST(CAST(AVG(CAST(trip_duration as FLOAT)) AS DATETIME) as TIME) AS avg_ride_length_member
FROM BikeShare_Consolidated
WHERE member_casual = 'member'

SELECT CAST(CAST(AVG(CAST(trip_duration as FLOAT)) AS DATETIME) as TIME) AS avg_ride_length_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'casual'


SELECT CAST(CAST(AVG(CAST(trip_duration as FLOAT)) AS DATETIME) as TIME) AS avg_ride_length_member, day_of_week
FROM BikeShare_Consolidated
WHERE member_casual = 'member'
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

SELECT CAST(CAST(AVG(CAST(trip_duration as FLOAT)) AS DATETIME) as TIME) AS avg_ride_length_casual, day_of_week
FROM BikeShare_Consolidated
WHERE member_casual = 'casual'
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


--=====================================================================
--Rides during the time of day, per day of the week
--=====================================================================

SELECT COUNT(*) AS number_of_riders, day_of_week
FROM BikeShare_Consolidated
WHERE CAST(start_time AS TIME) between '05:00' AND '09:00' AND member_casual = 'member'
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

SELECT COUNT(*) AS number_of_riders, day_of_week
FROM BikeShare_Consolidated
WHERE CAST(start_time AS TIME) between '05:00' AND '09:00' AND member_casual = 'casual'
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



--=====================================================================
--Starting and ending locations? Most concentrated area/location of use? Member vs Casual
--=====================================================================

SELECT TOP 3 start_station_name, start_lat, start_lng, COUNT(start_station_name) AS total_start, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member'
GROUP BY start_station_name, start_lat, start_lng, member_casual
ORDER BY COUNT(start_station_name) DESC

SELECT TOP 3 start_station_name, start_lat, start_lng, COUNT(start_station_name) AS total_start, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'casual'
GROUP BY start_station_name, start_lat, start_lng, member_casual
ORDER BY COUNT(start_station_name) DESC



SELECT end_station_name, end_lat, end_lng, COUNT(end_station_name) AS total_end, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member'
GROUP BY end_station_name, end_lat, end_lng, member_casual
ORDER BY COUNT(end_station_name) DESC

SELECT end_station_name, end_lat, end_lng, COUNT(end_station_name) AS total_end, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'casual'
GROUP BY end_station_name, end_lat, end_lng, member_casual
ORDER BY COUNT(end_station_name) DESC



--=====================================================================
--Which type of bike is used? Used more? Used less? Member vs. Casual
--=====================================================================

SELECT rideable_type, COUNT(ride_id) AS total_rides
FROM BikeShare_Consolidated
GROUP BY rideable_type



SELECT rideable_type, COUNT(ride_id) AS total_rides, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'member'
GROUP BY rideable_type, member_casual

SELECT rideable_type, COUNT(ride_id) AS total_rides, member_casual
FROM BikeShare_Consolidated
WHERE member_casual = 'casual'
GROUP BY rideable_type, member_casual



SELECT rideable_type, COUNT(rideable_type) AS total, trip_duration
FROM BikeShare_Consolidated
WHERE CAST(trip_duration as TIME) <= '00:05:00'
GROUP BY rideable_type, trip_duration
ORDER BY trip_duration DESC

SELECT rideable_type, COUNT(rideable_type) AS total, trip_duration
FROM BikeShare_Consolidated
WHERE CAST(trip_duration as TIME) > '00:05:00'
GROUP BY rideable_type, trip_duration
ORDER BY trip_duration DESC


