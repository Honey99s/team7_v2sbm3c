package dev.mvc.model;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.car.Car;
import dev.mvc.car.CarProcInter;
import dev.mvc.car.CarVO;
import dev.mvc.master.MasterProcInter;
import dev.mvc.tool.Tool;



@Controller
public class ModelCont {
  @Autowired
  @Qualifier("dev.mvc.model.ModelProc")
  private ModelProcInter modelProc;
  
  @Autowired
  @Qualifier("dev.mvc.master.MasterProc")
  private MasterProcInter masterProc;
  
  
  public ModelCont() {
    System.out.println("-> ModelCont created.");
  }

  //FORM 출력 // http://localhost:9092/model/create.do
//  @RequestMapping(value="/model/create.do", method=RequestMethod.GET)
//  @ResponseBody // 단순 문자열 출력
//  public String create() {
//    return "GET 방식 FORM 출력";
//  }
  
  //FORM 출력 // http://localhost:9092/model/create.do
  @RequestMapping(value="/model/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav =  new ModelAndView();
    mav.setViewName("/model/create"); // /WEB-INF/views/model/create.jsp
    
    return mav;
  }
  
  //FORM 데이터 처리 // http://localhost:9092/model/create.do
  @RequestMapping(value="/model/create.do", method=RequestMethod.POST)
  public ModelAndView create(ModelVO modelVO) {
    ModelAndView mav =  new ModelAndView();
    
   int cnt = this.modelProc.create(modelVO);
   System.out.println("->cnt: " + cnt);
   
   if(cnt==1) {
     //mav.addObject("code","create_success");
    //mav.addObject("name",modelVO.getName());
     mav.setViewName("redirect:/model/list_all.do");
   }else {
     mav.addObject("code","create_fail");
     mav.setViewName("/model/msg");
   }
   mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
    
    return mav;
  }
  /**
   * 전체 목록
   * http://localhost:9092/model/list_all.do
   * @return 
   */
  @RequestMapping(value="/model/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all(HttpSession session) {
    ModelAndView mav =  new ModelAndView();
    mav.setViewName("/model/list_all"); //WEB-INF/views/model/list_all.jsp
    
    if (this.masterProc.isMaster(session) == true) {
      mav.setViewName("/model/list_all"); // /WEB-INF/views/model/list_all.jsp
      
      ArrayList<ModelVO> list = this.modelProc.list_all();
      mav.addObject("list", list);
      
    } else {
      mav.setViewName("/master/login_need"); // /WEB-INF/views/master/login_need.jsp
      
    }
    
    return mav;
  }
  
  /**
   * 조회
   * http://localhost:9092/model/read.do?modelno=1
   * @return
   */
  @RequestMapping(value="/model/read.do", method = RequestMethod.GET)
  public ModelAndView read(int modelno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/model/read");
    
    ModelVO modelVO = this.modelProc.read(modelno);
    mav.addObject("modelVO", modelVO);
    
    return mav;
  }

  
  /**
   * 수정폼
   * http://localhost:9092/model/update.do?modelno=1
   * @return
   */
  @RequestMapping(value="/model/update.do", method = RequestMethod.GET)
  public ModelAndView update(HttpSession session, int modelno) {  //int modelno = (int)request.getParameter("modelno");
    ModelAndView mav = new ModelAndView();
    
    if(this.masterProc.isMaster(session) == true) {
    //mav.setViewName("/model/update"); // /WEB-INF/views/model/update.jsp
    mav.setViewName("/model/list_all_update");
    
    ModelVO modelVO = this.modelProc.read(modelno);
    mav.addObject("modelVO", modelVO);
    
    ArrayList<ModelVO> list = this.modelProc.list_all();
    mav.addObject("list", list);
    
    }else {
      mav.setViewName("/master/login_need");
    }
    
    return mav;
  }
  
  /**
   * 수정 처리, http://localhost:9092/model/update.do
   * @param modelVO 수정할 내용
   * @return
   */
  
  @RequestMapping(value="/model/update.do", method = RequestMethod.POST)
  public ModelAndView update(ModelVO modelVO) { // 자동으로 modelVO 객체가 생성되고 폼의 값이 할당됨
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/model/msg"); // /WEB-INF/views/model/msg.jsp
    
    int cnt = this.modelProc.update(modelVO); // 수정 처리
    System.out.println("-> cnt: " + cnt);
    
    if (cnt == 1) {
      //mav.addObject("code", "update_success"); // 키, 값
      //mav.addObject("name", modelVO.getName()); // 카테고리 이름 jsp로 전송
      mav.setViewName("redirect:/model/list_all.do");
    } else {
      mav.addObject("code", "update_fail");
      mav.setViewName("/model/msg");
    }
    
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
    
    return mav;
  }
  
  @Autowired
  @Qualifier("dev.mvc.car.CarProc")
  private CarProcInter carProc;
  /**
   * 삭제폼
   * http://localhost:9092/model/delete.do?modelno=1
   * @return
   */
  @RequestMapping(value="/model/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int modelno) { // int modelno = (int)request.getParameter("modelno");
    ModelAndView mav = new ModelAndView();
    
    if(this.masterProc.isMaster(session) == true) {
    //mav.setViewName("/model/delete"); // /WEB-INF/views/model/delete.jsp
    mav.setViewName("/model/list_all_delete");
    
    ModelVO modelVO = this.modelProc.read(modelno);
    mav.addObject("modelVO", modelVO);
    
    ArrayList<ModelVO> list = this.modelProc.list_all();
    mav.addObject("list", list);
    
    int count_by_modelno = this.carProc.count_by_modelno(modelno);
    mav.addObject("count_by_modelno", count_by_modelno);
    
    }else {
      mav.setViewName("/master/login_need");
    }
    
    return mav;
  }
  
