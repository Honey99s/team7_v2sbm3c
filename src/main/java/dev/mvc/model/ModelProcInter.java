package dev.mvc.model;

import java.util.ArrayList;

public interface ModelProcInter {
    /**
     * 등록. 추상메소드 -> Spring BOOT가 구현
     * @param modelVO 객체
     * @return
     */
    public int create(ModelVO modelVO);
    
    /**
     * 전체 목록
     * @return
     */
    public ArrayList<ModelVO> list_all();
    
    /**
     * 조회
     * @param modelno
     * @return 
     */
    public ModelVO read(int modelno);
    
    /**
     * 수정   
     * @param modelVO
     * @return 수정된 레코드 개수
     */
    public int update(ModelVO modelVO);

    /**
     * 삭제
     * @param modelno 삭제할 레코드 PK 번호
     * @return 삭제된 레코드 갯수
     */
    public int delete(int modelno);
    
    /**
     * 우선 순위 높임, 10 등 -> 1 등   
     * @param modelno
     * @return 수정된 레코드 갯수
     */
    public int update_seqno_forward(int modelno);

    /**
     * 우선 순위 낮춤, 1 등 -> 10 등   
     * @param modelno
     * @return 수정된 레코드 갯수
     */
    public int update_seqno_backward(int modelno);
    
    /**
     * 카테고리 공개 설정
     * @param modelno
     * @return
     */
    public int update_visible_y(int modelno);
    
    /**
     * 카테고리 비공개 설정
     * @param modelno
     * @return
     */
    public int update_visible_n(int modelno);
    
    /**
     * 비회원/회원 SELECT LIST
     * @return
     */
    public ArrayList<ModelVO> list_all_y();
    
  }
