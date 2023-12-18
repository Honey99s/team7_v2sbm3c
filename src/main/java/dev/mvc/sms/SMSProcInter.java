package dev.mvc.sms;

import java.util.ArrayList;

public interface SmsProcInter {
  
  /**
   * 모든 조건 목록
   * @return
   */
  public ArrayList<SmsVO> list_all();
  
  /**
   * 로그인 내역 조회
   * @param loginno
   * @return
   */
  public SmsVO read(int loginno);
  
  /**
   * 로그인내역 삭제
   * @param loginno
   * @return
   */
  public int delete(int loginno);
  
  


}
