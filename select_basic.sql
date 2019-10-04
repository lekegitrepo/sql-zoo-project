#SQL queries on table called world

#query to show population of Germany from table called world
SELECT population FROM world
  WHERE name = 'Germany'

#query to show name and population of 'Sweden', 'Norway', 'Denmark' from table called world
  SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

#query to show below shows countries with an area of 200,000-250,000 sq. km. from table called world
  SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

#query to Show the name for the countries that have a population of at least 200 million from table called world
SELECT name FROM world
WHERE population >= 200000000

#query show the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, GDP/population FROM world
WHERE population >= 200000000

#query Show the name and population in millions for the countries of the continent 'South America'
SELECT name, population/1000000 FROM world
WHERE continent = 'South America';

#query Show the name and population for France, Germany, Italy
SELECT name, population FROM world
WHERE name  IN ('France', 'Germany', 'Italy');

#query Show the countries which have a name that includes the word 'United'
SELECT name FROM world
WHERE name LIKE '%united%'

#query Show the countries that are big by area or big by population.
SELECT name, population, area FROM world
WHERE area >= 3000000 OR population >= 250000000

#query Show the countries that are big by area or big by population but not both.
SELECT name, population, area FROM world
WHERE area >= 3000000 XOR population >= 250000000

#query Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'.
#For South America show population in millions and GDP in billions both to 2 decimal places.
SELECT name, ROUND(population/1000000, 2),
ROUND(GDP/1000000000, 2)
FROM world
WHERE continent = 'South America';

#quey Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
#Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name, ROUND(GDP/population, -3) FROM world
WHERE GDP >= 1000000000000;

#query Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital FROM world
WHERE LENGTH(name) = LENGTH(capital)
#example query
SELECT name, LENGTH(name), continent, LENGTH(continent), capital, LENGTH(capital)
  FROM world
 WHERE name LIKE 'G%'

 #query Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
 SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
AND name <> capital;

#query Find the country that has all the vowels and no spaces in its name.
SELECT name
FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%'
AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%'
AND name NOT LIKE '% %';
