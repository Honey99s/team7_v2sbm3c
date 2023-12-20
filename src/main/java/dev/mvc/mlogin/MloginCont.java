package dev.mvc.mlogin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



import dev.mvc.master.MasterProcInter;


@Controller
public class MloginCont {
  @Autowired
  @Qualifier("dev.mvc.mlogin.MloginProc")
  private MloginProcInter mloginProc;
  
  @Autowired
  @Qualifier("dev.mvc.master.MasterProc") // @Component("dev.mvc.master.MasterProc")
  private MasterProcInter masterProc;
  
  public MloginCont() {
    System.out.println("-> MloginCont created.");
  }
  

  
  /**
   * 전체 목록
   * http://localhost:9093/mlogin/list_all.do
   * @return 
   */
  @RequestMapping(value="/mlogin/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all(HttpSession session, HttpServletRequest request) {
    System.out.println("-> list_all");
    ModelAndView mav =  new ModelAndView();
    
    if (this.masterProc.isMaster(session) == true) {
      mav.setViewName("/mlogin/list_all"); // /WEB-INF/views/mlogin/list_all.jsp
      ArrayList<MloginVO> list = this.mloginProc.list_all();
      System.out.println("-> list_size : " + list.size());
      mav.addObject("list", list);
     
    } else {
      mav.setViewName("/master/login_need"); // /WEB-INF/views/master/login_need.jsp
      
    }
    
    return mav;
  }
  
  /**
   * 조회
   * http://localhost:9093/mlogin/read.do?mloginno=1
   * @return
   */
  @RequestMapping(value="/mlogin/read.do", method = RequestMethod.GET)
  public ModelAndView read(int mloginno) { 
    System.out.println("-> read");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mlogin/read");
    
    MloginVO mloginVO = this.mloginProc.read(mloginno);
    System.out.println("-> done");
    
    mav.addObject("mloginVO", mloginVO);
    
    return mav;
  }
  
  
  /**
   * 파일 삭제 폼
   * http://localhost:9093/mlogin/delete.do?mloginno=1
   * 
   * @return
   */
  @RequestMapping(value = "/mlogin/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int mloginno) {
    System.out.println("-> delete");
    ModelAndView mav = new ModelAndView();
    
    if (this.masterProc.isMaster(session) == true) {
      System.out.println("-> master");
      MloginVO mloginVO = this.mloginProc.read(mloginno);
      mav.addObject("mloginVO", mloginVO);
      
      mav.setViewName("/mlogin/delete"); 
      
    } else {
      mav.setViewName("/master/login_need"); // /WEB-INF/views/master/login_need.jsp
      mav.setViewName("redirect:/master/msg.do"); 
    }


    return mav; 
  }
  /**
   * 삭제 처리 http://localhost:9093/mlogin/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/mlogin/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(MloginVO mloginVO) {
    System.out.println("-> deletedo");
    ModelAndView mav = new ModelAndView();
          
    MloginVO mloginVO_read = this.mloginProc.read(mloginVO.getMloginno());
    this.mloginProc.delete(mloginVO.getMloginno()); // DBMS 삭제
    

    mav.addObject("mloginno", mloginVO.getMloginno());
    mav.setViewName("redirect:/mlogin/list_all.do"); 
    
    return mav;
  }  
  
  
}