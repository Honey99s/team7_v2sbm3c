DROP TABLE CONDITION;

CREATE TABLE CONDITION(
    CONDITIONNO    NUMBER(10)       NOT NULL PRIMARY KEY,
    TITLE          VARCHAR2(100)    NOT NULL, 
    CONTENT        CLOB             NOT NULL, 
    MINPRICE       NUMBER(10)       NOT NULL, 
    MAXPRICE       NUMBER(10)       NOT NULL,   
    CHILDREN       NUMBER(10)       NOT NULL
);

COMMENT ON TABLE CONDITION is '조건';
COMMENT ON COLUMN CONDITION.CONDITIONNO is '조건 번호';
COMMENT ON COLUMN CONDITION.TITLE is '조건 제목';
COMMENT ON COLUMN CONDITION.CONTENT is '조건 내용';
COMMENT ON COLUMN CONDITION.MINPRICE is '최소 가격';
COMMENT ON COLUMN CONDITION.MAXPRICE is '최대 가격';
COMMENT ON COLUMN CONDITION.CHILDREN is '자녀수';

DROP SEQUENCE condition_seq;
CREATE SEQUENCE condition_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
-- CREATE
INSERT INTO condition(conditionno, title, content, minprice, maxprice, children) VALUES(condition_seq.nextval, '중고차 추천', '자녀2명에 2000만원~3000만원 사이의 차량 추천해주세요' , 2000, 3000, 2);
INSERT INTO condition(conditionno, title, content, minprice, maxprice, children) VALUES(condition_seq.nextval, '중고차 추천', '사회초년생 1000만원~1500만원 예산의 차량 추천해주세요' , 1000, 1500, 0);

-- SELECT
SELECT conditionno, title, content, minprice, maxprice, children
FROM condition
ORDER BY conditionno DESC;

-- READ
SELECT conditionno, title, content, minprice, maxprice, children
FROM condition
WHERE conditionno =1;

-- UPDATE
UPDATE condition SET minprice=3000, maxprice=4000, children=4 WHERE conditionno=3;

-- DELETE
DELETE FROM condition WHERE conditionno=2;

COMMIT;

