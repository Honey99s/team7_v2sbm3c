package dev.mvc.car;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.customer.CustomerProcInter;
import dev.mvc.customer.CustomerVO;
import dev.mvc.good.GoodProcInter;
import dev.mvc.master.MasterProcInter;
import dev.mvc.model.ModelProcInter;
import dev.mvc.model.ModelVO;
import dev.mvc.recommend.RecommendProcInter;
import dev.mvc.recommend.RecommendVO;
import dev.mvc.reply.ReplyCustomerVO;
import dev.mvc.reply.ReplyProcInter;
import dev.mvc.reply.ReplyVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;
import dev.mvc.car.CarVO;

@Controller
public class CarCont {
  @Autowired
  @Qualifier("dev.mvc.master.MasterProc") // @Component("dev.mvc.master.MasterProc")
  private MasterProcInter masterProc;
  
  @Autowired
  @Qualifier("dev.mvc.model.ModelProc")  // @Component("dev.mvc.model.ModelProc")
  private ModelProcInter modelProc;
  
  @Autowired
  @Qualifier("dev.mvc.customer.CustomerProc")  // @Component("dev.mvc.customer.CustomerProc")
  private CustomerProcInter customerProc;
  
  @Autowired
  @Qualifier("dev.mvc.car.CarProc") // @Component("dev.mvc.car.CarProc")
  private CarProcInter carProc;
  
  @Autowired
  @Qualifier("dev.mvc.recommend.RecommendProc") 
  private RecommendProcInter recommendProc;
  
  @Autowired
  @Qualifier("dev.mvc.good.GoodProc") 
  private GoodProcInter goodProc;
  
  @Autowired
  @Qualifier("dev.mvc.reply.ReplyProc") 
  private ReplyProcInter replyProc;
  
  public CarCont () {
    System.out.println("-> CarCont created.");
  }
  
