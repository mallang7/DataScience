#퀴즈3
#1번
SELECT NAME, Population
FROM country
WHERE population > (
SELECT population
FROM country
WHERE NAME="Mexico"
)
ORDER BY population DESC

#2번
SELECT country.NAME#, COUNT(country.name) AS count
FROM country
JOIN city
ON country.code=city.CountryCode
GROUP BY 
LIMIT 10


SELECT city.countrycode, city.name, country.name
FROM city
JOIN country ON city.countrycode=country.code
GROUP BY countrycode

#3번


