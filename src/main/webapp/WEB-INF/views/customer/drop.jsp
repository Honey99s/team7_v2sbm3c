<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="customerno" value="${customerVO.customerno }" />
<c:set var="grade" value="${customerVO.grade }" />

 
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

$(document).ready(
{

  
  $('#btn_drop').on('click', function (e) {
        e.preventDefault(); // 폼 제출 방지
        customer_drop_proc();
    });
      
  //탈퇴 시 비밀번호 여부 확인
  function customer_drop_proc(replyno) {
    var params = $('#customer_pw').val();
    $.ajax({
      url: "/customer/drop.do", // action 대상 주소 
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
            msg = "댓글을 등록했습니다.";      
              
          } else {
              $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
              msg = "회원 탈퇴에 실패했습니다.";
            }
            $('#modal_title').html('회원 탈퇴'); // 제목 
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
    
}

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
                     id='btn_frm_customer_delete_close'>Close</button>
      </div>
    </div>
  </div>
</div>
 
  <DIV class='title_line'>회원 탈퇴</DIV>
  
  <aside class="aside_right">
    <span class='menu_divide' >│</span>
    <a href="javascript:location.reload();">새로고침</a> 
  </aside>
  
  <div class='menu_line'></div>
  
  <h1>회원탈퇴 안내문</h1>
<p>
    회원탈퇴 시 개인정보 및 HoneyCar에서 만들어진 모든 데이터는 삭제됩니다. 다만, 아래의 항목은 표기된 법률에 따라 특정 기간 동안 보관됩니다.
</p>

<ol>
    <li>
        <strong>계약 또는 청약철회 등에 관한 기존 보존 이유:</strong>
        <ul>
            <li><strong>법률:</strong> 전자상거래 등에서의 소비자보호에 관한 법률</li>
            <li><strong>보존 기간:</strong> 5년</li>
        </ul>
    </li>
    <li>
        <strong>소비자 불만 또는 분쟁처리에 관한 기록 보존 이유:</strong>
        <ul>
            <li><strong>법률:</strong> 전자상거래 등에서의 소비자보호에 관한 법률</li>
            <li><strong>보존 기간:</strong> 3년</li>
        </ul>
    </li>
</ol>

<p>
    <strong>참고:</strong><br>
    본 기간은 관련 법률에 따라 정해진 것이며, 해당 기간 이후에는 관련 데이터가 완전히 삭제됩니다. 탈퇴 후에도 회원이 선택한 서비스 제공 동의에 따라 일부 정보는 삭제되지 않을 수 있습니다.
</p>

<p>
    <strong>탈퇴 취소 요청:</strong><br>
    회원 탈퇴 후 7일 이내에는 문의사항을 통해 탈퇴 취소를 요청할 수 있습니다. 탈퇴 취소 요청은 문의사항을 통해 제출하시기 바랍니다.
</p>

<p>
    위 내용은 법률 및 정책의 변경에 따라 업데이트될 수 있습니다. 추가로 문의사항이 있다면 언제든지 문의하십시오. 회원 탈퇴를 진행하시려면 "회원 탈퇴" 버튼을 클릭하여 주시기 바랍니다.
</p>
  
  <form name='frm' method='post' action='./drop.do'>
    <input type="hidden" name="customerno" value="${customerno }">
    
    <div>
    <label class="line-break">비밀번호 입력</label><br>
    <input type='password' name='passwd' id='customer_pw' placeholder="현재 비밀번호를 입력해주세요." class="line-break" style="width: 300px;"><br>

    <label class="line-break">무엇이 불편하였나요?</label><br>
    <select id="reason" name="reason" class="line-break" style="width: 300px;"><br>
        <option value="personal">개인적인 이유</option>
        <option value="unsatisfied">원하는 컨텐츠 부족</option>
        <option value="unsatisfied">콘텐츠 내용 불만</option>
        <option value="unsatisfied">사이트 사용 빈도 낮음</option>
        <option value="other">기타</option>
    </select>

</div>

       
    <div class="content_body_bottom">
      <button type='submit' class='btn btn-secondary btn-sm' id='btn_drop'>탈퇴하기</button>
    </div>
  
  </FORM>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>