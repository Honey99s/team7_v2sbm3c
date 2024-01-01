DROP TABLE car CASCADE CONSTRAINTS;
CREATE TABLE car(
        carno                                NUMBER(10)        NOT NULL         PRIMARY KEY,
        modelno                              NUMBER(10)        NOT NULL , -- FK
        masterno                             NUMBER(5)         NOT NULL , -- FK
        title                                VARCHAR2(100)      NOT NULL,
        content                              CLOB              NOT NULL,
        manufacturer                         VARCHAR2(30)      NOT NULL,
        recom                                NUMBER(7)         DEFAULT 0    NOT NULL,
        cnt                                  NUMBER(7)         DEFAULT 0    NOT NULL,
        replycnt                             NUMBER(7)         DEFAULT 0    NOT NULL,
        passwd                               VARCHAR2(15)      NOT NULL,
        word                                 VARCHAR2(100)     NULL ,
        rdate                                DATE              NOT NULL,
        file1                                VARCHAR(50)       NULL,  -- 원본 파일명 image
        file1saved                           VARCHAR(50)       NULL,  -- 저장된 파일명, image
        thumb1                               VARCHAR(50)       NULL,   -- preview image
        size1                                NUMBER(10)        DEFAULT 0 NULL,  -- 파일 사이즈
        map                                  VARCHAR2(1000)    NULL,
        youtube                              VARCHAR2(1000)    NULL,
        minprice                             NUMBER(10)        DEFAULT 0 NULL, 
        maxprice                             NUMBER(10)        DEFAULT 0 NULL,
        FOREIGN KEY (modelno) REFERENCES model (modelno),
        FOREIGN KEY (masterno) REFERENCES master (masterno)
);

COMMENT ON TABLE car is '자동차';
COMMENT ON COLUMN car.carno is '자동차 번호';
COMMENT ON COLUMN car.modelno is '차종 번호';
COMMENT ON COLUMN car.masterno is '마스터 번호';
COMMENT ON COLUMN car.title is '제목';
COMMENT ON COLUMN car.content is '내용';
COMMENT ON COLUMN car.manufacturer is '제조사';
COMMENT ON COLUMN car.recom is '추천수';
COMMENT ON COLUMN car.cnt is '조회수';
COMMENT ON COLUMN car.replycnt is '댓글수';
COMMENT ON COLUMN car.passwd is '패스워드';
COMMENT ON COLUMN car.word is '검색어';
COMMENT ON COLUMN car.rdate is '등록일';
COMMENT ON COLUMN car.file1 is '메인 이미지';
COMMENT ON COLUMN car.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN car.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN car.size1 is '메인 이미지 크기';
COMMENT ON COLUMN car.map is '지도';
COMMENT ON COLUMN car.youtube is 'Youtube 영상';
COMMENT ON COLUMN car.minprice is '최소금액';
COMMENT ON COLUMN car.maxprice is '최대금액';

DROP SEQUENCE car_seq;

CREATE SEQUENCE car_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 경차
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 1, 1, '캐스퍼', '자동차 추천', '현대', 0, 0, 0, '1234', '캐스퍼', sysdate, 'casper.jpg', 'casper_1.jsp', 'casper_t.jpg', 1000, 1550, 1850);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 1, 1, '올 뉴 모닝', '자동차 추천', '기아', 0, 0, 0, '1234', '올 뉴 모닝', sysdate, 'all new morning.jpg', 'all new morning_1.jpg', 'all new morning_t.jpg', 1000, 550, 700);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 1, 1, '더 뉴 모닝', '자동차 추천', '기아', 0, 0, 0, '1234', '더 뉴 모닝', sysdate, 'the new morning.jpg', 'the new morning_1.jpg', 'the new morning_t.jpg', 1000, 700, 850);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 1, 1, '올 뉴 모닝JA', '자동차 추천', '기아', 0, 0, 0, '1234', '올 뉴 모닝JA', sysdate, 'all new morning ja.jpg', 'all new morning ja_1.jpg', 'all new morning ja_t.jpg', 1000, 900, 1100);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 1, 1, '모닝 어반', '자동차 추천', '기아', 0, 0, 0, '1234', '모닝 어반', sysdate, 'morning urban.jpg', 'morning urban_1.jpg', 'morning urban_t.jpg', 1000, 1200, 1450);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 1, 1, '레이', '자동차 추천', '기아', 0, 0, 0, '1234', '레이', sysdate, 'ray.jpg', 'ray_1.jpg', 'ray_t.jpg', 1000, 800, 1000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 1, 1, '더 뉴 레이', '자동차 추천', '기아', 0, 0, 0, '1234', '더 뉴 레이', sysdate, 'the new ray.jpg', 'the new ray_1.jpg', 'the new ray_t.jpg', 1000, 1100, 1500);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 1, 1, '스파크', '자동차 추천', '쉐보레', 0, 0, 0, '1234', '스파크', sysdate, 'spark.jpg', 'spark_1.jpg', 'spark_t.jpg', 1000, 400, 500);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 1, 1, '더 넥스트 스파크', '자동차 추천', '쉐보레', 0, 0, 0, '1234', '더 넥스트 스파크', sysdate, 'the next spark.jpg', 'the next spark_1.jpg', 'the next spark_t.jpg', 1000, 650, 850);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 1, 1, '더 뉴 스파크', '자동차 추천', '쉐보레', 0, 0, 0, '1234', '더 뉴 스파크', sysdate, 'the new spark.jpg', 'the new spark_1.jpg', 'the new spark_t.jpg', 1000, 800, 1000);

