package dev.mvc.qna;

import java.util.ArrayList;

public interface QnaProcInter {

  /**
   *  등록
   * @param qnaVO
   * @return
   */
  public int create(QnaVO qnaVO);
  
  /**
   * 모든 조건 목록
   * @return
   */
  public ArrayList<QnaVO> list_all();
  
  /**
   * 조회
   * @param qnano
   * @return
   */
  public QnaVO read(int qnano);
  
  /**
   * 조건 정보 수정
   * @param qnaVO
   * @return 처리된 레코드 개수
   */
  public int update(QnaVO qnaVO);
  
  /**
   * 삭제
   * @param qnano
   * @return 삭제된 레코드 개수
   */
  public int delete(int qnano);


  
}
