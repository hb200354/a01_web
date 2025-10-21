/*
# NON EQUI JOIN(비등가 조인)
1. 같지 않을 때 만나는 특별한 조인
2. NON EQUI JOIN은 이름 그대로 등호(=)가 아닌, 다른 비교 연산자(>,<, BETWEEN)를
	사용하여 테이블을 연결하는 방식입니다.
3. EQUI JOIN이 너와 나는 같아라고 말하며 정확히 일치하는 값을 찾는다면,
	NON EQUI JOIN은 네가 나보다 크구나!! 네가 이 범위 안에 있네 처럼
	값의 범위를 기준으로 관계를 맺는 유연한 조인입니다.
4. 핵심 키워드
	1) 비등가 연산자 : 조인 조건으로 =를 사용하지 않고, >, >=, <, <= 
		BETWEEN AND 등의 연산자를 사용합니다.
	2) 범위 기반 조인 : 특정 값과 정확히 일치하는 것을 찾는 게 아니라, 특정 값의
		범위에 해당하는 데이터를 찾을 때 매우 유용합니다.
	3) WHERE 절 : 조인 조건은 WHERE 절에 명시합니다.
	4) 활용 예시 : 직원의 급여 등급을 결정하거나, 특정 점수 범위에 속하는 학생을 
		찾는 경우 등에 자주 사용됩니다.
	# 같지 않으니까(NON EQUI) 등호 대신 부등호를 사용해서 값의 범위를 찾아 연결
		한다고 생각합니다.		
 * */
SELECT * FROM SALGRADE;
SELECT ENAME, SAL FROM EMP;

SELECT ename, sal, grade 
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.LOSAL AND s.HISAL;
-- SELECT : 선택할 컬럼을 지정
-- FROM EMP E, SALGRADE S  : 조인할 테이블을 지정
-- WHERE 조인할컬럼대상 BETWEEN 비교데이터(컬럼) AND 비교데이터(컬럼)

/*
SELECT * FROM PLAYERS;
SELECT * FROM TIER_INFO;
를 활용해서 플레이어의 이름, 점수, 등급을 표현해주세요..
 * */
SELECT * FROM PLAYERS;
SELECT * FROM TIER_INFO;
SELECT player_name, score, tier_name
FROM PLAYERS p, TIER_INFO
WHERE score BETWEEN min_score AND max_score;