-- 승용차
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '액센트', '자동차 추천', '현대', 0, 0, 0, '1234', '액센트', sysdate, 'accent.jpg', 'accent_1.jpg', 'accent_t.jpg', 1000, 500, 1000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '아반떼MD', '자동차 추천', '현대',  0, 0, 0, '1234', '아반떼MD', sysdate, 'avante md.jpg', 'avante md_1.jpg', 'avante md_t.jpg', 1000, 500, 700);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 아반떼', '자동차 추천', '현대',  0, 0, 0, '1234', '더 뉴 아반떼', sysdate, 'the new avante.jpg', 'the new avante_1.jpg', 'the new avante_t.jpg', 1000, 850, 1000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '아반떼AD', '자동차 추천', '현대',  0, 0, 0, '1234', '아반떼AD', sysdate, 'avante ad.jpg', 'avante ad_1.jpg', 'avante ad_t.jpg', 1000, 1100, 1300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 아반떼AD', '자동차 추천', '현대',  0, 0, 0, '1234', '더 뉴 아반떼AD', sysdate, 'the new avante ad.jpg', 'the new avante ad_1.jpg', 'the new avante ad_t.jpg', 1000, 1400, 1650);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '아반떼CN7', '자동차 추천', '현대',  0, 0, 0, '1234', '아반떼CN7', sysdate, 'avante cn7.jpg', 'avante cn7_1.jpg', 'avante cn7_t.jpg', 1000, 1950, 2400);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '아반떼CN7 하이브리드', '자동차 추천', '현대',  0, 0, 0, '1234', '아반떼CN7 하이브리드', sysdate, 'avante cn7 hybrid.jpg', 'avante cn7 hybrid_1.jpg', 'avante cn7 hybrid_t.jpg', 1000, 2500, 2800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '아반떼N', '자동차 추천', '현대',  0, 0, 0, '1234', '아반떼N', sysdate, 'avante n.jpg', 'avante n_1.jpg', 'avante n_t.jpg', 1000, 2700, 3100);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'i30', '자동차 추천', '현대',  0, 0, 0, '1234', 'i30', sysdate, 'i30.jpg', 'i30_1.jpg', 'i30_t.jpg', 1000, 750, 850);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 i30', '자동차 추천', '현대',  0, 0, 0, '1234', '더 뉴 i30', sysdate, 'the new i30.jpg', 'the new i30_1.jpg', 'the new i30_t.jpg', 1000, 850, 1050);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'i30 pd', '자동차 추천', '현대',  0, 0, 0, '1234', 'i30 pd', sysdate, 'i30 pd.jpg', 'i30 pd_1.jpg', 'i30 pd_t.jpg', 1000, 1350, 1800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'i40', '자동차 추천', '현대',  0, 0, 0, '1234', 'i40', sysdate, 'i40.jpg', 'i40_1.jpg', 'i40_t.jpg', 1000, 900, 1000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 i40', '자동차 추천', '현대',  0, 0, 0, '1234', 'the new i40', sysdate, 'the new i40.jpg', 'the new i40_1.jpg', 'the new i40_t.jpg', 1000, 1100, 1400);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '벨로스터', '자동차 추천', '현대',  0, 0, 0, '1234', '벨로스터', sysdate, 'veloster.jpg', 'veloster_1.jpg', 'veloster_t.jpg', 1000, 700, 850);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 벨로스터', '자동차 추천', '현대',  0, 0, 0, '1234', '더 뉴 벨로스터', sysdate, 'the new veloster.jpg', 'the new veloster_1.jpg', 'the new veloster_t.jpg', 1000, 850, 1150);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '벨로스터JS', '자동차 추천', '현대',  0, 0, 0, '1234', '벨로스터JS', sysdate, 'veloster js.jpg', 'veloster js_1.jpg', 'veloster js_t.jpg', 1000, 1550, 1800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '벨로스터N', '자동차 추천', '현대',  0, 0, 0, '1234', '벨로스터N', sysdate, 'veloster n.jpg', 'veloster n_1.jpg', 'veloster n_t.jpg', 1000, 2500, 2800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '아이오닉 하이브리드', '자동차 추천', '현대',  0, 0, 0, '1234', '아이오닉 하이브리드', sysdate, 'ionic hybrid.jpg', 'ionic hybrid_1.jpg', 'ionic hybrid_t.jpg', 1000, 1700, 1900);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 아이오닉 하이브리드', '자동차 추천', '현대',  0, 0, 0, '1234', '더 뉴 아이오닉 하이브리드', sysdate, 'the new ionic hybrid.jpg', 'the new ionic hybrid_1.jpg', 'the new ionic hybrid_t.jpg', 1000, 2000, 2300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'YF쏘나타', '자동차 추천', '현대',  0, 0, 0, '1234', 'YF쏘나타', sysdate, 'yf sonata.jpg', 'yf sonata_1.jpg', 'yf sonata_t.jpg', 1000, 600, 800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '쏘나타 더 브릴리언트', '자동차 추천', '현대',  0, 0, 0, '1234', '쏘나타 더 브릴리언트', sysdate, 'sonata brilliant.jpg', 'sonata brilliant_1.jpg', 'sonata brilliant_t.jpg', 1000, 700, 1000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'LF쏘나타', '자동차 추천', '현대',  0, 0, 0, '1234', 'LF쏘나타', sysdate, 'lf sonata.jpg', 'lf sonata_1.jpg', 'lf sonata_t.jpg', 1000, 1200, 1400);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'LF쏘나타 하이브리드', '자동차 추천', '현대',  0, 0, 0, '1234', 'LF쏘나타 hybrid', sysdate, 'lf sonata hybrid.jpg', 'lf sonata hybrid_1.jpg', 'lf sonata hybrid_t.jpg', 1000, 1300, 1600);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '쏘나타 뉴 라이즈', '자동차 추천', '현대',  0, 0, 0, '1234', '쏘나타 뉴 라이즈', sysdate, 'sonata new rise.jpg', 'sonata new rise_1.jpg', 'sonata new rise_t.jpg', 1000, 1400, 1700);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '쏘나타DN8', '자동차 추천', '현대',  0, 0, 0, '1234', '쏘나타DN8', sysdate, 'sonata dn8.jpg', 'sonata dn8_1.jpg', 'sonata dn8_t.jpg', 1000, 2000, 2600);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '쏘나타DN8 하이브리드', '자동차 추천', '현대',  0, 0, 0, '1234', '쏘나타DN8 하이브리드', sysdate, 'sonata dn8 hybrid.jpg', 'sonata dn8 hybrid_1.jpg', 'sonata dn8 hybrid_t.jpg', 1000, 2700, 3000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '그랜져HG', '자동차 추천', '현대',  0, 0, 0, '1234', '그랜져HG', sysdate, 'grandeur hg.jpg', 'grandeur hg_1.jpg', 'grandeur hg_t.jpg', 1000, 900, 1300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '그랜져IG', '자동차 추천', '현대',  0, 0, 0, '1234', '그랜져IG', sysdate, 'grandeur ig.jpg', 'grandeur ig_1.jpg', 'grandeur ig_t.jpg', 1000, 1800, 2400);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '그랜져IG 하이브리드', '자동차 추천', '현대',  0, 0, 0, '1234', '그랜져IG 하이브리드', sysdate, 'grandeur ig hybrid.jpg', 'grandeur ig hybrid_1.jpg', 'grandeur ig hybrid_t.jpg', 1000, 2300, 2800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 그랜져', '자동차 추천', '현대',  0, 0, 0, '1234', '더 뉴 그랜져', sysdate, 'the new grandeur.jpg', 'the new grandeur_1.jpg', 'the new grandeur_t.jpg', 1000, 2900, 3300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 그랜져 하이브리드', '자동차 추천', '현대',  0, 0, 0, '1234', '더 뉴 그랜져 하이브리드', sysdate, 'the new grandeur hybrid.jpg', 'the new grandeur hybrid_1.jpg', 'the new grandeur hybrid_t.jpg', 1000, 3400, 3700);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '에쿠스', '자동차 추천', '현대',  0, 0, 0, '1234', '에쿠스', sysdate, 'equus.jpg', 'equus_1.jpg', 'equus_t.jpg', 1000, 1800, 2100);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '제네시스BH', '자동차 추천', '현대',  0, 0, 0, '1234', '제네시스BH', sysdate, 'genesis bh.jpg', 'genesis bh_1.jpg', 'genesis bh_t.jpg', 1000, 800, 1200);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '제네시스DH', '자동차 추천', '현대',  0, 0, 0, '1234', '제네시스BH', sysdate, 'genesis dh.jpg', 'genesis dh_1.jpg', 'genesis dh_t.jpg', 1000, 1600, 1900);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '제네시스EQ900', '자동차 추천', '현대',  0, 0, 0, '1234', '제네시스EQ900', sysdate, 'genesis eq900.jpg', 'genesis eq900_1.jpg', 'genesis eq900_t.jpg', 1000, 2700, 3400);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'G70', '자동차 추천', '현대',  0, 0, 0, '1234', 'G70', sysdate, 'g70.jpg', 'g70_1.jpg', 'g70_t.jpg', 1000, 2800, 3100);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 G70', '자동차 추천', '현대',  0, 0, 0, '1234', '더 뉴 G70', sysdate, 'the new g70.jpg', 'the new g70_1.jpg', 'the new g70_t.jpg', 1000, 3700, 4200);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'G80', '자동차 추천', '현대',  0, 0, 0, '1234', 'G80', sysdate, 'g80.jpg', 'g80_1.jpg', 'g80_t.jpg', 1000, 2200, 2600);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'G80 RG3', '자동차 추천', '현대',  0, 0, 0, '1234', 'G80 RG3', sysdate, 'g80 rg3.jpg', 'g80 rg3_1.jpg', 'g80 rg3_t.jpg', 1000, 4800, 5600);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'G90', '자동차 추천', '현대',  0, 0, 0, '1234', 'G90', sysdate, 'g90.jpg', 'g90_1.jpg', 'g90_t.jpg', 1000, 4500, 5700);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 프라이드', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 프라이드', sysdate, 'the new pride.jpg', 'the new pride_1.jpg', 'the new pride_t.jpg', 1000, 700, 950);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'K3', '자동차 추천', '기아',  0, 0, 0, '1234', 'K3', sysdate, 'k3.jpg', 'k3_1.jpg', 'k3_t.jpg', 1000, 800, 1000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 K3', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 K3', sysdate, 'the new k3.jpg', 'the new k3_1.jpg', 'the new k3_t.jpg', 1000, 1100, 1300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '올 뉴 K3', '자동차 추천', '기아',  0, 0, 0, '1234', '올 뉴 K3', sysdate, 'all new k3.jpg', 'all new k3_1.jpg', 'all new k3_t.jpg', 1000, 1500, 1750);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'K3 GT', '자동차 추천', '기아',  0, 0, 0, '1234', 'K3 GT', sysdate, 'k3 gt.jpg', 'k3 gt_1.jpg', 'k3 gt_t.jpg', 1000, 1700, 2100);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 K3 2세대', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 K3 2th', sysdate, 'the new k3 2th.jpg', 'the new k3 2th_1.jpg', 'the new k3 2th_t.jpg', 1000, 1950, 2100);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'K5', '자동차 추천', '기아',  0, 0, 0, '1234', 'K5', sysdate, 'k5.jpg', 'k5_1.jpg', 'k5_t.jpg', 1000, 700, 900);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 K5', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 K5', sysdate, 'the new k5.jpg', 'the new k5_1.jpg', 'the new k5_t.jpg', 1000, 950, 1100);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'K5 2세대', '자동차 추천', '기아',  0, 0, 0, '1234', 'K5 2세대', sysdate, 'k5 2th.jpg', 'k5 2th_1.jpg', 'k5 2th_t.jpg', 1000, 1200, 1600);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'K5 2세대 하이브리드', '자동차 추천', '기아',  0, 0, 0, '1234', 'K5 2세대 하이브리드', sysdate, 'k5 2th hybrid.jpg', 'k5 2th hybrid_1.jpg', 'k5 2th hybrid_t.jpg', 1000, 1400, 1600);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 K5 2세대', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 K5 2세대', sysdate, 'the new k5 2th.jpg', 'the new k5 2th_1.jpg', 'the new k5 2th_t.jpg', 1000, 1600, 1900);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 K5 2세대 하이브리드', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 K5 2세대', sysdate, 'the new k5 2th hybrid.jpg', 'the new k5 2th hybrid_1.jpg', 'the new k5 2th hybrid_t.jpg', 1000, 2100, 2350);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'K5 3세대', '자동차 추천', '기아',  0, 0, 0, '1234', 'K5 3세대', sysdate, 'k5 3th.jpg', 'k5 3th_1.jpg', 'k5 3th_t.jpg', 1000, 2600, 2900);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'K5 3세대 하이브리드', '자동차 추천', '기아',  0, 0, 0, '1234', 'K5 3세대 하이브리드', sysdate, 'k5 3th hybrid.jpg', 'k5 3th hybrid_1.jpg', 'k5 3th hybrid_t.jpg', 1000, 2900, 3400);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'K7', '자동차 추천', '기아',  0, 0, 0, '1234', 'K7', sysdate, 'k7.jpg', 'k7_1.jpg', 'k7_t.jpg', 1000, 600, 800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 K7', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 K7', sysdate, 'the new k7.jpg', 'the new k7_1.jpg', 'the new k7_t.jpg', 1000, 950, 1200);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '올 뉴 K7', '자동차 추천', '기아',  0, 0, 0, '1234', '올 뉴 K7', sysdate, 'all new k7.jpg', 'all new k7_1.jpg', 'all new k7_t.jpg', 1000, 1600, 1950);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '올 뉴 K7 하이브리드', '자동차 추천', '기아',  0, 0, 0, '1234', '올 뉴 K7 하이브리드', sysdate, 'all new k7 hybrid.jpg', 'all new k7 hybrid_1.jpg', 'all new k7 hybrid_t.jpg', 1000, 2000, 2450);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'K7 프리미어', '자동차 추천', '기아',  0, 0, 0, '1234', 'K7 프리미어', sysdate, 'k7 premiere.jpg', 'k7 premiere_1.jpg', 'k7 premiere_t.jpg', 1000, 2600, 3000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'K7 프리미어 하이브리드', '자동차 추천', '기아',  0, 0, 0, '1234', 'K7 프리미어 하이브리드', sysdate, 'k7 premiere hybrid.jpg', 'k7 premiere hybrid_1.jpg', 'k7 premiere hybrid_t.jpg', 1000, 2900, 3300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'K8', '자동차 추천', '기아',  0, 0, 0, '1234', 'K8', sysdate, 'k8.jpg', 'k8_1.jpg', 'k8_t.jpg', 1000, 3600, 4000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'K8 하이브리드', '자동차 추천', '기아',  0, 0, 0, '1234', 'K8 하이브리드', sysdate, 'k8 hybrid.jpg', 'k8 hybrid_1.jpg', 'k8 hybrid_t.jpg', 1000, 4000, 4300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'K9', '자동차 추천', '기아',  0, 0, 0, '1234', 'K9', sysdate, 'k9.jpg', 'k9_1.jpg', 'k9_t.jpg', 1000, 1300, 1700);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 K9', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 K9', sysdate, 'the new k9.jpg', 'the new k9_1.jpg', 'the new k9_t.jpg', 1000, 1700, 1850);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 K9', '자동차 추천', '기아',  0, 0, 0, '1234', '더 K9', sysdate, 'the k9.jpg', 'the k9_1.jpg', 'the k9_t.jpg', 1000, 3000, 3900);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '스팅어', '자동차 추천', '기아',  0, 0, 0, '1234', '스팅어', sysdate, 'stinger.jpg', 'stinger_1.jpg', 'stinger_t.jpg', 1000, 2350, 2800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '스팅어 마이스터', '자동차 추천', '기아',  0, 0, 0, '1234', '스팅어', sysdate, 'stinger meister.jpg', 'stinger meister_1.jpg', 'stinger meister_t.jpg', 1000, 3500, 4200);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '크루즈', '자동차 추천', '쉐보레',  0, 0, 0, '1234', '크루즈', sysdate, 'cruze.jpg', 'cruze_1.jpg', 'cruze_t.jpg', 1000, 500, 650);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '어메이징 뉴 크루즈', '자동차 추천', '쉐보레',  0, 0, 0, '1234', '어메이징 뉴 크루즈', sysdate, 'amazing new cruze.jpg', 'amazing new cruze_1.jpg', 'amazing new cruze_t.jpg', 1000, 700, 850);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '올 뉴 크루즈', '자동차 추천', '쉐보레',  0, 0, 0, '1234', '올 뉴 크루즈', sysdate, 'all new cruze.jpg', 'all new cruze_1.jpg', 'all new cruze_t.jpg', 1000, 1100, 1300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '말리부', '자동차 추천', '쉐보레',  0, 0, 0, '1234', '말리부', sysdate, 'malibu.jpg', 'malibu_1.jpg', 'malibu_t.jpg', 1000, 650, 800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '올 뉴 말리부', '자동차 추천', '쉐보레',  0, 0, 0, '1234', '올 뉴 말리부', sysdate, 'all new malibu.jpg', 'all new malibu_1.jpg', 'all new malibu_t.jpg', 1000, 1100, 1500);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '더 뉴 말리부', '자동차 추천', '쉐보레',  0, 0, 0, '1234', '더 뉴 말리부', sysdate, 'the new malibu.jpg', 'the new malibu_1.jpg', 'the new malibu_t.jpg', 1000, 1900, 2600);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '알페온', '자동차 추천', '쉐보레',  0, 0, 0, '1234', '알페온', sysdate, 'alpheon.jpg', 'alpheon_1.jpg', 'alpheon_t.jpg', 1000, 800, 950);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '임팔라', '자동차 추천', '쉐보레',  0, 0, 0, '1234', '임팔라', sysdate, 'impala.jpg', 'impala_1.jpg', 'impala_t.jpg', 1000, 1200, 1900);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, '뉴 SM3', '자동차 추천', '르노삼성',  0, 0, 0, '1234', '뉴 SM3', sysdate, 'new sm3.jpg', 'new sm3_1.jpg', 'new sm3_t.jpg', 1000, 500, 600);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'SM3 네오', '자동차 추천', '르노삼성',  0, 0, 0, '1234', 'SM3 네오', sysdate, 'sm3 neo.jpg', 'sm3 neo_1.jpg', 'sm3 neo_t.jpg', 1000, 600, 900);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'SM5 노바', '자동차 추천', '르노삼성',  0, 0, 0, '1234', 'SM3 노바', sysdate, 'sm5 nova.jpg', 'sm5 nova_1.jpg', 'sm5 nova_t.jpg', 1000, 1000, 1100);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 2, 1, 'SM7 노바', '자동차 추천', '르노삼성',  0, 0, 0, '1234', 'SM7 노바', sysdate, 'sm7 nova.jpg', 'sm7 nova_1.jpg', 'sm7 nova_t.jpg', 1000, 1100, 1400);

