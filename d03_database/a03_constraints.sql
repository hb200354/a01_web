/*
# 오라클 제약조건(constraints)
1. 오라클의 제약조건은 테이블에 데이터를 입력, 수정, 삭제할 때, 데이터의 무결성를
	지키기 위해 설정하는 강력한 규칙(위반데이터 위 입력,수정,삭제가 처리되지 않는다)입니다.
	1) 가장 쉬운 비유는 회원가입 폼의 규칙 또는 클럽 입구의 문지기입니다.
	- 아이디는 중복되면 안 됩니다.(unique)
	- 비밀번호는 반드시 입력해야 합니다.(not null)
	- 나이는 19세 이상만 받습니다.(check)
	- 가입 시 선택한 부서 코드는 부서 테이블에 실제로 존재해야 합니다.(foreign key)
	- 모든 회원을 구별할 주민번호는 필수이고 중복될 수 없습니다.(primary key)
	
	이런 규칙(제약조건)이 없으면, 테이블에는 이름도 없는 유령 회원, 나이가 -5살인 회원, 
	있지도 않는 부서에 소속된 회원 등 쓰레기 데이터가 쌓이게 됩니다.
2. 제약조건의 5가지 종류
	1) PRIMARY KEY(PK) : 기본키 - VIP명단 대조(신분증 검사) NOT NULL + UNIQUE
	2) NOT NULL(NN) - 필수입력 - 이름은 적고 오세요. 해당 컬럼에 NULL값을 허용하지 않음.
	3) UNIQUE KEY(UK) - 중복 검사 - PK처럼 중복을 허용하지 않지만, NULL은 허용된다.
			유일한, 말 그대로 이 값은 유일해야 해!!  
	4) FOREGIN KEY(FK) - 외래키(참조) - 초대장(부서코드)확인. 다른 테이블(부모)의 PK나 UK를 참조
	5) CHECK(CK) - 데이터가 특정 조건을 만족하는지 검사. 정의된 CHECK 조건( 예 GENDER IN('M','F'))를 통과해야 합니다.
		CHECK - 확인하다 검사합니다. 조건 검사
*/
-- 어벤져스 영웅 등록 테이블 만들(PK, NN, UK, CK)
/*
1. HERO 테이블 만듭니다.
2. HERO_CODE : 영웅코드 PK - 중복되지 않고, NULL이 안되는 데이터
3. HERO_NAME : 이름 NN - 이름은 반드시 입력되게, NULL이 안되는 데이터
4. EMAIL : 이메일 UK - NULL은 허용되지만, 중복되지 않게..
5. AGE : 나이는 0살을 초과하게 - 특정범위로 지정하여 처리..
 * */
CREATE TABLE HERO(
	HERO_CODE NUMBER PRIMARY KEY, -- PK 경호원
	HERO_NAME VARCHAR2(50) NOT NULL, -- NN 경호원
	EMAIL VARCHAR2(100) UNIQUE, -- UK 경호원
	AGE NUMBER CHECK( AGE > 0 ) -- CK 경호원
);
SELECT * FROM HERO;
CREATE SEQUENCE HERO_SEQ
	START WITH 101;
SELECT HERO_SEQ.NEXTVAL FROM DUAL;
SELECT HERO_SEQ.CURRVAL FROM DUAL;
-- (성공) 모든 규칙 준수
INSERT INTO HERO VALUES(HERO_SEQ.CURRVAL, '아이언맨','iron@stark.com', 40);
SELECT * FROM HERO;
-- PK 위반!!
INSERT INTO HERO VALUES(HERO_SEQ.CURRVAL, '캡틴아메리카','CAP@usa.com', 35);
-- NN 위반 (이름 HERO_NAME이 NULL 설정되는 경우)
INSERT INTO HERO VALUES(HERO_SEQ.NEXTVAL,  NULL ,'thor@god.com', 31);
INSERT INTO HERO(HERO_CODE, EMAIL, AGE) VALUES(HERO_SEQ.NEXTVAL, 'thor2@god.com', 32);
-- UK 위반 (이메일 중복)
INSERT INTO HERO VALUES(HERO_SEQ.NEXTVAL,'헐크','iron@stark.com', 45 );
-- UK 위반되지 않는 경우.
INSERT INTO HERO VALUES(HERO_SEQ.NEXTVAL,'헐크','huk@stark.com', 45 );
INSERT INTO HERO VALUES(HERO_SEQ.NEXTVAL,'원더우먼',NULL, 27 );
-- CK 위반 (나이가 0가 아님..)
INSERT INTO HERO VALUES(HERO_SEQ.NEXTVAL,'스파이더맨','spider@q.com',-5);
-- CK 위반 되지 않음.
INSERT INTO HERO VALUES(HERO_SEQ.NEXTVAL,'스파이더맨','spider@q.com',18);
SELECT * FROM HERO;






--  NULL을 명시적으로 입력하지 않더라도, HERO_NAME 컬럼이 빠졌기때문에 에러 발생..
-- 정상 입력..
INSERT INTO HERO VALUES(HERO_SEQ.NEXTVAL,  '트로우' ,'thor@god.com', 31);
SELECT * FROM HERO;





