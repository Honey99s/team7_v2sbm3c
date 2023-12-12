DROP TABLE CHATBOT;

CREATE TABLE CHATBOT(
    CHATBOTNO                NUMBER(10)       NOT NULL PRIMARY KEY,
    CUSTOMERNO               NUMBER(10)       NOT NULL,
    RECORD                   VARCHAR(50)      NOT NULL,
    CDATE                     DATE             NOT NULL,                
    FOREIGN KEY (CUSTOMERNO) REFERENCES CUSTOMER (CUSTOMERNO)
);

COMMENT ON TABLE CHATBOT is '챗봇';
COMMENT ON COLUMN CHATBOT.CHATBOTNO is '챗봇 번호';
COMMENT ON COLUMN CHATBOT.CUSTOMERNO is '고객 번호';
COMMENT ON COLUMN CHATBOT.RECORD is '기록';
COMMENT ON COLUMN CHATBOT.CDATE is '등록일';



DROP SEQUENCE chatbot_seq;
CREATE SEQUENCE chatbot_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
1) 등록

INSERT INTO chatbot(chatbotno, customerno, record, cdate)
VALUES (chatbot_seq.nextval, 1, '안녕 반가워', sysdate);

2) 목록
- 검색을 하지 않는 경우, 전체 목록 출력
 
SELECT chatbotno, customerno, record, cdate
FROM chatbot
ORDER BY chatbotno ASC, customerno ASC;
     
     
3. 조회
 
SELECT chatbotno, customerno, record, cdate
FROM chatbot
WHERE customerno = 1;

    
4. 수정
UPDATE chatbot 
SET record='어떤 종류의 차량을 원하세요?'
WHERE customerno=1 and qnano = 1;

COMMIT;

5. 삭제
1) 모두 삭제
DELETE FROM chatbot;
 
2) 특정 챗봇 삭제
DELETE FROM chatbot
WHERE chatbotno=3;

COMMIT;