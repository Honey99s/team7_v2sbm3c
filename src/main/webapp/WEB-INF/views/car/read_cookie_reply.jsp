<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="modelno" value="${carVO.modelno }" />
<c:set var="carno" value="${carVO.carno }" />
<c:set var="thumb1" value="${carVO.thumb1 }" />
<c:set var="file1saved" value="${carVO.file1saved }" />
<c:set var="title" value="${carVO.title }" />
<c:set var="content" value="${carVO.content }" />
<c:set var="rdate" value="${carVO.rdate }" />
<c:set var="youtube" value="${carVO.youtube }" />
<c:set var="map" value="${carVO.map }" />
<c:set var="file1" value="${carVO.file1 }" />
<c:set var="size1_label" value="${carVO.size1_label }" />
<c:set var="word" value="${carVO.word }" />
<c:set var="manufacturer" value="${carVO.manufacturer }" />
<c:set var="minprice" value="${carVO.minprice }" />
<c:set var="maxprice" value="${carVO.maxprice }" />
<c:set var="reply_id" value="" />
<c:set var="reply_content" value="" />
<c:set var="reply_rdate" value="" />

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
    // ---------------------------------------- 댓글 관련 시작 ----------------------------------------
    var frm_reply = $('#frm_reply');
    $('#content', frm_reply).on('click', check_login);  // 댓글 작성시 로그인 여부 확인
    $('#btn_create', frm_reply).on('click', reply_create);  // 댓글 작성시 로그인 여부 확인
    // ---------------------------------------- 댓글 관련 종료 ----------------------------------------
    

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

            // list_by_carno_join(); // 댓글 목록을 새로 읽어옴
            
            $('#reply_list').html(''); // 댓글 목록 패널 초기화, val(''): 안됨
            $("#reply_list").attr("data-replypage", 1);  // 댓글이 새로 등록됨으로 1로 초기화

            // modal이 닫힌 후에 페이지 새로고침
            $('#modal_panel').on('hidden.bs.modal', function (e) {
              window.location.reload();
            });
            
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

  //댓글 목록 갱신
  /* function refreshReplyList() {
    // 댓글 목록을 갱신하는 로직 추가
    // 아마도 Ajax를 통해 서버에서 댓글 목록을 다시 불러와서 출력하는 방식으로 구현할 것입니다.
  } */
});
  
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
          <button type='button' id="btn_recom" class="btn btn-info">♥(${recom })</button>
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
      <table class="table table-hover">
        <colgroup>
            <col style='width: 20%;'/>
            <col style='width: 60%;'/>
            <col style='width: 20%;'/>    
         </colgroup>
<!--          <thead>
            <tr>
              <th class="th_bs">Id</th>
              <th class="th_bs">내용</th>
              <th class="th_bs">등록일</th>
            </tr>
          </thead> -->
          <tbody>
          <c:forEach var="reply" items="${list}">
             <c:set var="reply_id" value="${reply.id}" />
             <c:set var="reply_content" value="${reply.content}" />
             <c:set var="reply_rdate" value="${reply.rdate}" />

            <!-- 여기서부터 <tr> 태그 시작 -->    
            <tr>
              <td class="td_bs">${reply_id}</td>
              <td class="td_bs">${reply_content}</td>
              <td class="td_bs">${reply_rdate.substring(0,16)}</td>
              <%-- <td class="td_bs">${modelVO.rdate.substring(0,10)}</td> --%>
            </tr>
            </c:forEach>
          </tbody>
         </table> 
    </DIV>

    <DIV id='reply_list_btn' style='border: solid 1px #EEEEEE; margin: 0px auto; width: 100%; background-color: #EEFFFF;'>
        <button id='btn_add' class='btn btn-secondary btn-sm' style='width: 100%;'>더보기 ▽</button>
    </DIV>  
  
</DIV>

<!-- ------------------------------ 댓글 영역 종료 ------------------------------  -->
  
   
    
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>