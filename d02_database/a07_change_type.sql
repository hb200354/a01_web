/*
# 오라클의 형변환 함수 
1. 데이터베이스에서 문자를 숫자로, 숫자를 날짜로 바꾸는 등 데이터의 종류를 바꾸는 함수이다.
2. 종류:
    - TO_CHAR() : 숫자나 날짜를 문자로 변환
    - TO_NUMBER() : 문자를 숫자로 변환
    - TO_DATE() : 문자를 날짜로 변환
3. 형변환 함수의 핵심은 포맷 코드(Format Code)이다. 
    - 'YYYY' : 4자리 연도
    - 'MM' : 월
    - 'DD' : 일
    - 'HH24' : 24시간 형식
    - 'MI' : 분
    - 'SS' : 초
    - '9' : 숫자 한 자를 의미.
    - '0' : 빈 자리를 0으로 채움 EX) '099'
*/
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD DAY AM HH:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일"') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일" HH"시" MI"분" SS"초"') FROM DUAL;

SELECT 12345000 DATA1,
    TO_CHAR(12345000, '999,999,999.00') DATA2
    TO_CHAR(12345000, 'L999,999,999.00') DATA3, -- 앞에 원화가 붙음
    TO_CHAR(12345000, '000,000,999,999,999.00') DATA4, -- 자리수가 남은 부분들을 0으로 표현
FROM DUAL;

SELECT '1,000' "기본 1000표현", TO_NUMBER('1,000', '9,999') + 3000 "연산시1(형변환)"
FROM DUAL;

/*
# to_date(문자열, '포맷형식') - 글자를 날짜로 변경하여 처리
1. 2025-10-26 같은 문자열을 오라클이 이해하는 진짜 날짜 데이터로 만들 때 사용
2. 형식
    YYYY : 4자리 연도
    MM : 2자리 월
    DD : 2자리 일
    HH24 : 24시간 형식 시간
    MI : 2자리 분
    SS : 2자리 초
    TO_DATE('2023-10-26', 'YYYY-MM-DD') : 문자열을 날짜로 읽도록 함
*/
SELECT TO_DATE('2025-12-25', 'YYYY-MM-DD') - SYSDATE "크리스마스까지 남은 날짜!"
FROM DUAL;

-- 1초 = 60 => 1분 = 60 => 1시간 = 24 => 1일
-- 1일 = 1/24 => 1시간 = 1/60 ==> 1분 = 1/60 => 1초

SELECT SYSDATE 오늘날짜, SYSDATE - 1 전날, SYSDATE + 1 내일, SYSDATE + 0.5 "12시간 이후"
FROM DUAL;

-- 2026-01-01 오늘로부터 몇일 남았는지, 2025/09/22로부터 몇일 지났는지 출력
SELECT TO_DATE('2026-01-01', 'YYYY-MM-DD') - SYSDATE "몇일 남았나", 
    SYSDATE - TO_DATE('2025/09/22', 'YYYY-MM-DD') "몇일 지났나"
FROM DUAL;

/*
FLOOR() : 소숫점 이하를 절삭해줌
CEIL() : 올림
ROUND() : 반올림
*/
SELECT FLOOR(TO_DATE('2026-01-01', 'YYYY-MM-DD')) - SYSDATE) "오늘로부터 몇일 남았나",
    CEIL(SYSDATE - TO_DATE('2025/09/22', 'YYYY-MM-DD')) "오늘일 몇일째인가"
FROM DUAL;