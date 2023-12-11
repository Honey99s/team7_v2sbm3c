package dev.mvc.recommend;

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
import dev.mvc.model.ModelProcInter;
import dev.mvc.tool.Tool;




@Controller
public class RecommendCont {
  @Autowired
  @Qualifier("dev.mvc.recommend.RecommendProc")
  private RecommendProcInter recommendProc;
  
  @Autowired
  @Qualifier("dev.mvc.model.ModelProc")
  private ModelProcInter modelProc;
  
  @Autowired
  @Qualifier("dev.mvc.car.CarProc")
  private CarProcInter carProc;
  
  @Autowired
  @Qualifier("dev.mvc.customer.CustomerProc")
  private CustomerProcInter customerProc;
  
  public RecommendCont () {
    System.out.println("-> RecommendCont created.");
  }
  /**
   * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원, 새로고침 방지, EL에서 param으로 접근
   * POST → url → GET → 데이터 전송
   * @return
   */
  @RequestMapping(value="/recommend/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
    //FORM 출력 // http://localhost:9093/recommend/create.do
    @RequestMapping(value="/recommend/create.do", method=RequestMethod.GET)
    public ModelAndView create() {
      ModelAndView mav =  new ModelAndView();
      mav.setViewName("/recommend/create"); // /WEB-INF/views/recommend/create.jsp
      
      return mav;
    }
    //FORM 데이터 처리 // http://localhost:9093/recommend/create.do
    @RequestMapping(value="/recommend/create.do", method=RequestMethod.POST)
    public ModelAndView create(RecommendVO recommendVO) {
      System.out.println("->create");
      ModelAndView mav =  new ModelAndView();
      
     int cnt = this.recommendProc.create(recommendVO);
     System.out.println("->cnt: " + cnt);
     
     if(cnt==1) {
       mav.setViewName("redirect:/recommend/list_all.do");
     }else {
       mav.addObject("code","create_fail");
       mav.setViewName("/recommend/msg");
     }
     mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
      
      return mav;
    }
    
    /**
     * 전체 목록
     * http://localhost:9093/recommend/list_all.do
     * @return 
     */
    @RequestMapping(value="/recommend/list_all.do", method = RequestMethod.GET)
    public ModelAndView list_all(HttpSession session) {
      System.out.println("-> list_all");
      ModelAndView mav =  new ModelAndView();
      mav.setViewName("/recommend/list_all"); //WEB-INF/views/recommend/list_all.jsp
      
      
      if (this.customerProc.isCustomer(session) == true) {
        mav.setViewName("/recommend/list_all"); // /WEB-INF/views/recommend/list_all.jsp
        System.out.println("-> customer");
        ArrayList<RecommendVO> list = this.recommendProc.list_all();
        System.out.println("->listsize : " + list.size());
        
        mav.addObject("list", list);
        
      } else {
        mav.setViewName("/customer/login_need"); // /WEB-INF/views/customer/login_need.jsp
        
      }
      
      return mav;
    }
    
    /**
     * 조회
     * http://localhost:9093/recommend/read.do?recommendno=1
     * @return
     */
    @RequestMapping(value="/recommend/read.do", method = RequestMethod.GET)
    public ModelAndView read(int recommendno) { 
      System.out.println("-> read");
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/recommend/read");
      
      RecommendVO recommendVO = this.recommendProc.read(recommendno);
      System.out.println("-> done");
      
      mav.addObject("recommendVO", recommendVO);
      
      return mav;
    }
    
    /**
     * 조회
     * http://localhost:9093/recommend/read_by_customerno.do?customerno=1
     * @return
     */
    @RequestMapping(value="/recommend/read_by_customerno.do", method = RequestMethod.GET)
    public ModelAndView read_by_customerno(int customerno) { 
      System.out.println("-> read_by_customerno");
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/recommend/read");
      
      RecommendVO recommendVO = this.recommendProc.read_by_customerno(customerno);
      System.out.println("-> done");
      
      mav.addObject("recommendVO", recommendVO);
      
      return mav;
    }
  
    /**
     * 파일 삭제 폼
     * http://localhost:9093/recommend/delete.do?recommendno=1
     * 
     * @return
     */
    @RequestMapping(value = "/recommend/delete.do", method = RequestMethod.GET)
    public ModelAndView delete(HttpSession session, int recommendno) {
      System.out.println("-> delete");
      ModelAndView mav = new ModelAndView();
      
      if (customerProc.isCustomer(session)) { 
        System.out.println("-> customer");
        RecommendVO recommendVO = this.recommendProc.read(recommendno);
        mav.addObject("recommendVO", recommendVO);
        
        mav.setViewName("/recommend/delete"); 
        
      } else {
        mav.addObject("url", "/customer/login_need"); 
        mav.setViewName("redirect:/customer/msg.do"); 
      }


      return mav; 
    }
    /**
     * 삭제 처리 http://localhost:9093/recommend/delete.do
     * 
     * @return
     */
    @RequestMapping(value = "/recommend/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(RecommendVO recommendVO) {
      System.out.println("-> deletedo");
      ModelAndView mav = new ModelAndView();
            
      RecommendVO recommendVO_read = this.recommendProc.read(recommendVO.getRecommendno());
      this.recommendProc.delete(recommendVO.getRecommendno()); // DBMS 삭제
      

      mav.addObject("recommendno", recommendVO.getRecommendno());
      mav.setViewName("redirect:/recommend/list_all.do"); 
      
      return mav;
    }   
    
  }

