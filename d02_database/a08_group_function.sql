/*
# 오라클 그룹 함수
1. 오라클의 그룹함수는 테이블의 전체 행 또는 특정 그룹별로 묶어서 하나의 결과를 반환하는
	아주 유용함 함수예요.
2. 여러 개의 데이터를 그룹으로 묶어 통계를 내는 계산기라고 생각하면 쉽죠.
3. 그룹 함수의 핵심을 여러 행에서 하나의 결과를 만들어 내는 것입니다. 마치 반 전체 학생들의 시험 점수를 가지고 반
	평균 하나를 계산하는 것과 같아요.
	1) 그룹화(Grouping) : 특정 컬럼(부서, 학년)을 기준으로 데이터를 작은 그룹으로 나눕니다.
	2) 집계(Aggregation) : 나눠진 그룹별로 합계, 평균, 개수 등을 계산합니다.
	3) 결과 : 각 그룹당 하나의 결과 값을 보여줍니다.
4. sql 처리시 기본 형식
	SELECT 그룹할컬럼명, 그룹함수(통계할컬럼)
	FROM 테이블명
	GROUP BY 그룹할컬럼명
	HAVING 그룹함수의 조건범위..
	- 부서별 평균급여를 출력하세요, 단 평균급여가 2000을 초과할 경우만 출력하세요
5. 핵심 키워드
	그룹으로 묶어(GROUP BY) 해빙(HAVING)에서 조건을 따져보나, 썸(SUM)타고 애인(AVG)생겨 카운트(COUNT)가 늘었네!!
	이제 맥스(MAX) 찍고 미니(MIN)멀 라이프 시작!!
	- GROUP BY : 그룹으로 묶는다!!
	- HAVING : 그룹에 대한 조건절 (WHERE은 그룹화 전 일반 조건) - 주의) 그룹함수만 조건으로 사용가능..
	- SUM : 합계(썸)
	- AVG : 평균(애인)
	- COUNT : 개수(카운트)
	- MAX : 최댓값(맥스)
	- MIN : 최솟값(미니)		
 * */
	SELECT DEPTNO, SAL
	FROM EMP
	ORDER BY DEPTNO, SAL;
	-- 부서별로 하나의 데이터로 통계화하여 처리..
	SELECT DEPTNO, AVG(SAL) "평균급여", COUNT(*) "부서별인원", MAX(SAL) "부서별 급여 최대값",
	               MIN(SAL) "부서별 급여 최소값", SUM(SAL) "부서별 급여 합계"
	FROM EMP
	GROUP BY DEPTNO
	ORDER BY DEPTNO; 
-- 주의) 그룹화할 컴럼은 하나만 일단 선정하고, 그룹함수는 여러개를 사용하여도 무방하다.
	SELECT DEPTNO, AVG(SAL) "평균급여"
	FROM EMP
	GROUP BY DEPTNO
    HAVING AVG(SAL)>2000; 
SELECT * FROM EMP;

-- 직책별(JOB)로 최대급여와 최소급여, 사원수를 출력하세요..  -- COUNT(SAL) 혹시, SAL이 NULL경우에는 카운트되지 않는다.
SELECT JOB, MAX(SAL) "직책별최대급여", MIN(SAL) "직책별최소급여", COUNT(*) "사원수"
FROM EMP
GROUP BY JOB
ORDER BY JOB;
SELECT * FROM EMP ORDER BY DEPTNO;
SELECT TO_CHAR(HIREDATE,'YYYY') 연도, e.*
FROM emp e
ORDER BY TO_CHAR(HIREDATE,'YYYY');
-- 연도별 사원수와, 최대 급여
SELECT TO_CHAR(HIREDATE,'YYYY') 연도, count(*) "연도별사원수", max(sal) "연도별 최대급여"
FROM emp e
GROUP BY TO_CHAR(HIREDATE,'YYYY')
ORDER BY TO_CHAR(HIREDATE,'YYYY');

SELECT TO_CHAR(HIREDATE,'MM') 월, e.*
FROM emp e
ORDER BY TO_CHAR(HIREDATE,'MM');
-- 입사월별 사원수와 평균 급여을 출력..
SELECT TO_CHAR(HIREDATE,'MM') 월, COUNT(*) "월별사원수", AVG(SAL) "월별 평균급여"
FROM emp e
GROUP BY TO_CHAR(HIREDATE,'MM')
ORDER BY TO_CHAR(HIREDATE,'MM');






