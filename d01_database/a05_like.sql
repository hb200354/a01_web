SELECT * FROM EMP;
/*
# ORACLE LIKE
1. 오라클 데이터베이스에서 원하는 데이터를 효과적으로 검색하기 위해 LIKE 연산자는 필수적인 도구다
2. LIKE: 비슷한 것을 찾아내는 기술
LIKE 연산자는 WHERE 절과 함께 사용되어, 컬럼의 데이터가 특정 문자열 패턴과 일치하는지를 비교한다.
완전 일치를 찾는 등호(=)연산자와 달리, LIKE는 와일드카드 문자(%,_)를 사용하여 유연한 검색을 가능하게 한다.
3. 핵심 와일드카드
    - %(퍼센트) : 0개 이상의 모든 문자를 의미. 어떤 문자든, 몇 개가 오든 상관없음
        컬럼명 LIKE '%A%' ==> A포함하기만 하면 앞뒤 어떤 글자가 와도 상관없이 검색
        컬럼명 LIKE '%%' ==> 글자 상관 없이 전체 데이터 검색(주로 초기화면에 전체데이터 로딩시)
    - _(언더스코어) : 단 하나의 문자를 의미. 정확히 한 글자를 대신하는 역할을 함.
4. 기본 형식
    SELECT 컬럼1, 컬럼2, ... 
    FROM 테이블명
    WHERE 컬럼명 LIKE '패턴'
*/
--EMP 테이블 기준 이름이 'S로 시작하는 모든 직원 찾기
SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'S%';
-- %S는 S로 끝나는 것이고, %S%는 S가 중간에 포함되는 것 전부 검색하는 것이다. 

-- EX) 이름이 'A'로 시작하는 직원을 모두 찾아주세요.
SELECT ENAME
FROM EMP 
WHERE ENAME LIKE 'A%';
-- EX) 직업이 'S'로 시작하고, 'MAN'으로 끝나는 직원을 찾아주세요.
SELECT *  
FROM EMP 
WHERE JOB LIKE 'S%' AND JOB LIKE '%MAN';

-- 이름의 두 번째 글자가 'A'인 직원 찾기
SELECT *
FROM EMP 
WHERE ENAME LIKE '_A%';

-- 직업이 5글자이며, 세 번쨰 글자가 'E'인 직원 찾기
SELECT *
FROM EMP
WHERE JOB LIKE '__E__';

-- EX1) 이름의 두 번째 글자가 L인 직원을 모두 찾아주세요.
SELECT *
FROM EMP 
WHERE ENAME LIKE '_L%';

-- EX2) 이름이 총 5글자이고, 마지막 글자가 S인 직원을 찾아 주세요. 
SELECT *
FROM EMP 
WHERE ENAME LIKE '____S'; -- OR WHERE ENAME LIKE '_____' AND ENAME LIKE '%S';

-- 직업이 MAN으로 끝나지 않는 직원 찾기 (NOT LIKE의 활용)
SELECT ENAME, JOB  
FROM EMP 
WHERE JOB NOT LIKE '%MAN';

-- EX) 이름에 마지막에 알파벳 S가 포함되지 않는 직원을 찾으세요
SELECT ENAME
FROM EMP 
WHERE ENAME NOT LIKE '%S';