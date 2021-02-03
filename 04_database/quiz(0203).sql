#퀴즈1
#1
SELECT DISTINCT(Continent)
FROM country

#2
SELECT NAME, Population
FROM city
WHERE CountryCode = "KOR" AND Population >=1000000
ORDER BY Population DESC

#3
SELECT NAME, CountryCode, Population
FROM city
WHERE Population BETWEEN 8000000 AND 10000000
ORDER BY Population DESC

#4
SELECT CODE, CONCAT(NAME,"(",IndepYear,")") AS "Nameindep",Continent,Population
FROM country
WHERE IndepYear BETWEEN 1940 AND 1959
ORDER BY IndepYear,Population DESC

#5
SELECT CountryCode, LANGUAGE, Percentage
FROM countrylanguage
WHERE LANGUAGE IN("Spanish","English","Korean") AND Percentage >= 95
ORDER BY Percentage DESC

#6
SELECT Code,NAME,Continent,GovernmentForm,Population
FROM country
WHERE Code LIKE"A%" AND GovernmentForm LIKE "%Republic%"