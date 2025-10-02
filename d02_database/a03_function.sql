/*
# nvl : null이면 이걸로
1. NVL 함수는 NULL 값을 처리하거나 데이터 값을 다른 값으로 변환할 떄 유용한 일반 기능 함수를 말한다.
2. 형식
    NVL(값1, 값2) 형태로 사용하면, 값1이 NULL 아니면 값1을 그대로 보여주고,
    NULL이면 값2로 바꿔서 보여준다. 마치 비상금을 준비해두는 것과 같다.
3. 특징
    1) 데이터 타입이 컬럼명과 대체값이 일치해야 한다.
        NVL(값1이 숫자형이면, 값2도 숫자형으로 표현)
        NVL(값1이 문자열형이면, 값2도 문자열형으로 표현)
    2) 주로 SELECT, 계산식(NULL일 때, 숫자와 합산해야 하는 경우), WHERE조건에서
    NULL에 대한 데이터를 처리할 때 사용

    주의) 데이터 1 + 데이터2 -> 데이터 1이더지, 데이터2가 하나라도 NULL이면 합산된 값은
    NULL이기 때문에 NULL인 데이터는 0으로 처리해야한다. 그러면, 정상적으로 합산 결과값 확인 가능
    1000 + NULL ==> NULL
    NULL + 500 ==> NULL
    1000 + NVL(NULL, 0) ==> 1000 + 0 ==> 1000
    NVL(NULL,0) + 500 ==> 0 + 500 ==> 500
    때문에 NULL의 가망성이 있는 컬럼은 NVL()을 사용하여 연산
**/
-- 보너스(COMM)이 NULL이면 0으로 출력
SELECT ENAME, SAL, COMM, SAL + COMM "합산1",
        NVL(COMM, 0), SAL + NVL(COMM, 0) "합산2"
FROM EMP;

SELECT * FROM ACADEMY_STUDENT;
-- EX) POWER_LV와 BONUS_POINTS를 합산을 하되, NVL 함수를 통해서 정산적으로 합산 되게 처리
-- 학생이름 파워레벨 보너스포인트 합산
SELECT SNAME, POWER_LV, BONUS_POINTS, POWER_LV + BONUS_POINTS "합산1",
        NVL(BONUS_POINTS,0) "BONUS_POINTS2",
        POWER_LV + NVL(BONUS_POINTS, 0) "합산2"
FROM ACADEMY_STUDENT;

/*
# NULLIF(데이터1, 데이터2)
1. 데이터1과 데이터2가 같으면 NULL, 다르면 데이터1로 처리
    중복값을 제거하거나 구분할 때 유용
2. 기본형식
    NULLIF(데이터1, 데이터2)
3. 특징
    1) 두 값이 같을 때만 NULL 반환
    2) DECODE 보다 간결하게 특징 비교 처리 기능

*/
SELECT * FROM EMP;
-- 급여가 3000인 사원은 급여체크 3000 NULL로 표현 그외는 급여 그대로 표현
SELECT ENAME, SAL, NULLIF(SAL, 3000) "급여체크3000"
FROM EMP;
/*
# NULLIF의 사용되는 실무적 필요성
1. 두 개의 컬럼을 비교하여, 비즈니스 로직상 의미 없거나 계산 오류를 유발하는 
데이터를 NULL로 깔끔히 처리
2. 적용 사례
    1) 변화 없는 데이터 무시 : 이전 값과 현재 값이 같을 때처럼 변화가 없어
    분석에 의미 없는 데이터를 NULL로 처리하여 제외할 때 사용
    2) 0으로 나누기 오류 방지 : 통게나 비율 계산 시 분모가 0이 되면 발생하는 오류를 원천 차단.
*/
SELECT * FROM PRODUCT_SALES;
-- 목표와 실적이 동일한 의미 없는 데이터 NULL처리
-- 목표 판매량과 실제 판매량이 다른 제품들만 주목해서 보고 싶다.
-- 두 수치가 같다면 목표량 데이터는 굳이 볼 필요 없음
-- NULLIF를 사용하면, 목표와 실적이 동일한 경우 목표 판매량을 NULL로 만들어 의미 없는
-- 데이터를 시각적으로 제거할 수 있다.
SELECT PRODUCT_NAME, TARGET_SALES "기본목표", ACTUAL_SALES "실제 실적",
    NULLIF(TARGET_SALES, ACTUAL_SALES) "분석용 목표(변경시만 표시)"
FROM PRODUCT_SALES
WHERE NULLIF(TARGET_SALES, ACTUAL_SALES) IS NOT NULL;

SELECT * FROM PRODUCT_SALES;
/*
# 0으로 나누기 오류 방지(가장 중요한 용법)
1. 모든 상품의 전월 대비 판매 성장률(%)를 계산해야 한다. 성장 공식은 (이번달실적 - 전월 실적) / 전월실적*100
    이 때, AI 스피커처럼 전월 실적인 0인 신제품은 0이 되어 ORA-01476: DIVISOR IS EQUAL TO ZERO 오류
*/
SELECT PRODUCT_NAME, 
    (ACTUAL_SALES - PREV_MONTH_SALES)/PREV_MONTH_SALES*100 "성장률(%)"
FROM PRODUCT_SALES;
-- 오류 방지 처리
SELECT PRODUCT_NAME,
    (ACTUAL_SALES - PREV_MONTH_SALES) / NULLIF(PREV_MONTH_SALES, 0) * 100 "성장률(%)"
FROM PRODUCT_SALES;