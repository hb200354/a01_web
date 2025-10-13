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
SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일" HH"시":MI"분":SS"초"') FROM DUAL;