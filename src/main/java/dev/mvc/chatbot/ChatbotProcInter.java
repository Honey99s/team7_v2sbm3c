package dev.mvc.chatbot;

import java.util.ArrayList;

public interface ChatbotProcInter {

  /**
   *  등록
   * @param chatbotVO
   * @return
   */
  public int create(ChatbotVO chatbotVO);
  
  /**
   * 모든 챗봇 목록
   * @return
   */
  public ArrayList<ChatbotVO> list_all();
  
  /**
   * 조회
   * @param chatbotno
   * @return
   */
  public ChatbotVO read(int chatbotno);
  
  /**
   * 삭제
   * @param chatbotno
   * @return 삭제된 레코드 개수
   */
  public int delete(int chatbotno);
  
  /**
   * 삭제
   * @param customernono
   * @return 삭제된 레코드 개수
   */
  public int delete1(int customerno);


  
}
