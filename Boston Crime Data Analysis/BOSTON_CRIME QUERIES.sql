--Counts the total times each OFFENSE_CODE_GROUP has been commited
SELECT Count(b.INCIDENT_NUMBER) TotalCrime, 
	   b.OFFENSE_CODE_GROUP
FROM BostonCrimeData2 b
Group BY OFFENSE_CODE_GROUP
Order BY TotalCrime DESC

--Counts the total crime by month in a specific year
SELECT Count(b.INCIDENT_NUMBER) TotalCrime,
	   MONTH(b.OCCURRED_ON_DATE) MONTH
FROM BostonCrimeData2 b
WHERE YEAR = '2018'
GROUP BY MONTH(b.OCCURRED_ON_DATE)
ORDER BY MONTH(b.OCCURRED_ON_DATE)

--Counts the total crime by the day of week 
SELECT DAY_OF_WEEK, 
	   Count(b.INCIDENT_NUMBER) TotalCrime
FROM BostonCrimeData2 b
GROUP BY b.DAY_OF_WEEK
Order By TotalCrime DESC

--Counts the total crime recorded in each street
SELECT STREET, 
       Count(b.INCIDENT_NUMBER) TotalCrime
FROM BostonCrimeData2 b
WHERE b.STREET is not null
GROUP BY b.STREET
Order By TotalCrime DESC

--Counts the total crime commited in each hour of the day
SELECT HOUR, 
       Count(b.INCIDENT_NUMBER) TotalCrime
FROM BostonCrimeData2 b
GROUP BY HOUR
Order By HOUR 


--Procedure that is used in the dashboard for embedding
--Counts the total crime on each street in a specific district
CREATE PROCEDURE usp_StreetbyDistrict
	@District varchar(50)
as
BEGIN
SELECT STREET, 
       Count(b.INCIDENT_NUMBER) TotalCrime
FROM BostonCrimeData2 b
WHERE b.STREET is not null and b.STREET = @District
GROUP BY b.STREET
Order By TotalCrime DESC
END

--Procedure that is used in the dashboard for embedding
--Counts the total crime by the day of week in a specific district
CREATE PROCEDURE usp_DayofWeekbyDistrict
	@District varchar(50)
as
BEGIN
SELECT b.DAY_OF_WEEK, 
	   Count(b.INCIDENT_NUMBER) TotalCrime
FROM BostonCrimeData2 b
WHERE b.DISTRICT = @District
GROUP BY b.DAY_OF_WEEK
Order By TotalCrime DESC
END

--Procedure that is used in the dashboard for embedding
--Counts the total crime by the Offense Code Group in a specific district
CREATE PROCEDURE usp_OffenseCodeGroupbyDistrict
	@District varchar(50)
as
BEGIN
SELECT TOP 8 
	   Count(b.INCIDENT_NUMBER) TotalCrime, 
	   b.OFFENSE_CODE_GROUP
FROM BostonCrimeData2 b
WHERE b.DISTRICT = 'B2'
Group BY b.OFFENSE_CODE_GROUP
Order BY TotalCrime DESC
END

--Procedure that is used in the dashboard for embedding
--Counts the total crime by the Month in a specific district
CREATE PROCEDURE usp_TotalCrimebyMonthbyDistrict
	@District varchar(50)
as
BEGIN
SELECT Count(b.INCIDENT_NUMBER) TotalCrime,
	   MONTH(b.OCCURRED_ON_DATE) MONTH
FROM BostonCrimeData2 b
WHERE b.DISTRICT = @District
GROUP BY MONTH(b.OCCURRED_ON_DATE)
ORDER BY MONTH(b.OCCURRED_ON_DATE)
END



Create Procedure usp_CrimeByDistrict
as
Begin
SELECT Count(b.INCIDENT_NUMBER) TotalNumberOfCrime, 
       b.DISTRICT
FROM BostonCrimeData2 b
Group BY b.DISTRICT
Order BY TotalNumberOfCrime DESC
END



Create PROCEDURE usp_CrimeinDistricts
	@district varchar(50)
as

BEGIN
SELECT Count(b.INCIDENT_NUMBER) TotalNumberOfCrime, 
       b.DISTRICT
FROM BostonCrimeData2 b
WHERE b.DISTRICT = @district
Group BY b.DISTRICT
Order BY TotalNumberOfCrime DESC
END



CREATE Procedure usp_IncidentsByDayOfWeek
as
BEGIN
SELECT b.DAY_OF_WEEK, 
       Count(b.INCIDENT_NUMBER) TotalCrime
FROM BostonCrimeData2 b
GROUP BY b.DAY_OF_WEEK
Order By TotalCrime desc
END


CREATE Procedure usp_IncidentsByStreet
as
BEGIN
SELECT top 15 
       b.STREET, 
       Count(b.INCIDENT_NUMBER) TotalCrime
FROM BostonCrimeData2 b
WHERE b.STREET is not null 
GROUP BY b.STREET
Order By TotalCrime desc
END

