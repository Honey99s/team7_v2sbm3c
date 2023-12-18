<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="reviewno" value="${reviewVO.reviewno}" />
<c:set var="carno" value="${reviewVO.carno}" />
<c:set var="title" value="${reviewVO.title}" />
<c:set var="content" value="${reviewVO.content}" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>HoneyCar</title>
<link rel="shortcut icon" href="/images/shortcut.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
  
</head>
 
<body>
<c:import url="/menu/top.do" />
 
  <DIV class='title_line'>구매후기 수정</DIV>
  
  <aside class="aside_right">
    <a href="./create.do?reviewno=${reviewno }">등록</a>
    <span class='menu_divide' >│</span>
    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>    
    <a href="./list_all">구매후기 목록</a>    
  </aside>`
  
  <div style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get'>
      <input type='hidden' name='reviewno' value='${reviewVO.reviewno }'>  <%-- 게시판의 구분 --%>
           
    </form>
  </div>
  
  <div class='menu_line'></div>
  
  <form name='frm' method='post' action='./update.do'>
    <input type="hidden" name="reviewno" value="${reviewno }">
    
    <div>
       <label>자동차 번호</label>
       <input type='int' name='carno' value="${carno}"  required="required" class="form-control" style='width: 20%;'>
    </div>   
    <div>
       <label>제목</label>
       <input type='text' name='title' value="${title}" required="required" autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>내용</label>
       <textarea name='content'  required="required" class="form-control" rows="20" style='width: 100%;'> ${content}</textarea>
    </div>
       
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-secondary btn-sm">저장</button>
      <button type="button" onclick="history.back();" class="btn btn-secondary btn-sm">취소</button>
    </div>
  
  </FORM>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
