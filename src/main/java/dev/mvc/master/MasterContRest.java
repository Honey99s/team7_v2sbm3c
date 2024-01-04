package dev.mvc.master;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController // REST 컨트롤러 선언
public class MasterContRest {
  @Autowired
  @Qualifier("dev.mvc.master.MasterProc") // "dev.mvc.master.MasterProc"라고 명명된 클래스
  private MasterProcInter masterProc; // MasterProcInter를 구현한 MasterProc 클래스의 객체를 자동으로 생성하여 할당

  public MasterContRest() {
    System.out.println("-> MasterContRest created.");
  }

  /**
   * Cookie 기반 로그인 처리
   * http://localhost:9093/master/login_rest.do
    {
    "id": "master1",
    "passwd": "1234"
    }
   * @return
   */
  @PostMapping(path = "/master/login_rest.do")
  public String login_proc(HttpServletResponse response, HttpSession session, @RequestBody MasterVO masterVO) {

    JSONObject json = new JSONObject();

    int cnt = masterProc.login(masterVO);
    if (cnt == 1) { // 로그인 성공시 회원 정보 조회
      MasterVO masterVO_read = masterProc.read_by_id(masterVO.getId()); // DBMS에서 id를 이용한 회원 조회
//      session.setAttribute("masterno", masterVO_read.getMasterno()); // 서버의 메모리에 기록
//      session.setAttribute("master_id", masterVO_read.getId());
//      session.setAttribute("master_mname", masterVO_read.getName());
//      session.setAttribute("master_grade", masterVO_read.getGrade());

      json.put("sw", true);
      json.put("masterno", masterVO_read.getMasterno());
    } else {
      json.put("sw", false);
    }

    return json.toString();
  }
  
  /**
   * 로그아웃 처리
   * http://localhost:9093/master/logout_rest.do 
   * @param session
   * @return
   */
  @GetMapping(path="/master/logout_rest.do")
  public String logout(HttpSession session){
    
    // session.invalidate(); // 모든 session 변수 삭제
    
    JSONObject json = new JSONObject();

    json.put("logout", true);
         
    return json.toString();
  }
  
}


