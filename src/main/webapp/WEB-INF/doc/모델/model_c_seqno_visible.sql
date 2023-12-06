/**********************************/
/* Table Name: 차종 */
/**********************************/
DROP TABLE model;

CREATE TABLE model(
		modelno                       		NUMBER(10)		 NOT NULL PRIMARY KEY,
		name                          		VARCHAR2(30)     NOT NULL,
		cnt                           		NUMBER(7)		 NOT NULL,
		rdate                         		DATE		     NOT NULL,
        seqno                               NUMBER(5)        DEFAULT 1  NOT NULL,
        visible                             CHAR(1)          DEFAULT 'N' NOT NULL
);

COMMENT ON TABLE model is '차종';
COMMENT ON COLUMN model.modelno is '차종 번호';
COMMENT ON COLUMN model.name is '차종류';
COMMENT ON COLUMN model.cnt is '관련 자료수';
COMMENT ON COLUMN model.rdate is '등록일';
COMMENT ON COLUMN model.seqno is '출력 순서';
COMMENT ON COLUMN model.visible is '출력 모드';

DROP SEQUENCE model_SEQ;

CREATE SEQUENCE model_SEQ
  START WITH 1         -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2              -- 2번은 메모리에서만 계산
  NOCYCLE;             -- 다시 1부터 생성되는 것을 방지
  
-- CREATE
INSERT INTO model(modelno, name, cnt, rdate) VALUES(model_seq.nextval, '경차', 0, sysdate);
INSERT INTO model(modelno, name, cnt, rdate) VALUES(model_seq.nextval, '승용차', 0, sysdate);
INSERT INTO model(modelno, name, cnt, rdate) VALUES(model_seq.nextval, '해치백', 0, sysdate);
INSERT INTO model(modelno, name, cnt, rdate) VALUES(model_seq.nextval, 'SUV', 0, sysdate);
INSERT INTO model(modelno, name, cnt, rdate) VALUES(model_seq.nextval, '승합차', 0, sysdate);


-- READ: LIST
SELECT * FROM model;
SELECT modelno, name, cnt, rdate, seqno, visible FROM model ORDER BY modelno ASC;
   MODELNO NAME                                  CNT RDATE                    SEQNO V
---------- ------------------------------ ---------- ------------------- ---------- -
         1 경차                                    0 2023-09-13 04:50:26          1 N
         2 승용차                                  0 2023-09-13 04:50:26          1 N
         3 SUV                                     0 2023-09-13 04:50:26          1 N
         4 승합차                                  0 2023-09-13 04:50:26          1 N

-- READ
SELECT modelno, name, cnt, rdate FROM model WHERE modelno=1;
  MODELNO NAME                                  CNT RDATE              
---------- ------------------------------ ---------- -------------------
         1 경차                                    0 2023-09-09 01:41:57 

-- UPDATE
UPDATE model SET name='소형차', cnt=1 WHERE modelno=1;
   MODELNO NAME                                  CNT RDATE              
---------- ------------------------------ ---------- -------------------
         1 소형차                                  1 2023-09-09 01:41:57

-- DELETE
DELETE FROM model WHERE modelno=8;

COMMIT;
-- COUNT
SELECT COUNT(*) as cnt FROM model;
       CNT
----------
         3
         
--우선 순위 높임, 10등 -> 1등
UPDATE model SET seqno = seqno - 1 WHERE modelno = 1;
SELECT modelno, name, cnt, rdate, seqno FROM model ORDER BY modelno ASC;

--우선 순위 낮춤, 1등 -> 10등
UPDATE model SET seqno = seqno + 1 WHERE modelno = 1;
SELECT modelno, name, cnt, rdate, seqno FROM model ORDER BY modelno ASC;

--READ: LIST
SELECT modelno, name, cnt, rdate, seqno FROM model ORDER BY seqno ASC;      

COMMIT;

-- 차종 공개 설정
UPDATE model SET visible='Y' WHERE modelno=1;
SELECT modelno, name, cnt, rdate, seqno, visible FROM model ORDER BY modelno ASC;

-- 차종 비공개 설정
UPDATE model SET visible='N' WHERE modelno=1;
SELECT modelno, name, cnt, rdate, seqno, visible FROM model ORDER BY modelno ASC;

-- 비회원/회원 SELECT LIST, id: list_all_Y
SELECT modelno, name, cnt, rdate, seqno, visible
FROM model
WHERE visible='Y'
ORDER BY seqno ASC;

COMMIT;
