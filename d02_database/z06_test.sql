CREATE TABLE Idols (
    IdolID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    DebutYear NUMBER,
    GroupID NUMBER,
    SunbaeID NUMBER -- 롤모델 또는 멘토 선배의 ID
);

CREATE TABLE Groups (
    GroupID NUMBER PRIMARY KEY,
    GroupName VARCHAR2(50)
);

CREATE TABLE DebutEras (
    EraName VARCHAR2(50),
    StartYear NUMBER,
    EndYear NUMBER
);


-- 데이터 입력 스크립트 --

-- Idols 테이블 데이터
INSERT INTO Idols (IdolID, Name, DebutYear, GroupID, SunbaeID) VALUES (101, 'RM', 2013, 1, NULL);
INSERT INTO Idols (IdolID, Name, DebutYear, GroupID, SunbaeID) VALUES (102, '정국', 2013, 1, 101);
INSERT INTO Idols (IdolID, Name, DebutYear, GroupID, SunbaeID) VALUES (103, '제니', 2016, 2, NULL);
INSERT INTO Idols (IdolID, Name, DebutYear, GroupID, SunbaeID) VALUES (104, '리사', 2016, 2, NULL);
INSERT INTO Idols (IdolID, Name, DebutYear, GroupID, SunbaeID) VALUES (105, '아이유', 2008, NULL, NULL); -- 솔로 가수
INSERT INTO Idols (IdolID, Name, DebutYear, GroupID, SunbaeID) VALUES (106, '카리나', 2020, 3, 103);
INSERT INTO Idols (IdolID, Name, DebutYear, GroupID, SunbaeID) VALUES (107, '윈터', 2020, 3, NULL);
INSERT INTO Idols (IdolID, Name, DebutYear, GroupID, SunbaeID) VALUES (108, '이서', 2021, 4, 105);

-- Groups 테이블 데이터
INSERT INTO Groups (GroupID, GroupName) VALUES (1, '방탄소년단');
INSERT INTO Groups (GroupID, GroupName) VALUES (2, '블랙핑크');
INSERT INTO Groups (GroupID, GroupName) VALUES (3, '에스파');
INSERT INTO Groups (GroupID, GroupName) VALUES (5, 'NMIXX'); -- 이 그룹에 속한 아이돌은 아직 Idols 테이블에 없음

-- DebutEras 테이블 데이터
INSERT INTO DebutEras (EraName, StartYear, EndYear) VALUES ('2세대', 2004, 2012);
INSERT INTO DebutEras (EraName, StartYear, EndYear) VALUES ('3세대', 2013, 2017);
INSERT INTO DebutEras (EraName, StartYear, EndYear) VALUES ('4세대', 2018, 2023);


-- 변경사항 최종 저장 --
COMMIT;
