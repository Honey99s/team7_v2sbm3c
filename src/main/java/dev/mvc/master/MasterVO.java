package dev.mvc.master;

public class MasterVO {
  private int masterno;
  private String id;
  private String passwd;
  private String name;
  private String mdate;
  private int grade;
  public int getMasterno() {
    return masterno;
  }
  public void setMasterno(int masterno) {
    this.masterno = masterno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getMdate() {
    return mdate;
  }
  public void setMdate(String mdate) {
    this.mdate = mdate;
  }
  public int getGrade() {
    return grade;
  }
  public void setGrade(int grade) {
    this.grade = grade;
  }
  @Override
  public String toString() {
    return "MasterVO [masterno=" + masterno + ", id=" + id + ", passwd=" + passwd + ", name=" + name + ", mdate="
        + mdate + ", grade=" + grade + "]";
  }
  
}
