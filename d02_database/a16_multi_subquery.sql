/*
# 오라클 서브쿼리(다중 행 / 다중 열)
1. 서브쿼리는 쿼리속의 쿼리이다.
2. 여러 줄(multi-row)나 여러 열(multi-column)을 다룬다
3. 서브쿼리의 결과가 한 줄 이상(여러 줄)일 때, 메인 쿼리 = 같은 단일 비교 연산자를 쓸 수 없다.
*/
SELECT * 
FROM EMP
WHERE DEPTNO IN (
    SELECT DEPTNO
    FROM DEPT
    WHERE DNAME IN ('SALES', 'RESEARCH')
);
SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;
-- DEPARTMENTS에서 부서위치가 서울인 사원들을 출력하세요
SELECT DEPT_ID
FRPM DEPARTMENTS
WHERE LOCATION = '서울';
-- 10, 40, 80
SELECT * FROM EMPLOYEES
WHERE DEPT_ID IN (10,40,80);

SELECT * FROM EMPLOYEES
WHERE DEPT_ID IN (
    SELECT DEPT_ID
    FROM DEPARTMENTS
    WHERE LOCATION = '서울'
);

/*
# 다중 열 처리 예제
1. 다른 부에 SMITH와 직무/급여과 같은 사람 찾기
- 임무 : SMITH와 직무, 부서가 같은데 해당 직무와 부서는 다른 사람을 찾자
- SUBQUERY : SMITH의 JOB, SAL 콤비 정보 가져옴
- MAIN : EMP 테이블에 JOB, SAL이 가져온 명단(IN)에 있으면, ENAME이 SMITH가 아니고
DEPTNO가 SMITH와 다른 사람을 찾는다.
*/
SELECT JOB, DEPTNO 
FROM EMP
WHERE ENAME = 'SMITH';

SELECT ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE JOB = 'CLERK'
AND DEPTNO = 20;

SELECT ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE (JOB, DEPTNO) = (
    SELECT JOB, DEPTNO
    FROM EMP
    WHERE ENAME = 'SMITH')
AND ENAME !='SMITH';  -- SMITH와 직무, 부서가 같은데 다른 사람

-- EX) ENAME이 WARD의 부서번호와 JOB이 같은 사원 정보 출력 *단, WARD는 제외

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE (JOB, DEPTNO) = (
    SELECT JOB, DEPTNO
    FROM EMP
    WHERE ENAME = 'WARD'
) AND ENAME ! = 'WARD';

/*
# 다중행열 SUBQUERY
1. 다중 열 서브쿼리는 WHERE 절에서 두 개 이상의 컬럼을 동시에 비교해야 할 때 유용함.
주로 (컬럼1, 컬럼2) IN (서브 쿼리)와 같은 형태로 작성됨.
2. 특정 사원과 동일한 부서 및 직책을 가진 사원 찾기
    1) 먼저 서브쿼리를 토앻 부서별로 급여가 가장 많은 정보를 가져옴
        SELECT DEPTNO, MAX(SAL)
        FROM EMP
        GROUP BY DEPTNO;
    2) 이 부서와 최대 급여가 같은 사원정보를 MAIN()에서 가져옴.
        SELECT ENAME, DEPTNO, SAL
        FROM EMP
        WHERE (DEPTNO, SAL) IN (다중의 행열의 결과 QUERY); 
*/
SELECT DEPTNO, MAX(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO, SAL, ENAME
FROM EMP
WHERE (DEPTNO, SAL) IN(
    SELECT DEPTNO, MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO
) ORDER BY DEPTNO, SAL;

-- EX) 직책별(JOB), 가장 최근에 입사한 사원(MAX(HIREDATE))의 정보 출력
SELECT JOB, HIREDATE, ENAME
FROM EMP
WHERE (JOB, HIREDATE) IN (
    SELECT JOB, MAX(HIREDATE)
    FROM EMP
    GROUP BY JOB
) ORDER BY JOB;

SELECT TO_CHAR(HIREDATE, 'Q') || '/4분기' "입사분기", HIREDATE, ENAME 
FROM EMP;

-- EX) 입사 분기별 최저 급여자를 출력
-- 1. 입사 분기별, 최저 급여(TO_CHAR(HIREDATE, 'Q'), MIN(SAL))
-- 2. 메인쿼리 WHERE 조건 (TO_CHAR(HIREDATE, 'Q'), SAL) IN (서브 쿼리)
SELECT TO_CHAR(HIREDATE, 'Q') || '/4분기' "분기", SAL, ENAME
FROM EMP
WHERE (TO_CHAR(HIREDATE,'Q'), SAL) IN (
    SELECT TO_CHAR(HIREDATE, 'Q'), MIN(SAL)
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'Q')
) ORDER BY "분기";
