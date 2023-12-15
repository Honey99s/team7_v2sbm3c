<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="conditionno" value="${conditionVO.conditionno }" />
<c:set var="title" value="${conditionVO.title }" />
<c:set var="content" value="${conditionVO.content }" />
<c:set var="minprice" value="${conditionVO.minprice }" />
<c:set var="maxprice" value="${conditionVO.maxprice }" />
<c:set var="maxprice" value="${conditionVO.reply }" />
<c:set var="children" value="${conditionVO.children }" />
 
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
 
  <DIV class='title_line'>조건 수정</DIV>
  
  <aside class="aside_right">
    <a href="./create.do?conditionno=${conditionno }">등록</a>
    <span class='menu_divide' >│</span>
    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>    
    <a href="./list_all">조건 목록</a>    
  </aside>`
  
  <div style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get'>
      <input type='hidden' name='conditionno' value='${conditionVO.conditionno }'>  <%-- 게시판의 구분 --%>
           
    </form>
  </div>
  
  <div class='menu_line'></div>
  
  <form name='frm' method='post' action='./update.do'>
    <input type="hidden" name="conditionno" value="${conditionno }">
    
    <div>
       <label>제목</label>
       <input type='text' name='title' value='중고차 추천' required="required" autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>내용</label>
       <textarea name='content' required="required" class="form-control" rows="12" style='width: 100%;'>저는 자녀가 2명있고 3000만원 이내의 짐을 많이 싣을수 있는 차를 원해요!</textarea>
    </div>
    <div>
     <label>최소가격</label>
       <input type='int' name='minprice' value='500' required="required" class="form-control" style='width: 100%;'>
    </div>
     <div>
       <label>최대가격</label>
       <input type='int' name='maxprice' value='9999' required="required" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>자녀수</label>
       <input type='int' name='children' value='2' required="required" 
                 class="form-control" style='width: 100%;'>
    </div>
     <div>
       <label>답변</label>
       <textarea name='content' required="required" class="form-control" rows="12" style='width: 100%;'>쏘나타DN8, K5 3세대, 그랜져IG 를추천합니다</textarea>
    </div>  
       
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-secondary btn-sm">저장</button>
      <button type="button" onclick="history.back();" class="btn btn-secondary btn-sm">취소</button>
    </div>
  
  </FORM>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
