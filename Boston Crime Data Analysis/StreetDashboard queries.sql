--Used for embedding in the Street dashboard
--Stored procedure that takes a street name as an input and returns
--the total crime by offense code in that street
CREATE PROCEDURE usp_OffenseCodebyStreetName
		@Street varchar(50)
as
Begin
SELECT TOP 8 
	   Count(b.INCIDENT_NUMBER) TotalCrime, 
	   b.OFFENSE_CODE_GROUP
FROM BostonCrimeData2 b
WHERE b.DISTRICT is not NULL
	  AND b.OFFENSE_CODE_GROUP != 'Other'
	  AND b.STREET = @Street
Group BY b.OFFENSE_CODE_GROUP
Order BY TotalCrime DESC
End

--Used for embedding in the Street dashboard
--Stored procedure that takes a street name as an input and returns
--the total shootings that occured on that street
CREATE PROCEDURE usp_TotalShootingsbyStreetName
		@Street varchar(50)
as
Begin
SELECT Count(b.SHOOTING) TotalShootings, 
	   b.STREET
FROM BostonCrimeData2 b
WHERE b.SHOOTING is not NULL
	  AND b.STREET = @Street
Group By b.STREET

End

--Used for embedding in the Street dashboard
--Stored procedure that takes a street name as an input and returns
--the total crime that occured in that street by the day of week
CREATE PROCEDURE usp_DayofWeekbyStreetName
		@Street varchar(50)
as
Begin
SELECT b.DAY_OF_WEEK, 
	   Count(b.INCIDENT_NUMBER) TotalCrime
FROM BostonCrimeData2 b
WHERE b.STREET = @Street
GROUP BY b.DAY_OF_WEEK
Order By TotalCrime DESC

End

--Used for embedding in the Street dashboard
--Stored procedure that takes a street name as an input and returns
--the total crime in that street by the reported areas of the street
CREATE PROCEDURE usp_ReportingAreaCrimebyStreetName
		@Street varchar(50)
as
Begin
SELECT Count(INCIDENT_NUMBER) TotalNumberOfCrime, 
       REPORTING_AREA
FROM BostonCrimeData2
WHERE STREET = @Street
	  AND REPORTING_AREA is not NULL
Group BY REPORTING_AREA
Order BY TotalNumberOfCrime DESC

End





