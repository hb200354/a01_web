CREATE TABLE HERO_LIST (
    ID NUMBER PRIMARY KEY,
    HERO_NAME VARCHAR2(50),
    POWER NUMBER,
    CITY VARCHAR2(50)
);

INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (1, '슈퍼맨', 9000, '메트로폴리스');
INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (2, '배트맨', 300, '고담');
INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (3, '아이언맨', 8500, '뉴욕');
INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (4, '캡틴아메리카', 7000, '뉴욕');
INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (5, '스파이더맨', 7500, '뉴욕');
INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (6, '토르', 9500, '아스가르드');
INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (7, '헐크', 9200, '데이턴');
INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (8, '원더우먼', 8800, '테미스키라');
INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (9, '플래시', 6000, '센트럴 시티');
INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (10, '블랙팬서', 7800, '와칸다');
INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (11, '닥터스트레인지', 8200, '뉴욕');
INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (12, '그린랜턴', 7700, '코스트 시티');
INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (13, '손오공', 50000, '서쪽 도시');
INSERT INTO HERO_LIST (ID, HERO_NAME, POWER, CITY) VALUES (14, '사이타마', 99999, 'Z시');

COMMIT;
SELECT * FROM HERO_LIST;
/*
# DML(Data Manipulation Language, 데이터 조작어)
1. 데이터베이스의 테이블에서 데이터를 등록, 수정하거나 삭제할 때 사용하는 SQL 명령을
DML이라고 한다.
2. 핵심 개념
    1) UPDATE : 테이블에 이미 존재하는 데이터의 내용을 다른 값으로 변경할 때 사용.
    2) DELETE : 테이블에 이미 존재하는 데이터 행(ROW)를 전체 삭제 할 때 사용
    * UPDATE/DELETE는 특정 조건을 지정해 WHERE 절과 함꼐 사용 해야한다. (빼먹을 시 테이블의 모든 데이터가 변경되거나 삭제될 수 있음)
3. 핵심 키워드
    1) INSERT, UPDATE, DELETE 구문은 정해진 형식에 따라 작성해야 한다.
    2) UPDATE :
        UPDATE 테이블명
            SET 변경할 컬럼 = 새로운 값
        WHERE 변경할 데이터 조건
        EX) 사원번호를 통해 급여 변경할 때
        UPDATE EMP
            SET SAL = 3000
        WHERE EMPNO = 7369;
    3) DELETE : 
        DELETE -- 컬럼명이 붙지 않음 (행단위로 삭제되어서)
        FROM 테이블명
        WHERE 삭제할 데이터 조건
*/
SELECT * FROM HERO_LIST WHERE HERO_NAME = '배트맨';
UPDATE HERO_LIST
    SET POWER = 5000
WHERE HERO_NAME = '배트맨';
SELECT * FROM HERO_LIST;

-- 아이언맨 도시를 뉴욕에서 LA로 변경
UPDATE HERO_LIST
    SET CITY = 'LA'
WHERE HERO_NAME = '아이언맨';
SELECT * FROM HERO_LIST;

-- * 컬럼명 = 컬럼명 + 추가데이터 : 기존에 있는 데이터를 변경해서 다시 할당
SELECT * FROM HERO_LIST WHERE HERO_NAME='플래시';
DELETE FROM HERO_LIST
WHERE HERO_NAME = '플래시';
    SELECT * FROM HERO_LIST;
    