  /**
   * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원, 새로고침 방지, EL에서 param으로 접근
   * POST → url → GET → 데이터 전송
   * @return
   */
  @RequestMapping(value="/car/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  
  // 등록 폼, car 테이블은 FK로 modelno를 사용함.
  // http://localhost:9093/car/create.do  X
  // http://localhost:9093/car/create.do?modelno=1  // modelno 변수값을 보내는 목적
  // http://localhost:9093/car/create.do?modelno=2
  // http://localhost:9093/car/create.do?modelno=3
  @RequestMapping(value="/car/create.do", method = RequestMethod.GET)
  public ModelAndView create(int modelno) {
//  public ModelAndView create(HttpServletRequest request,  int modelno) {
    ModelAndView mav = new ModelAndView();

    ModelVO modelVO = this.modelProc.read(modelno); // create.jsp에 차종 정보를 출력하기위한 목적
    mav.addObject("modelVO", modelVO);
//    request.setAttribute("modelVO", modelVO);
    
    mav.setViewName("/car/create"); // /webapp/WEB-INF/views/car/create.jsp
    
    return mav;
  }
  
  /**
   * 등록 처리 http://localhost:9093/car/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/car/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, HttpSession session, CarVO carVO) {
    ModelAndView mav = new ModelAndView();
    
    if (masterProc.isMaster(session)) { // 마스터로 로그인한경우
      // ------------------------------------------------------------------------------
      // 파일 전송 코드 시작
      // ------------------------------------------------------------------------------
      String file1 = "";          // 원본 파일명 image
      String file1saved = "";   // 저장된 파일명, image
      String thumb1 = "";     // preview image

      String upDir =  Car.getUploadDir(); // 파일을 업로드할 폴더 준비
      System.out.println("-> upDir: " + upDir);
      
      // 전송 파일이 없어도 file1MF 객체가 생성됨.
      // <input type='file' class="form-control" name='file1MF' id='file1MF' 
      //           value='' placeholder="파일 선택">
      MultipartFile mf = carVO.getFile1MF();
      
      file1 = mf.getOriginalFilename(); // 원본 파일명 산출, 01.jpg
      System.out.println("-> 원본 파일명 산출 file1: " + file1);
      
      if (Tool.checkUploadFile(file1) == true) { // 업로드 가능한 파일인지 검사
        long size1 = mf.getSize();  // 파일 크기
        
        if (size1 > 0) { // 파일 크기 체크
          // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
          file1saved = Upload.saveFileSpring(mf, upDir); 
          
          if (Tool.isImage(file1saved)) { // 이미지인지 검사
            // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
            thumb1 = Tool.preview(upDir, file1saved, 200, 150); 
          }
          
        }    
        
        carVO.setFile1(file1);   // 순수 원본 파일명
        carVO.setFile1saved(file1saved); // 저장된 파일명(파일명 중복 처리)
        carVO.setThumb1(thumb1);      // 원본이미지 축소판
        carVO.setSize1(size1);  // 파일 크기
        // ------------------------------------------------------------------------------
        // 파일 전송 코드 종료
        // ------------------------------------------------------------------------------
        
        // Call By Reference: 메모리 공유, Hashcode 전달
        int masterno = (int)session.getAttribute("masterno"); // masterno FK
        carVO.setMasterno(masterno);
        int cnt = this.carProc.create(carVO); 
        
        // ------------------------------------------------------------------------------
        // PK의 return
        // ------------------------------------------------------------------------------
        // System.out.println("--> carno: " + carVO.getcarno());
        // mav.addObject("carno", carVO.getcarno()); // redirect parameter 적용
        // ------------------------------------------------------------------------------
        
        if (cnt == 1) {
            mav.addObject("code", "create_success");
            // modelProc.increaseCnt(carVO.getmodelno()); // 글수 증가
        } else {
            mav.addObject("code", "create_fail");
        }
        mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
        
        // System.out.println("--> modelno: " + carVO.getmodelno());
        // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
        mav.addObject("modelno", carVO.getModelno()); // redirect parameter 적용
        
        mav.addObject("url", "/car/msg"); // msg.jsp, redirect parameter 적용
        mav.setViewName("redirect:/car/msg.do"); // Post -> Get - param...        
      } else {
        mav.addObject("cnt", "0"); // 업로드 할 수 없는 파일
        mav.addObject("code", "check_upload_file_fail"); // 업로드 할 수 없는 파일
        mav.addObject("url", "/car/msg"); // msg.jsp, redirect parameter 적용
        mav.setViewName("redirect:/car/msg.do"); // Post -> Get - param...        
      }
    } else {
      mav.addObject("url", "/master/login_need"); // /WEB-INF/views/master/login_need.jsp
      mav.setViewName("redirect:/car/msg.do"); 
    }
    
    return mav; // forward
  }
  
  /**
   * 전체 목록, 마스터만 사용 가능
   * http://localhost:9093/car/list_all.do
   * @return
   */
  @RequestMapping(value="/car/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (this.masterProc.isMaster(session) == true) {
      mav.setViewName("/car/list_all"); // /WEB-INF/views/car/list_all.jsp
      
      ArrayList<CarVO> list = this.carProc.list_all();
      
      // for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
      for (CarVO carVO : list) {
        String title = carVO.getTitle();
        String content = carVO.getContent();
        
        title = Tool.convertChar(title);  // 특수 문자 처리
        content = Tool.convertChar(content); 
        
        carVO.setTitle(title);
        carVO.setContent(content);  

      }
      mav.addObject("list", list);
      
    } else {
      mav.setViewName("/master/login_need"); // /WEB-INF/views/master/login_need.jsp
      
    }
    
    return mav;
  }
  
  
//  /**
//   * 특정 차종의 검색 목록
//   * http://localhost:9093/car/list_by_modelno.do?modelno=1
//   * @return
//   */
//  @RequestMapping(value="/car/list_by_modelno.do", method = RequestMethod.GET)
//  public ModelAndView list_by_modelno(int modelno, String word) {
//    ModelAndView mav = new ModelAndView();
//
//    mav.setViewName("/car/list_by_modelno"); // /WEB-INF/views/car/list_by_modelno.jsp
//    
//    ModelVO modelVO = this.modelProc.read(modelno); // create.jsp에 차종 정보를 출력하기위한 목적
//    mav.addObject("modelVO", modelVO);
//    // request.setAttribute("modelVO", modelVO);
//    
//    // 검색하지 않는 경우
//    // ArrayList<CarVO> list = this.carProc.list_by_modelno(modelno);
//    
//    //검색하는 경우
//    HashMap<String, Object> hashMap = new HashMap<String, Object>();
//    hashMap.put("modelno", modelno);
//    hashMap.put("word", word);
//    
//    ArrayList<CarVO> list = this.carProc.list_by_modelno_search(hashMap);
//    
//    // for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
//    for (CarVO carVO : list) {
//      String title = carVO.getTitle();
//      String content = carVO.getContent();
//      
//      title = Tool.convertChar(title);  // 특수 문자 처리
//      content = Tool.convertChar(content); 
//      
//      carVO.setTitle(title);
//      carVO.setContent(content);  
//
//    }
//    
//    mav.addObject("list", list);
//    
//    return mav;
//  }
  
