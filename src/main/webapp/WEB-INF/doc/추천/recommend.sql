DROP TABLE RECOMMEND;

CREATE TABLE RECOMMEND (
  RECOMMENDNO NUMBER(10)         NOT NULL PRIMARY KEY, -- 회원 번호, 레코드를 구분하는 컬럼 
  MODELNO     NUMBER(10)         NOT NULL,
  CARNO       NUMBER(10)         NOT NULL, 
  CUSTOMERNO  NUMBER(10)         NOT NULL,
  TITLE       VARCHAR2(100)      NOT NULL,
  CONTENT     CLOB               NOT NULL,
  RDATE       DATE               NOT NULL,
  FOREIGN KEY (MODELNO) REFERENCES MODEL (MODELNO),
  FOREIGN KEY (CARNO) REFERENCES CAR (CARNO),
  FOREIGN KEY (CUSTOMERNO) REFERENCES CUSTOMER (CUSTOMERNO)
);

COMMENT ON TABLE RECOMMEND is '추천';
COMMENT ON COLUMN RECOMMEND.MODELNO is '차종 번호';
COMMENT ON COLUMN RECOMMEND.CARNO is '자동차 번호';
COMMENT ON COLUMN RECOMMEND.CUSTOMERNO is '고객 번호';
COMMENT ON COLUMN RECOMMEND.TITLE is '제목';
COMMENT ON COLUMN RECOMMEND.CONTENT is '내용';
COMMENT ON COLUMN RECOMMEND.RDATE is '등록일';

DROP SEQUENCE recommend_seq;
CREATE SEQUENCE recommend_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO recommend(recommendno, modelno, carno, customerno, title, content, rdate)
VALUES (recommend_seq.nextval, 1, 1, 1, "자녀 2명 ,연봉 5000", "suv 스포티지 를 추천합니다.", sysdate);

COMMIT;

조회
SELECT recommendno, modelno, carno, customerno, title, content, rdate
FROM recommend
WHERE recommendno = 1;