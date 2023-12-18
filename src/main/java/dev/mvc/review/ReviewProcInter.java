package dev.mvc.review;

import java.util.ArrayList;

public interface ReviewProcInter {

  /**
   *  등록
   * @param qnaVO
   * @return
   */
  public int create(ReviewVO qnaVO);
  
  /**
   * 모든 조건 목록
   * @return
   */
  public ArrayList<ReviewVO> list_all();
  
  /**
   * 조회
   * @param qnano
   * @return
   */
  public ReviewVO read(int qnano);
  
  /**
   * 조건 정보 수정
   * @param qnaVO
   * @return 처리된 레코드 개수
   */
  public int update(ReviewVO qnaVO);
  
  /**
   * 삭제
   * @param qnano
   * @return 삭제된 레코드 개수
   */
  public int delete(int qnano);


  
}
