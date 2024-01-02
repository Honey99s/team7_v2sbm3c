package dev.mvc.ggultip;

import java.util.ArrayList;

public interface GgultipProcInter {

  /**
   *  등록
   * @param ggultipVO
   * @return
   */
  public int create(GgultipVO ggultipVO);
  
  /**
   * 모든 조건 목록
   * @return
   */
  public ArrayList<GgultipVO> list_all();
  
  /**
   * 조회
   * @param ggultipno
   * @return
   */
  public GgultipVO read(int ggultipno);
  
  /**
   * 조건 정보 수정
   * @param ggultipVO
   * @return 처리된 레코드 개수
   */
  public int update(GgultipVO ggultipVO);
  
  /**
   * 삭제
   * @param ggultipno
   * @return 삭제된 레코드 개수
   */
  public int delete(int ggultipno);
  
  
  
  
}