-- 입력시에 다시 HERO_CODE안에 101이라고 중복된 데이터 입력하기에 에러가 발생(PK)
INSERT INTO HERO VALUES(HERO_SEQ.NEXTVAL, '캡틴아메리카','CAP@usa.com', 35);
SELECT *
FROM   ALL_CONSTRAINTS
WHERE  OWNER = 'SCOTT'
AND TABLE_NAME = 'STUDENTS01';
--- EX) PK연습, STUDENTS01 테이블 STUD_ID로 NUMBER으로 PRIMARY KEY설정 후, 테이블 생성
--- 1. STUDENTS01 테이블 생성
CREATE TABLE STUDENTS01(
	STUD_ID NUMBER PRIMARY KEY
);
SELECT * FROM STUDENTS01;
--  STUDENTS01_SEQ (시퀀스를 START WITH 1000)
--- 2. STUDENTS01_SEQ 시퀀스 생성
CREATE SEQUENCE STUDENTS01_SEQ
		START WITH 1000;
-- 	STUDENTS01_SEQ.NEXTVAL, STUDENTS01_SEQ.CURRVAL
SELECT STUDENTS01_SEQ.NEXTVAL FROM DUAL;
SELECT STUDENTS01_SEQ.CURRVAL FROM DUAL;

--- STUDENTS01테이블에 데이터입력시, PRIMARY KEY 제약조건이 걸릴 때, 벗어날 때를 구분하여 처리 확인
--  3. 정상적으로 입력되는 경우
INSERT INTO STUDENTS01 VALUES(STUDENTS01_SEQ.CURRVAL);
SELECT * FROM STUDENTS01;
INSERT INTO STUDENTS01 VALUES(STUDENTS01_SEQ.CURRVAL);


INSERT INTO STUDENTS01 VALUES(STUDENTS01_SEQ.NEXTVAL);
---	4. 입력되지 않는 경우 
INSERT INTO STUDENTS01 VALUES(STUDENTS01_SEQ.CURRVAL);

SELECT * FROM STUDENTS01;

--  5. PRIMARY KEY에 대한 설정 의미를 정리.
---    STUDENTS01안에 STUD_ID는 PRIMARY KEY로 설정되어 있기에, 동일한 데이터를 입력시, 에러 발생한다.
INSERT INTO STUDENTS01 VALUES(NULL);
--     또한 NULL(값이 없음) 데이터를 처리할 수 없다..
CREATE TABLE STUDENTS02(
	STUD_ID NUMBER
);
INSERT INTO STUDENTS02 VALUES(NULL);
SELECT * FROM STUDENTS02;


-- EX) DEPT20 테이블 생성하되 DNAME VARCHAR2(50) NOT NULL로 설정하여 테이블을 만든 후,
-- INSERT INTO DEPT20 VALUES('인사');
-- INSERT INTO DEPT20 VALUES('재무');
-- INSERT INTO DEPT20 VALUES(NULL);
-- 로 처리하고, 처리되는 DEPT21 DNAME VARCHAR2(50)과 비교해 보세요..
CREATE TABLE DEPT20(
	DNAME VARCHAR2(50) NOT NULL
);
INSERT INTO DEPT20 VALUES('인사');
INSERT INTO DEPT20 VALUES('재무');
INSERT INTO DEPT20 VALUES(NULL); -- NOT NULL 있기에 발생하는 에러..
SELECT * FROM DEPT20;
CREATE TABLE DEPT21(
	DNAME VARCHAR2(50)
);
INSERT INTO DEPT21 VALUES('인사');
INSERT INTO DEPT21 VALUES('재무');
INSERT INTO DEPT21 VALUES(NULL); -- 에러발생하지 않음..
SELECT * FROM DEPT21;
-- 테이블 GAME_USERS 에 NICKNANE을 VARCHAR2(50)지정하고 UK(UNIQUE)로 설정 후, 데이터를 입력되는 경우와
-- 입력되지 않는 경우를 구분하여 확인하세요..
CREATE TABLE GAME_USERS(
	NICKNAME VARCHAR2(50) UNIQUE
);
INSERT INTO GAME_USERS VALUES('HIMAN');
INSERT INTO GAME_USERS VALUES('HIGIRL');
INSERT INTO GAME_USERS VALUES('HIGIRL'); -- 두번 중복해서 입력시는 입력이 되지 않는다.
INSERT INTO GAME_USERS VALUES(NULL);
SELECT * FROM GAME_USERS;
-- STUDENTS03테이블에 컬럼으로 GRADE NUMBER(1,0)  1~3 학년까지만 입력되게 처리 BETWEEN 이용해서
-- CHECK 제약조건을 설정하세요..
CREATE TABLE STUDENTS03(
	GRADE NUMBER(1,0) CHECK(GRADE BETWEEN 1 AND 3)
);
INSERT INTO STUDENTS03 VALUES(1);
INSERT INTO STUDENTS03 VALUES(2);
INSERT INTO STUDENTS03 VALUES(3);
INSERT INTO STUDENTS03 VALUES(4);
INSERT INTO STUDENTS03 VALUES(NULL);
INSERT INTO STUDENTS03 VALUES(3);
--- CHECK 제약조건은 중복데이터도 넣을 수 있고, NULL도 넣을 수 있지만 해당 범위에 있는 데이터로만 입력 가능하다.
SELECT * FROM STUDENTS03;

SELECT *
FROM EMP 
WHERE SAL BETWEEN 1000 AND 3000;













