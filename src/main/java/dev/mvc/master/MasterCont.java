package dev.mvc.master;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;

@Controller
public class MasterCont {
  @Autowired
  @Qualifier("dev.mvc.master.MasterProc")
  private MasterProcInter masterProc;
  
  public MasterCont() {
    System.out.println("-> MasterCont created");
  }
  
  /**
   * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원, 새로고침 방지, EL에서 param으로 접근
   * POST → url → GET → 데이터 전송
   * @return
   */
  @RequestMapping(value="/master/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  
  /**
   * 로그인 폼
   * http://localhost:9091/master/login.do
   * @return
   */
  @RequestMapping(value="/master/login.do", method=RequestMethod.GET)
  public ModelAndView login() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/master/login_form_ck"); // /WEB-INF/views/master/login_form.jsp
    
    return mav;
  }

  /**
   * 로그인 처리
   * http://localhost:9091/master/login.do
   * @return
   */
  @RequestMapping(value="/master/login.do", method=RequestMethod.POST)
  public ModelAndView login_proc( HttpServletRequest request,
      HttpServletResponse response,
      HttpSession session,
      MasterVO masterVO, String id_save, String passwd_save) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.masterProc.login(masterVO);
    
    if (cnt == 1) { // 로그인 성공, 마스터는 id를 입력하여 로그인하였음으로 id를 가지고 마스터 정보를 조회
      MasterVO masterVO_read = this.masterProc.read_by_id(masterVO.getId()); // 마스터 정보 읽기
      // session:  website 전체에서 공유되는 변수로 서버의 메모리상에 로그아웃 시점까지 유지됨.
      session.setAttribute("masterno", masterVO_read.getMasterno()); // 서버의 메모리에 기록
      session.setAttribute("master_id", masterVO_read.getId());
      session.setAttribute("master_name", masterVO_read.getName());
      session.setAttribute("master_grade", masterVO_read.getGrade());
      
      String id = masterVO.getId();                  // 폼에 입력된 id
      String passwd = masterVO.getPasswd();  // 폼에 입력된 passwd 

      if (Tool.checkNull(id_save).equals("Y")) { // id를 저장할 경우, Checkbox를 체크한 경우, 체크하지 않으면 null
        Cookie ck_master_id = new Cookie("ck_master_id", id);
        ck_master_id.setPath("/");  // root 폴더에 쿠키를 기록함으로 모든 경로에서 쿠기 접근 가능
        ck_master_id.setMaxAge(60 * 60 * 24 * 30); // 30 day, 초단위
        response.addCookie(ck_master_id); // client의 chrome 관련 폴더에 Cookie 저장
      } else { // N, id를 저장하지 않는 경우, Checkbox를 체크 해제한 경우
        Cookie ck_master_id = new Cookie("ck_master_id", ""); // 값을 삭제한 Cookie 객체 생성
        ck_master_id.setPath("/");
        ck_master_id.setMaxAge(0); // 수명을 0초로 지정
        response.addCookie(ck_master_id);  // client의 chrome 관련 폴더에 기존 Cookie를 덮어씀
      }
      
      // id를 저장할지 선택하는 CheckBox 체크 여부
      Cookie ck_master_id_save = new Cookie("ck_master_id_save", id_save);
      ck_master_id_save.setPath("/");
      ck_master_id_save.setMaxAge(60 * 60 * 24 * 30); // 30 day
      response.addCookie(ck_master_id_save);
 
      // Password 관련 쿠기 저장
      if (Tool.checkNull(passwd_save).equals("Y")) { // 패스워드 저장할 경우
        Cookie ck_master_passwd = new Cookie("ck_master_passwd", passwd);
        ck_master_passwd.setPath("/");
        ck_master_passwd.setMaxAge(60 * 60 * 24 * 30); // 30 day
        response.addCookie(ck_master_passwd);
      } else { // N, 패스워드를 저장하지 않을 경우
        Cookie ck_master_passwd = new Cookie("ck_master_passwd", "");
        ck_master_passwd.setPath("/");
        ck_master_passwd.setMaxAge(0);
        response.addCookie(ck_master_passwd);
      }
      
      // passwd를 저장할지 선택하는  CheckBox 체크 여부
      Cookie ck_master_passwd_save = new Cookie("ck_master_passwd_save", passwd_save);
      ck_master_passwd_save.setPath("/");
      ck_master_passwd_save.setMaxAge(60 * 60 * 24 * 30); // 30 day
      response.addCookie(ck_master_passwd_save);
      // -------------------------------------------------------------------
   
      mav.setViewName("redirect:/index.do");  
    } else {
      mav.addObject("url", "/master/login_fail_msg");
      mav.setViewName("redirect:/master/msg.do"); // Post -> Get
    }
       
    return mav;
  }
  
  /**
   * 로그아웃 처리
   * @param session
   * @return
   */
  @RequestMapping(value="/master/logout.do", method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // 모든 session 변수 삭제
    
    mav.setViewName("redirect:/index.do"); 
    
    return mav;
  }
  
}

