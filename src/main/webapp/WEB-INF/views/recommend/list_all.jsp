<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9093/recommend/list_all.do</title>
<link rel="shortcut icon" href="/images/honeyrecommend.png" /> <%-- /static 기준 --%>
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
      <col style='width: 15%;'/>
      <col style='width: 40%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
    </colgroup>
    <tr>
      <th class='th_bs'>번호</th>
      <th class='th_bs'>제목</th>
      <th class='th_bs'>내용</th>
      <th class='th_bs'>최소가격</th>
      <th class='th_bs'>최대가격</th>
      <th class='th_bs'>자녀수</th>
      <th class='th_bs'></th>
    </tr>
   <tbody>
    <c:forEach var="recommendVO" items="${list }" varStatus="info">
     <c:set var="recommendno" value="${recommendVO.recommendno }"/>

      <tr>
          <td class="td_bs">${recommendno }</td>
          <td><a href="./read.do?recommendno=${recommendno}" style="display:block;">${recommendVO.title}</a></td>
           <td><a href="./read.do?recommendno=${recommendno}" style="display:block;"> <c:choose>
              <c:when test="${recommendVO.content.length() > 160 }">
                ${recommendVO.content.substring(0, 160) }...
              </c:when>
              <c:otherwise>
                ${recommendVO.content }
              </c:otherwise>
              </c:choose>
              </a>
              </td>
          <td class="td_bs">${recommendVO.minprice}</td>
          <td class="td_bs">${recommendVO.maxprice}</td>
          <td class="td_bs">${recommendVO.children}</td>
          <td class="td_bs">
          <a href="./update.do?recommendno=${recommendno}"><IMG src='/recommend/images/update.png' title='수정' class="icon"></a>
          <a href="./delete.do?recommendno=${recommendno}"><IMG src='/recommend/images/delete.png' title='삭제' class="icon"></a>
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