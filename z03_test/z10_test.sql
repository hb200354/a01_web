CREATE TABLE morning_shift ( emp_name VARCHAR2(30) );
CREATE TABLE afternoon_shift ( emp_name VARCHAR2(30) );

INSERT INTO morning_shift VALUES ('김철수');
INSERT INTO morning_shift VALUES ('이영희');
INSERT INTO morning_shift VALUES ('박민수');

INSERT INTO afternoon_shift VALUES ('이영희'); -- (오전/오후 둘 다 근무)
INSERT INTO afternoon_shift VALUES ('최지민');
INSERT INTO afternoon_shift VALUES ('박민수'); -- (오전/오후 둘 다 근무)
COMMIT;


drop table DEPARTMENTS;
drop table EMPLOYEES;

/* ==================================================
  테이블 생성 (DDL) : DEPARTMENTS, EMPLOYEES
================================================== 
*/

-- DEPARTMENTS (부서) 테이블 생성
CREATE TABLE DEPARTMENTS (
    DEPT_ID NUMBER(4) CONSTRAINT PK_DEPT_ID PRIMARY KEY,
    DNAME VARCHAR2(30) NOT NULL,
    LOCATION VARCHAR2(30)
);

-- EMPLOYEES (사원) 테이블 생성
CREATE TABLE EMPLOYEES (
    EMP_ID NUMBER(6) CONSTRAINT PK_EMP_ID PRIMARY KEY,
    ENAME VARCHAR2(25) NOT NULL,
    JOB_ID VARCHAR2(10) NOT NULL,
    MGR_ID NUMBER(6),
    HIREDATE DATE,
    SALARY NUMBER(8, 2),
    COMM_PCT NUMBER(4, 2),
    DEPT_ID NUMBER(4) CONSTRAINT FK_DEPT_ID REFERENCES DEPARTMENTS
);

/* ==================================================
  데이터 입력 (DML) : DEPARTMENTS, EMPLOYEES
================================================== 
*/

-- DEPARTMENTS 데이터 입력
INSERT INTO DEPARTMENTS VALUES (10, 'Administration', '서울');
INSERT INTO DEPARTMENTS VALUES (20, 'Marketing', '토론토');
INSERT INTO DEPARTMENTS VALUES (30, 'Purchasing', '시애틀');
INSERT INTO DEPARTMENTS VALUES (40, 'Human Resources', '서울');
INSERT INTO DEPARTMENTS VALUES (50, 'Shipping', '사우스 SF');
INSERT INTO DEPARTMENTS VALUES (60, 'IT', '사우스 SF');
INSERT INTO DEPARTMENTS VALUES (80, 'Sales', '서울');
INSERT INTO DEPARTMENTS VALUES (90, 'Executive', '시애틀');

-- EMPLOYEES 데이터 입력
INSERT INTO EMPLOYEES VALUES (100, 'Steven King', 'AD_PRES', NULL, TO_DATE('1987-06-17', 'YYYY-MM-DD'), 24000, NULL, 90);
INSERT INTO EMPLOYEES VALUES (101, 'Neena Kochhar', 'AD_VP', 100, TO_DATE('1989-09-21', 'YYYY-MM-DD'), 17000, NULL, 90);
INSERT INTO EMPLOYEES VALUES (102, 'Lex De Haan', 'AD_VP', 100, TO_DATE('1993-01-13', 'YYYY-MM-DD'), 17000, NULL, 90);
INSERT INTO EMPLOYEES VALUES (103, 'Alexander Hunold', 'IT_PROG', 102, TO_DATE('1990-01-03', 'YYYY-MM-DD'), 9000, NULL, 60);
INSERT INTO EMPLOYEES VALUES (104, 'Bruce Ernst', 'IT_PROG', 103, TO_DATE('1991-05-21', 'YYYY-MM-DD'), 6000, NULL, 60);
INSERT INTO EMPLOYEES VALUES (145, 'John Russell', 'SA_MAN', 100, TO_DATE('1996-10-01', 'YYYY-MM-DD'), 14000, 0.4, 80);
INSERT INTO EMPLOYEES VALUES (146, 'Karen Partners', 'SA_MAN', 100, TO_DATE('1997-01-05', 'YYYY-MM-DD'), 13500, 0.3, 80);
INSERT INTO EMPLOYEES VALUES (200, 'Jennifer Whalen', 'AD_ASST', 101, TO_DATE('1987-09-17', 'YYYY-MM-DD'), 4400, NULL, 10);
INSERT INTO EMPLOYEES VALUES (201, 'Michael Hartstein', 'MK_MAN', 100, TO_DATE('1996-02-17', 'YYYY-MM-DD'), 13000, NULL, 20);
INSERT INTO EMPLOYEES VALUES (205, 'Shelley Higgins', 'AC_MGR', 101, TO_DATE('1994-06-07', 'YYYY-MM-DD'), 12000, NULL, 90);
INSERT INTO EMPLOYEES VALUES (206, 'William Gietz', 'AC_ACCOUNT', 205, TO_DATE('1994-06-07', 'YYYY-MM-DD'), 8300, NULL, 90);

-- 변경사항 저장
COMMIT;


CREATE TABLE employee (
  emp_id NUMBER,
  emp_name VARCHAR2(50),
  department VARCHAR2(30)
);

CREATE TABLE candidate (
  cand_id NUMBER,
  cand_name VARCHAR2(50),
  applied_dept VARCHAR2(30)
);

-- 재직자 데이터
INSERT INTO employee VALUES (101, '김개발', 'IT');
INSERT INTO employee VALUES (102, '박기획', 'Planning');
INSERT INTO employee VALUES (103, '이영업', 'Sales');

-- 지원자 데이터
INSERT INTO candidate VALUES (901, '나신입', 'IT');
INSERT INTO candidate VALUES (902, '오경력', 'Sales');
INSERT INTO candidate VALUES (903, '박기획', 'IT'); -- '박기획'은 재직 중인데 IT 부서로 또 지원함
COMMIT;