# group by
SELECT CountryCode, COUNT(CountryCode) AS count,
AVG(Population) AS avg_population
FROM city
WHERE population >= 5000000
GROUP BY countrycode
HAVING avg_population >= 8000000

# 소수점 올림,반올림,버림 함수
SELECT ceil(12.345)
SELECT round(12.345,2)
SELECT truncate(12.345,2)

#
SELECT CODE, CEIL((gnp/population)*1000)
FROM country

#조건문
#IF : IF(조건, 참, 거짓)
# 도시인구 100만이상 bigcity, 미만 small city
# column: city_scale
SELECT NAME,population,
if(population>=1000000,"big city","small city")
AS city_scale
FROM city

#IFNULL : IFNULL(참,거짓)
# country에서 indepyear 없으면 0
SELECT name,IFNULL(indepyear,0) AS indepyear
FROM country

#CASE :
# CASE 
#	WHEN (조건1) THEN (출력1)
#	WHEN (조건2) THEN (출력2)
# END AS (컬럼명)

#나라별 10억이상,1억이상,1억 이하 조건 출력
SELECT NAME,population,
CASE
	WHEN population > 1000000000 THEN "upper 1bilion"
	WHEN population > 100000000 THEN "upper 100milion"
	ELSE "below 100 milion"
END AS result
FROM country

#DATE_FORMAT : 날짜 데이터의 포맷을 변경해주는 함수
#sakila
USE sakila
#payment 에서 월별 총 매출 출력
SELECT date_format(payment_date,"%Y-%m") AS monthly,sum(amount)
FROM payment
GROUP BY monthly
#시간별
SELECT date_format(payment_date,"%H") AS hourly,COUNT(amount),sum(amount)
FROM payment
GROUP BY hourly

#JOIN : merge()
#JOIN
CREATE TABLE USER(
	user_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(30) DEFAULT NULL,
	PRIMARY KEY(user_id)
)ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE addr (
 id int(11) unsigned NOT NULL AUTO_INCREMENT,
 addr varchar(30) DEFAULT NULL,
user_id int(11) DEFAULT NULL,
 PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT INTO USER(name)
VALUES ("jin"),
("po"),
("alice"),
("petter");

INSERT INTO addr(addr, user_id)
VALUES ("seoul", 1),
("pusan", 2),
("deajeon", 3),
("deagu", 5),
("seoul", 6);