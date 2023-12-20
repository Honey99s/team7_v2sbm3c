package dev.mvc.mlogin;

//  CREATE TABLE mlogin(
//      mloginno                    NUMBER(10) NOT NULL PRIMARY KEY,
//      masterno                NUMBER(10) NOT NULL,
//      ip                            VARCHAR2(15) NOT NULL,
//      logindate                  DATE NOT NULL,
//      FOREIGN KEY (masterno) REFERENCES master (masterno)
//    );

public class MloginVO {
  private int mloginno;
  private int masterno;
  private String ip;
  private String logindate;
  public int getMloginno() {
    return mloginno;
  }
  public void setMloginno(int mloginno) {
    this.mloginno = mloginno;
  }
  public int getMasterno() {
    return masterno;
  }
  public void setMasterno(int masterno) {
    this.masterno = masterno;
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
    return "MloginVO [mloginno=" + mloginno + ", masterno=" + masterno + ", ip=" + ip + ", logindate=" + logindate
        + "]";
  }
}
