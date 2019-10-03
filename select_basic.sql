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
