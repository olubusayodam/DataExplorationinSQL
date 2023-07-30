SELECT *
FROM PortfolioProject..CovidDeaths
order by 3,4

SELECT *
FROM PortfolioProject..CovidVaccinations
order by 3,4

--Select Data that we are going to be using

Select Location, date, total_cases, new_cases, total_deaths,population
From PortfolioProject..CovidDeaths
order by 1,2

--looking at totalCases vs totalDeaths
--shows likelihood of dying if you contracted covid in your country
Select Location, date, total_cases, total_deaths,(total_deaths/total_cases)*100 As DeathPercentage
From PortfolioProject..CovidDeaths
Where location like '%states%'
order by 1,2

--Looking at Total cases vs Population
--shows what percentage of population got covid
Select Location, date,Population, total_cases,(total_cases/population)*100 As InfectedPopulationPercent
From PortfolioProject..CovidDeaths
Where location like '%states%'
order by 1,2

--looking at countries with highest infection rate compared to Population
Select Location,Population, MAX(total_cases) as HighestInfectionCount,MAX((total_cases/population))*100 As InfectedcasesPercentage
From PortfolioProject..CovidDeaths
--Where location like '%states%'
GROUP BY Location,Population
order by InfectedcasesPercentage DESC


--showing countries with highest death count per population
Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%states%'
where continent is not null
GROUP BY Location
order by TotalDeathCount DESC


--showing continent with highest death count per population
Select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%states%'
where continent is not null
GROUP BY continent
order by TotalDeathCount DESC


--showing continents with the highest death count per population
Select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%states%'
where continent is not null
GROUP BY continent
order by TotalDeathCount DESC

--
Select  SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths,SUM(cast(new_deaths as int))/Sum(new_cases)*100 As DeathPercentage
From PortfolioProject..CovidDeaths
--Where location like '%states%'
where continent is not null
--GROUP BY date
order by 1,2

--looking at the average number of new cases and new deaths per day for each country:
SELECT 
    Location,
    AVG(CAST(New_Cases AS INT)) AS Avg_New_Cases_Per_Day,
    AVG(CAST(New_Deaths AS INT)) AS Avg_New_Deaths_Per_Day
FROM PortfolioProject..CovidDeaths
WHERE Continent IS NOT NULL 
GROUP BY Location
ORDER BY Location;


--Analyzing the correlation between the total number of cases and the total number of vaccinations for different countries:
SELECT 
    death.Location,
    death.Date,
    death.Total_Cases,
    vac.Total_Vaccinations
FROM PortfolioProject..CovidDeaths death
INNER JOIN PortfolioProject..CovidVaccinations vac
    ON death.Location = vac.Location
    AND death.Date = vac.Date
WHERE death.Continent IS NOT NULL -- Optionally, you can specify conditions if needed
ORDER BY death.Location, death.Date;


--Looking at Total Population vs Vaccinations

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
       SUM(Convert(int,vac.new_vaccinations)) OVER(PARTITION BY dea.location ORDER BY dea.location,dea.date) AS RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
INNER JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3;

--USE CTE

with PopVsVac (Continent, Location,Date,Population,New_Vaccinations,RollingPeopleVaccinated)
as
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
       SUM(Convert(int,vac.new_vaccinations)) OVER(PARTITION BY dea.location ORDER BY dea.location,dea.date) AS RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
INNER JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
--ORDER BY 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopVsVac

--TEMP TABLE

DROP Table if exists #PercentPopulationVaccinated

Create Table  #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
       SUM(Convert(int,vac.new_vaccinations)) OVER(PARTITION BY dea.location ORDER BY dea.location,dea.date) AS RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
INNER JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
--ORDER BY 2,3;

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated

--Creating view to store data for later visualizations

Create view PercentPopulationVaccine  as
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
       SUM(Convert(int,vac.new_vaccinations)) OVER(PARTITION BY dea.location ORDER BY dea.location,dea.date) AS RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths dea
INNER JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
--ORDER BY 2,3;

--
CREATE VIEW PercentPopulationVaccine AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
       SUM(CONVERT(int, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated,
       (SUM(CONVERT(int, vac.new_vaccinations)) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) / CAST(dea.population AS float)) * 100 AS PercentPopulationVaccinated
FROM PortfolioProject..CovidDeaths dea
INNER JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL;






