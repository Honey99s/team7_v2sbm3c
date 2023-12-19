package dev.mvc.clogin;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import dev.mvc.customer.CustomerProcInter;


@Controller
public class CloginCont {
  @Autowired
  @Qualifier("dev.mvc.clogin.CloginProc")
  private CloginProcInter cloginProc;
  
  @Autowired
  @Qualifier("dev.mvc.customer.CustomerProc")
  private CustomerProcInter customerProc;
  
  public CloginCont() {
    System.out.println("-> CloginCont created.");
  }
  

  
  /**
   * 전체 목록
   * http://localhost:9093/clogin/list_all.do
   * @return 
   */
  @RequestMapping(value="/clogin/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all(HttpSession session) {
    System.out.println("-> list_all");
    ModelAndView mav =  new ModelAndView();
    mav.setViewName("/clogin/list_all"); //WEB-INF/views/clogin/list_all.jsp
    
    
    if (this.customerProc.isCustomer(session) == true) {
      mav.setViewName("/clogin/list_all"); // /WEB-INF/views/clogin/list_all.jsp
      ArrayList<CloginVO> list = this.cloginProc.list_all();

      
      mav.addObject("list", list);
      
    } else {
      mav.setViewName("/customer/login_need"); // /WEB-INF/views/customer/login_need.jsp
      
    }
    
    return mav;
  }
  
  /**
   * 조회
   * http://localhost:9093/clogin/read.do?cloginno=1
   * @return
   */
  @RequestMapping(value="/clogin/read.do", method = RequestMethod.GET)
  public ModelAndView read(int cloginno) { 
    System.out.println("-> read");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/clogin/read");
    
    CloginVO cloginVO = this.cloginProc.read(cloginno);
    System.out.println("-> done");
    
    mav.addObject("cloginVO", cloginVO);
    
    return mav;
  }
  
  
  /**
   * 파일 삭제 폼
   * http://localhost:9093/clogin/delete.do?cloginno=1
   * 
   * @return
   */
  @RequestMapping(value = "/clogin/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int cloginno) {
    System.out.println("-> delete");
    ModelAndView mav = new ModelAndView();
    
    if (customerProc.isCustomer(session)) { 
      System.out.println("-> customer");
      CloginVO cloginVO = this.cloginProc.read(cloginno);
      mav.addObject("cloginVO", cloginVO);
      
      mav.setViewName("/clogin/delete"); 
      
    } else {
      mav.addObject("url", "/customer/login_need"); 
      mav.setViewName("redirect:/customer/msg.do"); 
    }


    return mav; 
  }
  /**
   * 삭제 처리 http://localhost:9093/clogin/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/clogin/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(CloginVO cloginVO) {
    System.out.println("-> deletedo");
    ModelAndView mav = new ModelAndView();
          
    CloginVO cloginVO_read = this.cloginProc.read(cloginVO.getCloginno());
    this.cloginProc.delete(cloginVO.getCloginno()); // DBMS 삭제
    

    mav.addObject("cloginno", cloginVO.getCloginno());
    mav.setViewName("redirect:/clogin/list_all.do"); 
    
    return mav;
  }  
  
  
}