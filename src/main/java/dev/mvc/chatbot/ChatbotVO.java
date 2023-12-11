package dev.mvc.chatbot;

  /*
    CHATBOTNO                NUMBER(10)       NOT NULL PRIMARY KEY,
    CUSTOMERNO               NUMBER(10)       NOT NULL,
    RECORD                   VARCHAR(50)      NOT NULL,
    CDATE                     DATE             NOT NULL,                
    FOREIGN KEY (CUSTOMERNO) REFERENCES CUSTOMER (CUSTOMERNO)
   */

public class ChatbotVO {
  /** 챗봇 번호*/
  private int chatbotno;
  /** 고객 번호*/
  private int customerno;
  /** 기록*/
  private String record = "";
  /** 등록일*/
  private String cdate = "";
  public int getChatbotno() {
    return chatbotno;
  }
  public void setChatbotno(int chatbotno) {
    this.chatbotno = chatbotno;
  }
  public int getCustomerno() {
    return customerno;
  }
  public void setCustomerno(int customerno) {
    this.customerno = customerno;
  }
  public String getRecord() {
    return record;
  }
  public void setRecord(String record) {
    this.record = record;
  }
  public String getCdate() {
    return cdate;
  }
  public void setCdate(String cdate) {
    this.cdate = cdate;
  }
  @Override
  public String toString() {
    return "ChatbotVO [chatbotno=" + chatbotno + ", customerno=" + customerno + ", record=" + record + ", cdate="
        + cdate + "]";
  }
  
  

}
  

