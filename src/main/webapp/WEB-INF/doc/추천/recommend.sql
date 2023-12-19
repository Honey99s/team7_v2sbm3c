DROP TABLE RECOMMEND;

CREATE TABLE RECOMMEND (
  RECOMMENDNO NUMBER(10)         NOT NULL PRIMARY KEY, -- 회원 번호, 레코드를 구분하는 컬럼 
  MODELNO     NUMBER(10)         NOT NULL,
  CUSTOMERNO  NUMBER(10)         NOT NULL,
  SEQ         NUMBER(2)          DEFAULT 1         NOT NULL,
  RDATE       DATE               NOT NULL,
  FOREIGN KEY (MODELNO) REFERENCES MODEL (MODELNO),
  FOREIGN KEY (CARNO) REFERENCES CAR (CARNO),
  FOREIGN KEY (CUSTOMERNO) REFERENCES CUSTOMER (CUSTOMERNO)
);

COMMENT ON TABLE RECOMMEND is '추천';
COMMENT ON COLUMN RECOMMEND.RECOMMENDNO is '추천 번호';
COMMENT ON COLUMN RECOMMEND.MODELNO is '차종 번호';
COMMENT ON COLUMN RECOMMEND.CUSTOMERNO is '고객 번호';
COMMENT ON COLUMN RECOMMEND.SEQ is '추천 우선 순위';
COMMENT ON COLUMN RECOMMEND.RDATE is '등록일';

DROP SEQUENCE recommend_seq;
CREATE SEQUENCE recommend_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO recommend(recommendno, modelno, customerno, seq, rdate)
VALUES(RECOMMEND_SEQ.nextval, 2, 3, 1, sysdate);

INSERT INTO recommend(recommendno, modelno, customerno, seq, rdate)
VALUES(RECOMMEND_SEQ.nextval, 2, 1, 1, sysdate);

COMMIT;

조회
SELECT recommendno, modelno, customerno, seq, rdate
FROM recommend
WHERE recommendno = 1;

SELECT recommendno, modelno, customerno, seq, rdate
FROM recommend
WHERE customerno = 3;

삭제
DELETE FROM recommend;
DELETE FROM recommend WHERE customerno=1;
COMMIT;