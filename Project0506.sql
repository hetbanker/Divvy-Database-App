-- Project0506.sql
-- 6.	For each age group (year) among customers, list the average 
--  ride duration among all trips customers of that age group took.  
--select BirthYear, count(*) AS counter from Users
--GROUP By BirthYear

SELECT TOP 10 (YEAR(GETDATE()) - BirthYear) AS Age, 
              Avg(TripDuration) AS AverageTripDurationPerAgeGroup
FROM Users
LEFT JOIN Trips On Users.UserID = Trips.UserID
GROUP BY (YEAR(GETDATE()) - BirthYear)
ORDER By (Avg(TripDuration)) DESC

