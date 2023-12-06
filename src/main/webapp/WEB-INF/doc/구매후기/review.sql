DROP TABLE REVIEW CASCADE CONSTRAINTS;

CREATE TABLE REVIEW(
    REVIEWNO         NUMBER(10)       NOT NULL PRIMARY KEY,
    MODELNO          NUMBER(10)       NOT NULL , 
    CARNO            NUMBER(10)       NOT NULL,
    CUSTOMERNO       NUMBER(10)       NOT NULL,
    TITLE            VARCHAR2(100)    NOT NULL, 
    CONTENT          CLOB             NOT NULL,   
    RDATE            DATE             NOT NULL,
    FOREIGN KEY (MODELNO) REFERENCES MODEL (MODELNO),
    FOREIGN KEY (CARNO) REFERENCES CAR (CARNO),
    FOREIGN KEY (CUSTOMERNO) REFERENCES CUSTOMER (CUSTOMERNO)
);

COMMENT ON TABLE REVIEW is '구매 후기';
COMMENT ON COLUMN REVIEW.REVIEWNO is '후기 번호';
COMMENT ON COLUMN REVIEW.MODELNO is '차종 번호';
COMMENT ON COLUMN REVIEW.CARNO is '자동차 번호';
COMMENT ON COLUMN REVIEW.CUSTOMERNO is '고객 번호';
COMMENT ON COLUMN REVIEW.TITLE is '후기 제목';
COMMENT ON COLUMN REVIEW.CONTENT is '후기 내용';
COMMENT ON COLUMN REVIEW.RDATE is '등록일';

DROP SEQUENCE review_seq;
CREATE SEQUENCE review_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

INSERT INTO review(reviewno, modelno, carno, customerno, title, content, rdate) VALUES(review_seq.nextval, 1, 1, 1, '구매 후기', '자녀2명 3000만원 이하 차량' , sysdate);

COMMIT;