package dev.mvc.customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;  // 구현 클래스를 교체하기 쉬운 구조 지원

import javax.servlet.http.HttpSession;

public interface CustomerProcInter {
  /**
   * 중복 아이디 검사
   * @param id
   * @return 중복 아이디 갯수
   */
  public int checkID(String id);
  
  /**
   * 회원 가입
   * @param customerVO
   * @return
   */
  public int create(CustomerVO customerVO);
  
  /**
   * 회원 전체 목록
   * @return
   */
  public ArrayList<CustomerVO> list();

  /**
   * customerno로 회원 정보 조회
   * @param customerno
   * @return
   */
  public CustomerVO read(int customerno);
  
  /**
   * id로 회원 정보 조회
   * @param id
   * @return
   */
  public CustomerVO readById(String id);
  
  /**
   * 로그인된 회원 계정인지 검사합니다.
   * @param session
   * @return true: 사용자
   */
  public boolean isCustomer(HttpSession session);

  /**
   * 로그인된 회원 관리자 계정인지 검사합니다.
   * @param session
   * @return true: 사용자
   */
  public boolean isCustomerAdmin(HttpSession session);

  /**
   * 수정 처리
   * @param customerVO
   * @return
   */
  public int update(CustomerVO customerVO);
 
  /**
   * 회원 삭제 처리
   * @param customerno
   * @return
   */
  public int delete(int customerno);
  
  /**
   * 회원 자식 삭제 처리
   * @param customerno
   * @return
   */
  public int child_delete(int customerno);
  
  /**
   * 현재 패스워드 검사
   * @param map
   * @return 0: 일치하지 않음, 1: 일치함
   */
  public int passwd_check(HashMap<String, Object> map);
  
  /**
   * 패스워드 변경
   * @param map
   * @return 변경된 패스워드 갯수
   */
  public int passwd_update(HashMap<String, Object> map);
  
  /**
   * 로그인 처리
   */
  public int login(HashMap<String, Object> map);
  
  /**
   * 아이디 찾기
   * @param cname
   * @param phone
   * @return
   */
  public CustomerVO find_id(String cname, String tel);
  
  /**
   * 등급 변경 처리
   * @param map
   * @return
   */
  public int drop(HashMap<String, Object> map); 
  
}




