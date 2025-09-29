SELECT * FROM EMP;
/*
# 데이터 입력
1. 만들어진 테이블에 데이터 입력하기 위해서는 INSER 구문을 이용한다.
2. 데이터 입력 방식(기본 형식)
    1) 전체 컬럼 데이터 입력
        INSERT INTO 테이블명 VALUES(데이터1, 데이터2, 데이터3)
        테이블 생성 시, 만들어진 컬럼의 순서대로 각각의 컬럼의 데이터를 입력하여 하나의 행단위로
        데이터가 입력된다.
    2) 일부 컬럼 입력
        INSERT INTO 테이블명(컬럼명1, 컬럼명2) VALUES(데이터1, 데이터2);
        하나의 행데이터를 입력하되 지정된 컬럼에 데이터를 입력하는 경우를 말한다.
*/
CREATE TABLE MEMBER01(
    ID VARCHAR2(50),
    PWD VARCHAR2(50),
    NAME VARCHAR2(50),
    POINT NUMBER,
    AUTH VARCHAR2(20)
);
SELECT * FROM MEMBER01;
INSERT INTO MEMBER01 VALUES('himan', '7777', '홍길동', 1000, '관리자');
INSERT INTO MEMBER01(ID, PWD) VALUES('higirl', '8888'); -- 이 외 컬럼은 NULL처리 됨

-- EX) PRODUCT 테이블을 만들되 SNO은 NUMBER로 물건고유번호, NAME은 물건명, PRICE 가격, CNT재고량
-- 설정하여 테이블을 만들고, 전체 컬럼 입력, 물건고유번호와 물건명만 입력하여 처리하는 방식으로 데이터를 입력
CREATE TABLE PRODUCT(
    SNO NUMBER,
    NAME VARCHAR2(100),
    PRICE NUMBER,
    CNT NUMBER
);
SELECT * FROM PRODUCT;
INSERT INTO PRODUCT VALUES (7892, '지우개', 2000, 50);
INSERT INTO PRODUCT(SNO, NAME) VALUES(7234, '연필');
/* 
# DATE 타입에 대하여 처리
1. 오라클의 DATE 타입은 날짜와 시간을 함께 저장하는 데이터 유형이다. 세기, 년, 월, 일, 시, 분, 초의 정보를 모두 포함한다.
    1) 저장 정보 : 세기, 년, 월, 일, 시, 분, 초(7바이트 고정 길이)
    2) 기본 형식 : 오라클 설정(NLS_DATE_FORMAT)에 따라 다르지만, 보통 YYYY-MM-DD 또는 RR/MM/DD형식으로 사용한다.
    3) 시간 정보 : 별도로 시간 값을 지정하지 않고 날짜만 입력하면, 시간은 00:00:00(자정)으로 자동 설정된다. 
2. 핵심 키워드
    TO_DATE : 문자열을 날짜(DATE)타입으로 변환
    TO_CHAR : 날짜(DATE)를 원하는 형식의 문자열로 변환
    SYSDATE : 현재 데이터베이스 서버의 날짜와 시간을 반환
    TRUNCT : 특정 기준(일, 월, 년 등)으로 날짜나 시간 정보를 버린다.
    ADD_MONTHS, NEXT_DAY 등 : 날짜를 계산하는 다양한 함수가 있다.
*/
CREATE TABLE MEMBER02_LOG(
    ID VARCHAR2(50),
    NAME VARCHAR2(50),
    REGDATE DATE
);
SELECT * FROM MEMBER02_LOG;
INSERT INTO MEMBER02_LOG VALUES('himan', '홍길동', TO_DATE('2025-09-26', 'YYYY-MM-DD'));
INSERT INTO MEMBER02_LOG VALUES('higirl', '홍길동', TO_DATE('2025/09/26', 'YYYY/MM/DD'));
INSERT INTO MEMBER02_LOG VALUES('goodman', '마길동', SYSDATE);

/*
# 테이블 복사 및 데이터 입력
1. ORACLE에서는 보다 간단하게 기존 테이블을 이용하여 테이블 구조를 복사해 새 테이블을 생성할 수 있다.
또한, 기존 테이블의 데이터도 복사하여 사용할 수 있다. 
2. 기본 형식
    CREATE TABLE 새 테이블 명 AS SELECT * FROM 기존 테이블명;
    * 기본 테이블의 구조(데이터 타입)와 데이터를 그대로 복사하여 새 테이블을 만드는 가장 빠른 방법이다.
    단, NOT NULL을 제외한 제약조건(기본키, 외래키 등)
*/
CREATE TABLE EMP01
AS SELECT * 
FROM EMP;

SELECT * FROM EMP01;

CREATE TABLE EMP02
AS SELECT EMPNO, ENAME, DEPTNO, SAL 
FROM EMP;

SELECT * FROM EMP02;

CREATE TABLE EMP03
AS SELECT * 
FROM EMP
WHERE 1=0; -- 1=0 FALSE, 구조만 복사하고 데이터 없는 테이블 생성

SELECT * FROM EMP03;
