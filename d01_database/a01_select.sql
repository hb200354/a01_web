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
