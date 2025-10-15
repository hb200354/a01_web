/*
# 오라클의 날짜 함수
1. 오라클의 날짜 함수는 데이터베이스의 날짜와 관련된 모든 계산을 해준다.
2. 핵심 개념: 
    1. 기본 적인 연산 +1 (1일)
    2. MONTH_BETWEEN 함수 이용 시 월단위 1 ==> 0.5 ==> 15일을 의미
    ADD_MONTH()는 개월 수를 더해서 날짜를 처리함
    - SYSDATE : 현재 시간 - 시스템의 현재 날짜와 시간
    - ADD_MONTH() : 개월 수 더하기 - 특정 날짜에 원하는 개월 수를 더해 미래 날짜를 구함
    - MONTH_BETWEEN() : 개월 수 차이 - 두 날짜 사이의 개월 수를 계산함
    - NEXT_DAY() : 다음 요일 찾기 - 지정한 날짜로부터 가장 가까운 요일의 날짜를 리턴
    - LAST_DAY() : 그 달의 마지막 날 - 그 달의 마지막 날짜를 알려줌
    */
SELECT SYSDATE 오늘, SYSDATE - 1 어제, SYSDATE + 1 내일, SYSDATE +30 "30일 후"
FROM DUAL; 
-- 현재 날짜로부터 6개월 후 날짜 구하기
SELECT SYSDATE 현재일, ADD_MONTHS(SYSDATE, 6) "6개월 후",
    ADD_MONTHS(SYSDATE, 1) "1개월 후"
FROM DUAL;
-- 특정 날짜로부터 2개월 전 날짜
SELECT ADD_MONTHS(TO_DATE('2025-02-28', 'YYYY-MM-DD')) "지정한 날짜",
    ADD_MONTHS(TO_DATE('2025-02-29', 'YYYY-MM-DD'), -2) "2개월 전"
FROM DUAL;
-- EX) 사원명과 입사일, 수습기간 종료일(입사 후 3개월)을 출력하세요
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 3) "수습기간 종료일"
FROM EMP;
-- 두 날짜 사이의 개월 수 계산
SELECT TO_DATE('2025-02-28', 'YYYY-MM-DD') "날짜1",
    TO_DATE('2025-04-30', 'YYYY-MM-DD') "날짜2", 
    TO_DATE('2025-05-31', 'YYYY-MM-DD') "날짜3", 
    MONTHS_BETWEEN(TO_DATE('2025-02-28', 'YYYY-MM-DD'),
        TO_DATE('2025-04-30', 'YYYY-MM-DD')) "비교1",
    MONTHS_BETWEEN(TO_DATE('2025-02-28', 'YYYY-MM-DD'),
        TO_DATE('2025-05-30', 'YYYY-MM-DD')) "비교2"
FROM DUAL;
-- EX) 사원 정보를 통해, 사원의 현재까지 근속월 계산 (입사 후 @@개월째로 표시)
SELECT 
    ENAME, 
    HIREDATE, 
    '입사 후' || CEIL(MONTHS_BETWEEN(SYSDATE, HIREDATE)) || '개월째' AS "근속개월",
    '입사 후' || CEIL(MONTHS_BETWEEN(SYSDATE, HIREDATE)/12) || '년째' AS "근속년도"
FROM EMP;
-- 오늘 기준 가장 가까운 금요일 날짜 찾기
SELECT SYSDATE, NEXT_DAY(SYSDATE, '금요일') "다음 금요일"
FROM DUAL;
-- 입사 후 첫 번째 토요일 출력
SELECT ENAME, HIREDATE, NEXT_DAY(HIREDATE, '토요일') "첫 토요일",
    NEXT_DAY(HIREDATE, '토요일') + 7 "두 번째 토요일",
    NEXT_DAY(HIREDATE, '토요일') + 14 "세 번째 토요일"
FROM EMP;
-- 지정한 날짜가 속한 달의 마지막 날짜 반환
SELECT SYSDATE, LAST_DAY(SYSDATE) "이번 달 마지막 날짜",
    LAST_DAY(SYSDATE) + 1 "다음 달 첫 째 날"
FROM DUAL;
-- EX) 사원의 첫 급여일이 그 다음달 1일일 때, 해당 날짜 출력하고 보너스 일 (그 담달 10일일 때)도 출력
SELECT ENAME, LAST_DAY(HIREDATE) + 1 "첫 급여일",
    LAST_DAY(HIREDATE) + 10 "보너스 일"
FROM EMP;