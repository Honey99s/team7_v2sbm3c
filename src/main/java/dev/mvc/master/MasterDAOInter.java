package dev.mvc.master;

public interface MasterDAOInter {
  
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
   * 회원 정보 조회
   * @param masterno
   * @return
   */
  public MasterVO read(int masterno);

}
