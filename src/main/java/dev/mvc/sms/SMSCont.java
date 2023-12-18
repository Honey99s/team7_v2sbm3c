package dev.mvc.sms;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.sms.SmsVO;
import dev.mvc.tool.Tool;
import dev.mvc.sms.SmsVO;
import dev.mvc.customer.CustomerProcInter;


@Controller
public class SmsCont {
  @Autowired
  @Qualifier("dev.mvc.sms.SmsProc")
  private SmsProcInter smsProc;
  
  @Autowired
  @Qualifier("dev.mvc.customer.CustomerProc")
  private CustomerProcInter customerProc;
  
  public SmsCont() {
    System.out.println("-> SMSCont created.");
  }
  
  // http://localhost:9091/sms/form.do
  /**
   * 사용자의 전화번호 입력 화면
   * @return
   */
  @RequestMapping(value = {"/sms/form.do"}, method=RequestMethod.GET)
  public ModelAndView form() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/sms/form");  // /WEB-INF/views/sms/form.jsp
    
    
    
    return mav;
  }
  
  // http://localhost:9091/sms/proc.do
  /**
   * 사용자에게 인증 번호를 생성하여 전송
   * @param session
   * @param request
   * @return
   */
  @RequestMapping(value = {"/sms/proc.do"}, method=RequestMethod.POST)
  public ModelAndView proc(HttpSession session, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    String auth_no = "";
    Random random = new Random();
    for (int i=0; i<= 5; i++) {
      auth_no = auth_no + random.nextInt(10); // 0 ~ 9, 번호 6자리 생성
    }
    session.setAttribute("auth_no", auth_no); // 생성된 번호를 비교를위하여 session 에 저장
//    System.out.println(auth_no);
    
    System.out.println("-> IP:" + request.getRemoteAddr()); // 접속자의 IP 수집
    
    // 번호, 전화 번호, ip, auth_no, 날짜 -> SMS Oracle table 등록, 문자 전송 내역 관리 목적으로 저장(필수 아니나 권장)
    
    String msg = "[www.resort.co.kr] [" + auth_no + "]을 인증번호란에 입력해주세요.";
    System.out.print(msg);
    
    mav.addObject("msg", msg); // request.setAttribute("msg")
    mav.setViewName("/sms/proc");  // /WEB-INF/views/sms/proc.jsp
    
    return mav;
  }
  
  // http://localhost:9091/sms/proc_next.do
  /**
   * 사용자가 수신받은 인증번호 입력 화면
   * @return
   */
  @RequestMapping(value = {"/sms/proc_next.do"}, method=RequestMethod.GET)
  public ModelAndView proc_next() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/sms/proc_next");  // /WEB-INF/views/sms/proc_next.jsp
    
    return mav;
  }
  
  // http://localhost:9091/sms/confirm.do
  /**
   * 문자로 전송된 번호와 사용자가 입력한 번호를 비교한 결과 화면
   * @param session 사용자당 할당된 서버의 메모리
   * @param auth_no 사용자가 입력한 번호
   * @return
   */
  @RequestMapping(value = {"/sms/confirm.do"}, method=RequestMethod.POST)
  public ModelAndView confirm(HttpSession session, String auth_no) {
    ModelAndView mav = new ModelAndView();
    
    String session_auth_no = (String)session.getAttribute("auth_no"); // 사용자에게 전송된 번호 session에서 꺼냄
    
    String msg="";
    
    if (session_auth_no.equals(auth_no)) {
      msg = "ID공개 페이지나 패스워드 분실시 새로운 패스워드 입력 화면으로 이동합니다.<br><br>";
    } else {
      msg = "입력된 번호가 일치하지않습니다. 다시 인증 번호를 요청해주세요.";
      msg += "<br><br><A href='./form.do'>인증번호 재요청</A>"; 
    }
    
    mav.addObject("msg", msg); // request.setAttribute("msg")
    mav.setViewName("/sms/confirm");  // /WEB-INF/views/sms/confirm.jsp
    
    return mav;
  }
  
  /**
   * 전체 목록
   * http://localhost:9093/sms/list_all.do
   * @return 
   */
  @RequestMapping(value="/sms/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all(HttpSession session) {
    System.out.println("-> list_all");
    ModelAndView mav =  new ModelAndView();
    mav.setViewName("/sms/list_all"); //WEB-INF/views/sms/list_all.jsp
    
    
    if (this.customerProc.isCustomer(session) == true) {
      mav.setViewName("/sms/list_all"); // /WEB-INF/views/sms/list_all.jsp
      System.out.println("-> customer");
      ArrayList<SmsVO> list = this.smsProc.list_all();
      System.out.println("->listsize : " + list.size());
      
      mav.addObject("list", list);
      
    } else {
      mav.setViewName("/customer/login_need"); // /WEB-INF/views/customer/login_need.jsp
      
    }
    
    return mav;
  }
  
  /**
   * 조회
   * http://localhost:9093/sms/read.do?loginno=1
   * @return
   */
  @RequestMapping(value="/sms/read.do", method = RequestMethod.GET)
  public ModelAndView read(int loginno) { 
    System.out.println("-> read");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/sms/read");
    
    SmsVO smsVO = this.smsProc.read(loginno);
    System.out.println("-> done");
    
    mav.addObject("smsVO", smsVO);
    
    return mav;
  }
  
  
  /**
   * 파일 삭제 폼
   * http://localhost:9093/sms/delete.do?loginno=1
   * 
   * @return
   */
  @RequestMapping(value = "/sms/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int loginno) {
    System.out.println("-> delete");
    ModelAndView mav = new ModelAndView();
    
    if (customerProc.isCustomer(session)) { 
      System.out.println("-> customer");
      SmsVO smsVO = this.smsProc.read(loginno);
      mav.addObject("smsVO", smsVO);
      
      mav.setViewName("/sms/delete"); 
      
    } else {
      mav.addObject("url", "/customer/login_need"); 
      mav.setViewName("redirect:/customer/msg.do"); 
    }


    return mav; 
  }
  /**
   * 삭제 처리 http://localhost:9093/sms/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/sms/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(SmsVO smsVO) {
    System.out.println("-> deletedo");
    ModelAndView mav = new ModelAndView();
          
    SmsVO smsVO_read = this.smsProc.read(smsVO.getLoginno());
    this.smsProc.delete(smsVO.getLoginno()); // DBMS 삭제
    

    mav.addObject("loginno", smsVO.getLoginno());
    mav.setViewName("redirect:/sms/list_all.do"); 
    
    return mav;
  }  
  
  
}