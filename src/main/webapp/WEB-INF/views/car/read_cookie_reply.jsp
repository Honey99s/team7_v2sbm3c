<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="modelno" value="${carVO.modelno }" />
<c:set var="carno" value="${carVO.carno }" />
<c:set var="thumb1" value="${carVO.thumb1 }" />
<c:set var="file1saved" value="${carVO.file1saved }" />
<c:set var="title" value="${carVO.title }" />
<c:set var="content" value="${carVO.content }" />
<c:set var="recom" value="${carVO.recom }" />
<c:set var="rdate" value="${carVO.rdate }" />
<c:set var="youtube" value="${carVO.youtube }" />
<c:set var="map" value="${carVO.map }" />
<c:set var="file1" value="${carVO.file1 }" />
<c:set var="size1_label" value="${carVO.size1_label }" />
<c:set var="word" value="${carVO.word }" />
<c:set var="manufacturer" value="${carVO.manufacturer }" />
<c:set var="minprice" value="${carVO.minprice }" />
<c:set var="maxprice" value="${carVO.maxprice }" />


<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>HoneyCar</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

$(document).ready(function()
{

  $('#btn_recom').on("click", function() { update_recom_ajax(${carno}); });
  //$('#btn_login').on('click', login_ajax);
  //$('#btn_loadDefault').on('click', loadDefault);  
  
  // ---------------------------------------- 댓글 관련 시작 ----------------------------------------
  var frm_reply = $('#frm_reply');
  $('#content', frm_reply).on('click', check_login);  // 댓글 작성시 로그인 여부 확인
  $('#btn_create', frm_reply).on('click', reply_create);  // 댓글 작성시 로그인 여부 확인
  
  list_by_carno_join(); // 댓글 목록
  // ---------------------------------------- 댓글 관련 종료 ----------------------------------------
   
  // 좋아요
    function update_recom_ajax(carno)
    {
      // console.log('-> contentsno:' + contentsno);
      var params = "";
      // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
      params = 'carno=' + carno; // 공백이 값으로 있으면 안됨.
      $.ajax(
        {
          url: '/car/update_recom_ajax.do',
          type: 'post',  // get, post
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // true: 비동기 통신
          dataType: 'json', // 응답 형식: json, html, xml...
          data: params,      // 데이터
          success: function(rdata)
          { // 응답이 온경우
            // console.log('-> rdata: '+ rdata);
            var str = '';
            if (rdata.count == 1)
            {
              // console.log('-> btn_recom: ' + $('#btn_recom').val());  // X
              // console.log('-> btn_recom: ' + $('#btn_recom').html());
              $('#btn_recom').html('♥'+rdata.recom);  
              console.log(rdata.recom);
              $('#span_animation').hide();
            } else {
              // $('#span_animation').html("로그인을 해야 추천을 할 수 있습니다.");
              $('#modal_title').html('추천 수 증가'); // 제목
              $('#modal_content').html("로그인해야 추천 할 수 있습니다."); // 내용
              $('#modal_panel').modal('show');  // 다이얼로그 출력
              // $('#modal_panel').modal();            
              return false;  // 실행 종료
            }
          }, 
          // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
          error: function(request, status, error) { // callback 함수
            console.log(error);
          }
        });  //  $.ajax END  
     // $('#span_animation').css('text-align', 'center');
        $('#span_animation').html("<img src='/car/images/ani04.gif' style='width: 8%;'>");
        $('#span_animation').show(); // 숨겨진 태그의 출력
      } // function update_recom_ajax   

  function loadDefault() {
      $('#id').val('user1');
      $('#passwd').val('1234');
    } 

  <%-- 로그인 --%>
  function login_ajax() {
    var params = "";
    params = $('#frm_login').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    // params += '&${ _csrf.parameterName }=${ _csrf.token }';
    // console.log(params);
    // return;
    
    $.ajax(
      {
        url: '/customer/login_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          console.log('-> login cnt: ' + rdata.cnt);  // 1: 로그인 성공
          
          if (rdata.cnt == 1) {
            // 쇼핑카트에 insert 처리 Ajax 호출
            $('#div_login').hide();
            // alert('로그인 성공');
            $('#login_yn').val('YES'); // 로그인 성공 기록
            cart_ajax_post(); // 쇼핑카트에 insert 처리 Ajax 호출     
            
          } else {
            alert('로그인에 실패했습니다.<br>잠시후 다시 시도해주세요.');
            
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

  }

  // 댓글 작성시 로그인 여부 확인
  function check_login() {
    var frm_reply = $('#frm_reply');
    if ($('#customerno', frm_reply).val().length == 0 ) {
      console.log("로그인 안되어 있슴");
      $('#modal_title').html('댓글 등록'); // 제목
      $('#modal_content').html("로그인해야 등록 할 수 있습니다."); // 내용
      $('#modal_panel').modal('show');  // 다이얼로그 출력
      // $('#modal_panel').modal();            
      return false;  // 실행 종료
    }
  }

  // 댓글 등록
  function reply_create(e)
  {
   e.preventDefault(); // 폼 제출 방지
    
    var frm_reply = $('#frm_reply');
    
    if (check_login() !=false) { // 로그인 한 경우만 처리
      var params = frm_reply.serialize(); // 직렬화: 키=값&키=값&...
      // alert(params);
      // return;

      // 자바스크립트: 영숫자, 한글, 공백, 특수문자: 글자수 1로 인식
      // 오라클: 한글 1자가 3바이트임으로 300자로 제한
      // alert('내용 길이: ' + $('#content', frm_reply).val().length);
      // return;
      
      if ($('#content', frm_reply).val().length > 100) {
        $('#modal_title').html('댓글 등록'); // 제목 
        $('#modal_content').html("댓글 내용은 100자이상 입력 할 수 없습니다."); // 내용
        $('#modal_panel').modal('show');           // 다이얼로그 출력
        return false;  // 실행 종료
      }

      // 비밀번호 미입력 체크
      if ($('#passwd', frm_reply).val().length === 0) {
          $('#modal_title').html('댓글 등록'); // 제목 
          $('#modal_content').html('비밀번호를 입력하세요.'); // 내용
          $('#modal_panel').modal('show');           // 다이얼로그 출력
          return false;  // 실행 종료
      }
      
      // 댓글 내용 입력 여부 체크
      if ($('#content', frm_reply).val().length === 0) {
          $('#modal_title').html('댓글 등록'); // 제목 
          $('#modal_content').html('내용을 입력하세요.'); // 내용
          $('#modal_panel').modal('show');           // 다이얼로그 출력
          return false;  // 실행 종료
      }

      $.ajax({
        url: "../reply/create.do", // action 대상 주소
        type: "post",          // get, post
        cache: false,          // 브러우저의 캐시영역 사용안함.
        async: true,           // true: 비동기
        dataType: "json",   // 응답 형식: json, xml, html...
        data: params,        // 서버로 전달하는 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          // alert(rdata);
          var msg = ""; // 메시지 출력
          var tag = ""; // 글목록 생성 태그
       
          if (rdata.cnt > 0) {
            //$('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
            msg = "댓글을 등록했습니다.";      
            $('#content', frm_reply).val('');
            $('#passwd', frm_reply).val('');

            // 댓글 목록 갱신
            //refreshReplyList();

            list_by_carno_join(); // 댓글 목록을 새로 읽어옴
            
            $('#reply_list').html(''); // 댓글 목록 패널 초기화, val(''): 안됨
            $("#reply_list").attr("data-replypage", 1);  // 댓글이 새로 등록됨으로 1로 초기화
            
            // list_by_carno_join_add(); // 페이징 댓글, 페이징 문제 있음.
            // alert('댓글 목록 읽기 시작');
            // global_rdata = new Array(); // 댓글을 새로 등록했음으로 배열 초기화
            // global_rdata_cnt = 0; // 목록 출력 글수
            
            // list_by_carno_join(); // 페이징 댓글
          } else {
            $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
            msg = "댓글 등록에 실패했습니다.";
          }
          $('#modal_title').html('댓글 등록'); // 제목 
          $('#modal_content').html(msg);     // 내용
          $('#modal_panel').modal('show');           // 다이얼로그 출력
          // 페이지 새로고침
          // window.location.reload();
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          var msg = 'ERROR request.status: '+request.status + '/ ' + error;
          console.log(msg); // Chrome에 출력
        }
      });
    }
   }

//car 별 소속된 댓글 목록
  function list_by_carno_join() {
    var params = 'carno=' + ${carVO.carno };

    $.ajax({
      url: "/reply/list_by_carno_join.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = '';
        
        $('#reply_list').html(''); // 패널 초기화, val(''): 안됨
        
        for (i=0; i < rdata.list.length; i++) {
          var row = rdata.list[i];
          
          msg += "<DIV id='"+row.replyno+"' style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
          msg += "<span style='font-weight: bold;'>" + row.id + "</span>";
          msg += "  " + row.rdate;
          
          if ('${sessionScope.customerno}' == row.customerno) { // 글쓴이 일치여부 확인, 본인의 글만 삭제 가능함 ★
        	  msg += " <A href='#' class='delete-link' data-replyno='" + row.replyno + "'><IMG src='/reply/images/delete.png'></A>";
          }
          msg += "  " + "<br>";
          msg += row.content;
          msg += "</DIV>";
        }
        // alert(msg);
        $('#reply_list').append(msg);
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
    });
    
  } 

  $(document).on('click', '.delete-link', function() {
	    var replyno = $(this).data('replyno');
	    console.log(replyno);
	    reply_delete(replyno);
	});

  $(document).on('click', '#reply_delete_proc', function() {
	  var replyno = $("#replyno").val();
      console.log(replyno);
      reply_delete_proc(replyno);
  });

//댓글 삭제 레이어 출력
  function reply_delete(replyno) {
    // alert('replyno: ' + replyno);
    var frm_reply_delete = $('#frm_reply_delete');
    $('#replyno', frm_reply_delete).val(replyno); // 삭제할 댓글 번호 저장
    $('#modal_panel_delete').modal('show');             // 삭제폼 다이얼로그 출력
  }



  // 댓글 삭제 처리
  function reply_delete_proc(replyno) {
    // alert('replyno: ' + replyno);
    var params = $('#frm_reply_delete').serialize();
    $.ajax({
      url: "/reply/delete.do", // action 대상 주소
      type: "post",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = "";
        
        if (rdata.passwd_cnt ==1) { // 패스워드 일치
          if (rdata.delete_cnt == 1) { // 삭제 성공

            $('#btn_frm_reply_delete_close').trigger("click"); // 삭제폼 닫기, click 발생 
            $('#' + replyno).remove(); // 태그 삭제
              
            return; // 함수 실행 종료
          } else {  // 삭제 실패
            msg = "패스 워드는 일치하나 댓글 삭제에 실패했습니다. <br>";
            msg += " 다시한번 시도해주세요."
          }
        } else { // 패스워드 일치하지 않음.
          // alert('패스워드 불일치');
          // return;
          
          msg = "패스워드가 일치하지 않습니다.";
          $('#modal_panel_delete_msg').html(msg);

          $('#passwd', '#frm_reply_delete').focus();  // frm_reply_delete 폼의 passwd 태그로 focus 설정
          
        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
    });
  }

  //댓글 목록 갱신
  /* function refreshReplyList() {
    // 댓글 목록을 갱신하는 로직 추가
    // 아마도 Ajax를 통해 서버에서 댓글 목록을 다시 불러와서 출력하는 방식으로 구현할 것입니다.
  } */
});   //  $(document).ready(function() end
  
</script>
 
</head> 
 
<body>

<c:import url="/menu/top.do" />

<!-- The Modal -->
<div class="modal fade" id="modal_panel" role="dialog">
  <div class="modal-dialog">
  Modal content
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 id="modal_title"></h4>
        <button type="button" class="close" data-bs-dismiss="modal">x</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <p id='modal_content'></p>  
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> <!-- Modal 알림창 종료 -->

<!-- -------------------- 댓글 삭제폼 시작 -------------------- -->
<div class="modal fade" id="modal_panel_delete" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
    
      <div class="modal-header">
        <button type="button" class="close" data-bs-dismiss="modal">×</button>
        <h4 class="modal-title">댓글 삭제</h4><!-- 제목 -->
      </div>
      <div class="modal-body">
        <form name='frm_reply_delete' id='frm_reply_delete'>
          <input type='hidden' name='replyno' id='replyno' value=''>
          
          <label>패스워드</label>
          <input type='password' name='passwd' id='passwd' class='form-control'>
          <DIV id='modal_panel_delete_msg' style='color: #AA0000; font-size: 1.1em;'></DIV>
        </form>
      </div>
      <div class="modal-footer">
        <button id = 'reply_delete_proc' type='button' class='btn btn-danger' >삭제</button>

        <button type="button" class="btn btn-default" data-bs-dismiss="modal" 
                     id='btn_frm_reply_delete_close'>Close</button>
      </div>
    </div>
  </div>
</div>
   
<DIV class='title_line'>
  <A href="../modelgrp/list.do" class='title_link'>카테고리 그룹</A> > 
  <A href="./list_by_modelno_search_paging.do?modelno=${modelVO.modelno }" class='title_link'>${modelVO.name }</A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <%-- 마스터로 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.master_id != null }">
      <%--
      http://localhost:9092/car/create.do?modelno=1
      http://localhost:9092/car/create.do?modelno=2
      http://localhost:9092/car/create.do?modelno=3
      --%>
       <a href="./create.do?modelno=${modelno }">등록</a>
      <span class='menu_divide' >│</span>
      <a href="./update_text.do?carno=${carno}&now_page=${param.now_page}&word=${param.word }">글 수정</a>
      <span class='menu_divide' >│</span>
      <a href="./update_file.do?carno=${carno}&now_page=${param.now_page}">파일 수정</a>  
      <span class='menu_divide' >│</span>
      <a href="./map.do?modelno=${modelno }&carno=${carno}">지도</a>
      <span class='menu_divide' >│</span>
      <a href="./youtube.do?modelno=${modelno }&carno=${carno}">Youtube</a>
      <span class='menu_divide' >│</span>
      <a href="./delete.do?carno=${carno}&now_page=${param.now_page}&modelno=${modelno}">삭제</a>  
      <span class='menu_divide' >│</span>
    </c:if>
    </ASIDE>
  
  <div style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_modelno.do'>
      <input type='hidden' name='modelno' value='${param.modelno }'>  <%-- 게시판의 구분 --%>
      
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우는 검색어를 출력 --%>
          <input type='text' name='word' id='word' value='${param.word }'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value=''>
        </c:otherwise>
      </c:choose>
      <button type='submit' class='btn btn-secondary btn-sm' style="padding: 2px 8px 3px 8px; margin: 0px 0px 2px 0px;">검색</button>
      <c:if test="${param.word.length() > 0 }"> <%-- 검색 상태하면 '검색 취소' 버튼을 출력 --%>
        <button type='button' class='btn btn-secondary btn-sm' style="padding: 2px 8px 3px 8px; margin: 0px 0px 2px 0px;"
                    onclick="location.href='./list_by_modelno.do?modelno=${param.modelno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </div>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <c:set var="file1saved" value="${file1saved.toLowerCase() }" />
        <DIV style="width: 50%; float: left; margin-right: 10px;">
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/car/storage/ --%>
                <IMG src="/car/storage/${file1saved }" style="width: 100%;"> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/car/images/none1.png" style="width: 100%;"> 
              </c:otherwise>
            </c:choose>
        </DIV>
        <DIV style="width: 47%; height: 260px; float: left; margin-right: 10px; margin-bottom: 30px;">
      <span style="font-size: 2em; font-weight: bold;">${title }</span>
           <span style="font-size: 1.5em;">${manufacturer }</span><br>
           <span  style="font-size: 2em;" >가격 : \ ${minprice }~</span>
           <span style="font-size: 2em;">${maxprice } 만원</span><br>
          <span style="font-size: 1em;">등록일 : ${rdate }</span><br>
          <span style="font-size: 1.3em;">${content }</span>

          <form>
          <button type='button' onclick="" class="btn btn-info">관심 상품</button>
          <button type='button' id="btn_recom" class="btn btn-info">♥${recom}</button>
          <span id="span_animation"></span>
          </form>
      <c:if test="${youtube.trim().length() > 0 }">
        <li class="li_none" style="clear: both; padding-top: 5px; padding-bottom: 5px;">
          <DIV style="text-align: center;">
            ${youtube }
          </DIV>
        </li>
      </c:if>
      
      <c:if test="${map.trim().length() > 0 }">
        <li class="li_none" style="clear: both; padding-top: 5px; padding-bottom: 5px;">
          <DIV style='text-align: center; width:640px; height: 360px; margin: 0px auto;'>
            ${map }
          </DIV>
        </li>
      </c:if>
        </DIV> 
      </li>
      <li class="li_none">
        <DIV style='text-decoration: none;'>
          검색어(키워드): ${word }
        </DIV>
      </li>
      <li class="li_none">
        <DIV>
          <c:if test="${file1.trim().length() > 0 }">
            첨부 파일: <A href='/download?dir=/car/storage&filename=${file1saved}&downname=${file1}'>${file1}</A> (${size1_label})  
          </c:if>
        </DIV>
      </li>   
    </ul>
  </fieldset>

</DIV>

<!-- ------------------------------ 댓글 영역 시작 ------------------------------ -->
<DIV style='width: 80%; margin: 0px auto;'>
    <HR>
    <FORM name='frm_reply' id='frm_reply'> <%-- 댓글 등록 폼 --%>
        <input type='hidden' name='carno' id='carno' value='${carno}'>
        <input type='hidden' name='customerno' id='customerno' value='${sessionScope.customerno}'>
        
        <textarea name='content' id='content' style='width: 100%; height: 60px;' placeholder="댓글 작성, 로그인해야 등록 할 수 있습니다."></textarea>
        <input type='password' name='passwd' id='passwd' placeholder="비밀번호">
        <button type='submit' class='btn btn-secondary btn-sm' id='btn_create'>등록</button>
    </FORM>
    <HR>
    <DIV id='reply_list' data-replypage='1'>
      <%-- 댓글 목록 --%>
      
    </DIV>

    <DIV id='reply_list_btn' style='border: solid 1px #EEEEEE; margin: 0px auto; width: 100%; background-color: #EEFFFF;'>
        <button id='btn_add' class='btn btn-secondary btn-sm' style='width: 100%;'>더보기 ▽</button>
    </DIV>  
  
</DIV>

<!-- ------------------------------ 댓글 영역 종료 ------------------------------  -->
  
   
    
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>