package dev.mvc.good;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.car.CarProcInter;
import dev.mvc.customer.CustomerProcInter;
import dev.mvc.tool.Tool;


@Controller
public class GoodCont {
  @Autowired
  @Qualifier("dev.mvc.good.GoodProc")
  private GoodProcInter goodProc;
  
  @Autowired
  @Qualifier("dev.mvc.car.CarProc")
  private CarProcInter carProc;
  
  @Autowired
  @Qualifier("dev.mvc.customer.CustomerProc")
  private CustomerProcInter customerProc;
  
  public GoodCont () {
    System.out.println("-> GoodCont created.");
  }
  /**
   * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원, 새로고침 방지, EL에서 param으로 접근
   * POST → url → GET → 데이터 전송
   * @return
   */
  @RequestMapping(value="/good/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
    
    /**
     * 전체 목록
     * http://localhost:9093/good/list_all.do
     * @return 
     */
    @RequestMapping(value="/good/list_all.do", method = RequestMethod.GET)
    public ModelAndView list_all(HttpSession session) {
      System.out.println("-> list_all");
      ModelAndView mav =  new ModelAndView();
      mav.setViewName("/good/list_all"); //WEB-INF/views/good/list_all.jsp
      
      
      if (this.customerProc.isCustomer(session) == true) {
        mav.setViewName("/good/list_all"); // /WEB-INF/views/good/list_all.jsp
        System.out.println("-> customer");
        ArrayList<GoodVO> list = this.goodProc.list_all();
        System.out.println("->listsize : " + list.size());
        
        mav.addObject("list", list);
        
      } else {
        mav.setViewName("/customer/login_need"); // /WEB-INF/views/customer/login_need.jsp
        
      }
      
      return mav;
    }
    
    /**
     * 조회
     * http://localhost:9093/good/read.do?goodno=1
     * @return
     */
    @RequestMapping(value="/good/read.do", method = RequestMethod.GET)
    public ModelAndView read(int goodno) { 
      System.out.println("-> read");
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/good/read");
      
      GoodVO goodVO = this.goodProc.read(goodno);
      System.out.println("-> done");
      
      mav.addObject("goodVO", goodVO);
      
      return mav;
    }
    
  
    /**
     * 파일 삭제 폼
     * http://localhost:9093/good/delete.do?goodno=1
     * 
     * @return
     */
    @RequestMapping(value = "/good/delete.do", method = RequestMethod.GET)
    public ModelAndView delete(HttpSession session, int goodno) {
      System.out.println("-> delete");
      ModelAndView mav = new ModelAndView();
      
      if (customerProc.isCustomer(session)) { 
        System.out.println("-> customer");
        GoodVO goodVO = this.goodProc.read(goodno);
        mav.addObject("goodVO", goodVO);
        
        mav.setViewName("/good/delete"); 
        
      } else {
        mav.addObject("url", "/customer/login_need"); 
        mav.setViewName("redirect:/customer/msg.do"); 
      }


      return mav; 
    }
    /**
     * 삭제 처리 http://localhost:9093/good/delete.do
     * 
     * @return
     */
    @RequestMapping(value = "/good/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(GoodVO goodVO) {
      System.out.println("-> deletedo");
      ModelAndView mav = new ModelAndView();
            
      GoodVO goodVO_read = this.goodProc.read(goodVO.getGoodno());
      this.goodProc.delete(goodVO.getGoodno()); // DBMS 삭제
      

      mav.addObject("goodno", goodVO.getGoodno());
      mav.setViewName("redirect:/good/list_all.do"); 
      
      return mav;
    }   
    
  }

