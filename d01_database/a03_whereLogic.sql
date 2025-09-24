SELECT * FROM EMP;
/*
# 논리 연산자 : 조건을 섞어 더 강력한 필터 만들기
1. 논리 연산자는 두 개 이상의 조건을 결합하거나, 특정 조건을 부정하여 참(TRUE) 또는 거짓(FALSE)을 판단한다.
가장 대표적인 연산자는 AND, OR, NOT 이다.
2. 기본 형식:
    조건 1 AND 조건 2: 여러 조건이 모두 참일 때만 전체 조건이 참이 된다.
    조건 1 OR 조건 2: 여러 조건 중 하나만 참이어도 전체 조건이 참이 된다.
    NOT 조건: 여러 조건이 참이면 거짓, 거짓이면 참이 된다.
*/
SELECT ENAME, SAL 
FROM EMP
WHERE SAL >= 2000 AND SAL <= 3000;

-- 부서 번호 (DEPTNO)가 30이고, 급여가 2000 이상인 사원의 이름, 급여, 부서번호 출력
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30 AND SAL >= 2000;

-- EX1) 급여가 1500이상 2500이하인 사원정보를 출력
SELECT *
FROM EMP
WHERE SAL >= 1500 AND SAL <= 2500;
-- EX2) 직책이 SALESMAN이고 부서번호가 30인 사원명, 직책명,부서번호를 출력
SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB = 'SALESMAN' AND DEPTNO = 30;

-- 사원번호가 7369이거나 사원명이 ALLEN인 것을 출력
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE EMPNO = 7369 OR ENAME = 'ALLEN';
-- 급여(SAL) 1000미만이거나 3000이상인 사원정보를 가져온다
SELECT *
FROM EMP
WHERE SAL < 1000 OR SAL >= 3000;