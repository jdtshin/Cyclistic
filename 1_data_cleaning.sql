--Creating two tables, one working table and one lookup table
DROP TABLE IF EXISTS Bike_Consolidated
CREATE TABLE Bike_Consolidated (
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

DROP TABLE IF EXISTS Bike_Lookup
CREATE TABLE Bike_Lookup (
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

--Inserting all datasets into the two new tables (Bike_Consolidated and Bike_Lookup)
INSERT INTO Bike_Consolidated (ride_id, rideable_type, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SELECT * FROM Bike..['2022_01$']
UNION
SELECT * FROM Bike..['2022_02$']
UNION
SELECT * FROM Bike..['2022_03$']
UNION
SELECT * FROM Bike..['2022_04$']
UNION
SELECT * FROM Bike..['2022_05$']
UNION
SELECT * FROM Bike..['2022_06$']
UNION
SELECT * FROM Bike..['2022_07$']
UNION
SELECT * FROM Bike..['2022_08$']
UNION
SELECT * FROM Bike..['2022_09$']
UNION
SELECT * FROM Bike..['2022_10$']
UNION
SELECT * FROM Bike..['2022_11$']
UNION
SELECT * FROM Bike..['2022_12$']
UNION
SELECT * FROM Bike..['2023_01$']
UNION
SELECT * FROM Bike..['2023_02$']
UNION
SELECT * FROM Bike..['2023_03$']
UNION
SELECT * FROM Bike..['2023_04$']
UNION
SELECT * FROM Bike..['2023_05$']

INSERT INTO Bike_Lookup (ride_id, rideable_type, start_date, end_date, day_of_week, start_time, end_time, trip_duration, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SELECT * FROM Bike..['2022_01$']
UNION
SELECT * FROM Bike..['2022_02$']
UNION
SELECT * FROM Bike..['2022_03$']
UNION
SELECT * FROM Bike..['2022_04$']
UNION
SELECT * FROM Bike..['2022_05$']
UNION
SELECT * FROM Bike..['2022_06$']
UNION
SELECT * FROM Bike..['2022_07$']
UNION
SELECT * FROM Bike..['2022_08$']
UNION
SELECT * FROM Bike..['2022_09$']
UNION
SELECT * FROM Bike..['2022_10$']
UNION
SELECT * FROM Bike..['2022_11$']
UNION
SELECT * FROM Bike..['2022_12$']
UNION
SELECT * FROM Bike..['2023_01$']
UNION
SELECT * FROM Bike..['2023_02$']
UNION
SELECT * FROM Bike..['2023_03$']
UNION
SELECT * FROM Bike..['2023_04$']
UNION
SELECT * FROM Bike..['2023_05$']

SELECT *
FROM Bike_Consolidated

SELECT *
FROM Bike_Lookup


--Finding and updating the station names using the station ID where station names that are either blank or null
--By joining the Bike_Lookup table with the Bike_Consolidated table on their station ID's, I was able to update the Bike_Consolidated table where the starting and ending station names were blank or null.
UPDATE Bike_Consolidated
SET Bike_Consolidated.start_station_name = Bike_Lookup.start_station_name
FROM Bike_Consolidated
JOIN Bike_Lookup
	ON Bike_Consolidated.start_station_id = Bike_Lookup.start_station_id
WHERE Bike_Consolidated.start_station_name = '' OR Bike_Consolidated.start_station_name IS NULL

UPDATE Bike_Consolidated
SET Bike_Consolidated.end_station_name = Bike_Lookup.end_station_name
FROM Bike_Consolidated
JOIN Bike_Lookup
	ON Bike_Consolidated.end_station_id = Bike_Lookup.end_station_id
WHERE Bike_Consolidated.end_station_name = '' OR Bike_Consolidated.end_station_name IS NULL


--Checking and deleting rows where:
----(1) starting station name and id are blank
SELECT *
FROM Bike_Consolidated
WHERE start_station_name = '' AND start_station_id = ''

DELETE
FROM Bike_Consolidated
WHERE start_station_name = '' AND start_station_id = ''

----(2) ending station name and id are blank
SELECT *
FROM Bike_Consolidated
WHERE end_station_name = '' AND end_station_id = ''

DELETE
FROM Bike_Consolidated
WHERE end_station_name = '' AND end_station_id = ''

----(3) station names for both start and end are blank
SELECT *
FROM Bike_Consolidated
WHERE start_station_name = '' AND start_station_id = '' AND end_station_name = '' AND end_station_id = ''

DELETE
FROM Bike_Consolidated
WHERE start_station_name = '' AND start_station_id = '' AND end_station_name = '' AND end_station_id = ''

----(4) starting station name is NULL (Produced only one station with an ID of 780, checks show that there are no other stations with this ID. As such, I chose to delete this row from the table)
SELECT *
FROM Bike_Consolidated
WHERE start_station_name IS NULL

SELECT *
FROM Bike_Consolidated
WHERE start_station_id = '780'

DELETE
FROM Bike_Consolidated
WHERE start_station_id = '780'

----(5) ending station name is NULL
SELECT *
FROM Bike_Consolidated
WHERE end_station_name IS NULL

----(6) station ID's are null
SELECT *
FROM Bike_Consolidated
WHERE start_station_id IS NULL OR end_station_id IS NULL


SELECT *
FROM Bike_Consolidated