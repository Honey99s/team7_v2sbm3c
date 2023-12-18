package dev.mvc.review;

  /*
    REVIEWNO         NUMBER(10)       NOT NULL PRIMARY KEY, 
    CARNO            NUMBER(10)       NOT NULL,
    TITLE            VARCHAR2(100)    NOT NULL, 
    CONTENT          CLOB             NOT NULL,   
    RDATE            DATE             NOT NULL,
    FOREIGN KEY (CARNO) REFERENCES CAR (CARNO)
   */

public class ReviewVO {
  /** 구매후기 번호*/
  private int reviewno;
  /** 자동차 번호*/
  private int carno;
  /** 구매후기 제목*/
  private String title = "";
  /** 구매후기 내용*/
  private String content= "";
  /** 등록일*/
  private String rdate;
  public int getReviewno() {
    return reviewno;
  }
  public void setReviewno(int reviewno) {
    this.reviewno = reviewno;
  }
  public int getCarno() {
    return carno;
  }
  public void setCarno(int carno) {
    this.carno = carno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  @Override
  public String toString() {
    return "ReviewVO [reviewno=" + reviewno + ", carno=" + carno + ", title=" + title + ", content=" + content
        + ", rdate=" + rdate + "]";
  }
  
}
