package dev.mvc.master;

import javax.servlet.http.HttpSession;

public interface MasterProcInter {

  /**
   * 로그인
   * @param MasterVO
   * @return
   */
  public int login(MasterVO masterVO);
  
  /**
   * 회원 정보
   * @param String
   * @return
   */
  public MasterVO read_by_id(String id);
  
  /**
   * 관리자 로그인 체크
   * @param session
   * @return
   */
  public boolean isMaster(HttpSession session);
  
  /**
   * 회원 정보 조회
   * @param masterno
   * @return
   */
  public MasterVO read(int masterno);

}