-- SUV
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '맥스크루즈', '자동차 추천', '현대',  0, 0, 0, '1234', '맥스크루즈', sysdate, 'maxcruz.jpg', 'maxcruz_1.jpg', 'maxcruz_t.jpg', 1000, 1400, 1750);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '더 뉴 맥스크루즈', '자동차 추천', '현대',  0, 0, 0, '1234', '더 뉴 맥스크루즈', sysdate, 'the new maxcruz.jpg', 'the new maxcruz_1.jpg', 'the new maxcruz_t.jpg', 1000, 2100, 2850);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '베뉴', '자동차 추천', '현대',  0, 0, 0, '1234', '베뉴', sysdate, 'venue.jpg', 'venue_1.jpg', 'venue_t.jpg', 1000, 1700, 2000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '베라크루즈', '자동차 추천', '현대',  0, 0, 0, '1234', '베라크루즈', sysdate, 'veracruz.jpg', 'veracruz_1.jpg', 'veracruz_t.jpg', 1000, 800, 1500);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '싼타페DM', '자동차 추천', '현대',  0, 0, 0, '1234', '싼타페DM', sysdate, 'santafe dm.jpg', 'santafe dm_1.jpg', 'santafe dm_t.jpg', 1000, 1300, 1500);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '싼타페 더 프라임', '자동차 추천', '현대',  0, 0, 0, '1234', '싼타페 더 프라임', sysdate, 'santafe the prime.jpg', 'santafe the prime_1.jpg', 'santafe the prime_t.jpg', 1000, 1400, 1750);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '싼타페TM', '자동차 추천', '현대',  0, 0, 0, '1234', '싼타페TM', sysdate, 'santafe tm.jpg', 'santafe tm_1.jpg', 'santafe tm_t.jpg', 1000, 2700, 3100);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '더 뉴 싼타페', '자동차 추천', '현대',  0, 0, 0, '1234', '더 뉴 싼타페', sysdate, 'the new santafe.jpg', 'the new santafe_1.jpg', 'the new santafe_t.jpg', 1000, 3200, 3700);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '더 뉴 싼타페 하이브리드', '자동차 추천', '현대',  0, 0, 0, '1234', '더 뉴 싼타페 하이브리드', sysdate, 'the new santafe hybrid.jpg', 'the new santafe hybrid_1.jpg', 'the new santafe hybrid_t.jpg', 1000, 3600, 4200);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '아이오닉5', '자동차 추천', '현대',  0, 0, 0, '1234', '아이오닉5', sysdate, 'ionic 5.jpg', 'ionic 5_1.jpg', 'ionic 5_t.jpg', 1000, 3800, 4200);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '코나', '자동차 추천', '현대',  0, 0, 0, '1234', '코나', sysdate, 'kona.jpg', 'kona_1.jpg', 'kona_t.jpg', 1000, 1600, 1900);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '코나 일렉트릭', '자동차 추천', '현대',  0, 0, 0, '1234', '코나 일렉트릭', sysdate, 'kona electric.jpg', 'kona electric_1.jpg', 'kona electric_t.jpg', 1000, 2400, 2800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '코나 하이브리드', '자동차 추천', '현대',  0, 0, 0, '1234', '코나 하이브리드', sysdate, 'kona hybrid.jpg', 'kona hybrid_1.jpg', 'kona hybrid_t.jpg', 1000, 2000, 2200);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '코나SX2', '자동차 추천', '현대',  0, 0, 0, '1234', '코나SX2', sysdate, 'kona sx2.jpg', 'kona sx2_1.jpg', 'kona sx2_t.jpg', 1000, 2750, 3000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '코나SX2 하이브리드', '자동차 추천', '현대',  0, 0, 0, '1234', '코나SX2 하이브리드', sysdate, 'kona sx2 hybrid.jpg', 'kona sx2 hybrid_1.jpg', 'kona sx2 hybrid_t.jpg', 1000, 3250, 3700);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '투싼 ix', '자동차 추천', '현대',  0, 0, 0, '1234', '투싼 ix', sysdate, 'tucson ix.jpg', 'tucson ix_1.jpg', 'tucson ix_t.jpg', 1000, 800, 950);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '뉴 투싼 ix', '자동차 추천', '현대',  0, 0, 0, '1234', '뉴 투싼 ix', sysdate, 'new tucson ix.jpg', 'new tucson ix_1.jpg', 'new tucson ix_t.jpg', 1000, 1000, 1150);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '올 뉴 투싼', '자동차 추천', '현대',  0, 0, 0, '1234', '올 뉴 투싼', sysdate, 'all new tucson.jpg', 'all new tucson_1.jpg', 'all new tucson_t.jpg', 1000, 1500, 1800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '올 뉴 투싼TL', '자동차 추천', '현대',  0, 0, 0, '1234', '올 뉴 투싼TL', sysdate, 'all new tucson tl.jpg', 'all new tucson tl_1.jpg', 'all new tucson tl_t.jpg', 1000, 1900, 2200);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '투싼 4세대', '자동차 추천', '현대',  0, 0, 0, '1234', '투싼 4세대', sysdate, 'tucson 4th.jpg', 'tucson 4th_1.jpg', 'tucson 4th_t.jpg', 1000, 2900, 3200);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '투싼 4세대 하이브리드', '자동차 추천', '현대',  0, 0, 0, '1234', '투싼 4세대 하이브리드', sysdate, 'tucson 4th hybrid.jpg', 'tucson 4th hybrid_1.jpg', 'tucson 4th hybrid_t.jpg', 1000, 3100, 3500);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '팰리세이드', '자동차 추천', '현대',  0, 0, 0, '1234', '팰리세이드', sysdate, 'palisade.jpg', 'palisade_1.jpg', 'palisade_t.jpg', 1000, 3300, 4000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '더 뉴 팰리세이드', '자동차 추천', '현대',  0, 0, 0, '1234', '더 뉴 팰리세이드', sysdate, 'the new palisade.jpg', 'the new palisade_1.jpg', 'the new palisade_t.jpg', 1000, 4800, 5500);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, 'GV70', '자동차 추천', '현대',  0, 0, 0, '1234', 'GV70', sysdate, 'gv70.jpg', 'gv70_1.jpg', 'gv70_t.jpg', 1000, 4700, 5500);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, 'GV80', '자동차 추천', '현대',  0, 0, 0, '1234', 'GV80', sysdate, 'gv80.jpg', 'gv80_1.jpg', 'gv80_t.jpg', 1000, 6000, 6800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, 'EV6', '자동차 추천', '기아',  0, 0, 0, '1234', 'EV6', sysdate, 'ev6.jpg', 'ev6_1.jpg', 'ev6_t.jpg', 1000, 4000, 4900);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '니로', '자동차 추천', '기아',  0, 0, 0, '1234', '니로', sysdate, 'niro.jpg', 'niro_1.jpg', 'niro_t.jpg', 1000, 1700, 2100);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '더 뉴 니로', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 니로', sysdate, 'the new niro.jpg', 'the new niro_1.jpg', 'the new niro_t.jpg', 1000, 2400, 2800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '디 올 뉴 니로', '자동차 추천', '기아',  0, 0, 0, '1234', '디 올 뉴 니로', sysdate, 'the all new niro.jpg', 'the all new niro_1.jpg', 'the all new niro_t.jpg', 1000, 3100, 3600);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '더 뉴 모하비', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 모하비', sysdate, 'the new mohave.jpg', 'the new mohave_1.jpg', 'the new mohave_t.jpg', 1000, 2000, 2700);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '모하비 더 마스터', '자동차 추천', '기아',  0, 0, 0, '1234', '모하비 더 마스터', sysdate, 'mohave the master.jpg', 'mohave the master_1.jpg', 'mohave the master_t.jpg', 1000, 4000, 4800);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '셀토스', '자동차 추천', '기아',  0, 0, 0, '1234', '셀토스', sysdate, 'seltos.jpg', 'seltos_1.jpg', 'seltos_t.jpg', 1000, 2100, 2500);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '더 뉴 셀토스', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 셀토스', sysdate, 'the new seltos.jpg', 'the new seltos_1.jpg', 'the new seltos_t.jpg', 1000, 2900, 3300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '스토닉', '자동차 추천', '기아',  0, 0, 0, '1234', '스토닉', sysdate, 'stonic.jpg', 'stonic_1.jpg', 'stonic_t.jpg', 1000, 1300, 1700);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '스포티지R', '자동차 추천', '기아',  0, 0, 0, '1234', '스포티지R', sysdate, 'sportage r.jpg', 'sportage r_1.jpg', 'sportage r_t.jpg', 1000, 800, 950);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '더 뉴 스포티지R', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 스포티지R', sysdate, 'the new sportage r.jpg', 'the new sportage r_1.jpg', 'the new sportage r_t.jpg', 1000, 1000, 1250);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '스포티지 4세대', '자동차 추천', '기아',  0, 0, 0, '1234', '스포티지 4세대', sysdate, 'sportage 4th.jpg', 'sportage 4th_1.jpg', 'sportage 4th_t.jpg', 1000, 1600, 1850);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '스포티지 더 볼드', '자동차 추천', '기아',  0, 0, 0, '1234', '스포티지 더 볼드', sysdate, 'sportage the bold.jpg', 'sportage the bold_1.jpg', 'sportage the bold_t.jpg', 1000, 1850, 2350);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '디 올 뉴 스포티지', '자동차 추천', '기아',  0, 0, 0, '1234', '디 올 뉴 스포티지', sysdate, 'the all new sportage.jpg', 'the all new sportage_1.jpg', 'the all new sportage_t.jpg', 1000, 3200, 3600);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '디 올 뉴 스포티지 하이브리드', '자동차 추천', '기아',  0, 0, 0, '1234', '디 올 뉴 스포티지 하이브리드', sysdate, 'the all new sportage hybrid.jpg', 'the all new sportage hybrid_1.jpg', 'the all new sportage hybrid_t.jpg', 1000, 3600, 4100);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '쏘렌토R', '자동차 추천', '기아',  0, 0, 0, '1234', '쏘렌토R', sysdate, 'sorento r.jpg', 'sorento r_1.jpg', 'sorento r_t.jpg', 1000, 850, 1000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '뉴 쏘렌토R', '자동차 추천', '기아',  0, 0, 0, '1234', '뉴 쏘렌토R', sysdate, 'new sorento r.jpg', 'new sorento r_1.jpg', 'new sorento r_t.jpg', 1000, 1050, 1200);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '올 뉴 쏘렌토', '자동차 추천', '기아',  0, 0, 0, '1234', '올 뉴 쏘렌토', sysdate, 'all new sorento.jpg', 'all new sorento_1.jpg', 'all new sorento_t.jpg', 1000, 1700, 2000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '더 뉴 쏘렌토', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 쏘렌토', sysdate, 'the new sorento.jpg', 'the new sorento_1.jpg', 'the new sorento_t.jpg', 1000, 2300, 3000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '쏘렌토 4세대', '자동차 추천', '기아',  0, 0, 0, '1234', '쏘렌토 4세대', sysdate, 'sorento 4th.jpg', 'sorento 4th_1.jpg', 'sorento 4th_t.jpg', 1000, 3400, 4000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '쏘렌토 4세대 하이브리드', '자동차 추천', '기아',  0, 0, 0, '1234', '쏘렌토 4세대 하이브리드', sysdate, 'sorento 4th hybrid.jpg', 'sorento 4th hybrid_1.jpg', 'sorento 4th hybrid_t.jpg', 1000, 3800, 4300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '올란도', '자동차 추천', '쉐보레',  0, 0, 0, '1234', '올란도', sysdate, 'orlando.jpg', 'orlando_1.jpg', 'orlando_t.jpg', 1000, 850, 1050);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '트랙스', '자동차 추천', '쉐보레',  0, 0, 0, '1234', '트랙스', sysdate, 'trax.jpg', 'trax_1.jpg', 'trax_t.jpg', 1000, 850, 1050);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '더 뉴 트랙스', '자동차 추천', '쉐보레',  0, 0, 0, '1234', '더 뉴 트랙스', sysdate, 'the new trax.jpg', 'the new trax_1.jpg', 'the new trax_t.jpg', 1000, 1100, 1400);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '트레일블레이저', '자동차 추천', '쉐보레',  0, 0, 0, '1234', '트레일블레이저', sysdate, 'trailblazer.jpg', 'trailblazer_1.jpg', 'trailblazer_t.jpg', 1000, 2200, 2500);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '트래버스', '자동차 추천', '쉐보레',  0, 0, 0, '1234', '트래버스', sysdate, 'traverse.jpg', 'traverse_1.jpg', 'traverse_t.jpg', 1000, 3500, 4700);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, 'QM3', '자동차 추천', '르노삼성',  0, 0, 0, '1234', 'QM3', sysdate, 'qm3.jpg', 'qm3_1.jpg', 'qm3_t.jpg', 1000, 700, 950);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '뉴 QM3', '자동차 추천', '르노삼성',  0, 0, 0, '1234', '뉴 QM3', sysdate, 'new qm3.jpg', 'new qm3_1.jpg', 'new qm3_t.jpg', 1000, 1150, 1350);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, 'QM5 NEO', '자동차 추천', '르노삼성',  0, 0, 0, '1234', 'QM5 NEO', sysdate, 'qm5 neo.jpg', 'qm5 neo_1.jpg', 'qm5 neo_t.jpg', 1000, 800, 950);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, 'QM6', '자동차 추천', '르노삼성',  0, 0, 0, '1234', 'QM6', sysdate, 'qm6.jpg', 'qm6_1.jpg', 'qm6_t.jpg', 1000, 1900, 2600);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, 'XM3', '자동차 추천', '르노삼성',  0, 0, 0, '1234', 'XM3', sysdate, 'xm3.jpg', 'xm3_1.jpg', 'xm3_t.jpg', 1000, 1800, 2300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '캡처', '자동차 추천', '르노삼성',  0, 0, 0, '1234', '캡처', sysdate, 'capture.jpg', 'capture_1.jpg', 'capture_t.jpg', 1000, 1900, 2150);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '올 뉴 렉스턴', '자동차 추천', '쌍용',  0, 0, 0, '1234', '올 뉴 렉스턴', sysdate, 'all new rexton.jpg', 'all new rexton_1.jpg', 'all new rexton_t.jpg', 1000, 3200, 3600);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '뉴 코란도C', '자동차 추천', '쌍용',  0, 0, 0, '1234', '뉴 코란도C', sysdate, 'new corando c.jpg', 'new corando c_1.jpg', 'new corando c_t.jpg', 1000, 750, 950);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '뉴 스타일 코란도C', '자동차 추천', '쌍용',  0, 0, 0, '1234', '뉴 스타일 코란도C', sysdate, 'new style corando c.jpg', 'new style corando c_1.jpg', 'new style corando c_t.jpg', 1000, 1050, 1500);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '뷰티풀 코란도', '자동차 추천', '쌍용',  0, 0, 0, '1234', '뷰티풀 코란도', sysdate, 'beautiful corando.jpg', 'beautiful corando_1.jpg', 'beautiful corando_t.jpg', 1000, 1900, 2400);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '티볼리', '자동차 추천', '쌍용',  0, 0, 0, '1234', '티볼리', sysdate, 'tivoli.jpg', 'tivoli_1.jpg', 'tivoli_t.jpg', 1000, 1000, 1300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '티볼리 에어', '자동차 추천', '쌍용',  0, 0, 0, '1234', '티볼리 에어', sysdate, 'tivoli air.jpg', 'tivoli air_1.jpg', 'tivoli air_t.jpg', 1000, 1500, 1950);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '티볼리 아머', '자동차 추천', '쌍용',  0, 0, 0, '1234', '티볼리 아머', sysdate, 'tivoli armor.jpg', 'tivoli armor_1.jpg', 'tivoli armor_t.jpg', 1000, 1250, 1500);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '베리 뉴 티볼리', '자동차 추천', '쌍용',  0, 0, 0, '1234', '베리 뉴 티볼리', sysdate, 'very new tivoli.jpg', 'very new tivoli_1.jpg', 'very new tivoli_t.jpg', 1000, 1450, 2000);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 3, 1, '토레스', '자동차 추천', '쌍용',  0, 0, 0, '1234', '토레스', sysdate, 'toress.jpg', 'toress_1.jpg', 'toress_t.jpg', 1000, 2750, 3000);

