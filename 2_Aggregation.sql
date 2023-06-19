--===============================================================================================================================================================================================================
--SQL Queries to aggregate all 12 months of data and insert it into a new table, named BikeShare_Consolidated.
--===============================================================================================================================================================================================================


--=====================================================================
--Created a new table, named BikeShare_Consolidated, to aggregate all 12 months of data into.
--=====================================================================

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



--=====================================================================
--Inserted all 12 months of data by using the Union Operator to aggregate the data of all 12 tables
--=====================================================================

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



--=====================================================================
--Checking to see if the data was properly inserted into the new table.
--=====================================================================

SELECT *
FROM BikeShare_Consolidated
ORDER BY start_date

SELECT Distinct end_station_name, end_station_id
FROM BikeShare_Consolidated
ORDER BY end_station_name

SELECT COUNT(Distinct start_station_id) AS number_dock_stations
FROM BikeShare_Consolidated
WHERE start_station_name is not null

SELECT COUNT(Distinct rideable_type)
FROM BikeShare_Consolidated

SELECT CONVERT(time, trip_duration)
FROM BikeShare_Consolidated

