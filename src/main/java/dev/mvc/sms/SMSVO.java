package dev.mvc.sms;

//   CREATE TABLE login(
//      loginno                    NUMBER(10) NOT NULL PRIMARY KEY,
//      customerno                NUMBER(10) NOT NULL,
//      ip                            VARCHAR2(15) NOT NULL,
//      logindate                  DATE NOT NULL,
//      FOREIGN KEY (customerno) REFERENCES customer (customerno)
//    );



public class SMSVO {
  private int loginno;
  private int customerno;
  private String ip;
  private String logindate;
  public int getLoginno() {
    return loginno;
  }
  public void setLoginno(int loginno) {
    this.loginno = loginno;
  }
  public int getCustomerno() {
    return customerno;
  }
  public void setCustomerno(int customerno) {
    this.customerno = customerno;
  }
  public String getIp() {
    return ip;
  }
  public void setIp(String ip) {
    this.ip = ip;
  }
  public String getLogindate() {
    return logindate;
  }
  public void setLogindate(String logindate) {
    this.logindate = logindate;
  }
  @Override
  public String toString() {
    return "SMSVO [loginno=" + loginno + ", customerno=" + customerno + ", ip=" + ip + ", logindate=" + logindate + "]";
  }
  
}
