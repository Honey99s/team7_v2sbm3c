/**********************************/
/* Table Name: 댓글 */
/**********************************/
DROP TABLE reply;

CREATE TABLE reply(
        replyno                                NUMBER(10)         NOT NULL         PRIMARY KEY,
        carno                           NUMBER(10)    NOT     NULL ,
        customerno                            NUMBER(6)         NOT NULL ,
        content                               VARCHAR2(1000)         NOT NULL,
        passwd                                VARCHAR2(20)         NOT NULL,
        rdate                              DATE NOT NULL,
  FOREIGN KEY (carno) REFERENCES car (carno),
  FOREIGN KEY (customerno) REFERENCES customer (customerno)
);

COMMENT ON TABLE reply is '댓글';
COMMENT ON COLUMN reply.replyno is '댓글번호';
COMMENT ON COLUMN reply.carno is '자동차번호';
COMMENT ON COLUMN reply.customerno is '고객 번호';
COMMENT ON COLUMN reply.content is '내용';
COMMENT ON COLUMN reply.passwd is '비밀번호';
COMMENT ON COLUMN reply.rdate is '등록일';

DROP SEQUENCE reply_seq;
CREATE SEQUENCE reply_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지


1) 등록
INSERT INTO reply(replyno, carno, customerno, content, passwd, rdate)
VALUES(reply_seq.nextval, 10, 4, '댓글1', '1234', sysdate);
INSERT INTO reply(replyno, carno, customerno, content, passwd, rdate)
VALUES(reply_seq.nextval, 5, 3, '댓글2', '1234', sysdate);
INSERT INTO reply(replyno, carno, customerno, content, passwd, rdate)
VALUES(reply_seq.nextval, 5, 3, '댓글3', '1234', sysdate);        

commit;

2) 전체 목록
SELECT replyno, carno, customerno, content, passwd, rdate
FROM reply
ORDER BY replyno DESC;

   REPLYNO      CARNO CUSTOMERNO CONTENT     PASSWD               RDATE              
---------- ---------- ---------- ---------- -------------------- -------------------
         3          5          3 댓글3        1234                 2023-12-21 11:13:25
         2          5          3 댓글2        1234                 2023-12-21 11:13:25
         1          5          3 댓글1        1234                 2023-12-21 11:13:25

       
3) reply + customer join 목록
SELECT c.id,
          r.replyno, r.carno, r.customerno, r.content, r.passwd, r.rdate
FROM customer c,  reply r
WHERE c.customerno = r.customerno
ORDER BY r.replyno DESC;

4) reply + customer join + 특정 carno 별 목록
SELECT c.id,
           r.replyno, r.carno, r.customerno, r.content, r.passwd, r.rdate
FROM customer c,  reply r
WHERE (c.customerno = r.customerno) AND r.carno=10
ORDER BY r.replyno DESC;

ID                                REPLYNO      CARNO CUSTOMERNO CONTENT   PASSWD   RDATE              
------------------------------ ---------- ---------- ---------- --------  -------  --------------------
user1@gmail.com                         3          5          3 댓글3       1234    2023-12-21 11:13:25
user1@gmail.com                         2          5          3 댓글2       1234    2023-12-21 11:13:25
user1@gmail.com                         1          5          3 댓글1       1234    2023-12-21 11:13:25
 

5) 삭제
-- 패스워드 검사
SELECT count(passwd) as cnt
FROM reply
WHERE replyno=1 AND passwd='1234';

 CNT
 ---
   1
   
-- 삭제
DELETE FROM reply
WHERE replyno=1;

6) carno에 해당하는 댓글 수 확인 및 삭제
SELECT COUNT(*) as cnt
FROM reply
WHERE carno=5;

 CNT
 ---
   1

DELETE FROM reply
WHERE carno=1;

7) customerno에 해당하는 댓글 수 확인 및 삭제
SELECT COUNT(*) as cnt
FROM reply
WHERE customerno=1;

 CNT
 ---
   1

DELETE FROM reply
WHERE customerno=1;
 
8) 삭제용 패스워드 검사
SELECT COUNT(*) as cnt
FROM reply
WHERE replyno=1 AND passwd='1234';

 CNT
 ---
   0

9) 삭제
DELETE FROM reply
WHERE replyno=1;
