<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="customerno" value="${customerVO.customerno }" />

 
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
 
  <DIV class='title_line'>회원 번호 수정</DIV>
  
  <aside class="aside_right">
    <a href="./create.do?customerno=${customerno }">등록</a>
    <span class='menu_divide' >│</span>
    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>    
    <a href="./list_all">조건 목록</a>    
  </aside>`
  
  <div style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get'>
      <input type='hidden' name='customerno' value='${customerVO.customerno }'>  <%-- 게시판의 구분 --%>
           
    </form>
  </div>
  
  <div class='menu_line'></div>
  
  <form name='frm' method='post' action='./drop.do'>
    <input type="hidden" name="customerno" value="${customerno }">
    
    <div>
     <label>회원번호</label>
       <input type='int' name='customerno' value='' required="required" class="form-control" style='width: 100%;'>
    </div>

       
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-secondary btn-sm">저장</button>
      <button type="button" onclick="history.back();" class="btn btn-secondary btn-sm">취소</button>
    </div>
  
  </FORM>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