  /**
  * 목록 + 검색 + 페이징 지원
  * 검색하지 않는 경우
  * http://localhost:9093/car/list_by_modelno.do?modelno=1&word=&now_page=1
  * 검색하는 경우
  * http://localhost:9093/car/list_by_modelno.do?modelno=1&word=모닝&now_page=1
  * 
  * @param modelno
  * @param word
  * @param now_page
  * @return
  */
 @RequestMapping(value = "/car/list_by_modelno.do", method = RequestMethod.GET)
 public ModelAndView list_by_modelno(CarVO carVO) {
   ModelAndView mav = new ModelAndView();
 
   // 검색 목록
   ArrayList<CarVO> list = carProc.list_by_modelno_search_paging(carVO);
   
   // for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
   for (CarVO vo : list) {
     String title = vo.getTitle();
     String content = vo.getContent();
     
     title = Tool.convertChar(title);  // 특수 문자 처리
     content = Tool.convertChar(content); 
     
     vo.setTitle(title);
     vo.setContent(content);  
 
   }
   
   mav.addObject("list", list);
 
   ModelVO modelVO = modelProc.read(carVO.getModelno());
   mav.addObject("modelVO", modelVO);
 
   HashMap<String, Object> hashMap = new HashMap<String, Object>();
   hashMap.put("modelno", carVO.getModelno());
   hashMap.put("word", carVO.getWord());
   
   int search_count = this.carProc.search_count(hashMap);  // 검색된 레코드 갯수 ->  전체 페이지 규모 파악
   mav.addObject("search_count", search_count);
   
   /*
    * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
    * 18 19 20 [다음]
    * @param modelno 차종번호
    * @param now_page 현재 페이지
    * @param word 검색어
    * @param list_file 목록 파일명
    * @return 페이징용으로 생성된 HTML/CSS tag 문자열
    */
   String paging = carProc.pagingBox(carVO.getModelno(), carVO.getNow_page(), carVO.getWord(), "list_by_modelno.do");
   mav.addObject("paging", paging);
 
   // mav.addObject("now_page", now_page);
   
   mav.setViewName("/car/list_by_modelno");  // /car/list_by_modelno.jsp
 
   return mav;
 }

 /**
 * 목록 + 검색 + 페이징 지원 + Grid
 * 검색하지 않는 경우
 * http://localhost:9093/car/list_by_modelno_grid.do?modelno=1&word=&now_page=1
 * 검색하는 경우
 * http://localhost:9093/car/list_by_modelno_grid.do?modelno=1&word=탐험&now_page=1
 * 
 * @param modelno
 * @param word
 * @param now_page
 * @return
 */
 @RequestMapping(value = "/car/list_by_modelno_grid.do", method = RequestMethod.GET)
 public ModelAndView list_by_modelno_grid(CarVO carVO) {
    ModelAndView mav = new ModelAndView();
  
    // 검색 목록
  ArrayList<CarVO> list = carProc.list_by_modelno_search_paging(carVO);
  
  // for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
  for (CarVO vo : list) {
    String title = vo.getTitle();
    String content = vo.getContent();
    
    title = Tool.convertChar(title);  // 특수 문자 처리
      content = Tool.convertChar(content); 
      
      vo.setTitle(title);
      vo.setContent(content);  
  
    }
    
    mav.addObject("list", list);
  
    ModelVO modelVO = modelProc.read(carVO.getModelno());
    mav.addObject("modelVO", modelVO);
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("modelno", carVO.getModelno());
    hashMap.put("word", carVO.getWord());
    
    int search_count = this.carProc.search_count(hashMap);  // 검색된 레코드 갯수 ->  전체 페이지 규모 파악
    mav.addObject("search_count", search_count);
  
    /*
 * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
 * 18 19 20 [다음]
 * @param modelno 차종번호
 * @param now_page 현재 페이지
 * @param word 검색어
 * @param list_file 목록 파일명
 * @return 페이징용으로 생성된 HTML/CSS tag 문자열
 */
  String paging = carProc.pagingBox(carVO.getModelno(), carVO.getNow_page(), carVO.getWord(), "list_by_modelno_grid.do");
  mav.addObject("paging", paging);
  
    // mav.addObject("now_page", now_page);
  
  mav.setViewName("/car/list_by_modelno_grid");  // /car/list_by_modelno_grid.jsp
  
    return mav;
  }
 
