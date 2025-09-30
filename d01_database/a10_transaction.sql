/*
# oracle DML 처리 후, 트랜잭션 처리
1. DML(INSERT, UPDATE, DELETE) 작업 후에는 변경된 내용을 데이터베이스에 영구적으로 저장할지,
아니면 취소할지를 결정해야 한다. 이 과정을 트랜잭션(Transaction)처리하고 하면, 데이터의 일관성과
안정성을 보장하는 매우 중요한 기능이다.
2. 핵심 개념
    1) 트랜잭션 : 데이터베이스 작업을 처리하는 하나의 논리적 단위. INSERT, UPDATE, DELETE 같은
    여러 DML 작업이 하나의 트랜잭션으로 묶일 수 있다.
    2) COMMIT(커밋) : 모든 DML 작업을 성공적으로 마치고, 변경된 내용을 데이터베이스에 영구적으로
    저장하는 명령어입니다. 커밋이 완료되면 이전 상태로 되돌릴 수 없다.
    3) ROLLBACK(롤백) : DML 작업 중 문제가 발생했거나, 작업을 취소하고 싶을 때 가장 마지막에
    COMMIT 시점 이후 모든 변경 사항을 취소하고 원래 상태로 되돌리는 명령어다.
    4) SAVEPOINT(세이브포인트) : 긴 트랜잭션 안에서 중간 저장 지점을 만드는 명령어다.
    문제가 생겼을 때 전체를 ROLLBACK하는 대신, 특정 SAVEPOINT 지점까지만 되돌아갈 수 있다.

    # VSCODE AUTOCOMMIT 비활성화 처리 
    설정(CTRL + ,)을 열어 settings.json 파일을 연다. 
    json 파일에서 "oracle.developerTools.autocommit": false
*/
SELECT * FROM EMP01;
DELETE FROM EMP01 WHERE EMPNO = 7369;
ROLLBACK;
