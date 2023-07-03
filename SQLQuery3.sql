--Business Task: Discover how annual members and casual riders use Cyclistic differently.


--Practicing with CTEs here:
--WITH RideSummary AS (
--	SELECT 
--		DATEPART(year, RideDetails.start_date) as year, 
--		DATENAME(month, RideDetails.start_date) as month,
--		COUNT(RideDetails.ride_id) as total_rides,
--		Rides.member_casual as member_status
--	FROM 
--		RideDetails
--	JOIN Rides
--		ON RideDetails.ride_id = Rides.ride_id
--	GROUP BY 
--		DATEPART(year, RideDetails.start_date),
--		DATENAME(month, RideDetails.start_date),
--		Rides.member_casual
--)
--SELECT year, month, total_rides, member_status FROM RideSummary



--Total rides (Yearly)
SELECT DATEPART(year, start_date) as year, COUNT(RideDetails.ride_id) as total_rides, Rides.member_casual as member_status
FROM RideDetails
JOIN Rides
	ON RideDetails.ride_id = Rides.ride_id
GROUP BY DATEPART(year, start_date), Rides.member_casual
ORDER BY DATEPART(year, start_date)

--Total rides (Monthly)
SELECT DATEPART(year, RideDetails.start_date) as year, DATENAME(month, RideDetails.start_date) as month, COUNT(RideDetails.ride_id) as total_rides, Rides.member_casual as member_status
FROM RideDetails
JOIN Rides
	ON RideDetails.ride_id = Rides.ride_id
GROUP BY DATEPART(year, RideDetails.start_date), DATENAME(month, RideDetails.start_date), Rides.member_casual
ORDER BY
	DATEPART(year, RideDetails.start_date),
	CASE
		WHEN DATENAME(month, RideDetails.start_date) = 'January' THEN 1
		WHEN DATENAME(month, RideDetails.start_date) = 'February' THEN 2
		WHEN DATENAME(month, RideDetails.start_date) = 'March' THEN 3
		WHEN DATENAME(month, RideDetails.start_date) = 'April' THEN 4
		WHEN DATENAME(month, RideDetails.start_date) = 'May' THEN 5
		WHEN DATENAME(month, RideDetails.start_date) = 'June' THEN 6
		WHEN DATENAME(month, RideDetails.start_date) = 'July' THEN 7
		WHEN DATENAME(month, RideDetails.start_date) = 'August' THEN 8
		WHEN DATENAME(month, RideDetails.start_date) = 'September' THEN 9
		WHEN DATENAME(month, RideDetails.start_date) = 'October' THEN 10
		WHEN DATENAME(month, RideDetails.start_date) = 'November' THEN 11
		WHEN DATENAME(month, RideDetails.start_date) = 'December' THEN 12
	END ASC

--Total rides (Day of week)
SELECT DATEPART(year, RideDetails.start_date) as year, RideDetails.day_of_week as day_of_week, COUNT(RideDetails.ride_id) as total_rides, Rides.member_casual as member_status
FROM RideDetails
JOIN Rides
	ON RideDetails.ride_id = Rides.ride_id
GROUP BY DATEPART(year, RideDetails.start_date), RideDetails.day_of_week, Rides.member_casual
ORDER BY
	DATEPART(year, RideDetails.start_date),
	CASE
		WHEN RideDetails.day_of_week = 'Sunday' THEN 1
		WHEN RideDetails.day_of_week = 'Monday' THEN 2
		WHEN RideDetails.day_of_week = 'Tuesday' THEN 3
		WHEN RideDetails.day_of_week = 'Wednesday' THEN 4
		WHEN RideDetails.day_of_week = 'Thursday' THEN 5
		WHEN RideDetails.day_of_week = 'Friday' THEN 6
		WHEN RideDetails.day_of_week = 'Saturday' THEN 7
	END ASC


--Total rides (Time/hour of day)
SELECT DATEPART(year, RideDetails.start_date) as year, RideDetails.day_of_week as day_of_week, DATEPART(hour, RideDetails.start_time) as hour_of_day, COUNT(RideDetails.ride_id) as total_rides, Rides.member_casual as member_status
FROM RideDetails
JOIN Rides
	ON RideDetails.ride_id = Rides.ride_id
