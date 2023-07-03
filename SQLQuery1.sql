--Normalized tables and created a station name lookup table to use later.
--ride_id = primary key in Rides Table and foreign key referencing Rides Table in RideDetails Table


--Rides Table
DROP TABLE IF EXISTS Rides
CREATE TABLE Rides (
	ride_id nvarchar(255),
	rideable_type nvarchar(255),
	member_casual nvarchar(255)
)

INSERT INTO Rides (ride_id, rideable_type, member_casual)
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2022_01$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2022_02$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2022_03$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2022_04$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2022_05$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2022_06$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2022_07$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2022_08$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2022_09$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2022_10$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2022_11$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2022_12$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2023_01$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2023_02$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2023_03$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2023_04$']
UNION
SELECT ride_id, rideable_type, member_casual
FROM Bike..['2023_05$']


--RideDetails Table
DROP TABLE IF EXISTS RideDetails
CREATE TABLE RideDetails (
	ride_id nvarchar(255),
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
)

INSERT INTO RideDetails (ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng)
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2022_01$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2022_02$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2022_03$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2022_04$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2022_05$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2022_06$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2022_07$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2022_08$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2022_09$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2022_10$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2022_11$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2022_12$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2023_01$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2023_02$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2023_03$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2023_04$']
UNION
SELECT ride_id, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng
FROM Bike..['2023_05$']


DROP TABLE IF EXISTS StationNameLookup
CREATE TABLE StationNameLookup (
	start_station_name nvarchar(255),
	start_station_id nvarchar(255),
	end_station_name nvarchar(255),
	end_station_id nvarchar(255)
)

INSERT INTO StationNameLookup (start_station_name, start_station_id, end_station_name, end_station_id)
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2022_01$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2022_02$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2022_03$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2022_04$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2022_05$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2022_06$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2022_07$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2022_08$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2022_09$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2022_10$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2022_11$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2022_12$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2023_01$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2023_02$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2023_03$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2023_04$']
UNION
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM Bike..['2023_05$']


SELECT * FROM Bike..Rides

SELECT * FROM Bike..RideDetails

SELECT * FROM Bike..StationNameLookup