-- 승합차

INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 4, 1, '그랜드 스타렉스', '자동차 추천', '현대',  0, 0, 0, '1234', '그랜드 스타렉스', sysdate, 'grand starex.jpg', 'grand starex_1.jpg', 'grand starex_t.jpg', 1000, 1300, 1500);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 4, 1, '더 뉴 그랜드 스타렉스', '자동차 추천', '현대',  0, 0, 0, '1234', '더 뉴 그랜드 스타렉스', sysdate, 'the new grand starex.jpg', 'the new grand starex_1.jpg', 'the new grand starex_t.jpg', 1000, 1700, 2100);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 4, 1, '스타리아', '자동차 추천', '현대',  0, 0, 0, '1234', '스타리아', sysdate, 'staria.jpg', 'staria_1.jpg', 'staria_t.jpg', 1000, 2800, 3900);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 4, 1, '올 뉴 카니발', '자동차 추천', '기아',  0, 0, 0, '1234', '올 뉴 카니발', sysdate, 'all new carnival.jpg', 'all new carnival_1.jpg', 'all new carnival_t.jpg', 1000, 1700, 2300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 4, 1, '더 뉴 카니발', '자동차 추천', '기아',  0, 0, 0, '1234', '더 뉴 카니발', sysdate, 'the new carnival.jpg', 'the new carnival_1.jpg', 'the new carnival_t.jpg', 1000, 2700, 3300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 4, 1, '카니발 4세대', '자동차 추천', '기아',  0, 0, 0, '1234', '카니발 4세대', sysdate, 'carnival 4th.jpg', 'carnival 4th_1.jpg', 'carnival 4th_t.jpg', 1000, 3600, 4300);
INSERT INTO car(carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, passwd, word, rdate, file1, file1saved, thumb1, size1, minprice, maxprice)
VALUES(car_seq.nextval, 4, 1, '코란도 투리스모', '자동차 추천', '쌍용',  0, 0, 0, '1234', '코란도 투리스모', sysdate, 'corando turismo.jpg', 'corando turismo_1.jpg', 'corando turismo_t.jpg', 1000, 1000, 1500);

