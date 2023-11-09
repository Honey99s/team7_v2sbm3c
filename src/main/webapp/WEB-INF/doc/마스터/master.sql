/**********************************/
/* Table Name: 마스터 */
-- 개인 프로젝트에서는 개발자가 유일한 관리자로 처리됨.
/**********************************/
DROP TABLE MASTER;

CREATE TABLE MASTER(
    MASTERNO    NUMBER(5)    NOT NULL,
    ID         VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 중복 안됨, 레코드를 구분 
    PASSWD     VARCHAR(15)   NOT NULL, -- 패스워드, 영숫자 조합
    NAME      VARCHAR(20)   NOT NULL, -- 성명, 한글 10자 저장 가능
    MDATE      DATE          NOT NULL, -- 가입일    
    GRADE      NUMBER(2)     NOT NULL, -- 등급(1~10: 마스터, 정지 마스터: 20, 탈퇴 마스터: 99)    
    PRIMARY KEY (MASTERNO)              -- 한번 등록된 값은 중복 안됨
);

COMMENT ON TABLE MASTER is '마스터';
COMMENT ON COLUMN MASTER.MASTERNO is '마스터 번호';
COMMENT ON COLUMN MASTER.ID is '아이디';
COMMENT ON COLUMN MASTER.PASSWD is '패스워드';
COMMENT ON COLUMN MASTER.NAME is '성명';
COMMENT ON COLUMN MASTER.MDATE is '가입일';
COMMENT ON COLUMN MASTER.GRADE is '등급';

DROP SEQUENCE MASTER_SEQ;

CREATE SEQUENCE MASTER_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지

-- CREATE
INSERT INTO master(masterno, id, passwd, name, mdate, grade)
VALUES(master_seq.nextval, 'master1', '0830', '마스터1', sysdate, 1);

INSERT INTO master(masterno, id, passwd, name, mdate, grade)
VALUES(master_seq.nextval, 'master2', '1234', '마스터2', sysdate, 1);


commit;

-- READ: List
SELECT masterno, id, passwd, name, mdate, grade FROM master ORDER BY masterno ASC;

  MASTERNO ID                   PASSWD          NAME                 MDATE                    GRADE
---------- -------------------- --------------- -------------------- ------------------- ----------
         1 master1              1234            마스터1              2023-09-14 05:03:08          1
         2 master2              1234            마스터2              2023-09-14 05:03:08          1
         
-- READ         
SELECT masterno, id, passwd, name, mdate, grade 
FROM master
WHERE masterno=1;

  MASTERNO ID                   PASSWD          NAME                 MDATE                    GRADE
---------- -------------------- --------------- -------------------- ------------------- ----------
         1 master1              1234            마스터1              2023-09-14 05:03:08          1
         
-- READ by id
SELECT masterno, id, passwd, name, mdate, grade 
FROM master
WHERE id='master1';

  MASTERNO ID                   PASSWD          NAME                 MDATE                    GRADE
---------- -------------------- --------------- -------------------- ------------------- ----------
         1 master1              1234            마스터1              2023-09-14 05:03:08          1

-- UPDATE
UPDATE master
SET passwd='1234', name='마스터1', mdate=sysdate, grade=1
WHERE masterno=1;

COMMIT;

-- DELETE
DELETE FROM master WHERE masterno=3;
         
-- 로그인, 1: 로그인 성공, 0: 로그인 실패
SELECT COUNT(*) as cnt
FROM master
WHERE id='master1' AND passwd='1234'; 


       CNT
----------
         1       