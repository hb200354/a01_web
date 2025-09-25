SELECT * FROM EMP;
/*
# ORACLE 테이블 생성 개념
기본형식: 
CREATE TABLE 테이블 명(
    컬럼1 데이터유형,
    컬럼2 데이터유형,
    컬럼3 데이터유형,
);

핵심 데이터 유형
    1) NUMBER: 숫자 전용 칸
        정수, 실수를 포함한 모든 숫자 데이터를 저장. 계산이 필요한 값에 사용
    2) VARCHAR2: 신축성 있는 글자 칸
        가변 길이 문자열을 저장한다. 이름, 주소, 제목처럼 글자 수가 일정하지 않는 데이터를 담을 때 효율적   
        VARCHAR2(100)은 최대 BYTE(영문) 100글자까지 저장하되, 한글자 3BYTE(총 9BYTE)를 저장하며,
        딱 9BYTE에 해당하는 공간만 사용한다.
    3) CHAR: 고정된 글자 칸
        고정 길이 문자열을 저장. CHAR(50)에 세글자를 저장하면 데이터 자체는 9BYTE이지만,
        무조건 50BYTE공간을 모두 차지하고 나머지는 공백으로 채운다. 주민번호, 사번, 코드 처럼
        길이가 같은 데이터를 저장할 때 유리하다.
*/
CREATE TABLE HEROES(
    HERO_ID NUMBER,
    HERO_NAME VARCHAR2(50),
    HERO_CODE CHAR(6)
);
SELECT * FROM HEROES;

-- EX) STUDENTS 테이블 STD_ID 학생번호(NUMBER), STD_NAME 학생명, KOR, ENG, MATH - NUMBER
CREATE TABLE STUDENTS(
    STD_ID NUMBER, 
    STD_NAME VARCHAR2(100),
    KOR NUMBER, 
    ENG NUMBER, 
    MATH NUMBER
);
SELECT * FROM STUDENTS;