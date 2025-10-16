/*
# 데이터베이스 테이블 조인
1. 데이터베이스에서는 정보를 효율적으로 관리하기 위해 여러 테이블에 나눠서 저장한다.
2. 기본 형식
    SELECT 테이블1별칭.컬럼명, 테이블2별칭.컬럼명...
    FROM 테이블1명칭 테이블1별칭 JOIN 테이블2명칭 테이블2별칭
    ON 테이블1별칭.공통컬럼 = 테이블2별칭.공통컬럼
    WHERE 조건...
*/
SELECT E.*, D.*
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT E.*, DNAME, LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-- 공통되는 컬럼은 반드시 어떤 테이블의 컬럼인지 명시, 그 외는 컬럼명으로 구분된다.
-- 테이블의 별칭으로 선언하지 않아도 된다.
SELECT ENAME, DNAME, LOC, SAL -- 공통되지 않는 테이블의 컬럼명을 명시 안해도 된다
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D. DEPTNO; -- 두 테이블의 공통 컬럼은 반드시 테이블명을 명시해야 한다.

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
-- CUST_ID 공통 컬럼
-- 누가 어떤 물건을 구매했을 지 위 형식으로 JOIN해서 출력
SELECT NAME, ITEM
FROM CUSTOMERS C JOIN ORDERS O
ON C.CUST_ID = O.CUST_ID;

