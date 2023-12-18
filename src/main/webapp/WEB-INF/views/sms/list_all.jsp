<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9093/sms/list_all.do</title>
<link rel="shortcut icon" href="/images/honeycar.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
  
</head>
<body>
<c:import url="/menu/top.do"/>

<div class='title_line'>로그인 내역</div>

<aside class="aside_right">
  <a href="javascript:location.reload();">새로고침</a>
</aside>
<div class="menu_line"></div> 

<table class="table table-hover">
  <colgroup>
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>    
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>
    </colgroup>
    <thead>
      <tr>
        <th class="th_bs">로그인 번호</th>
        <th class="th_bs">회원 번호</th>
        <th class="th_bs">IP</th>
        <th class="th_bs">등록일</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="smsVO" items="${list }" varStatus="info">
      <c:set var="loginno" value="${smsVO.loginno }"/>
      <c:set var="customerno" value="${smsVO.customerno }"/>
      <c:set var="ip" value="${smsVO.ip }"/>
      <c:set var="logindate" value="${smsVO.logindate }"/>
      
      <tr>
      <td class="td_bs">${loginno }</td>
       <td class="td_bs">${customerno }</td>
       <td class="td_bs">${ip }</td>
       <td class="td_bs">${logindate }</td>
       <td class="td_bs">
          <a href="./delete.do?loginno=${loginno}"><IMG src='/sms/images/delete.png' title='삭제' class="icon"></a>
       </td>
      
  
    </c:forEach>
    </tbody>
    
</table>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>