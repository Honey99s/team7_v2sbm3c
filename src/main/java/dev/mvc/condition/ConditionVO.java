package dev.mvc.condition;


  
  /*
    CONDITIONNO    NUMBER(10)       NOT NULL PRIMARY KEY,
    TITLE          VARCHAR2(100)    NOT NULL UNIQUE, 
    CONTENT        CLOB             NOT NULL, 
    MINPRICE       NUMBER(10)       NOT NULL, 
    MAXPRICE       NUMBER(10)       NOT NULL,   
    CHILDREN       NUMBER(10)       NOT NULL
   */

public class ConditionVO {
  /** 조건 번호*/
  private int conditionno;
  /** 조건 제목*/
  private String title = "";
  /** 조건 내용*/
  private String content= "";
  /** 최소 가격*/
  private int minprice;
  /** 최대 가격*/
  private int maxprice;
  /** 자녀수*/
  private int children;
  public int getConditionno() {
    return conditionno;
  }
  public void setConditionno(int conditionno) {
    this.conditionno = conditionno;
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
  public int getMinprice() {
    return minprice;
  }
  public void setMinprice(int minprice) {
    this.minprice = minprice;
  }
  public int getMaxprice() {
    return maxprice;
  }
  public void setMaxprice(int maxprice) {
    this.maxprice = maxprice;
  }
  public int getChildren() {
    return children;
  }
  public void setChildren(int children) {
    this.children = children;
  }
  @Override
  public String toString() {
    return "ConditionVO [conditionno=" + conditionno + ", title=" + title + ", content=" + content + ", minprice="
        + minprice + ", maxprice=" + maxprice + ", children=" + children + "]";
  }
  
  
  
}
