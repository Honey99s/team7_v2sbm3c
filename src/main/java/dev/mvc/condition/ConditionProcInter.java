package dev.mvc.condition;

import java.util.ArrayList;

public interface ConditionProcInter {

  /**
   *  등록
   * @param conditionVO
   * @return
   */
  public int create(ConditionVO conditionVO);
  
  /**
   * 모든 조건 목록
   * @return
   */
  public ArrayList<ConditionVO> list_all();
  
  /**
   * 조회
   * @param conditionno
   * @return
   */
  public ConditionVO read(int conditionno);
  
  /**
   * 조건 정보 수정
   * @param conditionVO
   * @return 처리된 레코드 개수
   */
  public int update(ConditionVO conditionVO);
  
  /**
   * 삭제
   * @param conditionno
   * @return 삭제된 레코드 개수
   */
  public int delete(int conditionno);


  
}
