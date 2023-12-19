DROP TABLE clogin;
CREATE TABLE clogin(
  cloginno                    NUMBER(10) NOT NULL PRIMARY KEY,
  customerno                NUMBER(10) NOT NULL,
  ip                            VARCHAR2(15) NOT NULL,
  logindate                  DATE NOT NULL,
  FOREIGN KEY (customerno) REFERENCES customer (customerno)
);

COMMENT ON TABLE clogin is '회원 로그인 내역';
COMMENT ON COLUMN clogin.cloginno is '로그인 번호';
COMMENT ON COLUMN clogin.customerno is '회원 번호';
COMMENT ON COLUMN clogin.ip is '접속 IP';
COMMENT ON COLUMN clogin.logindate is '로그인 날짜';

DROP SEQUENCE clogin_seq;
CREATE SEQUENCE clogin_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO clogin(cloginno, customerno, ip, logindate)
VALUES(clogin_seq.nextval, 3, '211.201.201.229', sysdate);

SELECT cloginno, customerno, ip, logindate FROM clogin ORDER BY cloginno DESC;

DELETE from clogin
WHERE cloginno=1;
