/*
# ORACLE ALTER테이블을 통한 테이블 구조 변경
1. ALTER TABLE은 이미 생성된 테이블의 구조, 즉 뼈대를 수정하는 강력한 DDL(데이터 정의어) 명령어입니다.
   건물을 다 지은 뒤에 기둥(열)을 추가하거나, 방(열)의 크기를 바꾸거나, 불필요한 창문(열)을 없애는 등
   리모델링을 하는 것과 같습니다. 데이터가 아닌 테이블의 정의 자체를 변경할 때 사용합니다.
2. 핵심 키워드
   ALTER TABLE에서 가장 자주 쓰이는 핵심 기능 네 가지를  에모드려!! 한마디로 외워보세요..
   에(ADD) : 새로운 열 추가요!!  EX) ALTER TABLE EMP01
                                   ADD DNAME VARCHAR2(50);  사원테이블에 DNAME 컬럼 추가.`
   모(MODIFY) : 모자라거나 남으니 수정 (타입, 크기, DEFAULT) EX) ALTER TABLE EMP01
                                                              MODIFY ENAME VARCHAR2(100);
                                                            사원테이블의 ENAME의 크기를 100로 변경
   드(DROP) : 드디어 필요 없는 열 삭제 EX) ALTER TABLE EMP01
                                         DROP COLUMN COMM;   COMM컬럼을 삭제 처리
   려(RENAME) : 어려운 이름, 새 이름으로 변경   EX) ALTER TABLE EMP01
                                                  RENAME COLUMN SAL TO SALARY;
                                                사원테이블의 SAL컬럼을 SALARY 컬럼으로 변경
    WINDOW +SHIFT + S : 캡쳐                                            
*/
SELECT * FROM EMP01; -- ctl + enter 실행 단축키

-- 컬럼추가..
ALTER TABLE EMP01
ADD DNAME VARCHAR2(50);
SELECT * FROM HERO_LIST;
--- ex) POINT NUMBER 로 해당 컬럼을 HERO_LIST에 추가하세요..
ALTER TABLE HERO_LIST
ADD POINT NUMBER;
-- 구조의 변경
ALTER TABLE EMP01
MODIFY DNAME VARCHAR2(100); -- MODIFY 컬럼명 데이터유형
ALTER TABLE EMP01   -- CTRL + 마우스 클릭..
MODIFY DEPTNO NUMBER(10,2); -- 전체자리수는 10자리 그중에 소숫점이하는 2자리
-- EX) ENAME VARCHAR2(50), MGR NUMBER(10,3) 변경
ALTER TABLE EMP01 
MODIFY ( ENAME VARCHAR2(50), MGR NUMBER(10,3) );

SELECT * FROM EMP01;
ALTER TABLE EMP01
DROP COLUMN DNAME;
-- EX) HERO_LIST의 POINT 컬럼을 삭제 처리하세요
SELECT * FROM HERO_LIST;
ALTER TABLE HERO_LIST
DROP COLUMN POINT;
-- 컬럼명 변경
SELECT * FROM EMP01;
ALTER TABLE EMP01
RENAME COLUMN SAL TO SALARY;
-- EX) HERO_LIST에서 HERO_NAME을 NAME으로 변경하세요.
SELECT * FROM HERO_LIST;
ALTER TABLE HERO_LIST
RENAME COLUMN HERO_NAME TO NAME;
-- 테이블 삭제처리 1 DDL 방식으로 데이터 삭제
-- DELETE FROM 테이블; - 전체데이터 삭제... DML방식.. - 속도 걸리지만 원복 가능
CREATE TABLE DEPT04
AS SELECT * FROM DEPT;
SELECT * FROM DEPT04;
DELETE FROM DEPT04;
ROLLBACK;
SELECT * FROM DEPT04;
TRUNCATE TABLE DEPT04; -- DDL(DATA DEFINITION LANGUAGE) 방식


