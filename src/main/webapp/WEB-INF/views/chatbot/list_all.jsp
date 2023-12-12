<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9093/chatbot/list_all.do</title>
<link rel="shortcut icon" href="/images/honeychatbot.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
  
</head>
<body>
<c:import url="/menu/top.do" />
 
  <DIV class='title_line'>챗봇 목록</DIV>

  <!-- 목록 밑 작은 글씨 메뉴 -->
  <!--  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>조건 등록</A>
    <span class='menu_divide' >│</span> 
    <A href='./list_all.do'>조건 목록</A>
  </ASIDE> 
   
  <div class='menu_line'></div>
   !-->
   
  <table class="table table-hover" style='width: 100%;'>
    <colgroup>
      <col style='width: 5%;'/>
      <col style='width: 5%;'/>
      <col style='width: 65%;'/>
      <col style='width: 20%;'/>
      <col style='width: 5%;'/>
    </colgroup>
    <tr>
      <th class='th_bs'>챗봇 번호</th>
      <th class='th_bs'>고객 번호</th>
      <th class='th_bs'>기록</th>
      <th class='th_bs'>등록일</th>
      <th class='th_bs'>삭제</th>
    </tr>
   <tbody>
    <c:forEach var="chatbotVO" items="${list }" varStatus="info">
     <c:set var="chatbotno" value="${chatbotVO.chatbotno }"/>

      <tr>
          <td class="td_bs">${chatbotno }</td>
          <td class="td_bs">${chatbotVO.customerno}</td>
          <td><a href="./read.do?chatbotno=${chatbotno}" style="display:block;">${chatbotVO.record }</a></td>
          <td class="td_bs">${chatbotVO.cdate}</td>
          <td class="td_bs">
          <a href="./delete.do?chatbotno=${chatbotno}"><IMG src='/recommend/images/delete.png' title='삭제' class="icon"></a>
        </td>
      </tr>
      
    </c:forEach>
    </tbody>
    
  </TABLE>
   
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.href='./create.do'" class="btn btn-primary btn-sm">등록</button>
    <button type='button' onclick="location.reload();" class="btn btn-primary btn-sm">새로 고침</button>
  </DIV>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>