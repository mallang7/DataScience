# 퀴즈2
# 1번
SELECT COUNT(distinct(continent)) AS count
FROM country

#2번
SELECT continent, COUNT(continent) AS count
FROM country
GROUP BY continent
ORDER BY continent desc

#3번
SELECT countrycode, sum(population) AS population
FROM city
GROUP BY countrycode
having population >=50000000
ORDER BY population DESC

#4번
SELECT LANGUAGE, COUNT(LANGUAGE)as COUNT
FROM countrylanguage
GROUP BY LANGUAGE
ORDER BY COUNT DESC, LANGUAGE ASC
LIMIT 4,6

#5번
SELECT LANGUAGE ,COUNT(LANGUAGE) as COUNT
FROM countrylanguage
GROUP BY LANGUAGE
HAVING COUNT >= 15
ORDER BY count DESC

#6번
SELECT continent,SUM(surfacearea) as surfacearea
FROM country
GROUP BY continent
ORDER BY surfacearea desc
