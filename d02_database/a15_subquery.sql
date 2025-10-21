/*
# 오라클 서브쿼리(subquery)
1. 쿼리 속의 또 다른 쿼리/비밀요원
2. 서브쿼리는 하나의 sql 쿼리 안에 포함된 또 다른 SELECT 권리입니다.
	마치, 영화 인셉션 처럼, 쿼리 안에 또 다른 쿼리가 있는 구조입니다.
	이 내부 쿼리는 마치 비밀요원처럼 먼저 실행되어, 외부의 메인 쿼리가 임무를 완수하는 데 필요한
	결정적인 정보(값, 목록 등)를 찾아 주는 역할을 합니다.
3. 핵심 키워드
	1) 메인 쿼리(main query) 서브쿼리를 포함하는 바깥쪽의 전체 쿼리입니다.
	2) 서브 쿼리(subquery) 메인 쿼리 내부에 있는 안쪽의 쿼리입니다.
	3) 괄호( () ) 서브쿼리는 반드시 괄호로 감싸야 합니다. 이 괄호가 비밀 요원의 신분증입니다.
	4) 실행 순서 : 일반적으로 서브쿼리가 먼저 실행되고, 그 결과를 메인 쿼리가 이어받아 사용합니다.
	5) 위치 : SELECT FROM WHERE HAVING 절 등 다양한 곳에서 활약할 수 있습니다.
	5) 반환 값
		단일행 서브쿼리 (Single-row Subquery) : 하나의 값만 반환합니다.(=, >, < 연산자와 사용)
		다중행 서브쿼리 (Multi-row Subquery) : 여러 개의 행을 반환합니다. (in, any, all 연산자와사용)
	# 서버쿼리는 괄호 안의 비밀 요원으로 메인 미션 전에 괄호() 속 비밀 요원이 먼저 정보를 캐온다.
 * */
-- 사원 중에서 가장 급여를 많은 사원 정보를 출력하세요.
-- 1. 최고 급여 
SELECT MAX(SAL) FROM EMP;
-- 2. 최고 급여에 해당하는 사원 검색
SELECT * 
FROM emp
WHERE sal = 5000;
-- 3. subquery와 mainquery를 한번에 처리..
SELECT *
FROM EMP 
WHERE SAL = ( SELECT MAX(SAL) FROM EMP );
-- ex1) 급여가 가장 작은 사원을 출력하세요.
SELECT min(sal) FROM emp;
SELECT * FROM emp WHERE sal = 800;
SELECT * FROM emp WHERE sal = (SELECT min(sal) FROM emp);


-- ex2) 평균 급여를 초과하는 사원들을 출력하세요.
SELECT avg(sal) FROM emp;
SELECT * FROM emp WHERE sal > 2073;
SELECT * FROM emp WHERE sal > (SELECT avg(sal) FROM emp);
-- ex3) 최초(min(hiredate))로 입사한 사원을 출력하세요.. 
SELECT min(hiredate) FROM emp;
SELECT * FROM emp WHERE hiredate = (SELECT min(hiredate) FROM emp);





