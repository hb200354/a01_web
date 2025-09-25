/*
# ORACLE 정렬 (ORDER BY)
1. SELECT 문으로 조회된 데이터는 기본적으로 정해진 순서 없이 출력 될 수 있다.
이 때, ORDER BY 절을 사용하면 특정 컬럼을 기준으로 데이터를 정렬할 수 있다.
2. ORDER BY 규칙
- ORDER BY : 정렬한다고 선언
- 정렬 기준 컬럼 : 기준이 되는 컬럼
- 정렬 방식 : 오름차순(작은 -> 큰) 또는 내림차순(큰 -> 작은)
3. 핵심 키워드
- ASC(오름차순)
- DESC(내림차순)
*/

-- 직원들의 급여를 높은 순서대로 정렬
SELECT ENAME, SAL
FROM EMP
ORDER BY SAL DESC;

-- EX1) 부서번호를 기준으로 오름차순으로 사원 정보 출력
SELECT *
FROM EMP 
ORDER BY DEPNO ASC;

-- EX2) 입사일을 기준으로 내림차순으로 사원 정보 출력
SELECT *
FROM EMP 
ORDER BY HIREDATE DESC;
/*
# 다중 정렬
1. 정렬을 진행할 때, 하나의 기준으로 하는 경우도 있지만, 제 1기준으로 우선 정렬하고,
그 이후 제 1 기준이 같을 때, 제 2기준으로 정렬한다.
*/
SELECT DEPTNO, ENAME
FROM EMP 
ORDER BY DEPTNO, ENAME; -- 둘다 오름차순으로 정리

SELECT DEPTNO, ENAME
FROM EMP
ORDER BY DEPTNO DESC, ENAME DESC; -- 둘 다 내림차순으로 정리