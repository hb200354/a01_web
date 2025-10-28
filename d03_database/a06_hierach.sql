SELECT * FROM EMP;
/*
# 오라클 계층형 쿼리 : 족보와 조직도를 캐는 탐정
1. 데이터를 '줄줄이 사탕'처럼 엮어서 뽑아내는 아주 재미있는 기술, 계층형 쿼리입니다.
2. 계층형 쿼리란?
	여러분이 탐정이 되어 어느 회사의 회장님을 만났다고 상상해 보세요
	회장님이 여러분에게 미션을 줍니다. 우리 회사 조직도 좀 싹 다 뽑아와!!
	- 회사 조직도 차트를 상상해봅시다..
	데이베이스 테이블(Employees)을 열어보니
	1번 : 김회장(상사:없음)
	2번 : 이부장(상사:1번)
	3번 : 박과장(상사:2번)
	4번 : 최소리(상사:3번)
	5번 : 정사원(상사:3번)
	6번 : 최부장(상사:1번)
	계층형 쿼리는
	테이블 안에 부모-자식 관계(혹은 상사-부하, 부품-완제품)가 숨어 있을 때, 단 한 번의 쿼리로 이 족보를 쫙
	펼쳐주는 오라클의 강력한 기능입니다.
3. 계층형 쿼리의 키워드
	SELECT LEVLE, *
	FROM 테이블명
	WHERE..
	START WITH (ROOT 노드 조건)
	CONNECT BY PRIOR 계층연관관계 조건
	ORDER SIBLINGS BY 정렬 기준 설정
	1) START WITH (스타트 위드)
		- 어디서부터 족보를 캘까요? (시작점 지정)
		- 계층 구조의 최상위 루트가 될 조건을 지정합니다.
		- START - 시작 말 그대로 족보 탐색의 시작점입니다.
		- 탐색 시작 지점 EX) START WITH 상사 IS NULL ==> 회장님부터 시작..
	2) CONNECT BY PRIOR 
		- 부모와 자식을 어떻게 연결(CONNECT)할까요? (연결고리 지정)
		- 부모 행과 자식 행의 관계를 정의합니다.
		- CONNECT BY : ~로 연결하라.
		- PRIOR : 이전의 먼저의 계증 구조에서는 부모(Parent) 또는 상사를 의미합니다.
	# 위 코드를 정리하면
		PRIOR가 부모다 - 부모컬럼과 현재 행의 자식컬럼이 같은 것끼리 연결해라는..
		CONNECT BY PRIOR 부모컬럼 = 자식컬럼
		EX) CONNECT BY PRIOR EMPNO = MGR.
						   이전행(부모행 상사 EMPNO) = 현재행(자식행 부하)상사번호.					   
	3) SELECT에 사용되는 키워드 LEVEL
		지금 몇 세대(generation)인가요? (계층 깊이)
		루트가 1, 그 자식2, 손자가 3 자동으로 번호를 매겨줍니다.
		LEVEL = 세대(1대, 2대, ...)
 * */
SELECT EMPNO, ENAME, MGR
FROM EMP;
SELECT E.EMPNO 사원번호, E.ENAME 사원명 , 
		E.MGR 관리자사원번호, M.ENAME 관리자이름
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO;
-- 계층형 SQL
SELECT LEVEL 계층레벨, EMPNO 사원번호, ENAME 사원명, MGR 관리자번호
FROM EMP 
START WITH MGR IS NULL  -- 최상위 계층의 사원은 더 이상은 관리번호가 없음.
CONNECT BY PRIOR EMPNO = MGR  -- 관리자의 EMPNO와 관리자 번호를 연결..
ORDER SIBLINGS BY EMPNO;   -- 계층내 형제지간 정렬 기준 컬럼..

SELECT * FROM SKILL_TREE;
-- ROOT REQ_ID IS NULL
-- SKILL_ID = REQ_ID 
-- 계층레벨   스킬명   스킬아이디   상위스킬아이디
SELECT LEVEL,
       SKILL_NAME,
       SKILL_ID,
       REQ_ID
  FROM SKILL_TREE
START WITH REQ_ID IS NULL
 CONNECT BY PRIOR SKILL_ID = REQ_ID
ORDER SIBLINGS BY SKILL_NAME;  









