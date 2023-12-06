package dev.mvc.recommend;
  /*
  RECOMMENDNO NUMBER(10)         NOT NULL PRIMARY KEY, -- 회원 번호, 레코드를 구분하는 컬럼 
  MODELNO     NUMBER(10)         NOT NULL,
  CARNO       NUMBER(10)         NOT NULL,
  CUSTOMERNO  NUMBER(10)         NOT NULL,
  SEQ         NUMBER(2)          DEFAULT 1         NOT NULL,
  RDATE       DATE               NOT NULL,
  FOREIGN KEY (MODELNO) REFERENCES MODEL (MODELNO),
  FOREIGN KEY (CARNO) REFERENCES CAR (CARNO),
  FOREIGN KEY (CUSTOMERNO) REFERENCES CUSTOMER (CUSTOMERNO)
   */

public class RecommendVO {
  /** 추천 번호*/
  private int recommendno;
  /** 차종 번호*/
  private int modelno;
  /** 자동차 번호*/
  private int carno;
  /** 고객 번호*/
  private int customerno;
  /** 순서*/
  private int seq;
  /** 등록일*/
  private String rdate = "";
  public int getRecommendno() {
    return recommendno;
  }
  public void setRecommendno(int recommendno) {
    this.recommendno = recommendno;
  }
  public int getModelno() {
    return modelno;
  }
  public void setModelno(int modelno) {
    this.modelno = modelno;
  }
  public int getCarno() {
    return carno;
  }
  public void setCarno(int carno) {
    this.carno = carno;
  }
  public int getCustomerno() {
    return customerno;
  }
  public void setCustomerno(int customerno) {
    this.customerno = customerno;
  }
  public int getSeq() {
    return seq;
  }
  public void setSeq(int seq) {
    this.seq = seq;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  @Override
  public String toString() {
    return "RecommendVO [recommendno=" + recommendno + ", modelno=" + modelno + ", carno=" + carno + ", customerno="
        + customerno + ", seq=" + seq + ", rdate=" + rdate + "]";
  }
  
  
  
}
