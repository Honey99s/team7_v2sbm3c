DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE REVIEW;

CREATE TABLE REVIEW(
    REVIEWNO         NUMBER(10)       NOT NULL PRIMARY KEY, 
    CARNO            NUMBER(10)       NOT NULL,
    TITLE            VARCHAR2(100)    NOT NULL, 
    CONTENT          CLOB             NOT NULL,   
    RDATE            DATE             NOT NULL,
    FOREIGN KEY (CARNO) REFERENCES CAR (CARNO)
);

COMMENT ON TABLE REVIEW is '구매 후기';
COMMENT ON COLUMN REVIEW.REVIEWNO is '후기 번호';
COMMENT ON COLUMN REVIEW.CARNO is '자동차 번호';
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

INSERT INTO review(reviewno, carno, title, content, rdate)
VALUES(review_seq.nextval, 1, '구매 후기', '자녀2명 3000만원 이하 차량' ,sysdate);

2) 목록
- 검색을 하지 않는 경우, 전체 목록 출력
 
SELECT reviewno, carno, title, content, rdate
FROM review
ORDER BY reviewno ASC     
     
3. 조회
 
SELECT reviewno, carno, title, content, rdate
FROM review
WHERE reviewno = 1;
    
4. 수정
UPDATE review
SET carno = 3,
title='EV9 후기',
content='전기차라 효율이 좋습니다.'
WHERE reviewno=1;

COMMIT;

5. 삭제
1) 모두 삭제
DELETE FROM review;
 
2) 특정 챗봇 삭제
DELETE FROM review
WHERE reviewno=1;

COMMIT;
