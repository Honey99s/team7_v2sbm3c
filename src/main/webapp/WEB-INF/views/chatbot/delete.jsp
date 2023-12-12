<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="chatbotno" value="${chatbotVO.chatbotno }" />
<c:set var="customerno" value="${chatbotVO.customerno }" />
<c:set var="record" value="${chatbotVO.record}" />
<c:set var="cdate" value="${chatbotVO.cdate }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9093/</title>
<link rel="shortcut icon" href="/images/honeycar.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->

</head>
<body>
<c:import url="/menu/top.do" />
  <DIV class='title_line'> 챗봇 삭제</DIV>
  
  <!--  추천 삭제 밑에 우측 부분
  <aside class="aside_right">
    <a href="./create.do?chatbotno=${chatbotno }">조건 등록</a>
    <span class='menu_divide' >│</span>
    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>    
    <a href="./list_all.do">조건 목록</a>    
  </aside>
-->
  
  <div class='menu_line'></div>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">

        <DIV style='text-align: left; width: 47%; float: left;'>

          <br>
          <FORM name='frm' method='post' action='./delete.do'>
              <input type='hidden' name='chatbotno' value='${chatbotno}'>
              <br><br>
              <div style='text-align: center; margin: 10px auto;'>
                <span style="color: #FF0000; font-weight: bold;">삭제를 진행 하시겠습니까? 삭제하시면 복구 할 수 없습니다.</span><br><br>
                <br><br>
                <button type = "submit" class="btn btn-secondary btn-sm">삭제 진행</button>
                <button type = "button" onclick = "history.back()" class="btn btn-secondary btn-sm">취소</button>
              </div>   
          </FORM>
        </DIV>
      </li>
     </ul>
  </fieldset>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>

