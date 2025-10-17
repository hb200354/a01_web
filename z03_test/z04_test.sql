DROP TABLE BOOKS;
-- 테이블 생성
CREATE TABLE books (
    book_id NUMBER,
    title VARCHAR2(100),
    author VARCHAR2(100)
);

-- 데이터 삽입
INSERT INTO books VALUES (1, 'Oracle Database SQL', '이것이(Oracle)');
INSERT INTO books VALUES (2, 'SQL 전문가를 위한 Oracle', '전문가(Oracle)');
INSERT INTO books VALUES (3, 'Java의 정석 part.1', '남궁성(Java)');
INSERT INTO books VALUES (4, 'Java의 정석 part.2', '남궁성(Java)');

COMMIT;