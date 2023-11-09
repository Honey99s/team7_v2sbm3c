<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9092/model/list_all.do</title>
<link rel="shortcut icon" href="/images/honeycar.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
  
</head>
<body>
<c:import url="/menu/top.do"/>

<div class='title_line'>차종</div>
<aside class="aside_right">
  <a href="./create.do?modelno=${modelVO.modelno }">등록</a>
  <span class='menu_divide' >│</span>
  <a href="javascript:location.reload();">새로고침</a>
</aside>
<div class="menu_line"></div> 

<form name='frm' method='post' action='/model/create.do'>
  <div>
    <label>차종 이름</label>
    <input type="text" name="name" value="" required="required" autofocus="autofocus" class="" style="width:50%">
    <button type="submit" class="btn btn-secondary" style="height: 28px; margin-bottom: 5px;">등록</button>
    <button type="button" onclick="location.href='./list_all.do'" class="btn btn-secondary" style="height: 28px; margin-bottom: 5px;">목록</button>
  </div>
</form> 

<table class="table table-hover">
  <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 10%;'/>    
      <col style='width: 20%;'/>
      <col style='width: 20%;'/>
    </colgroup>
    <thead>
      <tr>
        <th class="th_bs">순서</th>
        <th class="th_bs">차종명</th>
        <th class="th_bs">자료수</th>
        <th class="th_bs">등록일</th>
        <th class="th_bs">기타</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="modelVO" items="${list }" varStatus="info">
      <c:set var="modelno" value="${modelVO.modelno }"/>
      <c:set var="seqno" value="${modelVO.seqno }"/>
      
      <tr>
        <td class="td_bs">${seqno }</td>
        <td><a href="../car/list_by_modelno.do?modelno=${modelno }" style="display: block;">${modelVO.name }</a></td>
        <td class="td_bs">${modelVO.cnt }</td>
        <td class="td_bs">${modelVO.rdate.substring(0,10) }</td>
        <td class="td_bs">
        <a href="../car/create.do?modelno=${modelno }" title="등록"><img src="/model/images/create.png" class="icon"></a>
        <c:choose>
          <c:when test="${modelVO.visible == 'Y' }">
            <a href="./update_visible_n.do?modelno=${modelno }" title="카테고리 공개 설정"><img src="/model/images/show.png" class="icon"></a>
          </c:when>
          <c:otherwise>
            <a href="./update_visible_y.do?modelno=${modelno }" title="카테고리 비공개 설정"><img src="/model/images/hide.png" class="icon"></a>
           </c:otherwise>
           </c:choose>
           
           <a href="./update_seqno_forward.do?modelno=${modelno }" title="우선 순위 높임"><img src="/model/images/decrease.png" class="icon"></a>
           <a href="./update_seqno_backward.do?modelno=${modelno }" title="우선 순위 낮춤"><img src="/model/images/increase.png" class="icon"></a>
          <a href="./update.do?modelno=${modelno }" title="수정"><img src="/model/images/update.png" class="icon"></a>
          <a href="./delete.do?modelno=${modelno }" title="삭제"><img src="/model/images/delete.png" class="icon"></a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
    
</table>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>