package dev.mvc.ggultip;

  /*
 CREATE TABLE GGULTIP(
    GGULTIPNO    NUMBER(10)       NOT NULL PRIMARY KEY,
    CONTENT        CLOB             NOT NULL, 
    RDATE          DATE             NOT NULL
);
   */

public class GgultipVO {
  /** 꿀팁 번호*/
  private int ggultipno;
  /** 꿀팁 내용*/
  private String content= "";
  /** 등록일*/
  private String rdate;
  public int getGgultipno() {
    return ggultipno;
  }
  public void setGgultipno(int ggultipno) {
    this.ggultipno = ggultipno;
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
    return "GgultipVO [ggultipno=" + ggultipno + ", content=" + content + ", rdate=" + rdate + "]";
  } 
}
