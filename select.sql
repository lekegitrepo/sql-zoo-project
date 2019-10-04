#query displays Nobel prizes for 1950.
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

#query show who won the 1962 prize for Literature.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

#query show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject FROM nobel
WHERE winner = 'Albert Einstein';

#query give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner FROM nobel
WHERE subject = 'Peace' AND yr >= 2000;

#query show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT * FROM nobel
WHERE subject = 'Literature' 
AND yr BETWEEN 1980 AND 1989;