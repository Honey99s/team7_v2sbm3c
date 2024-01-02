package dev.mvc.ggultip;

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
public class GgultipCont {
  @Autowired
  @Qualifier("dev.mvc.ggultip.GgultipProc")
  private GgultipProcInter ggultipProc;
  
  @Autowired
  @Qualifier("dev.mvc.customer.CustomerProc")
  private CustomerProcInter customerProc;
  
  public GgultipCont () {
    System.out.println("-> GgultipCont created.");
  }
  /**
   * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원, 새로고침 방지, EL에서 param으로 접근
   * POST → url → GET → 데이터 전송
   * @return
   */
  @RequestMapping(value="/ggultip/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
    //FORM 출력 // http://localhost:9093/ggultip/create.do
    @RequestMapping(value="/ggultip/create.do", method=RequestMethod.GET)
    public ModelAndView create() {
      ModelAndView mav =  new ModelAndView();
      mav.setViewName("/ggultip/create"); // /WEB-INF/views/ggultip/create.jsp
      
      return mav;
    }
    //FORM 데이터 처리 // http://localhost:9093/ggultip/create.do
    @RequestMapping(value="/ggultip/create.do", method=RequestMethod.POST)
    public ModelAndView create(GgultipVO ggultipVO) {
      System.out.println("->create");
      ModelAndView mav =  new ModelAndView();
      
     int cnt = this.ggultipProc.create(ggultipVO);
     System.out.println("->cnt: " + cnt);
     
     if(cnt==1) {
       mav.setViewName("redirect:/ggultip/list_all.do");
     }else {
       mav.addObject("code","create_fail");
       mav.setViewName("/ggultip/msg");
     }
     mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
      
      return mav;
    }
    
    /**
     * 전체 목록
     * http://localhost:9093/ggultip/list_all.do
     * @return 
     */
    @RequestMapping(value="/ggultip/list_all.do", method = RequestMethod.GET)
    public ModelAndView list_all(HttpSession session) {
      System.out.println("-> list_all");
      ModelAndView mav =  new ModelAndView();
      mav.setViewName("/ggultip/list_all"); //WEB-INF/views/ggultip/list_all.jsp
      
      
      if (this.customerProc.isCustomer(session) == true) {
        mav.setViewName("/ggultip/list_all"); // /WEB-INF/views/ggultip/list_all.jsp
        System.out.println("-> customer");
        ArrayList<GgultipVO> list = this.ggultipProc.list_all();
        System.out.println("->listsize : " + list.size());
        for (GgultipVO ggultipVO : list) {
          String content = ggultipVO.getContent();
          
          content = Tool.convertChar(content); 
          
          ggultipVO.setContent(content);  

        }
        
        mav.addObject("list", list);
        
      } else {
        mav.setViewName("/customer/login_need"); // /WEB-INF/views/customer/login_need.jsp
        
      }
      
      return mav;
    }
    
    /**
     * 조회
     * http://localhost:9093/ggultip/read.do?ggultipno=1
     * @return
     */
    @RequestMapping(value="/ggultip/read.do", method = RequestMethod.GET)
    public ModelAndView read(int ggultipno) { 
      System.out.println("-> read");
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/ggultip/read");
      
      GgultipVO ggultipVO = this.ggultipProc.read(ggultipno);
      System.out.println("-> done");
      String content = ggultipVO.getContent();
      
      content = Tool.convertChar(content); 
      
      ggultipVO.setContent(content);  
      
      mav.addObject("ggultipVO", ggultipVO);
      
      return mav;
    }
    
    /**
     * 수정폼
     * http://localhost:9093/ggultip/update.do?ggultipno=1
     * @return
     */
    @RequestMapping(value="/ggultip/update.do", method = RequestMethod.GET)
    public ModelAndView update(HttpSession session, int ggultipno) {  //int ggultipno = (int)request.getParameter("ggultipno");
      System.out.println("->update");
      ModelAndView mav = new ModelAndView();
      
      if(this.customerProc.isCustomer(session) == true) {
      System.out.println("->customer");
  
      GgultipVO ggultipVO = this.ggultipProc.read(ggultipno);
      mav.addObject("ggultipVO", ggultipVO);
      mav.setViewName("/ggultip/update"); // /WEB-INF/views/customer/update.jsp
      
      }else {
        mav.setViewName("/customer/login_need");
      }
      
      return mav;
    }
    
    /**
     * 수정 처리, http://localhost:9093/ggultip/update.do
     * @param ggultipVO 수정할 내용
     * @return
     */
    
    @RequestMapping(value="/ggultip/update.do", method = RequestMethod.POST)
    public ModelAndView update(GgultipVO ggultipVO) { // 자동으로 modelVO 객체가 생성되고 폼의 값이 할당됨
      System.out.println("-> updatedo");
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/ggultip/msg"); // /WEB-INF/views/ggultip/msg.jsp
      
      int cnt = this.ggultipProc.update(ggultipVO); // 수정 처리
      System.out.println("-> cnt: " + cnt);
      
      if (cnt == 1) {
        mav.setViewName("redirect:/ggultip/list_all.do");
      } else {
        mav.addObject("code", "update_fail");
        mav.setViewName("/ggultip/msg");
      }
      
      mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
      
      return mav;
    }
    /**
     * 파일 삭제 폼
     * http://localhost:9093/ggultip/delete.do?ggultipno=1
     * 
     * @return
     */
    @RequestMapping(value = "/ggultip/delete.do", method = RequestMethod.GET)
    public ModelAndView delete(HttpSession session, int ggultipno) {
      System.out.println("-> delete");
      ModelAndView mav = new ModelAndView();
      
      if (customerProc.isCustomer(session)) { 
        System.out.println("-> customer");
        GgultipVO ggultipVO = this.ggultipProc.read(ggultipno);
        mav.addObject("ggultipVO", ggultipVO);
        
        mav.setViewName("/ggultip/delete"); 
        
      } else {
        mav.addObject("url", "/customer/login_need"); 
        mav.setViewName("redirect:/customer/msg.do"); 
      }


      return mav; 
    }
    /**
     * 삭제 처리 http://localhost:9093/ggultip/delete.do
     * 
     * @return
     */
    @RequestMapping(value = "/ggultip/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(GgultipVO ggultipVO) {
      System.out.println("-> deletedo");
      ModelAndView mav = new ModelAndView();
            
      GgultipVO ggultipVO_read = this.ggultipProc.read(ggultipVO.getGgultipno());
      this.ggultipProc.delete(ggultipVO.getGgultipno()); // DBMS 삭제
      

      mav.addObject("ggultipno", ggultipVO.getGgultipno());
      mav.setViewName("redirect:/ggultip/list_all.do"); 
      
      return mav;
    }   
    
  }

