/*
# WHERE 조건문
1. SQL의 SELECT가 데이터 테이블에서 원하는 정보를 열단위로 쏙쏙 뽑아내는 기술이였다면, 
WHERE는 행단위로 데이터를 필터링 하는 기술이다. (조건에 해당하는 값을 찾는 것)
2. 비교 연산식 형식: WHERE 컬럼명 = '값'
*/

-- 먼저 전체 테이블 지정하면 COLUMN입력할 때 편리함
SELECT * FROM EMP;

-- EX) EMP 테이블에서 ENAME이 'SMITH'인 사원의 사원명과 직책을 출력하세요
SELECT ENAME, JOB
FROM EMP
WHERE ENAME = 'SMITH';

/* 
# 핵심키워드 암기
1. 프로그래밍에서는 등호(=)를 두 번 쓰지만, SQL에서는 한 번만 사용한다.
2. !=, >, <, >=, <=, <> : 같지 않다, 크다, 작다, 크거나 같다, 작거나 같다
3. AND, OR, NOT ; 조건이 2개 이상일 때 사용하는 키워드
   AND : 그리고 (모든 조건이 참일 때)
   OR  : 또는 (조건 중에 하나만 참이어도 됨)
   NOT : ~가 아닌 (조건을 부정할 때)
*/
-- 직업이 MANAGER이면서 (AND) 월급(SAL)이 2500이상인 사람 찾기
SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB = 'MANAGER' AND SAL >= 2500;

-- 직업이 CLERK인 사원정보 전체(*)를 출력
SELECT *
FROM EMP
WHERE JOB = 'CLERK';

-- 사원번호 7499의 사원명, 급여를 출력
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE EMPNO = 7499;
