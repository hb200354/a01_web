/*
# 오라클 집합 연산자(UNION, UNION ALL, INTERSECT, MINUS)
1. 오라클에서 집합 연산자는 두 개 이상의 SELECT문 결과를 하나로 합치거나, 바교할 때 사용한다.
    - JOIN (수평결합)
    - SET OPERATOR(수직 결합)

2. 집합 연산자 사용 규칙
    1) 컬럼 갯수 일치: 두 SELECT문의 컬럼갯수과 완벽하게 동일해야 한다.
    2) 데이터 타입 일치: 위에서부터 순서대로 대응하는 컬럼의 데이터 타입이 서로 일치해야 한다. 
*/
SELECT * FROM MORNING_SHIFT;
SELECT * FROM AFTERNOON_SHIFT;
-- UNION(중복 제거) : 오늘 근무한 사람 이름 목록
SELECT EMP_NAME FROM MORNING_SHIFT
UNION
SELECT EMP_NAME FROM AFTERNOON_SHIFT;
-- INTERSECT(교집합) : 오전에 일하고 오후에 일한 근무자
SELECT EMP_NAME FROM MORNING_SHIFT
INTERSECT
SELECT EMP_NAME FROM AFTERNOON_SHIFT;
-- MINUS(차집합) : 오전에만 일하고 오후에는 일하지 않는 오전 전담 근무자
SELECT EMP_NAME FROM MORNING_SHIFT
MINUS
SELECT EMP_NAME FROM AFTERNOON_SHIFT;