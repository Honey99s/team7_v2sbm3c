<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9093/condition/list_all.do</title>
<link rel="shortcut icon" href="/images/honeycondition.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
  
</head>
<body>
<c:import url="/menu/top.do" />
 
  <DIV class='title_line'>조건 목록</DIV>

  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>조건 등록</A>
    <span class='menu_divide' >│</span> 
    <A href='./list_all.do'>조건 목록</A>
  </ASIDE> 
   
  <div class='menu_line'></div>
    
   
  <table class="table table-hover" style='width: 100%;'>
    <colgroup>
      <col style='width: 5%;'/>
      <col style='width: 10%;'/>
      <col style='width: 30%;'/>
      <col style='width: 7.5%;'/>
      <col style='width: 7.5%;'/>
      <col style='width: 5%;'/>
      <col style='width: 25%;'/>
      <col style='width: 10%;'/>
    </colgroup>
    <tr>
      <th class='th_bs'>번호</th>
      <th class='th_bs'>제목</th>
      <th class='th_bs'>내용</th>
      <th class='th_bs'>최소가격</th>
      <th class='th_bs'>최대가격</th>
      <th class='th_bs'>자녀수</th>
      <th class='th_bs'>답변</th>
      <th class='th_bs'>등록일</th>
    </tr>
   <tbody>
    <c:forEach var="conditionVO" items="${list }" varStatus="info">
     <c:set var="conditionno" value="${conditionVO.conditionno }"/>

      <tr>
          <td class="td_bs">${conditionno }</td>
          <td><a href="./read.do?conditionno=${conditionno}" style="display:block;">${conditionVO.title}</a></td>
           <td><a href="./read.do?conditionno=${conditionno}" style="display:block;"> <c:choose>
              <c:when test="${conditionVO.content.length() > 160 }">
                ${conditionVO.content.substring(0, 160) }...
              </c:when>
              <c:otherwise>
                ${conditionVO.content }
              </c:otherwise>
              </c:choose>
              </a>
              </td>
          <td class="td_bs">${conditionVO.minprice}</td>
          <td class="td_bs">${conditionVO.maxprice}</td>
          <td class="td_bs">${conditionVO.children}</td>
          <td class="td_bs">${conditionVO.reply}</td>
          <td class="td_bs">(${conditionVO.rdate.substring(0,16) })</td>
          <td class="td_bs">
          <a href="./update.do?conditionno=${conditionno}"><IMG src='/condition/images/update.png' title='수정' class="icon"></a>
          <a href="./delete.do?conditionno=${conditionno}"><IMG src='/condition/images/delete.png' title='삭제' class="icon"></a>
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