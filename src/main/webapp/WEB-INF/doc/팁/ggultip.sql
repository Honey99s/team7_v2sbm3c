DROP TABLE GGULTIP;

CREATE TABLE GGULTIP(
    GGULTIPNO    NUMBER(10)       NOT NULL PRIMARY KEY,
    CONTENT        CLOB             NOT NULL, 
    RDATE          DATE             NOT NULL
);

COMMENT ON TABLE GGULTIP is '꿀팁';
COMMENT ON COLUMN GGULTIP.GGULTIPNO is '꿀팁 번호';
COMMENT ON COLUMN GGULTIP.CONTENT is '꿀팁 내용';
COMMENT ON COLUMN GGULTIP.RDATE is '등록일';

DROP SEQUENCE ggultip_seq;
CREATE SEQUENCE ggultip_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  -- CREATE
INSERT INTO ggultip(ggultipno, content, rdate) VALUES(ggultip_seq.nextval, '꿀팁', sysdate);


-- SELECT
SELECT ggultipno, content, rdate
FROM ggultip
ORDER BY ggultipno DESC;

-- READ
SELECT ggultipno, content, rdate
FROM ggultip
WHERE ggultipno =1;

-- UPDATE
UPDATE ggultip SET content = "꿀팁"  WHERE ggultipno=1;

-- DELETE
DELETE FROM ggultip WHERE ggultipno=1;

COMMIT;