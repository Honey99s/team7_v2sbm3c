package dev.mvc.mlogin;

import java.util.ArrayList;


public interface MloginDAOInter {
  
  /**
   * 로그인 내역 제작
   * @param mloginVO
   * @return 
   */
  public int create(MloginVO mloginVO);
  
  /**
   * 모든 로그인 내역
   * @return
   */
  public ArrayList<MloginVO> list_all();
  
  /**
   * 로그인 내역 조회
   * @param mloginno
   * @return
   */
  public MloginVO read(int mloginno);
  
  /**
   * 로그인내역 삭제
   * @param mloginno
   * @return
   */
  public int delete(int mloginno);
  
  /**
   * 로그인내역 삭제
   * @param masterno
   * @return
   */
  public int delete1(int masterno);
  


}
