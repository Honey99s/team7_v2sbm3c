DROP TABLE qna;

-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE qna CASCADE CONSTRAINTS; 
 
CREATE TABLE qna (
  qnano          NUMBER(10)     NOT NULL     PRIMARY KEY, -- 회원 번호, 레코드를 구분하는 컬럼 
  carno          NUMBER(10)     NOT NULL,
  customerno     NUMBER(10)     NOT NULL,
  id             VARCHAR(30)    NOT NULL    UNIQUE, -- 이메일(아이디), 중복 안됨, 레코드를 구분 
  cname          VARCHAR(30)    NOT NULL, -- 성명, 한글 10자 저장 가능
  tel            VARCHAR(14)    NOT NULL, -- 전화번호
  cdate          DATE           NOT NULL, -- 가입일    
  grade          NUMBER(2)      NOT NULL, -- 등급(1~10: 관리자, 11~20: 회원, 30~39: 비회원, 40~49: 정지 회원, 99: 탈퇴 회원)
  title          VARCHAR2(100)  NOT NULL,
  content        CLOB           NOT NULL,
  FOREIGN KEY (carno) REFERENCES car (carno),
  FOREIGN KEY (customerno) REFERENCES customer (customerno)
);
 
COMMENT ON TABLE QNA is '문의사항';
COMMENT ON COLUMN QNA.QNANO is '고객 번호';
COMMENT ON COLUMN QNA.CARNO is '자동차 번호';
COMMENT ON COLUMN QNA.CUSTOMERNO is '고객 번호';
COMMENT ON COLUMN QNA.ID is '아이디';
COMMENT ON COLUMN QNA.CNAME is '성명';
COMMENT ON COLUMN QNA.TEL is '전화번호';
COMMENT ON COLUMN QNA.CDATE is '가입일';
COMMENT ON COLUMN QNA.GRADE is '등급';
COMMENT ON COLUMN QNA.TITLE is '제목';
COMMENT ON COLUMN QNA.CONTENT is '내용';

DROP SEQUENCE qna_seq;
CREATE SEQUENCE qna_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지