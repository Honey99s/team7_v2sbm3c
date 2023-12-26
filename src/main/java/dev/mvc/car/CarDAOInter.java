package dev.mvc.car;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.model.ModelVO;

/**
 * Spring Boot 자동 구현
 * @author user
 *
 */
public interface CarDAOInter {
  
  /**
   *  등록, 추상 메소드
   * @param carVO
   * @return
   */
  public int create(CarVO carVO);

  /**
   * 모든 차 목록
   * @return
   */
  public ArrayList<CarVO> list_all();
  
  /**
   * 차종별 등록된 차 목록
   * @param modelno
   * @return
   */
  public ArrayList<CarVO> list_by_modelno(int modelno);
  
  /**
   * 조회
   * @param carvo
   * @return
   */
  public CarVO read(int carno);
  
  /**
   * map 등록, 수정, 삭제
   * @param map
   * @return 수정된 레코드 개수
   */
  public int map(HashMap<String, Object> map);
  
  /**
   * youtube 등록, 수정, 삭제
   * @param youtube
   * @return 수정된 레코드 개수
   */
  public int youtube(HashMap<String, Object> youtube);
  
  /**
   * 차종별 검색 목록
   * @param map
   * @return
   */
  public ArrayList<CarVO> list_by_modelno_search(HashMap<String, Object> hashMap);
  
  /**
   * 차종별 검색된 레코드 갯수
   * @param map
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 차종별 검색 목록 + 페이징
   * @param carVO
   * @return
   */
  public ArrayList<CarVO> list_by_modelno_search_paging(CarVO carVO);
  
  /**
   * 차종 추천
   * @param modelno
   * @return
   */
  public ArrayList<CarVO> list_recommend_by_modelno(int modelno);
  
  /**
   * 등록일순 자동차 목록
   * @param rdate
   * @return
   */
  public ArrayList<CarVO> list_recommend_by_rdate(String rdate);
  
  /**
   *  패스워드 검사
   * @param hashMap
   * @return
   */
  public int password_check(HashMap<String, Object> hashMap);
  
  /**
   *  글 정보 수정
   * @param carVO
   * @return 처리된 레코드 개수
   */
  public int update_text(CarVO carVO);
  
  /**
   * 파일 정보 수정
   * @param carVO
   * @return 처리된 레코드 개수
   */
  public int update_file(CarVO carVO);
  
  /**
   * 삭제
   * @param carno
   * @return 삭제된 레코드 개수
   */
  public int delete(int carno);
  
  /**
   * FK modelno 값이 같은 레코드 개수 산출
   * @param modelno
   * @return
   */
  public int count_by_modelno(int modelno);
  
  /**
   * 특정 차종에 속한 모든 레코드 삭제
   * @param modelno
   * @return 삭제된 레코드 개수
   */
  public int delete_by_modelno(int modelno);
  
  /**
   * 글 수 증가
   * @param 
   * @return
   */ 
  public int increaseReplycnt(int carno);
 
  /**
   * 글 수 감소
   * @param 
   * @return
   */   
  public int decreaseReplycnt(int carno);
  
}
