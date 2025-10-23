/*
# 오라클 시퀀스(SEQUENCE)
1. 오라클의 시퀀스는 자동으로 순서가 있는 번호를 생성하는 객체다
2. 개발자가 직접 수정하면, 번호가 꼬이거나 중복될 수 있다.
3. 시퀀스라는 번호표를 DB에 만들어 놓고, 데이터가 추가될 때마다 요청하면 중복되지 않는 고유 번호를 받을 수 있다.
4. 기본 형식
    1) DEFAULT
        생성 : CREATE SEQUENCE 시퀀스명; - 기본적으로 1부터 시작해서 1씩 늘어나는 시퀀스가 만들어짐
        사용 : 시퀀스명.NEXTVAL; 번호 호출하고, 다음 호출시 NUMBERING하여 증가
               시퀀스명.CURRVAL; 현재 번호를 호출하고, 다음 호출 시 현재번호가 호출됨.
*/
CREATE SEQUENCE SEQ01;
SELECT SEQ01.NEXTVAL FROM DUAL;
SELECT SEQ01.CURRVAL FROM DUAL;
---ex) 기본 sequence 만들기, 시쿼스명  board_seq01이라고 하고, 데이터가 증가 및 현재 sequence번호를 출력하세요.
CREATE SEQUENCE BOARD_SEQ01;
SELECT BOARD_SEQ01.NEXTVAL FROM DUAL;
SELECT BOARD_SEQ01.CURRVAL FROM DUAL;
/*
? 필요한것
1) 코드값이 정해져서 만들어진 ..- 자리수가 정해지고, 특정 문자 AE00005 조합
2) 초기값을 1000,  자리수 지정이 필요..
3) 증가/감소단위 설정하고, 2씩 또는 그 이상으로 증감 처리되게 하는 것이 필요..

# sequence의 기본 옵션들..
CREATE SEQUENCE 시퀀스명
	START WITH 시작 숫자
	INCREMENT BY 증가 숫자
	MAXVALUE 최대 숫자
	MINVALUE 최소 숫자;
	
	CYCLE/NOCYCL   최대값 도달 시 다시 처음(최소값)부터 시작
	CACHE/NOCACHE    미리 번호표를 몇 개 뽑아 메모에 둘지, 속도 향상요, 기본값 CACHE 20
	
	