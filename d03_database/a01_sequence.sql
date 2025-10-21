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
