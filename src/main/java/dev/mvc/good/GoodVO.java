package dev.mvc.good;

//    CREATE TABLE good(
//    goodno                    NUMBER(10) NOT NULL PRIMARY KEY,
//    carno                     NUMBER(10) NOT NULL,
//    customerno                NUMBER(10) NOT NULL,
//    rdate                     DATE       NOT NULL,
//    FOREIGN KEY (customerno) REFERENCES customer (customerno),
//    FOREIGN KEY (carno) REFERENCES car (carno)
//    );


public class GoodVO {
  private int goodno;
  private int carno;
  private int customerno;
  private String rdate;
  public int getGoodno() {
    return goodno;
  }
  public void setGoodno(int goodno) {
    this.goodno = goodno;
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
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  @Override
  public String toString() {
    return "GoodVO [goodno=" + goodno + ", carno=" + carno + ", customerno=" + customerno + ", rdate=" + rdate + "]";
  }
  
  
  
  
}
