#inner join
SELECT *
FROM addr
JOIN USER
ON addr.user_id=USER.user_id

#world도시이름,국가이름
SELECT city.countrycode, city.name, country.name
FROM city
JOIN country
ON city.countrycode=country.code

#left join
SELECT id, addr.addr,addr.user_id,IFNULL(USER.name,"-")
FROM addr
LEFT JOIN USER
ON addr.user_id=USER.user_id

#right join
SELECT addr.id, addr.addr,USER.user_id,USER.name
FROM addr
right JOIN USER
ON addr.user_id=USER.user_id

#union : select 문의 결과를 합쳐서 출력
#자동으로 중복을 제거
SELECT NAME
FROM USER
union
SELECT addr
FROM addr

#중복도 포함
SELECT NAME
FROM USER
UNION all
SELECT addr
FROM addr

#outer join : left, right를 union
SELECT USER.name, addr.addr,USER.user_id
FROM USER
LEFT JOIN addr
ON USER.user_id=addr.user_id
UNION
SELECT USER.name, addr.addr, addr.user_id
FROM USER
right JOIN addr
ON USER.user_id=addr.user_id

#Sub-query : 쿼리문안에 쿼리가 있는 문법
#select,from,where

#select 서브
#전체 나라수,전체 도시수, 전체 언어수 출력
SELECT 
(SELECT COUNT(*)
FROM country) AS total_country,
(SELECT COUNT(*)
FROM city) AS total_city,
(SELECT COUNT(DISTINCT(language))
FROM countrylanguage) AS total_language

#from 서브
# 800만 이상이 되는 도시의 국가코드,도시이름,국가이름 ,도시인구수를 출력
SELECT *
from
	(SELECT countrycode,NAME,population
	FROM city
	WHERE population >= 8000000) AS city
join
	(SELECT CODE, NAME
	FROM country) AS country
ON city.countrycode=country.code

#where 서브
#800만 이상 도시의 국가코드,국가이름,대통령이름 출력
SELECT code, NAME, country.HeadOfState
FROM country
WHERE CODE IN (SELECT distinct(countrycode)
FROM city
WHERE population >= 8000000)
