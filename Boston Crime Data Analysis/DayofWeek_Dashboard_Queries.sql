--Procedure that is used in the DayofWeek dashboard for embedding
--Takes a DayofWeek as a prameter and returns the total crime by street in that day of week
CREATE PROCEDURE usp_StreetbyDayofWeek
	@DayofWeek varchar(50)
as
BEGIN
SELECT b.STREET, 
       Count(b.INCIDENT_NUMBER) TotalCrime
FROM BostonCrimeData2 b
WHERE b.STREET is not null and b.DAY_OF_WEEK = @DayofWeek
GROUP BY b.STREET
Order By TotalCrime DESC
END


--Procedure that is used in the DayofWeek dashboard for embedding
--Counts the total crime by the Offense Code Group in a specific day of week
CREATE PROCEDURE usp_OffenseCodeGroupbyDayofWeek
	@DayofWeek varchar(50)
as
BEGIN
SELECT TOP 8 
	   Count(b.INCIDENT_NUMBER) TotalCrime, 
	   b.OFFENSE_CODE_GROUP
FROM BostonCrimeData2 b
WHERE b.DAY_OF_WEEK = @DayofWeek
Group BY b.OFFENSE_CODE_GROUP
Order BY TotalCrime DESC
END

--Procedure that is used in the dashboard for embedding
--Counts the total crime by the Month in a specific district
CREATE PROCEDURE usp_CrimeinDistrictsbyDayofWeek
	@Dayofweek varchar(50)
as
BEGIN
SELECT Count(b.INCIDENT_NUMBER) TotalCrime,
	   b.DISTRICT
FROM BostonCrimeData2 b
WHERE b.DAY_OF_WEEK = @Dayofweek
GROUP BY b.DISTRICT
ORDER BY b.DISTRICT
END

--Query that counts the total records in each year
--Allowed me to pick the year with the most optimal data
SELECT Count(b.INCIDENT_NUMBER) Totalrecords,
	   YEAR(b.OCCURRED_ON_DATE) YEAR
FROM BostonCrimeData2 b
GROUP BY YEAR(b.OCCURRED_ON_DATE)
ORDER BY YEAR(b.OCCURRED_ON_DATE)

--Stored procedure that takes a dayofweek as an input and returns
--the total shooting on that day
CREATE PROCEDURE usp_ShootingbyDayofWeek
	@Dayofweek varchar(50)
as
BEGIN
SELECT Count(b.SHOOTING) TotalShootings,
	   b.DAY_OF_WEEK
FROM BostonCrimeData2 b
WHERE b.DAY_OF_WEEK is not NULL and b.DAY_OF_WEEK = @Dayofweek
GROUP BY b.DAY_OF_WEEK
ORDER BY b.DAY_OF_WEEK
END