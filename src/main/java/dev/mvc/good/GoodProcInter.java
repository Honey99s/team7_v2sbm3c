package dev.mvc.good;

import java.util.ArrayList;

public interface GoodProcInter {
  
  /**
   *  등록
   * @param goodVO
   * @return
   */
  public int create(GoodVO goodVO);
  
  /**
   * 모든 조건 목록
   * @return
   */
  public ArrayList<GoodVO> list_all();
  
  /**
   * 조회
   * @param goodno
   * @return
   */
  public GoodVO read(int goodno);
  
  
  /**
   * 삭제
   * @param goodno
   * @return 삭제된 레코드 개수
   */
  public int delete(int goodno);

}
