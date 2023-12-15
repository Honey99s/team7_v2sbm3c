<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="qnano" value="${qnaVO.qnano}" />
<c:set var="pw" value="${qnaVO.pw}" />
<c:set var="title" value="${qnaVO.title}" />
<c:set var="content" value="${qnaVO.content}" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>HoneyCar</title>
<link rel="shortcut icon" href="/images/honeycar.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
    
</head> 
 
<body>
<c:import url="/menu/top.do" />
  <DIV class='title_line'>문의사항 조회</div>

  <aside class="aside_right">
    <%-- 회원으로 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.customer_id != null }">
      <%--
      http://localhost:9093/qna/create.do?qnano=1
      --%>
       <a href="./create.do?qnano=${qnano }">문의사항 등록</a>
      <span class='menu_divide' >│</span>
      <a href="./update.do?qnano=${qnano}}">문의사항 수정</a>
      <span class='menu_divide' >│</span>
      <a href="./delete.do?qnano=${qnano}">문의사항 삭제</a>  
      <span class='menu_divide' >│</span>
    </c:if>

    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>
    <a href="./list_all.do">문의사항 목록</a>
  </aside> 
    <form name='frm' id='frm' method='get' action='./list_all.do'></form>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 100%; word-break: break-all;">

           <span style="font-size: 3em; font-weight: bold;">${title }</span><br>
           <span style="font-size: 2em;">${content }</span><br>
        </DIV>
    </ul>
  </fieldset>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

