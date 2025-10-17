/*
# 오라클 self joinㄴ
1. 자기 자신과 조인하는 것을 의미한다. 테이블 하나를 두 개의 테이블인 것처럼 사용하여,
테이블 내의 행들을 서로 비교하고 싶을 때 사용함.
2. 핵심 키워드
    - 하나의 테이블 : 조인에 사용되는 테이블은 단 하나
    - 별칭(ALIAS) : 같은 테이블을 두 번 사용하기에, 각 테이블에 별칭을 부여해야 함.
    - 계층 구조(HIERARCHIACAL STRUCTURE) : 테이블 내에 계층적인 관계가 있을 때 유용함.
    - ON 절 : 조인 조건을 설정함. 하위테이블.컬럼명 = 상위테이블.컬럼명
    
*/
SELECT * FROM EMP;
SELECT EMPNO, ENAME FROM EMP;

SELECT E.MGR, M.ENAME 
FROM EMP E INNER JOIN EMP M
ON E.MGR = M.EMPNO; 

SELECT EMPNO, ENAME, MGR FROM EMP;
SELECT DISTINCT E.MGR "관리자 사원 번호", M.ENAME "관리자 이름" -- DISTINCT 중복 제거
FROM EMP E INNER JOIN EMP M
ON E.MGR = M.EMPNO;

-- 모든 직원의 이름과 상사 이름 찾기 
SELECT EMPNO, ENAME, MGR FROM EMP; -- 사원테이블
SELECT EMPNO 사원번호, ENAME 사원명, M.MGR 관리자번호, E.ENAME 관리명
FROM EMP E INNER JOIN EMP M
ON E.MGR = M.MEMPNO;

SELECT * FROM DUNDER_MIFFLIN;