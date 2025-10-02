
-- ===============================================================
-- 1. ACADEMY_DEPT : 학부 정보 테이블
-- 히어로의 소속 학부 정보를 관리합니다. (DEPT 테이블 역할)
-- ===============================================================
CREATE TABLE ACADEMY_DEPT (
    DEPT_CODE NUMBER(2) CONSTRAINT PK_DEPT1 PRIMARY KEY,
    DNAME     VARCHAR2(50),
    LOCATION  VARCHAR2(50)
);

INSERT INTO ACADEMY_DEPT VALUES (10, '전략전술학부', '본관');
INSERT INTO ACADEMY_DEPT VALUES (20, '초능력제어학부', '서관');
INSERT INTO ACADEMY_DEPT VALUES (30, '첨단장비학부', '지하연구소');


-- ===============================================================
-- 2. POWER_GRADE : 전투력 등급 테이블
-- 전투력(POWER_LV)에 따른 등급 정보를 관리합니다. (SALGRADE 테이블 역할)
-- ===============================================================
CREATE TABLE POWER_GRADE (
    GRADE      VARCHAR2(10),
    MIN_POWER  NUMBER,
    MAX_POWER  NUMBER
);

INSERT INTO POWER_GRADE VALUES ('S급', 3001, 9999);
INSERT INTO POWER_GRADE VALUES ('A급', 2001, 3000);
INSERT INTO POWER_GRADE VALUES ('B급', 1401, 2000);
INSERT INTO POWER_GRADE VALUES ('C급', 700, 1400);
INSERT INTO POWER_GRADE VALUES ('F급', 0, 699);


-- ===============================================================
-- 3. ACADEMY_STUDENT : 학생(히어로) 정보 테이블
-- 히어로 지망생들의 상세 정보를 관리합니다. (EMP 테이블 역할)
-- ===============================================================
CREATE TABLE ACADEMY_STUDENT (
    STUDENT_NO    NUMBER(4) CONSTRAINT PK_STUDENT1 PRIMARY KEY,
    SNAME         VARCHAR2(20),
    NICKNAME      VARCHAR2(50),
    MENTOR_NO     NUMBER(4),
    ENTRY_DATE    DATE,
    POWER_LV      NUMBER(5),
    BONUS_POINTS  NUMBER(5),
    DEPT_CODE     NUMBER(2) CONSTRAINT FK_DEPT_CODE1 REFERENCES ACADEMY_DEPT
);

INSERT INTO ACADEMY_STUDENT VALUES (1001, '김민준', '불꽃주먹', 1004, TO_DATE('2023-03-02', 'YYYY-MM-DD'), 1800, 300, 20);
INSERT INTO ACADEMY_STUDENT VALUES (1002, '이서연', '얼음공주', 1004, TO_DATE('2023-03-02', 'YYYY-MM-DD'), 2100, 500, 20);
INSERT INTO ACADEMY_STUDENT VALUES (1003, '박도윤', '천재해커', 1005, TO_DATE('2023-03-05', 'YYYY-MM-DD'), 1500, NULL, 30);
INSERT INTO ACADEMY_STUDENT VALUES (1004, '최지우', '밤의 추적자', NULL, TO_DATE('2022-03-02', 'YYYY-MM-DD'), 3500, 1000, 10);
INSERT INTO ACADEMY_STUDENT VALUES (1005, '정시우', '강철의 방패', 1004, TO_DATE('2022-03-02', 'YYYY-MM-DD'), 2900, NULL, 10);
INSERT INTO ACADEMY_STUDENT VALUES (1006, '윤채원', '음파', 1002, TO_DATE('2024-03-04', 'YYYY-MM-DD'), 1300, 100, 20);
INSERT INTO ACADEMY_STUDENT VALUES (1007, '강하준', '닥터 스트레인지', 1005, TO_DATE('2024-03-04', 'YYYY-MM-DD'), 2500, 200, 10);
INSERT INTO ACADEMY_STUDENT VALUES (1008, '임아린', '투명소녀', 1002, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 1100, NULL, 20);
INSERT INTO ACADEMY_STUDENT VALUES (1009, '신유찬', '로켓펀치', 1001, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 1900, 400, 30);
INSERT INTO ACADEMY_STUDENT VALUES (1010, '한지민', '아이언걸', 1003, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 2800, 800, 30);
INSERT INTO ACADEMY_STUDENT VALUES (1011, '송은우', '빛의 속도', 1002, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 2200, NULL, 20);
INSERT INTO ACADEMY_STUDENT VALUES (1012, '조정우', '마음의 소리', 1004, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 900, 50, 10);


-- ===============================================================
-- 스크립트 실행 후 데이터베이스에 변경사항을 영구 저장합니다.
-- ===============================================================
COMMIT;