GROUP BY DATEPART(year, RideDetails.start_date), RideDetails.day_of_week, DATEPART(hour, RideDetails.start_time), Rides.member_casual
ORDER BY
	DATEPART(year, RideDetails.start_date),
	--COUNT(RideDetails.ride_id) DESC,
	CASE
		WHEN RideDetails.day_of_week = 'Sunday' THEN 1
		WHEN RideDetails.day_of_week = 'Monday' THEN 2
		WHEN RideDetails.day_of_week = 'Tuesday' THEN 3
		WHEN RideDetails.day_of_week = 'Wednesday' THEN 4
		WHEN RideDetails.day_of_week = 'Thursday' THEN 5
		WHEN RideDetails.day_of_week = 'Friday' THEN 6
		WHEN RideDetails.day_of_week = 'Saturday' THEN 7
	END ASC

--Average trip duration (Yearly)
SELECT DATEPART(year, RideDetails.start_date) as year, CAST(CAST(AVG(CAST(RideDetails.trip_duration as FLOAT)) as DATETIME) as TIME) as average_trip_duration, Rides.member_casual as member_status
FROM RideDetails
JOIN Rides
	ON RideDetails.ride_id = Rides.ride_id
GROUP BY DATEPART(year, RideDetails.start_date), Rides.member_casual
ORDER BY DATEPART(year, RideDetails.start_date)

--Average trip duration (Monthly)
SELECT DATEPART(year, RideDetails.start_date) as year, DATENAME(month, RideDetails.start_date) as month, CAST(CAST(AVG(CAST(RideDetails.trip_duration as FLOAT)) as DATETIME) as TIME) as average_trip_duration, Rides.member_casual as member_status
FROM RideDetails
JOIN Rides
	ON RideDetails.ride_id = Rides.ride_id
GROUP BY DATEPART(year, RideDetails.start_date), DATENAME(month, RideDetails.start_date), Rides.member_casual
ORDER BY 
	DATEPART(year, RideDetails.start_date),
	CASE
		WHEN DATENAME(month, RideDetails.start_date) = 'January' THEN 1
		WHEN DATENAME(month, RideDetails.start_date) = 'February' THEN 2
		WHEN DATENAME(month, RideDetails.start_date) = 'March' THEN 3
		WHEN DATENAME(month, RideDetails.start_date) = 'April' THEN 4
		WHEN DATENAME(month, RideDetails.start_date) = 'May' THEN 5
		WHEN DATENAME(month, RideDetails.start_date) = 'June' THEN 6
		WHEN DATENAME(month, RideDetails.start_date) = 'July' THEN 7
		WHEN DATENAME(month, RideDetails.start_date) = 'August' THEN 8
		WHEN DATENAME(month, RideDetails.start_date) = 'September' THEN 9
		WHEN DATENAME(month, RideDetails.start_date) = 'October' THEN 10
		WHEN DATENAME(month, RideDetails.start_date) = 'November' THEN 11
		WHEN DATENAME(month, RideDetails.start_date) = 'December' THEN 12
	END ASC

--Average trip duration (Day of week)
SELECT DATEPART(year, RideDetails.start_date) as year, RideDetails.day_of_week as day_of_week, CAST(CAST(AVG(CAST(RideDetails.trip_duration as FLOAT)) as DATETIME) as TIME) as average_trip_duration, Rides.member_casual as member_status
FROM RideDetails
JOIN Rides
	ON RideDetails.ride_id = Rides.ride_id
GROUP BY DATEPART(year, RideDetails.start_date), RideDetails.day_of_week, Rides.member_casual
ORDER BY
	DATEPART(year, RideDetails.start_date),
	CASE
		WHEN RideDetails.day_of_week = 'Sunday' THEN 1
		WHEN RideDetails.day_of_week = 'Monday' THEN 2
		WHEN RideDetails.day_of_week = 'Tuesday' THEN 3
		WHEN RideDetails.day_of_week = 'Wednesday' THEN 4
		WHEN RideDetails.day_of_week = 'Thursday' THEN 5
		WHEN RideDetails.day_of_week = 'Friday' THEN 6
		WHEN RideDetails.day_of_week = 'Saturday' THEN 7
	END ASC

