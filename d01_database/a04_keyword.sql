SELECT * FROM EMP;
/* 
# 오라클의 키워드 연산자
1. 키워드 연산자란, 단순한 비교(=, >, <)를 넘어 특별한 의미를 가진 예약어(KEYWORD)를 사용하여 복잡한
조건을 간결하게 처리하는 연산자를 말한다. 데이터 베이스에서 구체적이고, 복잡한 명령을 내릴 때 사용하는 특수 명령어
KEYWORD는 WHERE 절에서 필터링 조건을 만들 때 코드의 가독성을 높이고, 여러 줄로 작성해야 할 ON이나 AND를 한 줄로 깔끔하게 만들어준다
2. 핵심 코드
    1) IN (쇼핑 리스트) : 여러 값 중 하나라도 일치하는 데이터를 찾는다
        WHERE 컬럼명 IN ('값1', '값2', '값3, ......)
    2) BETWEEN (줄자) : 두 값 사이의 범위에 있는 데이터를 찾는다.
        WHERE 컬럼명 BETWEEN 값1 AND 값2
    3) LIKE (탑지견) : 특정 패턴이나 글자가 포함된 데이터를 찾는다. 
        WHERE 컬럼명 LIKE '%패턴%'
    4) IS NULL (빈 상자) : 데이터가 비어 있는 (NULL)경우를 찾는다.
        WHERE 컬럼 IS NULL 
# IN 연산자
1. 여러 값 중 하나라도 일치하는 데이터를 찾을 때 사용
*/

-- 직책(JOB)이 'MANAGER', 'SALESMAN', 'ANALYST'중 하나인 사원의 이름(ENAME)과 직책(JOB)찾기
SELECT ENAME, JOB
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN', 'ANALYST');

-- EX) MGR(관리자번호)가 7902이거나, 7839인 사원의 사원명, 관리자번호, 급여를 출력하세요
SELECT ENAME, MGR, SAL
FROM EMP
WHERE MGR IN (7902, 7839);
-- EX) 부서 번호가 10이거나 30번인 사원의 사원번호, 사원명, 직책명을 출력하세요
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO IN(10, 30);

-- EX) 급여 2000에서 3000 사이인 사원의 이름과 급여를 찾아보자
SELECT ENAME, SAL
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

-- EX) 커미션(COMM)을 받지 않는 사원의 이름과 커미션 찾기
SELECT ENAME, COMM
FROM EMP
WHERE COMM IS NULL;










