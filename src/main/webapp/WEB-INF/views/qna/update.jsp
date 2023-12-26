<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="qnano" value="${qnaVO.qnano}" />
<c:set var="pw" value="${qnaVO.pw}" />
<c:set var="title" value="${qnaVO.title}" />
<c:set var="content" value="${qnaVO.content}" />
<c:set var="reply" value="${qnaVO.reply}" />
 
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
 
  <DIV class='title_line'>문의사항 수정</DIV>
  
  <aside class="aside_right">
    <a href="./create.do?qnano=${qnano }">등록</a>
    <span class='menu_divide' >│</span>
    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>    
    <a href="./list_all">문의사항 목록</a>    
  </aside>`
  
  <div style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get'>
      <input type='hidden' name='qnano' value='${qnaVO.qnano }'>  <%-- 게시판의 구분 --%>
           
    </form>
  </div>
  
  <div class='menu_line'></div>
  
  <form name='frm' method='post' action='./update.do'>
    <input type="hidden" name="qnano" value="${qnano }">
    
    <div>
       <label>제목</label>
       <input type='text' name='title' value="${title}" required="required" autofocus="autofocus" class="form-control"
        style='width: 100%;'>
    </div>
    <div>
       <label>내용</label>
       <textarea name='content' required="required" class="form-control" rows="12"
        style='width: 100%;'>${content}</textarea>
    </div>
    <div>
      <label>답변</label>
      <textarea name='reply' required="required" class="form-control" rows="12" style='width: 100%;'>${reply}</textarea>
    </div>
    <div>
       <label>비밀번호</label>
       <input type='password' name='pw' value="${pw}" required="required" class="form-control" style='width: 20%;'>
    </div>   
       
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-secondary btn-sm">저장</button>
      <button type="button" onclick="history.back();" class="btn btn-secondary btn-sm">취소</button>
    </div>
  
  </FORM>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
