--Used for embedding in the offense code group dahsboard
--Stored procedure that takes an Offense Code as an input and returns
--the total Crime in each district by the offense code
CREATE PROCEDURE usp_DistrictCrimebyOffenseGroup
		@OffenseCodeGroup varchar(50)
as
Begin
SELECT Count(b.INCIDENT_NUMBER) TotalNumberOfCrime, 
       b.DISTRICT
FROM BostonCrimeData2 b
WHERE b.DISTRICT is not Null 
	  AND b.OFFENSE_CODE_GROUP = @OffenseCodeGroup
Group BY b.DISTRICT
Order BY TotalNumberOfCrime DESC

End

--Used for embedding in the offense code group dahsboard
--Stored procedure that takes an offense code group as an input and returns
--the Total crime by offense code that occured in each day of week
CREATE PROCEDURE usp_DayofWeekbyOffenseGroup
		@OffenseCodeGroup varchar(50)
as
Begin
SELECT b.DAY_OF_WEEK, 
	   Count(b.INCIDENT_NUMBER) TotalCrime
FROM BostonCrimeData2 b
WHERE b.DISTRICT is not NULL
	  AND b.OFFENSE_CODE_GROUP = @OffenseCodeGroup
GROUP BY b.DAY_OF_WEEK
Order By TotalCrime DESC

End
--Used for embedding in the offense code group dahsboard
--Stored procedure that takes an offense code as an input and returns 
--the total crime by month based on the offense code group
CREATE PROCEDURE usp_MonthbyOffenseCodeGroup
		@OffenseCodeGroup varchar(50)
as
Begin
SELECT Count(b.INCIDENT_NUMBER) TotalCrime,
	   MONTH(b.OCCURRED_ON_DATE) MONTH
FROM BostonCrimeData2 b
WHERE b.OFFENSE_CODE_GROUP = @OffenseCodeGroup
GROUP BY MONTH(b.OCCURRED_ON_DATE)
ORDER BY MONTH(b.OCCURRED_ON_DATE)

End
--Used for embedding in the offense code group dahsboard
--Stored procedure that takes and offense code group as an input and returns
--the total crime by offense code in each street 
CREATE PROCEDURE usp_StreetbyOffenseCodeGroup
		@OffenseCodeGroup varchar(50)
as
Begin
SELECT TOP 15 b.STREET, 
	   Count(b.INCIDENT_NUMBER) TotalCrime
FROM BostonCrimeData2 b
WHERE b.STREET is not null 
	and b.OFFENSE_CODE_GROUP = @OffenseCodeGroup
GROUP BY b.STREET
Order By TotalCrime DESC

End