 /**
 * 추천 차종 그리드
 * http://localhost:9093/car/list_recommend_by_modelno.do?recommendno=1
 * 
 * 
 * @param modelno
 * @param now_page
 * @return
 */
 @RequestMapping(value = "/car/list_recommend_by_modelno.do", method = RequestMethod.GET)
 public ModelAndView list_recommend_by_modelno(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    System.out.println("->list");
    
    int customerno = (int)(session.getAttribute("customerno"));
    System.out.println("-> customerno : " +session.getAttribute("customerno") );
    int modelno = this.recommendProc.read_by_customerno(customerno).getModelno(); //회원의 관심모델
    System.out.println("->modelno : " + this.recommendProc.read_by_customerno(customerno).getModelno());
    
  
    ArrayList<CarVO> list_recommend_by_modelno = this.carProc.list_recommend_by_modelno(modelno);
    mav.addObject("list_recommend_by_modelno", list_recommend_by_modelno);
    mav.setViewName("/car/list_recommend_by_modelno");  
  
    return mav;
  }
 
 /**
 * 등록일자별 추천 차종 그리드
 * http://localhost:9093/car/list_by_rdate.do?
 * 
 * 
 * @param modelno
 * @param now_page
 * @return
 */
 @RequestMapping(value = "/car/list_recommend_by_rdate.do", method = RequestMethod.GET)
 public ModelAndView list_recommend_by_rdate(String rdate) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/car/list_recommend_by_rdate");
    

    ArrayList<CarVO> list_recommend_by_rdate = this.carProc.list_recommend_by_rdate(rdate);
    mav.addObject("list_recommend_by_rdate", list_recommend_by_rdate);
    mav.setViewName("car/list_recommend_by_rdate");
      
  
    return mav;
  }
  
 /**
  * 조회
  * http://localhost:9093/car/read.do?carno=17
  * @return
  */
 @RequestMapping(value="/car/read.do", method = RequestMethod.GET)
 public ModelAndView read(int carno) { // int modelno = (int)request.getParameter("modelno");
   ModelAndView mav = new ModelAndView();
   //mav.setViewName("/car/read"); // /WEB-INF/views/car/read.jsp
   
   CarVO carVO = this.carProc.read(carno);
   
   String title = carVO.getTitle();
   String content = carVO.getContent();
   
   title = Tool.convertChar(title);  // 특수 문자 처리
   content = Tool.convertChar(content); 
   
   carVO.setTitle(title);
   carVO.setContent(content);  
   
   long size1 = carVO.getSize1();
   String size1_label = Tool.unit(size1);
   carVO.setSize1_label(size1_label);
   
   List<ReplyCustomerVO> list = replyProc.list_by_carno_join(carno);
   
   mav.addObject("carVO", carVO);
   mav.addObject("list", list);
   
   
   ModelVO modelVO = this.modelProc.read(carVO.getModelno());
   mav.addObject("modelVO", modelVO);
   // 댓글 기능 추가 
   mav.setViewName("/car/read_cookie_reply"); // /WEB-INF/views/car/read_cookie_reply.jsp
   
   return mav;
 }
 
