#query list each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

#query show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name FROM world
WHERE GDP/population >
(SELECT GDP/population FROM world
  WHERE name = 'United Kingdom') AND continent = 'Europe';

#query list the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent FROM world
WHERE continent = (SELECT continent FROM world
  WHERE name = 'Argentina') OR continent = (SELECT continent FROM world
  WHERE name = 'Australia')
ORDER BY name;

#query which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population FROM world
WHERE population > (SELECT population FROM world
  WHERE name = 'Canada') AND population < (SELECT population FROM world
  WHERE name = 'Poland');

#query shows the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
SELECT name, CONCAT(
  ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100, 0),'%') 
AS percent FROM world WHERE continent = 'Europe';

#query which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name FROM world
WHERE GDP > ALL(SELECT MAX(GDP) FROM world WHERE continent = 'Europe');

#example query
SELECT continent, name, population FROM world x
  WHERE population >= ALL
    (SELECT population FROM world y
        WHERE y.continent=x.continent
          AND population>0);
#query find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

#query list each continent and the name of the country that comes first alphabetically.
SELECT continent, name FROM world x
  WHERE name =
    (SELECT name FROM world y
        WHERE y.continent=x.continent
          ORDER BY name LIMIT 1);

#query find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population FROM world
 WHERE continent NOT IN
  (SELECT DISTINCT continent FROM world WHERE population > 25000000);

#query some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent FROM world x
 WHERE population > 
 ALL (SELECT population * 3 FROM world y
      WHERE x.continent = y.continent AND x.name != y.name);


