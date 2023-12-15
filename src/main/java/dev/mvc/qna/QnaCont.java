package dev.mvc.qna;

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
public class QnaCont {
  @Autowired
  @Qualifier("dev.mvc.qna.QnaProc")
  private QnaProcInter qnaProc;
  
  @Autowired
  @Qualifier("dev.mvc.customer.CustomerProc")
  private CustomerProcInter customerProc;
  
  public QnaCont () {
    System.out.println("-> QnaCont created.");
  }
  /**
   * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원, 새로고침 방지, EL에서 param으로 접근
   * POST → url → GET → 데이터 전송
   * @return
   */
  @RequestMapping(value="/qna/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  //FORM 출력 // http://localhost:9093/qna/create.do
  @RequestMapping(value="/qna/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav =  new ModelAndView();
    mav.setViewName("/qna/create"); // /WEB-INF/views/qna/create.jsp
    
    return mav;
  }
  //FORM 데이터 처리 // http://localhost:9093/qna/create.do
  @RequestMapping(value="/qna/create.do", method=RequestMethod.POST)
  public ModelAndView create(QnaVO qnaVO) {
    System.out.println("->create");
    ModelAndView mav =  new ModelAndView();
    
   int cnt = this.qnaProc.create(qnaVO);
   System.out.println("->cnt: " + cnt);
   
   if(cnt==1) {
     mav.setViewName("redirect:/qna/list_all.do");
   }else {
     mav.addObject("code","create_fail");
     mav.setViewName("/qna/msg");
   }
   mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
    
    return mav;
  }
    
  /**
   * 전체 목록
   * http://localhost:9093/qna/list_all.do
   * @return 
   */
  @RequestMapping(value="/qna/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all(HttpSession session) {
    System.out.println("-> list_all");
    ModelAndView mav =  new ModelAndView();
    mav.setViewName("/qna/list_all"); //WEB-INF/views/qna/list_all.jsp
    
    
    if (this.customerProc.isCustomer(session) == true) {
      mav.setViewName("/qna/list_all"); // /WEB-INF/views/qna/list_all.jsp
      System.out.println("-> customer");
      ArrayList<QnaVO> list = this.qnaProc.list_all();
      System.out.println("->listsize : " + list.size());
      for (QnaVO qnaVO : list) {
        String title = qnaVO.getTitle();
        String content = qnaVO.getContent();
        
        title = Tool.convertChar(title);  // 특수 문자 처리
        content = Tool.convertChar(content); 
        
        qnaVO.setTitle(title);
        qnaVO.setContent(content);  

      }
      
      mav.addObject("list", list);
      
    } else {
      mav.setViewName("/customer/login_need"); // /WEB-INF/views/customer/login_need.jsp
      
    }
    
    return mav;
  }
    
  /**
   * 조회
   * http://localhost:9093/qna/read.do?qnano=1
   * @return
   */
  @RequestMapping(value="/qna/read.do", method = RequestMethod.GET)
  public ModelAndView read(int qnano) { 
    System.out.println("-> read");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qna/read");
    
    QnaVO qnaVO = this.qnaProc.read(qnano);
    System.out.println("-> done");
    String title = qnaVO.getTitle();
    String content = qnaVO.getContent();
    
    title = Tool.convertChar(title);  // 특수 문자 처리
    content = Tool.convertChar(content); 
    
    qnaVO.setTitle(title);
    qnaVO.setContent(content);  
    
    mav.addObject("qnaVO", qnaVO);
    
    return mav;
  }
  
  /**
   * 수정폼
   * http://localhost:9093/qna/update.do?qnano=1
   * @return
   */
  @RequestMapping(value="/qna/update.do", method = RequestMethod.GET)
  public ModelAndView update(HttpSession session, int qnano) {  //int qnano = (int)request.getParameter("qnano");
    System.out.println("->update");
    ModelAndView mav = new ModelAndView();
    
    if(this.customerProc.isCustomer(session) == true) {
    System.out.println("->customer");

    QnaVO qnaVO = this.qnaProc.read(qnano);
    mav.addObject("qnaVO", qnaVO);
    mav.setViewName("/qna/update"); // /WEB-INF/views/customer/update.jsp
    
    }else {
      mav.setViewName("/customer/login_need");
    }
    
    return mav;
  }
  
  /**
   * 수정 처리, http://localhost:9093/qna/update.do
   * @param qnaVO 수정할 내용
   * @return
   */
  
  @RequestMapping(value="/qna/update.do", method = RequestMethod.POST)
  public ModelAndView update(QnaVO qnaVO) { // 자동으로 modelVO 객체가 생성되고 폼의 값이 할당됨
    System.out.println("-> updatedo");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qna/msg"); // /WEB-INF/views/qna/msg.jsp
    
    int cnt = this.qnaProc.update(qnaVO); // 수정 처리
    System.out.println("-> cnt: " + cnt);
    
    if (cnt == 1) {
      mav.setViewName("redirect:/qna/list_all.do");
    } else {
      mav.addObject("code", "update_fail");
      mav.setViewName("/qna/msg");
    }
    
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
    
    return mav;
  }
  /**
   * 파일 삭제 폼
   * http://localhost:9093/qna/delete.do?qnano=1
   * 
   * @return
   */
  @RequestMapping(value = "/qna/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int qnano) {
    System.out.println("-> delete");
    ModelAndView mav = new ModelAndView();
    
    if (customerProc.isCustomer(session)) { 
      System.out.println("-> customer");
      QnaVO qnaVO = this.qnaProc.read(qnano);
      mav.addObject("qnaVO", qnaVO);
      
      mav.setViewName("/qna/delete"); 
      
    } else {
      mav.addObject("url", "/customer/login_need"); 
      mav.setViewName("redirect:/customer/msg.do"); 
    }


    return mav; 
  }
  /**
   * 삭제 처리 http://localhost:9093/qna/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/qna/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(QnaVO qnaVO) {
    System.out.println("-> deletedo");
    ModelAndView mav = new ModelAndView();
          
    QnaVO qnaVO_read = this.qnaProc.read(qnaVO.getQnano());
    this.qnaProc.delete(qnaVO.getQnano()); // DBMS 삭제
    

    mav.addObject("qnano", qnaVO.getQnano());
    mav.setViewName("redirect:/qna/list_all.do"); 
    
    return mav;
  }   
  
}

