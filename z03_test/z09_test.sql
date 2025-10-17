DROP TABLE DUNDER_MIFFLIN;
CREATE TABLE DUNDER_MIFFLIN (
    EMPLOYEE_ID NUMBER(4) PRIMARY KEY, -- 직원 ID
    FULL_NAME   VARCHAR2(50),          -- 이름
    POSITION  VARCHAR2(50),          -- 직책
    MANAGER_ID  NUMBER(4)              -- 매니저 ID
);
-- 지점장 (최상위 관리자)
INSERT INTO DUNDER_MIFFLIN VALUES (1001, '마이클 스캇', '지점장', NULL);

-- 중간 관리자 및 팀원 (마이클에게 보고)
INSERT INTO DUNDER_MIFFLIN VALUES (2001, '드와이트 슈루트', '판매 과장', 1001);
INSERT INTO DUNDER_MIFFLIN VALUES (2002, '짐 핼퍼트', '판매 부과장', 1001);
INSERT INTO DUNDER_MIFFLIN VALUES (2003, '팸 비즐리', '사무 관리자', 1001);

-- 짐 핼퍼트 팀의 인턴
INSERT INTO DUNDER_MIFFLIN VALUES (3001, '라이언 하워드', '인턴', 2002);

-- 회계팀 (마이클에게 보고)
INSERT INTO DUNDER_MIFFLIN VALUES (2004, '안젤라 마틴', '회계팀장', 1001);
INSERT INTO DUNDER_MIFFLIN VALUES (3002, '케빈 멀론', '회계팀원', 2004);
INSERT INTO DUNDER_MIFFLIN VALUES (3003, '오스카 마르티네즈', '회계팀원', 2004);

COMMIT;