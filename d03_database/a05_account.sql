/*
# 계정 생성(DCL) 
1. 모든 개발자가 최고 관리자(SYSTEM)계정 하나로 접속해서 작업하면 보안 사고가 터질 것이다.
때문에 직접 DB의 주인이 되어, 필요한 사람에게만 CREATE USER를 발급하고, GRANT를 부여하는 법을 배우자.
* 이것을 DCL(DATA CONTROL LANGUAGE), 즉 데이터 제어어라고 부른다.

# 권한 부여 GRANT...TO...
1. 키워드
    GRANT: 주다, 수여하다 - 권한 줄 때 사용
    TO : ..에게 - 권한 받을 대상 지정
2. 역할
    CONNECT (접속권한) - DB 접속 권한
    RESOURCE (사용 권한) - 테이블, 시퀀스 등 자원 생성/사용 권한
    DBA (마스터 키) - 관리자 권한
    EX) GRANT CONNECT, RESOURCE TO KING_DEV;
        * KING_DEV에게 접속권과 자원 사용권 수여
    EX) GRANT GRANT ANY PRIVILEGE TO SCOTT; 
        * SCOTT 계정에 시스템의 모든 권한(DBA권한 포함) 다른 사용자에게 부여할 수 있는 권한 부여

# 계정 생성 CREATE USER ... IDENTIFIED BY ...(ID카드 발급)
    CREATE USER : 계정(사용자) 생성
    IDENTIFIED BY : @@로 식별되는 비밀번호 지정
    EX) CREATE USER KING_DEV IDENTIFIED BY 1234
        * KING_DEV라는 ID를 1234 비번으로 발급
*/
CREATE USER USER02 IDENTIFIED BY 1234;
GRANT CONNECT TO USER02;
GRANT RESOURCE TO USER02;
REVOKE RESOURCE FROM USER02;