<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9093/model/list_all.do</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
  
</head>
<body>
<c:import url="/menu/top.do" />

<div class='title_line'>차종 삭제</div>

<aside class="aside_right">
  <a href="./create.do?modelno=${modelVO.modelno }">등록</a>
  <span class='menu_divide' >│</span>
  <a href="javascript:location.reload();">새로고침</a>
</aside>
<div class="menu_line"></div> 

<div id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <form name='frm_delete' id='frm_delete' method='post' action='./delete.do'>
      <input type="hidden" name="modelno" value="${param.modelno}"> <%-- 삭제할 차종 번호 --%>

      <c:choose>
        <c:when test="${count_by_modelno >= 1 }"> <%-- 자식 레코드가 있는 상황 --%>
          <div class="msg_warning">
            관련 자료 ${count_by_modelno } 건이 발견되었습니다.<br>
            관련 자료와 차종를 모두 삭제하시겠습니까?
          </div>
            
          <label>관련 차종 이름</label>: ${modelVO.name}  
          <a href="../car/list_by_modelno.do?modelno=${modelVO.modelno }&now_page=1" title="관련 차종로 이동"><img src='/model/images/link.png'></a>
          &nbsp;      
          <button type="submit" id='submit' class='btn btn-danger btn-sm' style='height: 28px; margin-bottom: 5px;'>관련 자료와 함게 차종 삭제</button>
          
        </c:when>
        <c:otherwise> <%-- 자식 레코드가 없는 상황 --%>
          <div class="msg_warning">차종를 삭제하면 복구 할 수 없습니다.</div>
          <label>차종 이름</label>: ${modelVO.name}
      
          <button type="submit" id='submit' class='btn btn-warning btn-sm' style='height: 28px; margin-bottom: 5px;'>삭제</button>          
        </c:otherwise>
      </c:choose>      

      <button type="button" onclick="location.href='/model/list_all.do'" class='btn btn-info btn-sm' style='height: 28px; margin-bottom: 5px;'>취소</button>
    </form>
  </div>

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
      <th class="th_bs">차종 이름</th>
      <th class="th_bs">자료수</th>
      <th class="th_bs">등록일</th>
      <th class="th_bs">기타</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="modelVO" items="${list }" varStatus="info">
      <c:set var="modelno" value="${modelVO.modelno }" />

      <tr>
        <td class="td_bs">${info.count }</td>
        <td><a href="./read.do?modelno=${modelno }" style="display: block;">${modelVO.name }</a></td>
        <td class="td_bs">${modelVO.cnt }</td>
        <td class="td_bs">${modelVO.rdate.substring(0, 10) }</td>
        <td class="td_bs">
          <img src="/model/images/show.png" class="icon">
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