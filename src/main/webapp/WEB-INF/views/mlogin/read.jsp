<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

      <c:set var="mloginno" value="${mloginVO.mloginno }"/>
      <c:set var="masterno" value="${mloginVO.masterno }"/>
      <c:set var="ip" value="${mloginVO.ip }"/>
      <c:set var="logindate" value="${mloginVO.logindate }"/>

 
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
  <DIV class='title_line'>로그인 내역 조회</div>

  <aside class="aside_right">
    <%-- 마스터로 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.master_id != null }">
      <%--
      http://localhost:9093/mlogin/create.do?mloginno=1
      --%>
      <a href="./delete.do?mloginno=${mloginno}">로그인 내역 삭제</a>  
      <span class='menu_divide' >│</span>
    </c:if>

    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>
    <a href="./list_all.do">로그인 내역</a>
  </aside> 
    <form name='frm' id='frm' method='get' action='./list_all.do'></form>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 100%; word-break: break-all;">

           <span style="font-size: 2em; font-weight: bold;">로그인 번호: ${mloginno }</span><br>
           <span style="font-size: 2em;">회원 번호: ${masterno }</span><br>
           <span  style="font-size: 2em;" >IP : ${ip }</span>
           <span style="font-size: 2em;">로그인 날짜: ${logindate }</span><br>
        </DIV>
    </ul>
  </fieldset>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

