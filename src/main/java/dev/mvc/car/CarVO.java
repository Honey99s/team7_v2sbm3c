package dev.mvc.car;

import org.springframework.web.multipart.MultipartFile;

/*
    carno                                NUMBER(10)        NOT NULL         PRIMARY KEY,
    modelno                              NUMBER(10)        NOT NULL , -- FK
    masterno                             NUMBER(5)          NOT NULL , -- FK
    title                                VARCHAR2(50)      NOT NULL,
    content                               CLOB                  NOT NULL,
    manufacturer                         VARCHAR2(30)      NOT NULL,
    recom                                NUMBER(7)         DEFAULT 0    NOT NULL,
    cnt                                  NUMBER(7)         DEFAULT 0    NOT NULL,
    replycnt                             NUMBER(7)         DEFAULT 0    NOT NULL,
    passwd                               VARCHAR2(15)      NOT NULL,
    word                                 VARCHAR2(100)     NULL ,
    rdate                                DATE              NOT NULL,
    file1                                VARCHAR(50)       NULL,  -- 원본 파일명 image
    file1saved                           VARCHAR(50)       NULL,  -- 저장된 파일명, image
    thumb1                               VARCHAR(50)       NULL,   -- preview image
    size1                                NUMBER(10)        DEFAULT 0 NULL,  -- 파일 사이즈
    map                                  VARCHAR2(1000)    NULL,
    youtube                              VARCHAR2(1000)    NULL,
    price                                VARCHAR(50)       NOT NULL, 
    FOREIGN KEY (modelno) REFERENCES model (modelno),
    FOREIGN KEY (masterno) REFERENCES master (masterno)

*/

public class CarVO {
  /** 자동차 번호 */
  private int carno;
  /** 마스터 번호 */
  private int masterno;
  /** 차종 번호 */
  private int modelno;
  /** 제목 */
  private String title = "";
  /** 내용 */
  private String content= "";
  /** 제조사 */
  private String manufacturer = "";
  /** 추천수 */
  private int recom;
  /** 조회수 */
  private int cnt = 0;
  /** 댓글수 */
  private int replycnt = 0;
  /** 패스워드 */
  private String passwd = "";
  /** 검색어 */
  private String word = "";
  /** 등록 날짜 */
  private String rdate = "";
  /** 지도 */
  private String map;
  /** Youtube */
  private String youtube;
  /** 최소 가격 */
  private int minprice = 0;
  /** 최대 가격*/
  private int maxprice = 0;
  
  // 파일 업로드 관련
  // -----------------------------------------------------------------------------------
  /**
  이미지 파일
  <input type='file' class="form-control" name='file1MF' id='file1MF' 
             value='' placeholder="파일 선택">
  */
  private MultipartFile file1MF;
  /** 메인 이미지 크기 단위, 파일 크기 */
  private String size1_label = "";
  /** 메인 이미지 */
  private String file1 = "";
  /** 실제 저장된 메인 이미지 */
  private String file1saved = "";
  /** 메인 이미지 preview */
  private String thumb1 = "";
  /** 메인 이미지 크기 */
  private long size1;
  
  // 페이징 관련
  // -----------------------------------------------------------------------------------
  /** 시작 rownum */
  private int start_num;    
  /** 종료 rownum */
  private int end_num;    
  /** 현재 페이지 */
  private int now_page = 1;
  public int getCarno() {
    return carno;
  }
  public void setCarno(int carno) {
    this.carno = carno;
  }
  public int getMasterno() {
    return masterno;
  }
  public void setMasterno(int masterno) {
    this.masterno = masterno;
  }
  public int getModelno() {
    return modelno;
  }
  public void setModelno(int modelno) {
    this.modelno = modelno;
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
  public String getManufacturer() {
    return manufacturer;
  }
  public void setManufacturer(String manufacturer) {
    this.manufacturer = manufacturer;
  }
  public int getRecom() {
    return recom;
  }
  public void setRecom(int recom) {
    this.recom = recom;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public int getReplycnt() {
    return replycnt;
  }
  public void setReplycnt(int replycnt) {
    this.replycnt = replycnt;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getWord() {
    return word;
  }
  public void setWord(String word) {
    this.word = word;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getMap() {
    return map;
  }
  public void setMap(String map) {
    this.map = map;
  }
  public String getYoutube() {
    return youtube;
  }
  public void setYoutube(String youtube) {
    this.youtube = youtube;
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
  public MultipartFile getFile1MF() {
    return file1MF;
  }
  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }
  public String getSize1_label() {
    return size1_label;
  }
  public void setSize1_label(String size1_label) {
    this.size1_label = size1_label;
  }
  public String getFile1() {
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getFile1saved() {
    return file1saved;
  }
  public void setFile1saved(String file1saved) {
    this.file1saved = file1saved;
  }
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }
  public long getSize1() {
    return size1;
  }
  public void setSize1(long size1) {
    this.size1 = size1;
  }
  public int getStart_num() {
    return start_num;
  }
  public void setStart_num(int start_num) {
    this.start_num = start_num;
  }
  public int getEnd_num() {
    return end_num;
  }
  public void setEnd_num(int end_num) {
    this.end_num = end_num;
  }
  public int getNow_page() {
    return now_page;
  }
  public void setNow_page(int now_page) {
    this.now_page = now_page;
  }
  @Override
  public String toString() {
    return "CarVO [carno=" + carno + ", masterno=" + masterno + ", modelno=" + modelno + ", title=" + title
        + ", content=" + content + ", manufacturer=" + manufacturer + ", recom=" + recom + ", cnt=" + cnt
        + ", replycnt=" + replycnt + ", passwd=" + passwd + ", word=" + word + ", rdate=" + rdate + ", map=" + map
        + ", youtube=" + youtube + ", minprice=" + minprice + ", maxprice=" + maxprice + ", file1MF=" + file1MF
        + ", size1_label=" + size1_label + ", file1=" + file1 + ", file1saved=" + file1saved + ", thumb1=" + thumb1
        + ", size1=" + size1 + ", start_num=" + start_num + ", end_num=" + end_num + ", now_page=" + now_page + "]";
  }
 
  
  
}