package dev.mvc.review;

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
public class ReviewCont {
  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc")
  private ReviewProcInter reviewProc;
  
  @Autowired
  @Qualifier("dev.mvc.customer.CustomerProc")
  private CustomerProcInter customerProc;
  
  public ReviewCont () {
    System.out.println("-> ReviewCont created.");
  }
  /**
   * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원, 새로고침 방지, EL에서 param으로 접근
   * POST → url → GET → 데이터 전송
   * @return
   */
  @RequestMapping(value="/review/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  //FORM 출력 // http://localhost:9093/review/create.do
  @RequestMapping(value="/review/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav =  new ModelAndView();
    mav.setViewName("/review/create"); // /WEB-INF/views/review/create.jsp
    
    return mav;
  }
  //FORM 데이터 처리 // http://localhost:9093/review/create.do
  @RequestMapping(value="/review/create.do", method=RequestMethod.POST)
  public ModelAndView create(ReviewVO reviewVO) {
    System.out.println("->create");
    ModelAndView mav =  new ModelAndView();
    
   int cnt = this.reviewProc.create(reviewVO);
   System.out.println("->cnt: " + cnt);
   
   if(cnt==1) {
     mav.setViewName("redirect:/review/list_all.do");
   }else {
     mav.addObject("code","create_fail");
     mav.setViewName("/review/msg");
   }
   mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
    
    return mav;
  }
    
  /**
   * 전체 목록
   * http://localhost:9093/review/list_all.do
   * @return 
   */
  @RequestMapping(value="/review/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all(HttpSession session) {
    System.out.println("-> list_all");
    ModelAndView mav =  new ModelAndView();
    mav.setViewName("/review/list_all"); //WEB-INF/views/review/list_all.jsp
    
    
    if (this.customerProc.isCustomer(session) == true) {
      mav.setViewName("/review/list_all"); // /WEB-INF/views/review/list_all.jsp
      System.out.println("-> customer");
      ArrayList<ReviewVO> list = this.reviewProc.list_all();
      System.out.println("->listsize : " + list.size());
      for (ReviewVO reviewVO : list) {
        String title = reviewVO.getTitle();
        String content = reviewVO.getContent();
        
        title = Tool.convertChar(title);  // 특수 문자 처리
        content = Tool.convertChar(content); 
        
        reviewVO.setTitle(title);
        reviewVO.setContent(content);  

      }
      
      mav.addObject("list", list);
      
    } else {
      mav.setViewName("/customer/login_need"); // /WEB-INF/views/customer/login_need.jsp
      
    }
    
    return mav;
  }
    
  /**
   * 조회
   * http://localhost:9093/review/read.do?reviewno=1
   * @return
   */
  @RequestMapping(value="/review/read.do", method = RequestMethod.GET)
  public ModelAndView read(int reviewno) { 
    System.out.println("-> read");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/read");
    
    ReviewVO reviewVO = this.reviewProc.read(reviewno);
    System.out.println("-> done");
    String title = reviewVO.getTitle();
    String content = reviewVO.getContent();
    
    title = Tool.convertChar(title);  // 특수 문자 처리
    content = Tool.convertChar(content); 
    
    reviewVO.setTitle(title);
    reviewVO.setContent(content);  
    
    mav.addObject("reviewVO", reviewVO);
    
    return mav;
  }
  
  /**
   * 수정폼
   * http://localhost:9093/review/update.do?reviewno=1
   * @return
   */
  @RequestMapping(value="/review/update.do", method = RequestMethod.GET)
  public ModelAndView update(HttpSession session, int reviewno) {  //int reviewno = (int)request.getParameter("reviewno");
    System.out.println("->update");
    ModelAndView mav = new ModelAndView();
    
    if(this.customerProc.isCustomer(session) == true) {
    System.out.println("->customer");

    ReviewVO reviewVO = this.reviewProc.read(reviewno);
    mav.addObject("reviewVO", reviewVO);
    mav.setViewName("/review/update"); // /WEB-INF/views/customer/update.jsp
    
    }else {
      mav.setViewName("/customer/login_need");
    }
    
    return mav;
  }
  
  /**
   * 수정 처리, http://localhost:9093/review/update.do
   * @param reviewVO 수정할 내용
   * @return
   */
  
  @RequestMapping(value="/review/update.do", method = RequestMethod.POST)
  public ModelAndView update(ReviewVO reviewVO) { // 자동으로 modelVO 객체가 생성되고 폼의 값이 할당됨
    System.out.println("-> updatedo");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/msg"); // /WEB-INF/views/review/msg.jsp
    
    int cnt = this.reviewProc.update(reviewVO); // 수정 처리
    System.out.println("-> cnt: " + cnt);
    
    if (cnt == 1) {
      mav.setViewName("redirect:/review/list_all.do");
    } else {
      mav.addObject("code", "update_fail");
      mav.setViewName("/review/msg");
    }
    
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
    
    return mav;
  }
  /**
   * 파일 삭제 폼
   * http://localhost:9093/review/delete.do?reviewno=1
   * 
   * @return
   */
  @RequestMapping(value = "/review/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int reviewno) {
    System.out.println("-> delete");
    ModelAndView mav = new ModelAndView();
    
    if (customerProc.isCustomer(session)) { 
      System.out.println("-> customer");
      ReviewVO reviewVO = this.reviewProc.read(reviewno);
      mav.addObject("reviewVO", reviewVO);
      
      mav.setViewName("/review/delete"); 
      
    } else {
      mav.addObject("url", "/customer/login_need"); 
      mav.setViewName("redirect:/customer/msg.do"); 
    }


    return mav; 
  }
  /**
   * 삭제 처리 http://localhost:9093/review/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/review/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(ReviewVO reviewVO) {
    System.out.println("-> deletedo");
    ModelAndView mav = new ModelAndView();
          
    ReviewVO reviewVO_read = this.reviewProc.read(reviewVO.getReviewno());
    this.reviewProc.delete(reviewVO.getReviewno()); // DBMS 삭제
    

    mav.addObject("reviewno", reviewVO.getReviewno());
    mav.setViewName("redirect:/review/list_all.do"); 
    
    return mav;
  }   
  
}