--Type of bike used (Yearly):
SELECT DATEPART(year, RideDetails.start_date) as year, Rides.rideable_type as bike_type, COUNT(RideDetails.ride_id) as total_rides, Rides.member_casual as member_status
FROM RideDetails
JOIN Rides
	ON RideDetails.ride_id = Rides.ride_id
GROUP BY DATEPART(year, RideDetails.start_date), Rides.rideable_type, Rides.member_casual
ORDER BY DATEPART(year, RideDetails.start_date)

--Type of bike used (Monthly):
SELECT DATEPART(year, RideDetails.start_date) as year, DATENAME(month, RideDetails.start_date) as month, Rides.rideable_type as bike_type, COUNT(RideDetails.ride_id) as total_rides, Rides.member_casual as member_status
FROM RideDetails
JOIN Rides
	ON RideDetails.ride_id = Rides.ride_id
GROUP BY DATEPART(year, RideDetails.start_date), DATENAME(month, RideDetails.start_date), Rides.rideable_type, Rides.member_casual
ORDER BY DATEPART(year, RideDetails.start_date),
	CASE
		WHEN DATENAME(month, RideDetails.start_date) = 'January' THEN 1
		WHEN DATENAME(month, RideDetails.start_date) = 'February' THEN 2
		WHEN DATENAME(month, RideDetails.start_date) = 'March' THEN 3
		WHEN DATENAME(month, RideDetails.start_date) = 'April' THEN 4
		WHEN DATENAME(month, RideDetails.start_date) = 'May' THEN 5
		WHEN DATENAME(month, RideDetails.start_date) = 'June' THEN 6
		WHEN DATENAME(month, RideDetails.start_date) = 'July' THEN 7
		WHEN DATENAME(month, RideDetails.start_date) = 'August' THEN 8
		WHEN DATENAME(month, RideDetails.start_date) = 'September' THEN 9
		WHEN DATENAME(month, RideDetails.start_date) = 'October' THEN 10
		WHEN DATENAME(month, RideDetails.start_date) = 'November' THEN 11
		WHEN DATENAME(month, RideDetails.start_date) = 'December' THEN 12
	END ASC


--Most popular stations (2022):
SELECT TOP 10 RideDetails.start_station_name, RideDetails.start_station_id, COUNT(RideDetails.ride_id) as total_rides, Rides.member_casual as member_status
FROM RideDetails
JOIN Rides
	ON RideDetails.ride_id = Rides.ride_id
WHERE DATEPART(year, RideDetails.start_date) = '2022' AND Rides.member_casual = 'member'
GROUP BY RideDetails.start_station_name, RideDetails.start_station_id, Rides.member_casual
ORDER BY COUNT(RideDetails.ride_id) DESC

SELECT TOP 10 RideDetails.start_station_name, RideDetails.start_station_id, COUNT(RideDetails.ride_id) as total_rides, Rides.member_casual as member_status
FROM RideDetails
JOIN Rides
	ON RideDetails.ride_id = Rides.ride_id
WHERE DATEPART(year, RideDetails.start_date) = '2022' AND Rides.member_casual = 'casual'
GROUP BY RideDetails.start_station_name, RideDetails.start_station_id, Rides.member_casual
ORDER BY COUNT(RideDetails.ride_id) DESC


SELECT RideDetails.end_station_name, RideDetails.end_station_id, COUNT(RideDetails.ride_id) as total_rides, Rides.member_casual as member_status
FROM RideDetails
JOIN Rides
	ON RideDetails.ride_id = Rides.ride_id
WHERE DATEPART(year, RideDetails.start_date) = '2022' AND Rides.member_casual = 'member'
GROUP BY RideDetails.end_station_name, RideDetails.end_station_id, Rides.member_casual
ORDER BY COUNT(RideDetails.ride_id) DESC

SELECT RideDetails.end_station_name, RideDetails.end_station_id, COUNT(RideDetails.ride_id) as total_rides, Rides.member_casual as member_status
FROM RideDetails
JOIN Rides
	ON RideDetails.ride_id = Rides.ride_id
WHERE DATEPART(year, RideDetails.start_date) = '2022' AND Rides.member_casual = 'member'
GROUP BY RideDetails.end_station_name, RideDetails.end_station_id, Rides.member_casual
ORDER BY COUNT(RideDetails.ride_id) DESC


