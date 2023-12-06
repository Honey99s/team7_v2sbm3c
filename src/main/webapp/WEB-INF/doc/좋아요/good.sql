DROP TABLE good;
CREATE TABLE good(
  goodno                    NUMBER(10) NOT NULL PRIMARY KEY,
  carno                     NUMBER(10) NOT NULL,
  customerno                NUMBER(10) NOT NULL,
  rdate                     DATE       NOT NULL,
  FOREIGN KEY (customerno) REFERENCES customer (customerno),
  FOREIGN KEY (carno) REFERENCES car (carno)
);

COMMENT ON TABLE good is '좋아요';
COMMENT ON COLUMN good.goodno is '좋아요 번호';
COMMENT ON COLUMN good.carno is '자동차 번호';
COMMENT ON COLUMN good.customerno is '회원 번호';
COMMENT ON COLUMN good.rdate is '등록일';

DROP SEQUENCE good_seq;
CREATE SEQUENCE good_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO good(goodno, carno, customerno, rdate)
VALUES(good_seq.nextval, 1, '1', sysdate);

SELECT goodno, carno, customerno, rdate
FROM good
ORDER BY goodno DESC;