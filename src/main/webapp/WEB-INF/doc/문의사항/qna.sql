DROP TABLE qna;

-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE qna CASCADE CONSTRAINTS; 
 
CREATE TABLE qna (
  qnano          NUMBER(10)     NOT NULL     PRIMARY KEY, -- 회원 번호, 레코드를 구분하는 컬럼 
  carno          NUMBER(10)     NOT NULL,
  customerno     NUMBER(10)     NOT NULL,
  id             VARCHAR(20)    NOT NULL    UNIQUE, -- 이메일(아이디), 중복 안됨, 레코드를 구분 
  cname          VARCHAR(10)    NOT NULL, -- 성명, 한글 10자 저장 가능
  title          VARCHAR(30)  NOT NULL,
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
COMMENT ON COLUMN QNA.TITLE is '제목';
COMMENT ON COLUMN QNA.CONTENT is '내용';

DROP SEQUENCE qna_seq;
CREATE SEQUENCE qna_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
1) 등록
INSERT INTO qna(qnano, carno, customerno, id, cname, title, content)
VALUES (qna_seq.nextval, 1, 1, 'user2@gmail.com', '이동우','차 얼마임?', '승용차 5인승 얼마임?');

2) 목록
- 검색을 하지 않는 경우, 전체 목록 출력
 
SELECT qnano, carno, customerno, id, cname, title, content
FROM qna
ORDER BY qnano ASC, customerno ASC;
     
     
3. 조회
 
1) user1@gmail.com 사원 정보 보기
SELECT qnano, carno, customerno, id, cname, title, content
FROM qna
WHERE customerno = 1;

    
4. 수정
UPDATE qna 
SET id='dleh6454@naver.com'
WHERE customerno=1 and qnano = 1;

COMMIT;

5. 삭제
1) 모두 삭제
DELETE FROM qna;
 
2) 특정 회원 삭제
DELETE FROM qna
WHERE qnano=3;

COMMIT;