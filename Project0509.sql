-- Project0509.sql
-- 9.	The station contains a location as latitude and longitude.  Compute for 
--  each trip the distance covered by that trip, using the following equation to 
--  approximate: sqrt( (69 miles * difference in latitude)^2 + (52 miles * 
--  difference in longitude)^2 ).  For this computation, use the SQRT function and 
--  SQUARE function in SQL.  For the 10 longest trips, return the trip ID, 
--  starting station ID, ending station ID, and distance travelled as Distance.

SELECT TOP 10 TripID, FromStation, ToStation,   (SQRT(SQUARE( 69.0 * ((SELECT Latitude FROM Stations WHERE StationID = FromStation) - 
                                                (SELECT Latitude FROM Stations WHERE StationID = ToStation)))
                                                                                    +
                                                SQUARE( 52.0 * ((SELECT Longitude FROM Stations WHERE StationID = FromStation) - 
                                                (SELECT Longitude FROM Stations WHERE StationID = ToStation)))))
                                                AS Distance 
FROM Trips 
ORDER BY Distance DESC