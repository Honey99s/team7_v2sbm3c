package dev.mvc.qna;

  /*
  QNANO              NUMBER(10)     NOT NULL     PRIMARY KEY, -- 회원 번호, 레코드를 구분하는 컬럼 
  PW                    VARCHAR(20)    NOT NULL, -- 비밀번호, 글 수정이나 비밀글로 했을
  TITLE                  VARCHAR(30)    NOT NULL,
  CONTENT            CLOB               NOT NULL,
  QDATE                DATE               NOT NULL,
   */

public class QnaVO {
  /** 문의사항 번호*/
  private int qnano;
  /** 비밀번호*/
  private int pw;
  /** 문의사항 제목*/
  private String title = "";
  /** 문의사항 내용*/
  private String content= "";
  /** 등록일*/
  private String qdate;
  public int getQnano() {
    return qnano;
  }
  public void setQnano(int qnano) {
    this.qnano = qnano;
  }
  public int getPw() {
    return pw;
  }
  public void setPw(int pw) {
    this.pw = pw;
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
  public String getQdate() {
    return qdate;
  }
  public void setQdate(String qdate) {
    this.qdate = qdate;
  }
  @Override
  public String toString() {
    return "QnaVO [qnano=" + qnano + ", pw=" + pw + ", title=" + title + ", content=" + content + ", qdate=" + qdate
        + "]";
  }
  
}
