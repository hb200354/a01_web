SELECT * FROM EMP;
/*
SELECT : 테이블이 2차원 구조 (행/열)에서 열을 선택할 때, 사용하는 명령어
(*표는 모든 열을 선택)
FROM : 특정한 테이블의 데이터를 로딩처리
*/
SELECT EMPNO, ENAME, JOB FROM EMP;
-- SELECT 컬럼1, 컬럼2, 컬럼 3 FROM 테이블명;
-- EX1) DEPT 테이블의 전체데이터 로딩 명령어 수행
SELECT * FROM DEPT;
-- EX2) DEPT 테이블의 컬럼을 확인하고, 2개의 컬럼만 로딩 명령어 수행
SELECT DNAME, LOC FROM DEPT;
-- EX3) SALGRADE 테이블에 컬럼 2개를 로딩 하는 명령어 실행SELECT * FROM EMP;
SELECT * FROM SALGRADE;
SELECT GRADE, LOSAL FROM SALGRADE;

/*
# 컬럼의 별칭 사용하기
1. 모든 테이블의 구성요소 컬럼은 SELECT 컬럼명으로 사용하여 호출할 수 있다.
2. 그러나, 특정한 경우에는 컬럼명을 변경하거나, 통합된 컬럼명으로 처리해야하는 경우가 있다. 
EX) SELECT ENAME AS NAME 
==> 원래 테이블에서의 컬럼명은 ENAME이지만, 데이터 로딩하여 출력할 때는 NAME으로 설정하여 처리
EX) SELECT ENAME || DEPTNO ENAMEDEPT
==> ENAME 컬럼과 DEPTNO 컬럼을 통합하여 하나의 컬럼으로 처리
EX) SELECT SAL * 100 SALMULTI 
==> 원래는 SAL 컬럼이지만, 100을 곱한 결과를 SALMULTI라는 이름으로 처리
3. 기본 형식S
SELECT 컬럼명 AS 별칭 AS : ALIAS(별칭)
       컬럼명 별칭 : 공백으로 별칭을 바로 사용 
SELECT 컬럼명 "별칭명": ""를 사용하는 가장 큰 이점은 공백이 추가되거나 특수문자를 사용한 별칭을 지정할 때 활용
*/
SELECT EMPNO AS NO, ENAME NAME 
FROM EMP;
-- 데이터 1 || 데이터 2 데이터와 데이터를 연결시 사용하는 키워드
-- ' - ' : 데이터베이스에서 문자열 데이터를 표현할 때 사용
SELECT ENAME, DEPTNO, ENAME || ' - ' || DEPTNO DEPTNO_ENAME
FROM EMP;
SELECT ENAME, SAL, SAL * 100 SALMULTI
FROM EMP;
-- EX1) EMP 테이블에 SAL ==> SALARY 표현, DEPTNO ==> DNO라고 표현
SELECT ENAME, SAL AS SALARY, DEPTNO DNO
FROM EMP;
-- EX2) EMPNO, ENAME, SAL와 급여의 50%(SAL50PER)를 출력하세요
SELECT EMPNO, ENAME, SAL, SAL * 0.5 SAL50PER
FROM EMP;
-- SELECT 컬럼명 "ALIAS명"
SELECT ENAME "이 름", JOB "@ 직 책 명 @"
FROM EMP;
-- EX1) EMPNO를 "번 호"로 표현, HIREDATE를 "입 사 일"로 표현하여, 번 호, ENAME, 입 사 일로 컬럼명을 지정하여 출력하세요.
SELECT EMPNO "번 호", ENAME, HIREDATE "입 사 일"
FROM EMP;
-- EX2) @@@@님의 사원번호는 @@@입니다. 를 출력하되 컬럼명을 "!! 사원 소개 !!"라고 표현하여 출력.
-- HINT) ||' 문자열 표현 '|| 활용하여 출력.. @@@님 ==> ENAME, @@@ ==> EMPNO 활용
SELECT ENAME || '님의 사원번호는 ' || EMPNO || '입니다.' "!! 사원 소개 !!"
FROM EMP;

