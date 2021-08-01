select * from Covid_Deaths_Vaccinations..CovidDeaths
order by 3,4

--select * from Covid_Deaths_Vaccinations..CovidVaccinations
--order by 3,4

select Location,date,total_cases, new_cases, total_deaths, population
from Covid_Deaths_Vaccinations..CovidDeaths
order by 1,2


--Total case Vs. Total deaths

select Location,date,total_cases,  total_deaths, (total_cases/total_deaths)*100 as Death_Percentage
from Covid_Deaths_Vaccinations..CovidDeaths
order by 1,2

select Location,date,total_cases,  total_deaths, (total_cases/total_deaths)*100 as Death_Percentage
from Covid_Deaths_Vaccinations..CovidDeaths
Where location = 'Ethiopia'
        
		 -- Total cases vs Populations

		 select Location,date, population ,total_cases ,(total_cases/population)*100 as CovidCase_Percentage
         from Covid_Deaths_Vaccinations..CovidDeaths
         Where location = 'Ethiopia'

--Countries with highest infection
		  select Location, population ,Max(total_cases) as HighestInfection,max(total_cases/population)*100 as  PercentPopultatedInfected
         from Covid_Deaths_Vaccinations..CovidDeaths
		 group by location, population
       order by PercentPopultatedInfected

-- Countries with highest Death count per population
 select Location ,Max(cast(Total_deaths as int)) as totaldeathCount
       from Covid_Deaths_Vaccinations..CovidDeaths
		where continent is not null
		 group by location
		  order by totaldeathCount desc 

--Continent Data
       select continent ,Max(cast(Total_deaths as int)) as totaldeathCount
         from Covid_Deaths_Vaccinations..CovidDeaths
		  where continent is not null
		   group by continent
		    order by totaldeathCount desc 

-- continent with highest death count per population

select continent ,Max(cast(Total_deaths as int)) as totaldeathCount
         from Covid_Deaths_Vaccinations..CovidDeaths
		  where continent is not null
		   group by continent
		    order by totaldeathCount desc
			
--Global Numbers

select location date,total_cases,  total_deaths, (total_deaths /total_cases)*100 as Death_Percentage
from Covid_Deaths_Vaccinations..CovidDeaths
where continent is not null
order by 1,2
