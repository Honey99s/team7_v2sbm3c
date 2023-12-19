package dev.mvc.clogin;

import java.util.ArrayList;

public interface CloginProcInter {
  
  /**
   * 모든 조건 목록
   * @return
   */
  public ArrayList<CloginVO> list_all();
  
  /**
   * 로그인 내역 조회
   * @param cloginno
   * @return
   */
  public CloginVO read(int cloginno);
  
  /**
   * 로그인내역 삭제
   * @param cloginno
   * @return
   */
  public int delete(int cloginno);
  
  


}
