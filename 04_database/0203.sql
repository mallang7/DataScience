# 1-1. 데이터 베이스
SHOW DATABASES; # 현재 데이터 베이스확인

# 생성
CREATE DATABASE test;

# 선택
USE test;

#현재 확인
SELECT DATABASE();

#2. Table
CREATE TABLE USER1(
	user_id INT,
	name VARCHAR(20),
	email VARCHAR(30),
	age INT(3),
	rdate DATE
)

CREATE TABLE USER2(
	user_id INTUSER1USER1 PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	email VARCHAR(30) UNIQUE NOT NULL,
	age INT(3) DEFAULT '30',
	rdate TIMESTAMP
)

# 2. 수정 Alter
#2-1 데이터 베이스 수정
SHOW VARIABLES LIKE "character_set_database"
ALTER DATABASE test CHARACTER SET = UTF8

#2-2 테이블 수정
ALTER TABLE USER2 ADD tmp TEXT
ALTER TABLE USER2 MODIFY COLUMN tmp INT(3)
ALTER TABLE USER2 DROP tmp

#3. Drop
CREATE DATABASE tmp
DROP DATABASE tmp
SHOW DATABASES

# 테이블 삭제
#DROP TABLE user3

#4. Insert
INSERT INTO USER1(user_id,name,email,age,rdate)
VALUE(2,"jin","jin@gmail.com",32,NOW()),
(3,"peter","peter@gmail.com",33,NOW()),
(4,"po","po@gmail.com",23,NOW()),
(5,"andy","andy@gmail.com",43,NOW()),
(6,"jin","jin@gmail.com",17,NOW())

# 5. SELECT : 데이터 조회
SELECT user_id,name,age
FROM USER1

SELECT *
FROM USER1

SELECT user_id AS "ID", name AS "UserName",age AS "AGES"
FROM USER1

#DISTINCT 중복제거
SELECT DISTINCT(name)
FROM USER1

# WHERE 조건검색
SELECT COUNT(DISTINCT(name))
FROM USER1
WHERE age >=30

SELECT *
FROM USER1
WHERE age >= 20 AND age<40

#BETWEEN A AND B (A, B 포함)
SELECT *
FROM USER1
WHERE age BETWEEN 20 AND 40

#ORDER BY 정렬
SELECT *
FROM USER1
ORDER BY age DESC

SELECT *
FROM USER1
ORDER BY name, age DESC

#나이가 20세에서 40세사이에 있는 사용자
#이름순으로 내림차순정렬하고 중복데이터를 제거해서 출력
SELECT DISTINCT(name)
FROM USER1
WHERE age BETWEEN 20 AND 39
ORDER BY NAME DESC

#CONCAT(데이터합치기)
SELECT name,age,CONCAT(NAME,"(",age,")") AS "name_age"
FROM USER1

#LIKE : WHERE절에서 특정 문자열이 들어간 데이터 조회
SELECT *
FROM USER1
WHERE email not LIKE "%@gmail.%"

# in : 여러개의 조건을 조회할 때 사용
SELECT *
FROM USER1
WHERE name IN ("andy", "peter", "po")


SELECT *
FROM USER1
WHERE name IN (
	SELECT DISTINCT(NAME)
	FROM USER1
	WHERE age >30
)

#lIMIT
SELECT *
FROM USER1
LIMIT 3

#3번쨰부터 아래로 5개
SELECT *
FROM USER1
LIMIT 3,5

# 6. UPDATE
UPDATE USER1
SET age=20, rdate="2021-02-02"
WHERE age BETWEEN 20 AND 29

SELECT *
FROM USER1
WHERE age BETWEEN 20 AND 29

# 7. DELETE
DELETE FROM USER1
WHERE rdate <= "2021-02-02"

SELECT *
FROM USER1

#Group by
#city 테이블에서 나라별 도시의 갯수를 출력
SELECT CountryCode,COUNT(CountryCode) AS count 
FROM city
GROUP BY CountryCode

#Countrylanguage 테이브레서 전체 언어의 갯수출력
SELECT count(DISTINCT(LANGUAGE))
FROM countrylanguage

#대륙별 인구수와 GNP의 최대값 출력
SELECT continent,max(population),max(GNP),
SUM(GNP)/SUM(Population)
FROM country
GROUP BY continent

#대륙별 전체인구를 구하고 5억이상인 대륙만 출력
#Having : group by가 실행되고 난 결과에 조건을 추가(순서)
SELECT continent,sum(population)
FROM country
GROUP BY continent
HAVING SUM(population)>=500000000