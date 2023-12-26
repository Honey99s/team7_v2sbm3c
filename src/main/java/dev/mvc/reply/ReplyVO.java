package dev.mvc.reply;

public class ReplyVO {
  /** 댓글 번호 */
  private int replyno;
  /** 관련 글 번호 */
  private int carno;
  /** 고객 번호 */
  private int customerno;
  /** 내용 */
  private String content;
  /** 패스워드 */
  private String passwd;
  /** 등록일 */
  private String rdate;
  public int getReplyno() {
    return replyno;
  }
  public void setReplyno(int replyno) {
    this.replyno = replyno;
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
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  @Override
  public String toString() {
    return "ReplyVO [replyno=" + replyno + ", carno=" + carno + ", customerno=" + customerno + ", content=" + content
        + ", passwd=" + passwd + ", rdate=" + rdate + "]";
  }
 
  
}