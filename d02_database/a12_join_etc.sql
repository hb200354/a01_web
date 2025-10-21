/*
# 오라클의 JOIN(흩어져 있는 데이터 퍼즐 조각을 맞추는 데이터 탐정 기술)
1. 여러 테이블에 나뉘어 저장된 정볼르 하나의 완성된 그림으로 합쳐주는 아주 강력하고 필수적인 기능이죠
   예를들어, 학생 테이블에는 이름과 학년만 있고, 성적 테이블에는 과목과 점수만 있다면, A학생의 수학 점수는 몇점?이라는
   	질문에 답하기 위해 두 테이블을 연결해야 하는데, 이 때 바로 join을 사용합니다.
2. 기본 개념
	1) join을 각기 다른 정보를 가진 두 그룹의 소개팅이라고 생각하면 아주 쉽습니다.
		테이블 : 소개팅에 나온 A그룹과 B그룹
		컬럼(column) : 각자의 이름, 나이, 사는 곳 같은 프로필 정보
		join 조건 : 사는 곳이 같은 사람끼리 짝을 지어주세요! 와 같은 매칭 규칙
		
		이 소개팅(join)에는 여러 종류의 매칭 방식이 있습니다.
		
	2) join 종류와 핵심 키워드
		INNER JOIN : 커플 매칭 성공 - 양쪽 테이블에 모두 매칭되는 데이터만 보여줌. 가장 기본적이고 흔한 조인
			교집합
		LEFT OUTER JOIN : A그룹은 전원 참석 - 왼쪽(A그룹) 테이블의 데이터는 모두 보여주고, 오른쪽(B그룹)은
			매칭되는 데이터만 보여줌. (짝이 없으면 NULL로 표시)
		RIGHT OUTER JOIN : B그룹은 전원 참석 - 오른쪽(B그룹) 테이블의 데이터는 모두 보여주고, 왼쪽(A그룹)은
			매칭되는 데이터마 보여줌(짝이 없으면 null로 표시)
		FULL OUTER JOIN : 모두 다 나와 - 양쪽 테이블의 데이터를 모두 보여줌. 짝이 있든 없든 명단에 전부 올리는
			방식 (합집합) 예) 사원 테이블에 사원과 관리자의 관계 찾기
    #  LEFT, RIGHT는 주인공이 누구인지 생각해야 합니다. LEFT JOIN 왼쪽 테이블이 주인공,
	RIGHT JOIN 오른쪽 테이블이 주인공. 주인공 절대 빠지지 않아요!!			
			
			
 * */
-- inner join : 두개의 테이블에 공통된 데이터가 있을 시만 보여줌..
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
-- 부서에 소속된 사원들의 이름과 그 부서의 이름을 출력
SELECT EMP_NAME, DEPT_NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON e.DEPT_ID  = d.DEPT_ID; 
-- 부서를 배치 받지 않는 사원도 표현하여 처리하고자 할 때..==> LEFT JOIN
-- EMPLOYEES 테이블이 주인공이기에 다 나오게 한다.
SELECT EMP_NAME, DEPT_NAME
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
ON e.DEPT_ID  = d.DEPT_ID; 

SELECT EMP_NAME, DEPT_NAME
FROM EMPLOYEES e RIGHT OUTER JOIN DEPARTMENTS D
ON e.DEPT_ID = d.DEPT_ID;
SELECT * FROM emp;
SELECT * FROM dept;
-- ex) EMP, DEPT 를 활용해서  부서별로 할당된 사원들 표현하되, 할당되지 않는 부서도 표현하세요.
SELECT DNAME, ENAME 
FROM EMP e RIGHT OUTER JOIN DEPT d
ON e.deptno = d.deptno;

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
-- CUSTOMERS 와 ORDERS를 이용해서 고객과 구매현황을 고객명, 구매물품(ITEM)을
-- 출력하되, 구매하지 고객도 표현하여 출력되게 하세요 
SELECT NAME, ITEM
FROM CUSTOMERS C INNER JOIN ORDERS O
ON C.CUST_ID = O.CUST_ID; -- 구매한 사람의 내용
SELECT NAME, ITEM
FROM CUSTOMERS C LEFT OUTER JOIN ORDERS O
ON C.CUST_ID = O.CUST_ID; -- 구매한 사람의 내용



SELECT EMP_NAME, DEPT_ID  
FROM EMPLOYEES
ORDER BY DEPT_ID;
SELECT DEPT_ID, DEPT_NAME 
FROM DEPARTMENTS;


-- 양쪽 테이블의 테이블의 데이터 모두를 보여줌, 짝이 없더라도, 짝이 없는 내용 NULL로 표시.
-- FULL JOIN
SELECT EMP_NAME, DEPT_NAME
FROM EMPLOYEES e FULL OUTER JOIN DEPARTMENTS D
ON e.DEPT_ID = d.DEPT_ID;


SELECT NAME, ITEM
FROM CUSTOMERS C RIGHT OUTER JOIN ORDERS O
ON C.CUST_ID = O.CUST_ID; -- 구매한 사람의 내용

-- EX) EMP와 DEPT 테이블을 FULL JOIN하여 사원명과 부서명을 출력하세요
SELECT ENAME, DNAME
FROM EMP E FULL OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
