  // 삭제 처리, 수정 처리를 복사하여 개발
  // 자식 테이블 레코드 삭제 -> 부모 테이블 레코드 삭제
  /**
   * 카테고리 삭제
   * @param session
   * @param modelno 삭제할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/model/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(HttpSession session, int modelno) { // <form> 태그의 값이 자동으로 저장됨
//    System.out.println("-> modelno: " + modelVO.getmodelno());
//    System.out.println("-> name: " + modelVO.getName());
    
    ModelAndView mav = new ModelAndView();
    
    if (this.masterProc.isMaster(session) == true) {
      ArrayList<CarVO> list = this.carProc.list_by_modelno(modelno); // 자식 레코드 목록 읽기
      
      for(CarVO carVO : list) { // 자식 레코드 관련 파일 삭제
        // -------------------------------------------------------------------
        // 파일 삭제 시작
        // -------------------------------------------------------------------
        String file1saved = carVO.getFile1saved();
        String thumb1 = carVO.getThumb1();
        
        String uploadDir = Car.getUploadDir();
        Tool.deleteFile(uploadDir, file1saved);  // 실제 저장된 파일삭제
        Tool.deleteFile(uploadDir, thumb1);     // preview 이미지 삭제
        // -------------------------------------------------------------------
        // 파일 삭제 종료
        // -------------------------------------------------------------------
      }
      
      this.carProc.delete_by_modelno(modelno); // 자식 레코드 삭제     
            
      int cnt = this.modelProc.delete(modelno); // 카테고리 삭제
      
      if (cnt == 1) {
        mav.setViewName("redirect:/model/list_all.do");       // 자동 주소 이동, Spring 재호출
        
      } else {
        mav.addObject("code", "delete_fail");
        mav.setViewName("/model/msg"); // /WEB-INF/views/model/msg.jsp
      }
      
      mav.addObject("cnt", cnt);
      
    } else {
      mav.setViewName("/master/login_need"); // /WEB-INF/views/master/login_need.jsp
    }
    
    return mav;
  }
  
  /**
   * 우선 순위 높임, 10등 -> 1등 http://localhost:9092/model/update_seqno_forward.do?modelno=1
   * @param modelVO 수정할 내용
   * @return
   */
  @RequestMapping(value="/model/update_seqno_forward.do", method = RequestMethod.GET)
  public ModelAndView update_seqno_forward(int modelno) { // 자동으로 modelVO 객체가 생성되고 폼의 값이 할당됨
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.modelProc.update_seqno_forward(modelno); // 수정 처리
    System.out.println("-> cnt: " + cnt);
    
    if (cnt == 1) {
      mav.setViewName("redirect:/model/list_all.do");
    } else {
      mav.addObject("code", "update_fail");
      mav.setViewName("/model/msg");
    }
    
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
    
    return mav;
  }
  
  /**
   * 우선 순위 낮춤, 1등 -> 10등 http://localhost:9092/model/update_seqno_backward.do?modelno=1
   * @param modelno 수정할 레코드 PK 번호
   * @return
   */
  @RequestMapping(value="/model/update_seqno_backward.do", method = RequestMethod.GET)
  public ModelAndView update_seqno_backward(int modelno) { // 자동으로 modelVO 객체가 생성되고 폼의 값이 할당됨
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.modelProc.update_seqno_backward(modelno); // 수정 처리
    System.out.println("-> cnt: " + cnt);
    
    if (cnt == 1) {
      mav.setViewName("redirect:/model/list_all.do");
    } else {
      mav.addObject("code", "update_fail");
      mav.setViewName("/model/msg");
    }
    
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
    
    return mav;
  }
  
  /**
   * 카테고리 공개 설정,  http://localhost:9092/model/update_visible_y.do?modelno=1
   * @param modelno 수정할 레코드 PK 번호
   * @return
   */
  @RequestMapping(value="/model/update_visible_y.do", method = RequestMethod.GET)
  public ModelAndView update_visible_y(int modelno) { // 자동으로 modelVO 객체가 생성되고 폼의 값이 할당됨
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.modelProc.update_visible_y(modelno); // 수정 처리
    System.out.println("-> cnt: " + cnt);
    
    if (cnt == 1) {
      mav.setViewName("redirect:/model/list_all.do");
    } else {
      mav.addObject("code", "update_fail");
      mav.setViewName("/model/msg");
    }
    
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
    
    return mav;
  }
  
  /**
   * 카테고리 비공개 설정,  http://localhost:9092/model/update_visible_n.do?modelno=1
   * @param modelno 수정할 레코드 PK 번호
   * @return
   */
  @RequestMapping(value="/model/update_visible_n.do", method = RequestMethod.GET)
  public ModelAndView update_visible_n(int modelno) { // 자동으로 modelVO 객체가 생성되고 폼의 값이 할당됨
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.modelProc.update_visible_n(modelno); // 수정 처리
    System.out.println("-> cnt: " + cnt);
    
    if (cnt == 1) {
      mav.setViewName("redirect:/model/list_all.do");
    } else {
      mav.addObject("code", "update_fail");
      mav.setViewName("/model/msg");
    }
    
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt);
    
    return mav;
  }
  
}
