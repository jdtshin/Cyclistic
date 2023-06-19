--===============================================================================================================================================================================================================
--SQL Query to merge and combine all 12 data tables into one consolidated table to perform data cleaning and data exploration on.
--===============================================================================================================================================================================================================



--=====================================================================
--Used the SQL Union operator to combine the result set for all 12 months of data
--=====================================================================

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
SELECT * FROM BikeShare..['2023_04$']
