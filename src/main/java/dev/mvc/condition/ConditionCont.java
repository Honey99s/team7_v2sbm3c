package dev.mvc.condition;

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
public class ConditionCont {
  @Autowired
  @Qualifier("dev.mvc.condition.ConditionProc")
  private ConditionProcInter conditionProc;
  
  @Autowired
  @Qualifier("dev.mvc.customer.CustomerProc")
  private CustomerProcInter customerProc;
  
  public ConditionCont () {
    System.out.println("-> ConditionCont created.");
  }
  /**
   * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원, 새로고침 방지, EL에서 param으로 접근
   * POST → url → GET → 데이터 전송
   * @return
   */
  @RequestMapping(value="/condition/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
    //FORM 출력 // http://localhost:9093/condition/create.do
    @RequestMapping(value="/condition/create.do", method=RequestMethod.GET)
    public ModelAndView create() {
      ModelAndView mav =  new ModelAndView();
      mav.setViewName("/condition/create"); // /WEB-INF/views/condition/create.jsp
      
      return mav;
    }
    //FORM 데이터 처리 // http://localhost:9093/condition/create.do
    @RequestMapping(value="/condition/create.do", method=RequestMethod.POST)
    public ModelAndView create(ConditionVO conditionVO) {
      System.out.println("->create");
      ModelAndView mav =  new ModelAndView();
      
     int cnt = this.conditionProc.create(conditionVO);
     System.out.println("->cnt: " + cnt);
     
     if(cnt==1) {
       mav.setViewName("redirect:/condition/list_all.do");
     }else {
       mav.addObject("code","create_fail");
       mav.setViewName("/condition/msg");
     }
     mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
      
      return mav;
    }
    
    /**
     * 전체 목록
     * http://localhost:9093/condition/list_all.do
     * @return 
     */
    @RequestMapping(value="/condition/list_all.do", method = RequestMethod.GET)
    public ModelAndView list_all(HttpSession session) {
      System.out.println("-> list_all");
      ModelAndView mav =  new ModelAndView();
      mav.setViewName("/condition/list_all"); //WEB-INF/views/condition/list_all.jsp
      
      
      if (this.customerProc.isCustomer(session) == true) {
        mav.setViewName("/condition/list_all"); // /WEB-INF/views/condition/list_all.jsp
        System.out.println("-> customer");
        ArrayList<ConditionVO> list = this.conditionProc.list_all();
        System.out.println("->listsize : " + list.size());
        for (ConditionVO conditionVO : list) {
          String title = conditionVO.getTitle();
          String content = conditionVO.getContent();
          
          title = Tool.convertChar(title);  // 특수 문자 처리
          content = Tool.convertChar(content); 
          
          conditionVO.setTitle(title);
          conditionVO.setContent(content);  

        }
        
        mav.addObject("list", list);
        
      } else {
        mav.setViewName("/customer/login_need"); // /WEB-INF/views/customer/login_need.jsp
        
      }
      
      return mav;
    }
    
    /**
     * 조회
     * http://localhost:9093/condition/read.do?conditionno=1
     * @return
     */
    @RequestMapping(value="/condition/read.do", method = RequestMethod.GET)
    public ModelAndView read(int conditionno) { 
      System.out.println("-> read");
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/condition/read");
      
      ConditionVO conditionVO = this.conditionProc.read(conditionno);
      System.out.println("-> done");
      String title = conditionVO.getTitle();
      String content = conditionVO.getContent();
      
      title = Tool.convertChar(title);  // 특수 문자 처리
      content = Tool.convertChar(content); 
      
      conditionVO.setTitle(title);
      conditionVO.setContent(content);  
      
      mav.addObject("conditionVO", conditionVO);
      
      return mav;
    }
    
    /**
     * 수정폼
     * http://localhost:9093/condition/update.do?conditionno=1
     * @return
     */
    @RequestMapping(value="/condition/update.do", method = RequestMethod.GET)
    public ModelAndView update(HttpSession session, int conditionno) {  //int conditionno = (int)request.getParameter("conditionno");
      System.out.println("->update");
      ModelAndView mav = new ModelAndView();
      
      if(this.customerProc.isCustomer(session) == true) {
      System.out.println("->customer");
  
      ConditionVO conditionVO = this.conditionProc.read(conditionno);
      mav.addObject("conditionVO", conditionVO);
      mav.setViewName("/condition/update"); // /WEB-INF/views/customer/update.jsp
      
      }else {
        mav.setViewName("/customer/login_need");
      }
      
      return mav;
    }
    
    /**
     * 수정 처리, http://localhost:9093/condition/update.do
     * @param conditionVO 수정할 내용
     * @return
     */
    
    @RequestMapping(value="/condition/update.do", method = RequestMethod.POST)
    public ModelAndView update(ConditionVO conditionVO) { // 자동으로 modelVO 객체가 생성되고 폼의 값이 할당됨
      System.out.println("-> updatedo");
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/condition/msg"); // /WEB-INF/views/condition/msg.jsp
      
      int cnt = this.conditionProc.update(conditionVO); // 수정 처리
      System.out.println("-> cnt: " + cnt);
      
      if (cnt == 1) {
        mav.setViewName("redirect:/condition/list_all.do");
      } else {
        mav.addObject("code", "update_fail");
        mav.setViewName("/condition/msg");
      }
      
      mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
      
      return mav;
    }
    /**
     * 파일 삭제 폼
     * http://localhost:9093/condition/delete.do?conditionno=1
     * 
     * @return
     */
    @RequestMapping(value = "/condition/delete.do", method = RequestMethod.GET)
    public ModelAndView delete(HttpSession session, int conditionno) {
      System.out.println("-> delete");
      ModelAndView mav = new ModelAndView();
      
      if (customerProc.isCustomer(session)) { 
        System.out.println("-> customer");
        ConditionVO conditionVO = this.conditionProc.read(conditionno);
        mav.addObject("conditionVO", conditionVO);
        
        mav.setViewName("/condition/delete"); 
        
      } else {
        mav.addObject("url", "/customer/login_need"); 
        mav.setViewName("redirect:/customer/msg.do"); 
      }


      return mav; 
    }
    /**
     * 삭제 처리 http://localhost:9093/condition/delete.do
     * 
     * @return
     */
    @RequestMapping(value = "/condition/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(ConditionVO conditionVO) {
      System.out.println("-> deletedo");
      ModelAndView mav = new ModelAndView();
            
      ConditionVO conditionVO_read = this.conditionProc.read(conditionVO.getConditionno());
      this.conditionProc.delete(conditionVO.getConditionno()); // DBMS 삭제
      

      mav.addObject("conditionno", conditionVO.getConditionno());
      mav.setViewName("redirect:/condition/list_all.do"); 
      
      return mav;
    }   
    
  }

