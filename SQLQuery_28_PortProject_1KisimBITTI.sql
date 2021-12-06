Select * 
from DAILY_CASE_INFO_PUBLIC
-- check for Columns

Select * 
from DAILY_CASE_INFO_PUBLIC
where TOTAL_CASES between 1 and 100
order by TOTAL_CASES
--------------------------------------

Select d.DATE,d.NEW_CASES,d.NEG_TESTS,d.POS_TESTS,d.NEW_DEATHS
from DAILY_CASE_INFO_PUBLIC as d
order by d.DATE
---------------------------------------


--Total Deaths vs Total Cases percentage of total deaths
Select d.DATE,d.TOTAL_CASES,d.TOTAL_DEATHS,(d.TOTAL_DEATHS /  d.TOTAL_CASES)*100
as DeathPercentage from DAILY_CASE_INFO_PUBLIC as d
where d.TOTAL_CASES > 1
order by d.DATE


--Positive_Tests vs Total_Tests
Select d.DATE,d.NEG_TESTS,d.POS_TESTS,d.TOTAL_TESTS,(d.POS_TESTS/d.TOTAL_TESTS) * 100
as PositivePercentage
from DAILY_CASE_INFO_PUBLIC as d
where d.POS_TESTS > 1
order by d.DATE


--Total_Tests vs Total_Deaths yani bu kadar test yaptiranlardan bu kadari oluyor
Select d.DATE,MAX(d.TOTAL_Tests) as HighestTotalTests,MAX(d.TOTAL_DEATHS / D.TOTAL_TESTS) * 100 
as DeathPercentageForTotalTests 
from DAILY_CASE_INFO_PUBLIC as d
group by d.DATE
order by d.DATE


--Gun gun toplam olumleri ve toplam vakalar? getirip birbirine oranlay?p toplam olum oran?n? bulduk
Select d.DATE,SUM(d.TOTAL_CASES) as SumOfTotalCases ,SUM(d.TOTAL_DEATHS) as SumOfTotalDeaths, 
SUM(d.TOTAL_DEATHS) / SUM(d.TOTAL_CASES) * 100 as DeathPercentage
from DAILY_CASE_INFO_PUBLIC as d 
where d.TOTAL_CASES > 0
group by d.DATE
order by d.DATE

--
Select c.Date,c.Location,c.Population,c.TOTAL_VACCINATIONS
from Covid_Vaccinations as c
where c.Population between 100 and 10000
order by c.Date


---Combining 2 tables relative to what happened on the same date and how much of it was recovered from the same date
Select d.DATE,d.TOTAL_CASES,d.NEW_INACTIVE_RECOVERED,c.Date,c.Location
from DAILY_CASE_INFO_PUBLIC as d 
inner join
Covid_Vaccinations as c
on 
d.DATE = c.Date
order by c.Date

---------------------------------------------------------------
Create Table Cem
(
Population int,
Location nvarchar(255),
date date,
TotalCases int
)


