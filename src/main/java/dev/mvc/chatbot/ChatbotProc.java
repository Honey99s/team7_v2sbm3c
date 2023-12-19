package dev.mvc.chatbot;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.chatbot.ChatbotProc")
public class ChatbotProc implements ChatbotProcInter {
  @Autowired
  private ChatbotDAOInter chatbotDAO;

  @Override
  public int create(ChatbotVO chatbotVO) {
    int cnt = this.chatbotDAO.create(chatbotVO);
    return cnt;
  }

  @Override
  public ArrayList<ChatbotVO> list_all() {
    ArrayList<ChatbotVO> list = this.chatbotDAO.list_all();
    return list;
  }

  @Override
  public ChatbotVO read(int chatbotno) {
    ChatbotVO chatbotVO = this.chatbotDAO.read(chatbotno);
    return chatbotVO;
  }

  @Override
  public int delete(int chatbotno) {
    int cnt = this.chatbotDAO.delete(chatbotno);
    return cnt;
  }

  @Override
  public int delete1(int customerno) {
    int cnt = this.chatbotDAO.delete(customerno);
    return 0;
  }
  
  
  

}
