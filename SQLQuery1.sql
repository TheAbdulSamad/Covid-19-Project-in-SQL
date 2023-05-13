
/*	
	these column on whcih we will work
	there is lot of data on it there is lot of things thaht can be extracted
	
	location, date, total_casses, new_casses, total_deaths, population

*/

-- 1) Total Cases vs Total Deaths(death percentage)

select location, date, total_cases, total_deaths,
(cast(total_deaths as decimal)/cast(total_cases as decimal)* 100) deathPercent
from covidTable
where continent is not null
order by 1,2


-- 2) percentage of infected population as per date

/*
	total_cases on population percentage

*/


select location, date,population, total_cases,
(cast(total_cases as decimal)/cast(population as decimal) * 100) as InfectedPercentage
from covidTable
where continent is not null
order by 1,2


--  Countries with Highest Infection Rate compared to Population till 2023


select location,  MAX((cast(total_cases as decimal)/cast(population as decimal) * 100))
from CovidData..covidTable
where continent is not null
group by location
order by location


-- 3) Countries with Highest Death Count per Populatio

select location, max(cast(total_deaths as int)) total_Deaths
from covidTable
where continent is not null
group by location
order by location


	-- Showing contintents with the highest death count per population


--4) breaking in continent

select continent, max(cast(total_deaths as int))
from covidTable
where continent is not null
group by continent



-- 5) GLOBAL NUMBERS of total till april 2023

select   sum(cast(new_cases as int)) totalCases,sum(cast(new_deaths as int)) totalDeaths,
SUM(cast(new_deaths as decimal))/SUM(New_Cases)*100 as DeathPercentage
from covidTable
where continent is not null
--group by date
order by 1


Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From covidTable
where continent is not null 
--Group By date
order by 1,2



--   6)  Total Population vs Vaccinations




