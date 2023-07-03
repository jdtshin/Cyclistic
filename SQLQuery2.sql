--Used the StationNameLookup Table as a reference to find, match, and update the RideDetails Table where station names were missing, but station IDs were provided.
--Deleted rows where station names and IDs were blank or null


--Finding starting station names that have a station ID provided
UPDATE RideDetails
SET RideDetails.start_station_name = StationNameLookup.start_station_name
FROM RideDetails
JOIN StationNameLookup
	ON RideDetails.start_station_id = StationNameLookup.start_station_id
WHERE RideDetails.start_station_name = '' OR RideDetails.start_station_name is NULL


--Finding ending station names that have a station ID provided
UPDATE RideDetails
SET RideDetails.end_station_name = StationNameLookup.end_station_name
FROM RideDetails
JOIN StationNameLookup
	ON RideDetails.end_station_id = StationNameLookup.end_station_id
WHERE RideDetails.end_station_name = '' OR RideDetails.end_station_name is NULL


--Delete rows where station information is not provided
SELECT *
FROM RideDetails
WHERE start_station_name = '' and start_station_id = ''

DELETE
FROM RideDetails
WHERE start_station_name = '' and start_station_id = ''

SELECT *
FROM RideDetails
WHERE end_station_name = '' and end_station_id = ''

DELETE
FROM RideDetails
WHERE end_station_name = '' and end_station_id = ''

SELECT *
FROM RideDetails
WHERE start_station_name is NULL

SELECT *
FROM RideDetails
WHERE start_station_id = '780'

DELETE
FROM RideDetails
WHERE start_station_id = '780'

SELECT * 
FROM RideDetails
WHERE end_station_name is NULL