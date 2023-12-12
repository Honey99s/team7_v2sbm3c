package dev.mvc.chatbot;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import dev.mvc.customer.CustomerProcInter;
import dev.mvc.tool.Tool;




@Controller
public class ChatbotCont {
  @Autowired
  @Qualifier("dev.mvc.chatbot.ChatbotProc")
  private ChatbotProcInter chatbotProc;
  
  @Autowired
  @Qualifier("dev.mvc.customer.CustomerProc")
  private CustomerProcInter customerProc;
  
  public ChatbotCont () {
    System.out.println("-> ChatbotCont created.");
  }
  /**
   * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원, 새로고침 방지, EL에서 param으로 접근
   * POST → url → GET → 데이터 전송
   * @return
   */
  @RequestMapping(value="/chatbot/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  //FORM 출력 // http://localhost:9093/chatbot/create.do
  @RequestMapping(value="/chatbot/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav =  new ModelAndView();
    mav.setViewName("/chatbot/create"); // /WEB-INF/views/chatbot/create.jsp
    
    return mav;
  }
  //FORM 데이터 처리 // http://localhost:9093/chatbot/create.do
  @RequestMapping(value="/chatbot/create.do", method=RequestMethod.POST)
  public ModelAndView create(ChatbotVO chatbotVO) {
    System.out.println("->create");
    ModelAndView mav =  new ModelAndView();
    
   int cnt = this.chatbotProc.create(chatbotVO);
   System.out.println("->cnt: " + cnt);
   
   if(cnt==1) {
     mav.setViewName("redirect:/chatbot/list_all.do");
   }else {
     mav.addObject("code","create_fail");
     mav.setViewName("/chatbot/msg");
   }
   mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
    
    return mav;
  }
      
  /**
   * 전체 목록
   * http://localhost:9093/chatbot/list_all.do
   * @return 
   */
  @RequestMapping(value="/chatbot/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all(HttpSession session) {
    System.out.println("-> list_all");
    ModelAndView mav =  new ModelAndView();
    mav.setViewName("/chatbot/list_all"); //WEB-INF/views/chatbot/list_all.jsp
    
    if (this.customerProc.isCustomer(session) == true) {
      mav.setViewName("/chatbot/list_all"); // /WEB-INF/views/chatbot/list_all.jsp
      System.out.println("-> customer");
      ArrayList<ChatbotVO> list = this.chatbotProc.list_all();
      System.out.println("->listsize : " + list.size());
      
      mav.addObject("list", list);
      
    } else {
      mav.setViewName("/customer/login_need"); // /WEB-INF/views/customer/login_need.jsp
      
    }
    
    return mav;
  }
    
  /**
   * 조회
   * http://localhost:9093/chatbot/read.do?chatbotno=1
   * @return
   */
  @RequestMapping(value="/chatbot/read.do", method = RequestMethod.GET)
  public ModelAndView read(int chatbotno) { 
    System.out.println("-> read");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/chatbot/read");
    
    ChatbotVO chatbotVO = this.chatbotProc.read(chatbotno);
    System.out.println("-> done");
    
    mav.addObject("chatbotVO", chatbotVO);
    
    return mav;
  }
  
  /**
   * 수정폼
   * http://localhost:9093/chatbot/update.do?chatbotno=1
   * @return
   */
  @RequestMapping(value="/chatbot/update.do", method = RequestMethod.GET)
  public ModelAndView update(HttpSession session, int chatbotno) {  //int chatbotno = (int)request.getParameter("chatbotno");
    System.out.println("->update");
    ModelAndView mav = new ModelAndView();
    
    if(this.customerProc.isCustomer(session) == true) {
    System.out.println("->customer");

    ChatbotVO chatbotVO = this.chatbotProc.read(chatbotno);
    mav.addObject("chatbotVO", chatbotVO);
    mav.setViewName("/chatbot/update"); // /WEB-INF/views/customer/update.jsp
    
    }else {
      mav.setViewName("/customer/login_need");
    }
    
    return mav;
  }
  

  /**
   * 파일 삭제 폼
   * http://localhost:9093/chatbot/delete.do?chatbotno=1
   * 
   * @return
   */
  @RequestMapping(value = "/chatbot/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int chatbotno) {
    System.out.println("-> delete");
    ModelAndView mav = new ModelAndView();
    
    if (customerProc.isCustomer(session)) { 
      System.out.println("-> customer");
      ChatbotVO chatbotVO = this.chatbotProc.read(chatbotno);
      mav.addObject("chatbotVO", chatbotVO);
      
      mav.setViewName("/chatbot/delete"); 
      
    } else {
      mav.addObject("url", "/customer/login_need"); 
      mav.setViewName("redirect:/customer/msg.do"); 
    }


    return mav; 
  }
  /**
   * 삭제 처리 http://localhost:9093/chatbot/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/chatbot/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(ChatbotVO chatbotVO) {
    System.out.println("-> deletedo");
    ModelAndView mav = new ModelAndView();
          
    ChatbotVO chatbotVO_read = this.chatbotProc.read(chatbotVO.getChatbotno());
    this.chatbotProc.delete(chatbotVO.getChatbotno()); // DBMS 삭제
    

    mav.addObject("chatbotno", chatbotVO.getChatbotno());
    mav.setViewName("redirect:/chatbot/list_all.do"); 
    
    return mav;
  }   
  
}

