DROP TABLE mlogin;
CREATE TABLE mlogin(
  mloginno                    NUMBER(10) NOT NULL PRIMARY KEY,
  masterrno                NUMBER(10) NOT NULL,
  ip                            VARCHAR2(15) NOT NULL,
  logindate                  DATE NOT NULL,
  FOREIGN KEY (masterno) REFERENCES master (customerno)
);

COMMENT ON TABLE login is '로그인 내역';
COMMENT ON COLUMN login.loginno is '로그인 번호';
COMMENT ON COLUMN login.customerno is '회원 번호';
COMMENT ON COLUMN login.ip is '접속 IP';
COMMENT ON COLUMN login.logindate is '로그인 날짜';

DROP SEQUENCE login_seq;
CREATE SEQUENCE login_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO login(loginno, customerno, ip, logindate)
VALUES(login_seq.nextval, 3, '211.201.201.229', sysdate);

SELECT loginno, customerno, ip, logindate FROM login ORDER BY loginno DESC;

UPDATE login
SET ip='211.201.201.229'
WHERE loginno=1;

DELETE from login
WHERE loginno=1;
