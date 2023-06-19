--===============================================================================================================================================================================================================
--SQL Queries to delete rows with blank and/or null values (First part of data cleaning in EXCEL revealed that the columns start_station_name, start_station_id, end_station_name, and end_station_id have the only blank/null values). 
--===============================================================================================================================================================================================================



--=====================================================================
--FIRST CHECK FOR BLANKS AND NULLS HERE
--=====================================================================

--Selecting the starting station names and id where they are null or blank. Produces 1,468,430 rows
SELECT start_station_name, start_station_id
FROM BikeShare_Consolidated
WHERE start_station_name is NULL OR start_station_name = '' AND start_station_id is NULL OR start_station_id = ''

--Selecting the ending station names and id where they are null or blank. Produces 984,848 rows
SELECT end_station_name, end_station_id
FROM BikeShare_Consolidated
WHERE end_station_name is NULL OR end_station_name = '' AND end_station_id is NULL OR end_station_id = ''

--Selecting all the rows where the starting and ending station names and ids are all blank. Produces 348,636 rows
SELECT start_station_name, start_station_id, end_station_name, end_station_id
FROM BikeShare_Consolidated
WHERE start_station_name = '' AND start_station_id = '' AND end_station_name = '' AND end_station_id = ''



--=====================================================================
--DELETION OF NULL/BLANK ROWS HERE
--=====================================================================

--Deletes all the rows where the starting AND ending station names and ids are all blank. 348,636 rows deleted
DELETE 
FROM BikeShare_Consolidated
WHERE start_station_name = '' AND start_station_id = '' AND end_station_name = '' AND end_station_id = ''

--Deletes the rows where the starting station name and id are both null or blank. 1,119,794 rows deleted
DELETE
FROM BikeShare_Consolidated
WHERE start_station_name is NULL OR start_station_name = '' AND start_station_id is NULL OR start_station_id = ''

--Deletes the rows where the ending station name and id are both blank. 499,481 rows deleted
DELETE
FROM BikeShare_Consolidated
WHERE end_station_name is NULL OR end_station_name = '' AND end_station_id is NULL OR end_station_id = ''

--Checking if there are still anymore blanks. 4,495,362 rows remaining
SELECT *
FROM BikeShare_Consolidated
WHERE start_station_name = '' AND start_station_id = '' AND end_station_name = '' AND end_station_id = ''

SELECT *
FROM BikeShare_Consolidated
WHERE start_station_name is NULL OR start_station_name = '' AND start_station_id is NULL OR start_station_id = ''

SELECT *
FROM BikeShare_Consolidated
WHERE end_station_name is NULL OR end_station_name = '' AND end_station_id is NULL OR end_station_id = ''

SELECT *
FROM BikeShare_Consolidated


--=====================================================================
--Remove if trip_duration > 10 hours?
--=====================================================================