// // http://localhost:9093/car/read.do
// /**
//  * 조회
//  * @return
//  */
// @RequestMapping(value="/car/read.do", method=RequestMethod.GET )
// public ModelAndView read_ajax(HttpServletRequest request, int carno) {
//   // public ModelAndView read(int carno, int now_page) {
//   // System.out.println("-> now_page: " + now_page);
//   
//   ModelAndView mav = new ModelAndView();
//
//   CarVO carVO = this.carProc.read(carno);
//   mav.addObject("carVO", carVO); // request.setAttribute("carVO", carVO);
//
//   ModelVO modelVO = this.modelProc.read(carVO.getModelno());
//   mav.addObject("modelVO", modelVO); 
//   
//   // 단순 read
//   // mav.setViewName("/car/read"); // /WEB-INF/views/car/read.jsp
//   
//   // 쇼핑 기능 추가
//   // mav.setViewName("/car/read_cookie"); // /WEB-INF/views/car/read_cookie.jsp
//   
//   // 댓글 기능 추가 
//   mav.setViewName("/car/read_cookie_reply"); // /WEB-INF/views/car/read_cookie_reply.jsp
//   
//   // -------------------------------------------------------------------------------
//   // 쇼핑 카트 장바구니에 상품 등록전 로그인 폼 출력 관련 쿠기  
//   // -------------------------------------------------------------------------------
//   Cookie[] cookies = request.getCookies();
//   Cookie cookie = null;
//
//   String ck_id = ""; // id 저장
//   String ck_id_save = ""; // id 저장 여부를 체크
//   String ck_passwd = ""; // passwd 저장
//   String ck_passwd_save = ""; // passwd 저장 여부를 체크
//
//   if (cookies != null) {  // Cookie 변수가 있다면
//     for (int i=0; i < cookies.length; i++){
//       cookie = cookies[i]; // 쿠키 객체 추출
//       
//       if (cookie.getName().equals("ck_id")){
//         ck_id = cookie.getValue();                                 // Cookie에 저장된 id
//       }else if(cookie.getName().equals("ck_id_save")){
//         ck_id_save = cookie.getValue();                          // Cookie에 id를 저장 할 것인지의 여부, Y, N
//       }else if (cookie.getName().equals("ck_passwd")){
//         ck_passwd = cookie.getValue();                          // Cookie에 저장된 password
//       }else if(cookie.getName().equals("ck_passwd_save")){
//         ck_passwd_save = cookie.getValue();                  // Cookie에 password를 저장 할 것인지의 여부, Y, N
//       }
//     }
//   }
//   
//   System.out.println("-> ck_id: " + ck_id);
//   
//   mav.addObject("ck_id", ck_id); 
//   mav.addObject("ck_id_save", ck_id_save);
//   mav.addObject("ck_passwd", ck_passwd);
//   mav.addObject("ck_passwd_save", ck_passwd_save);
//   // -------------------------------------------------------------------------------
//   
//   return mav;
// }

 
 /**
  * 추천 수 증가
  * http://localhost:9093/car/map.do?carno=1
  * @return
  */
 @ResponseBody
 @RequestMapping(value="/car/update_recom_ajax.do", method = RequestMethod.POST)
 public Map<String, Object> recom_update(HttpSession session, int carno) {
     Map<String, Object> result = new HashMap<>();
     
     if (this.customerProc.isCustomer(session)) { // 회원 로그인 확인
         int count = this.carProc.increaseRecom(carno);
         CarVO carVO = this.carProc.read(carno);
         int recom = carVO.getRecom();
         result.put("count", count);
         result.put("recom", recom);
     } else {
         result.put("error", "user_not_authenticated");
     }
     
     return result;
 }

 
 
 
  /**
   * 맵 등록/수정/삭제 폼
   * http://localhost:9093/car/map.do?carno=1
   * @return
   */
  @RequestMapping(value="/car/map.do", method=RequestMethod.GET )
  public ModelAndView map(int carno) {
    ModelAndView mav = new ModelAndView();

    CarVO carVO = this.carProc.read(carno); // map 정보 읽어 오기
    mav.addObject("carVO", carVO); // request.setAttribute("carVO", carVO);

    ModelVO modelVO = this.modelProc.read(carVO.getModelno()); // 그룹 정보 읽기
    mav.addObject("modelVO", modelVO); 

    mav.setViewName("/car/map"); // /WEB-INF/views/car/map.jsp
        
    return mav;
  }
  
  /**
   * MAP 등록/수정/삭제 처리
   * http://localhost:9093/car/map.do
   * @param carVO
   * @return
   */
  @RequestMapping(value="/car/map.do", method = RequestMethod.POST)
  public ModelAndView map_update(int carno, String map) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("carno", carno);
    hashMap.put("map", map);
    
    this.carProc.map(hashMap);
    
    mav.setViewName("redirect:/car/read.do?carno=" + carno); 
    // /webapp/WEB-INF/views/car/read.jsp
    
    return mav;
  }

  /**
   * Youtube 등록/수정/삭제 폼
   * http://localhost:9093/car/map.do?carno=1
   * @return
   */
  @RequestMapping(value="/car/youtube.do", method=RequestMethod.GET )
  public ModelAndView youtube(int carno) {
    ModelAndView mav = new ModelAndView();

    CarVO carVO = this.carProc.read(carno); // map 정보 읽어 오기
    mav.addObject("carVO", carVO); // request.setAttribute("carVO", carVO);

    ModelVO modelVO = this.modelProc.read(carVO.getModelno()); // 그룹 정보 읽기
    mav.addObject("modelVO", modelVO); 

    mav.setViewName("/car/youtube"); // /WEB-INF/views/car/youtube.jsp
        
    return mav;
  }
  
  /**
   * Youtube 등록/수정/삭제 처리
   * http://localhost:9093/car/map.do
   * @param carno 글 번호
   * @param youtube Youtube url의 소스 코드
   * @return
   */
  @RequestMapping(value="/car/youtube.do", method = RequestMethod.POST)
  public ModelAndView youtube_update(int carno, String youtube) {
    ModelAndView mav = new ModelAndView();
    
    if (youtube.trim().length() > 0) {  // 삭제 중인지 확인, 삭제가 아니면 youtube 크기 변경
      youtube = Tool.youtubeResize(youtube, 640);  // youtube 영상의 크기를 width 기준 640 px로 변경
    }    
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("carno", carno);
    hashMap.put("youtube", youtube);
    
    this.carProc.youtube(hashMap);
    
    mav.setViewName("redirect:/car/read.do?carno=" + carno); 
    // /webapp/WEB-INF/views/car/read.jsp
    
    return mav;
  }
  
  /**
   * 수정 폼
   * http://localhost:9093/car/update_text.do?carno=1
   * 
   * @return
   */
  @RequestMapping(value = "/car/update_text.do", method = RequestMethod.GET)
  public ModelAndView update_text(HttpSession session, int carno) {
    ModelAndView mav = new ModelAndView();
    
    if (masterProc.isMaster(session)) { // 마스터로 로그인한경우
      CarVO carVO = this.carProc.read(carno);
      mav.addObject("carVO", carVO);
      
      ModelVO modelVO = this.modelProc.read(carVO.getModelno());
      mav.addObject("modelVO", modelVO);
      
      mav.setViewName("/car/update_text"); // /WEB-INF/views/car/update_text.jsp
      // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
      // mav.addObject("content", content);

    } else {
      mav.addObject("url", "/master/login_need"); // /WEB-INF/views/master/login_need.jsp
      mav.setViewName("redirect:/car/msg.do"); 
    }

    return mav; // forward
  }
  
  /**
   * 수정 처리
   * http://localhost:9093/car/update_text.do?carno=1
   * 
   * @return
   */
  @RequestMapping(value = "/car/update_text.do", method = RequestMethod.POST)
  public ModelAndView update_text(HttpSession session, CarVO carVO) {
    ModelAndView mav = new ModelAndView();
    
    // System.out.println("-> word: " + carVO.getWord());
    
    if (this.masterProc.isMaster(session)) { // 마스터 로그인 확인
      HashMap<String, Object> hashMap = new HashMap<String, Object>();
      hashMap.put("carno", carVO.getCarno());
      hashMap.put("passwd", carVO.getPasswd());
      
      if (this.carProc.password_check(hashMap) == 1) { // 패스워드 일치
        this.carProc.update_text(carVO); // 글수정  
         
        // mav 객체 이용
        mav.addObject("carno", carVO.getCarno());
        mav.addObject("modelno", carVO.getModelno());
        mav.setViewName("redirect:/car/read.do"); // 페이지 자동 이동
        
      } else { // 패스워드 불일치
        mav.addObject("code", "passwd_fail");
        mav.addObject("cnt", 0);
        mav.addObject("url", "/car/msg"); // msg.jsp, redirect parameter 적용
        mav.setViewName("redirect:/car/msg.do");  // POST -> GET -> JSP 출력
      }
    } else { // 정상적인 로그인이 아닌 경우 로그인 유도
      mav.addObject("url", "/master/login_need"); // /WEB-INF/views/master/login_need.jsp
      mav.setViewName("redirect:/car/msg.do"); 
    }
    
    mav.addObject("now_page", carVO.getNow_page()); // POST -> GET: 데이터 분실이 발생함으로 다시하번 데이터 저장 ★
    
    // URL에 파라미터의 전송
    // mav.setViewName("redirect:/car/read.do?carno=" + carVO.getcarno() + "&modelno=" + carVO.getmodelno());             
    
    return mav; // forward
  }
  
  /**
   * 파일 수정 폼
   * http://localhost:9093/car/update_file.do?carno=1
   * 
   * @return
   */
  @RequestMapping(value = "/car/update_file.do", method = RequestMethod.GET)
  public ModelAndView update_file(HttpSession session, int carno) {
    ModelAndView mav = new ModelAndView();
    
    if (this.masterProc.isMaster(session)) { // 마스터 로그인 확인
      CarVO carVO = this.carProc.read(carno);
      mav.addObject("carVO", carVO);
      
      ModelVO modelVO = this.modelProc.read(carVO.getModelno());
      mav.addObject("modelVO", modelVO);
      
      mav.setViewName("/car/update_file"); // /WEB-INF/views/car/update_file.jsp
    }else {
      mav.addObject("url", "/master/login_need"); // /WEB-INF/views/master/login_need.jsp
      mav.setViewName("redirect:/car/msg.do"); 
    }
 
    return mav; // forward
  }
  
  /**
   * 파일 수정 처리 http://localhost:9093/car/update_file.do
   * 
   * @return
   */
  @RequestMapping(value = "/car/update_file.do", method = RequestMethod.POST)
  public ModelAndView update_file(HttpSession session, CarVO carVO) {
    ModelAndView mav = new ModelAndView();
    
    if (this.masterProc.isMaster(session)) {
      // 삭제할 파일 정보를 읽어옴, 기존에 등록된 레코드 저장용
      CarVO carVO_old = carProc.read(carVO.getCarno());
      
      // -------------------------------------------------------------------
      // 파일 삭제 시작
      // -------------------------------------------------------------------
      String file1saved = carVO_old.getFile1saved();  // 실제 저장된 파일명
      String thumb1 = carVO_old.getThumb1();       // 실제 저장된 preview 이미지 파일명
      long size1 = 0;
         
      String upDir =  Car.getUploadDir(); // C:/kd/deploy/honeycar3/car/storage/
      
      Tool.deleteFile(upDir, file1saved);  // 실제 저장된 파일삭제
      Tool.deleteFile(upDir, thumb1);     // preview 이미지 삭제
      // -------------------------------------------------------------------
      // 파일 삭제 종료
      // -------------------------------------------------------------------
          
      // -------------------------------------------------------------------
      // 파일 전송 시작
      // -------------------------------------------------------------------
      String file1 = "";          // 원본 파일명 image

      // 전송 파일이 없어도 file1MF 객체가 생성됨.
      // <input type='file' class="form-control" name='file1MF' id='file1MF' 
      //           value='' placeholder="파일 선택">
      MultipartFile mf = carVO.getFile1MF();
          
      file1 = mf.getOriginalFilename(); // 원본 파일명
      size1 = mf.getSize();  // 파일 크기
          
      if (size1 > 0) { // 폼에서 새롭게 올리는 파일이 있는지 파일 크기로 체크 ★
        // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
        file1saved = Upload.saveFileSpring(mf, upDir); 
        
        if (Tool.isImage(file1saved)) { // 이미지인지 검사
          // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
          thumb1 = Tool.preview(upDir, file1saved, 250, 200); 
        }
        
      } else { // 파일이 삭제만 되고 새로 올리지 않는 경우
        file1="";
        file1saved="";
        thumb1="";
        size1=0;
      }
          
      carVO.setFile1(file1);
      carVO.setFile1saved(file1saved);
      carVO.setThumb1(thumb1);
      carVO.setSize1(size1);
      // -------------------------------------------------------------------
      // 파일 전송 코드 종료
      // -------------------------------------------------------------------
          
      this.carProc.update_file(carVO); // Oracle 처리

      mav.addObject("carno", carVO.getCarno());
      mav.addObject("modelno", carVO.getModelno());
      mav.setViewName("redirect:/car/read.do"); // request -> param으로 접근 전환
                
    } else {
      mav.addObject("url", "/master/login_need"); // login_need.jsp, redirect parameter 적용
      mav.setViewName("redirect:/car/msg.do"); // GET
    }

    // redirect하게되면 전부 데이터가 삭제됨으로 mav 객체에 다시 저장
    mav.addObject("now_page", carVO.getNow_page());
    
    return mav; // forward
  }   
  
  /**
   * 파일 삭제 폼
   * http://localhost:9093/car/delete.do?carno=1
   * 
   * @return
   */
  @RequestMapping(value = "/car/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int carno) {
    ModelAndView mav = new ModelAndView();
    
    if (masterProc.isMaster(session)) { // 관리자로 로그인한경우
      CarVO carVO = this.carProc.read(carno);
      mav.addObject("carVO", carVO);
      
      ModelVO modelVO = this.modelProc.read(carVO.getModelno());
      mav.addObject("modelVO", modelVO);
      
      mav.setViewName("/car/delete"); // /WEB-INF/views/car/delete.jsp
      
    } else {
      mav.addObject("url", "/master/login_need"); // /WEB-INF/views/master/login_need.jsp
      mav.setViewName("redirect:/car/msg.do"); 
    }


    return mav; // forward
  }
  
  /**
   * 삭제 처리 http://localhost:9093/car/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/car/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(CarVO carVO) {
    ModelAndView mav = new ModelAndView();
    
    // -------------------------------------------------------------------
    // 파일 삭제 시작
    // -------------------------------------------------------------------
    // 삭제할 파일 정보를 읽어옴.
    CarVO carVO_read = carProc.read(carVO.getCarno());
        
    String file1saved = carVO.getFile1saved();
    String thumb1 = carVO.getThumb1();
    
    String uploadDir = Car.getUploadDir();
    Tool.deleteFile(uploadDir, file1saved);  // 실제 저장된 파일삭제
    Tool.deleteFile(uploadDir, thumb1);     // preview 이미지 삭제
    // -------------------------------------------------------------------
    // 파일 삭제 종료
    // -------------------------------------------------------------------
        
    this.carProc.delete(carVO.getCarno()); // DBMS 삭제
        
    // -------------------------------------------------------------------------------------
    // 마지막 페이지의 마지막 레코드 삭제시의 페이지 번호 -1 처리
    // -------------------------------------------------------------------------------------    
    // 마지막 페이지의 마지막 10번째 레코드를 삭제후
    // 하나의 페이지가 3개의 레코드로 구성되는 경우 현재 9개의 레코드가 남아 있으면
    // 페이지수를 4 -> 3으로 감소 시켜야함, 마지막 페이지의 마지막 레코드 삭제시 나머지는 0 발생
    int now_page = carVO.getNow_page();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("modelno", carVO.getModelno());
    hashMap.put("word", carVO.getWord());
    
    if (carProc.search_count(hashMap) % Car.RECORD_PER_PAGE == 0) {
      now_page = now_page - 1; // 삭제시 DBMS는 바로 적용되나 크롬은 새로고침등의 필요로 단계가 작동 해야함.
      if (now_page < 1) {
        now_page = 1; // 시작 페이지
      }
    }
    // -------------------------------------------------------------------------------------

    mav.addObject("modelno", carVO.getModelno());
    mav.addObject("now_page", now_page);
    mav.setViewName("redirect:/car/list_by_modelno.do"); 
    
    return mav;
  }   
      
  // http://localhost:9093/car/delete_by_modelno.do?modelno=1
  // 파일 삭제 -> 레코드 삭제
  @RequestMapping(value = "/car/delete_by_modelno.do", method = RequestMethod.GET)
  public String delete_by_modelno(int modelno) {
    ArrayList<CarVO> list = this.carProc.list_by_modelno(modelno);
    
    for(CarVO carVO : list) {
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
    
    int cnt = this.carProc.delete_by_modelno(modelno);
    System.out.println("-> count: " + cnt);
    
    return "";
  
  }

}
