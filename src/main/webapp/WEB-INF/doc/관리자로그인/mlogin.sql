DROP TABLE mlogin;
CREATE TABLE mlogin(
  mloginno                    NUMBER(10) NOT NULL PRIMARY KEY,
  masterno                NUMBER(10) NOT NULL,
  ip                            VARCHAR2(15) NOT NULL,
  logindate                  DATE NOT NULL,
  FOREIGN KEY (masterno) REFERENCES master (masterno)
);

COMMENT ON TABLE mlogin is '마스터 로그인 내역';
COMMENT ON COLUMN mlogin.mloginno is '로그인 번호';
COMMENT ON COLUMN mlogin.masterno is '마스터 번호';
COMMENT ON COLUMN mlogin.ip is '접속 IP';
COMMENT ON COLUMN mlogin.logindate is '로그인 날짜';

DROP SEQUENCE mlogin_seq;
CREATE SEQUENCE mlogin_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO mlogin(mloginno, masterno, ip, logindate)
VALUES(mlogin_seq.nextval, 3, '211.201.201.229', sysdate);

SELECT mloginno, masterno, ip, logindate FROM mlogin ORDER BY mloginno DESC;

UPDATE mlogin
SET ip='211.201.201.229'
WHERE mloginno=1;

DELETE from mlogin
WHERE mloginno=1;