-- 차종 전체 목록
SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
       file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice
FROM car
ORDER BY carno DESC;

-- 경차만 출력
SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
       file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice
FROM car
WHERE modelno =3
ORDER BY carno DESC;

UPDATE car SET map='카페산 지도 스크립트' WHERE carno=1;

UPDATE car SET map='' WHERE carno=1;

DELETE FROM car
WHERE carno = 104;
commit;


-- ----------------------------------------------------------------------------------------------------
-- 검색 + 페이징 + 메인 이미지
-- ----------------------------------------------------------------------------------------------------
-- step 1
SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
       file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice
FROM car
WHERE modelno=1 AND (title LIKE '%모닝%' OR content LIKE '%모닝%' OR word LIKE '%모닝%')
ORDER BY carno DESC;

-- step 2
SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
       file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice, rownum as r
FROM (
          SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
                 file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice
          FROM car
          WHERE modelno=1 AND (title LIKE '%모닝%' OR content LIKE '%모닝%' OR word LIKE '%모닝%')
          ORDER BY carno DESC
);

-- step 3, 1 page
SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
       file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice, r
FROM (
           SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
                  file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice, rownum as r
           FROM (
                     SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
                            file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice
                     FROM car
                     WHERE modelno=1 AND (UPPER(title) LIKE '%' || UPPER('모닝') || '%' 
                                         OR UPPER(content) LIKE '%' || UPPER('모닝') || '%' 
                                         OR UPPER(word) LIKE '%' || UPPER('모닝') || '%')
                     ORDER BY carno DESC
           )          
)
WHERE r >= 1 AND r <= 3;

