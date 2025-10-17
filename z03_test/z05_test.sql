CREATE TABLE KPOP_IDOLS (
    GROUP_ID    NUMBER(3) PRIMARY KEY, -- 그룹 고유 ID (PK)
    GROUP_NAME  VARCHAR2(50) NOT NULL, -- 그룹 이름 (한글)
    AGENCY      VARCHAR2(50) NOT NULL, -- 소속사 (한글)
    DEBUT_SONG  VARCHAR2(100),         -- 데뷔 곡 제목 (한글)
    MEMBERS     VARCHAR2(200)          -- 멤버 이름 (콤마로 구분된 문자열)
);
INSERT INTO KPOP_IDOLS (GROUP_ID, GROUP_NAME, AGENCY, DEBUT_SONG, MEMBERS) VALUES (
    101, 
    '방탄소년단', 
    '빅히트 뮤직', 
    'No More Dream', 
    'RM, 진, 슈가, 제이홉, 지민, 뷔, 정국'
);

INSERT INTO KPOP_IDOLS (GROUP_ID, GROUP_NAME, AGENCY, DEBUT_SONG, MEMBERS) VALUES (
    102, 
    '뉴진스', 
    '어도어', 
    'Attention', 
    '민지, 하니, 다니엘, 해린, 혜인'
);

INSERT INTO KPOP_IDOLS (GROUP_ID, GROUP_NAME, AGENCY, DEBUT_SONG, MEMBERS) VALUES (
    103, 
    '트와이스', 
    'JYP 엔터테인먼트', 
    'OOH-AHH하게', 
    '나연, 정연, 모모, 사나, 지효, 미나, 다현, 채영, 쯔위'
);

INSERT INTO KPOP_IDOLS (GROUP_ID, GROUP_NAME, AGENCY, DEBUT_SONG, MEMBERS) VALUES (
    104, 
    '에스파', 
    'SM 엔터테인먼트', 
    'Black Mamba', 
    '카리나, 지젤, 윈터, 닝닝'
);

INSERT INTO KPOP_IDOLS (GROUP_ID, GROUP_NAME, AGENCY, DEBUT_SONG, MEMBERS) VALUES (
    105, 
    '세븐틴', 
    '플레디스 엔터테인먼트', 
    '아낀다', 
    '에스쿱스, 정한, 조슈아, 준, 호시, 원우, 우지, 디에잇, 민규, 도겸, 승관, 버논, 디노'
);

COMMIT;
