/*
# 오라클 LTRIM, RTRIM, TRIM: 지저분한 공백/문자 청소
1. 이 함수들의 양쪽 끝(왼쪽, 오른쪽, 양쪽 모두)에서 지정한 공백을 잘라내는 역할을 함.
    LTRIM(Left TRIM) : 왼쪽의 불필요한 부분 잘라냄
    RTRIM(Right TRIM) : 오른쪽의 불필요한 부분 잘라냄
    TRIM : 양쪽 모두를 잘라내거나, 특정 방향의 특정 문자 하나를 지정해서 잘라냄
2. 핵심 키워드
    1) 대상 문자열 : 청소하고 싶은 데이터
    2) 제거할 문자 : 지우고 싶은 문자(지정 안하면 공백을 청소)
    3) TRIM(옵션, 제거할 문자) FROM 대상 문자열
        옵션 : LEADING(왼쪽), TRAILING(오른쪽), BOTH(양쪽, 기본값)
        제거할 문자 : 딱 하나의 문자만 지정 가능
*/
SELECT 
    '   SWAG    ' data1,
    LENGTH('    SWAG    ') data2, 
    LTRIM('    SWAG    ') data3,
    LENGTH(LTRIM('    SWAG    ')) data4,
    RTRIM('    SWAG    ') data5,
    TRIM('    SWAG    ') data7,
    LENGTH(TRIM('    SWAG    ')) data8
FROM dual;