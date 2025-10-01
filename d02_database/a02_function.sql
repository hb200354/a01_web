/*
# 오라클 기능 함수
1. 일반함수(General Functions)는 sql의 SELECT, WHERE, ORDER BY 절 등에서 사용되어 단일행 또는 단일 값으
처리하고 결과를 반환하는 함수들의 통칭합니다. 이 함수들은 문자, 숫자, 날짜, 변환, 조건등 다양한 유형의 데이터를
다룰 수 있어, 데이터의 처리를 유연하고 강력하게 만듭니다.
2. 함수의 2가지 분류
   1) 단일행 함수 : 행 하나를 입력받아 값 하나를 반환합니다.(대부분의 일반함수)
   2) 그룹함수 : 여러 행을 입력받아 값 하나를 반환합니다.(SUM(), AVG(), COUNT()
3. 핵심 키워드
   1) 날짜/시간 조작 : SYSDATE, ADD_MONTHS : 데이터는 SYSDATE로 ADD해서 쏜다.
   2) 문자열 : SUBSTR, LENGTH, INSTR : SUB LEN를 INS로 들여다 본다.
   3) 숫자처리(반올림, 버림) ROUND, TRUNC : ROUND로 돌리고, TRUNC로 자른다.
   4) 데이터타입 변환 TO_CHAR, TO_DATE, TO_NUMBER  : TO_가 붙으면서 변환한다.
   5) 조건 처리   NVL, DECODE, CASE     : NULL이면 Value로, DECODE로 조건을 건다.
      
**/
/*
# SUBSTR()
1. 문자열을 추출해주는 기능함수
2. 기본 형식
	SUBSTR(데이터, 시작위치번호, 잘라낼 길이)
	1) 시작번호의 위치는 1부터 시작합니다.
	2) 잘라낼 길이는 생략하면 끝까지 잘라진다.
 * */



