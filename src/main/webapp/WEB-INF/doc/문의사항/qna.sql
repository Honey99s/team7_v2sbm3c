DROP TABLE qna;

-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE qna CASCADE CONSTRAINTS; 
 
CREATE TABLE qna (
  QNANO          NUMBER(10)     NOT NULL     PRIMARY KEY, -- 회원 번호, 레코드를 구분하는 컬럼 
  PW             VARCHAR(20)    NOT NULL, -- 비밀번호, 글 수정이나 비밀글로 했을
  TITLE          VARCHAR(30)    NOT NULL,
  CONTENT        CLOB           NOT NULL,
  QDATE          DATE           NOT NULL,
);
 
COMMENT ON TABLE QNA is '문의사항';
COMMENT ON COLUMN QNA.QNANO is '문의사항 번호';
COMMENT ON COLUMN QNA.PW is '비밀번호';
COMMENT ON COLUMN QNA.TITLE is '제목';
COMMENT ON COLUMN QNA.CONTENT is '내용';
COMMENT ON COLUMN QNA.QDATE is '등록일';

DROP SEQUENCE qna_seq;
CREATE SEQUENCE qna_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
1) 등록
INSERT INTO qna(qnano, pw, title, content, qdate)
VALUES (qna_seq.nextval, 1, '1234','차 얼마임?', '승용차 5인승 얼마임?');

2) 목록
- 검색을 하지 않는 경우, 전체 목록 출력
 
SELECT qnano, pw, title, content, qdate
FROM qna
ORDER BY qnano ASC;
     
     
3. 조회
 
SELECT qnano, pw, title, content, qdate
FROM qna
WHERE qnano = 1;

    
4. 수정
UPDATE qna 
SET title='차 얼마일까요?',
    content= '승용차 5인승 얼마일까요?'
WHERE qnano = 1;

COMMIT;

5. 삭제
1) 모두 삭제
DELETE FROM qna;
 
2) 특정 회원 삭제
DELETE FROM qna
WHERE qnano=3;

COMMIT;

             
