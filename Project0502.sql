-- Project0502.sql
-- 2.	Retrieve the number of unique bikeIDs
SELECT COUNT(DISTINCT(BikeId)) AS NumBikes 
FROM Trips