-- step 3, 2 page
SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
       file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice, r
FROM (
           SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
                  file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice, rownum as r
           FROM (
                     SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
                            file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice
                     FROM car
                     WHERE modelno=1 AND (UPPER(title) LIKE '%' || UPPER('모닝') || '%' 
                                         OR UPPER(content) LIKE '%' || UPPER('모닝') || '%' 
                                         OR UPPER(word) LIKE '%' || UPPER('모닝') || '%')
                     ORDER BY carno DESC
           )          
)
WHERE r >= 4 AND r <= 6;

-- 대소문자를 처리하는 페이징 쿼리
SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
       file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice, r
FROM (
           SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
                  file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice, rownum as r
           FROM (
                     SELECT carno, modelno, masterno, title, content, manufacturer, recom, cnt, replycnt, word, rdate,
                            file1, file1saved, thumb1, size1, map, youtube, minprice, maxprice
                     FROM car
                     WHERE modelno=1 AND (UPPER(title) LIKE '%' || UPPER('모닝') || '%' 
                                         OR UPPER(content) LIKE '%' || UPPER('모닝') || '%' 
                                         OR UPPER(word) LIKE '%' || UPPER('모닝') || '%')
                     ORDER BY carno DESC
           )          
)
WHERE r >= 6 AND r <= 8;

UPDATE car SET carno='254' WHERE carno=264;

-- 패스워드 검사, id="password_check"
SELECT COUNT(*) as cnt 
FROM car
WHERE carno=1 AND passwd='123';

-- 댓글 수 증감
1) 댓글수 증가
UPDATE car
SET replycnt = replycnt + 1
WHERE carno = 1;

2) 댓글수 감소
UPDATE car
SET replycnt = replycnt - 1
WHERE carno = 1;   

commit;


























































        

