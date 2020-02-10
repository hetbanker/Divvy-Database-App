-- Project0504.sql
-- 4.	For each StationID, retrieve the ID, number of trips 
-- taken from that station as NumTripsFrom and to that station 
-- as NumTripsTo (as separate values).  Order the results in 
-- descending order by the total number of trips both from and 
-- to the station.

SELECT TOP 10 StationID, 
              SUM(  CASE WHEN Stations.StationID = Trips.FromStation THEN 1 ELSE 0 END) AS NumTripsFrom, 
              COUNT(CASE WHEN Stations.StationID = Trips.ToStation   THEN 1 ELSE NULL END) AS NumTripsTo 
FROM Trips, Stations
GROUP BY StationID
ORDER BY (SUM(  CASE WHEN Stations.StationID = Trips.FromStation THEN 1 ELSE 0 END) + 
          COUNT(CASE WHEN Stations.StationID = Trips.ToStation   THEN 1 ELSE NULL END))  DESC