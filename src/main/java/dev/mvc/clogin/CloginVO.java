package dev.mvc.clogin;

//  CREATE TABLE clogin(
//      cloginno                    NUMBER(10) NOT NULL PRIMARY KEY,
//      customerno                NUMBER(10) NOT NULL,
//      ip                            VARCHAR2(15) NOT NULL,
//      logindate                  DATE NOT NULL,
//      FOREIGN KEY (customerno) REFERENCES customer (customerno)
//    );



public class CloginVO {
  private int cloginno;
  private int customerno;
  private String ip;
  private String logindate;
  public int getCloginno() {
    return cloginno;
  }
  public void setCloginno(int cloginno) {
    this.cloginno = cloginno;
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
    return "CloginVO [cloginno=" + cloginno + ", customerno=" + customerno + ", ip=" + ip + ", logindate=" + logindate + "]";
  }
  
}
