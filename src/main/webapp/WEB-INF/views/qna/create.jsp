<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<c:set var="qnano" value="${qnaVO.qnano}" />
<c:set var="customerno" value="${qnaVO.customerno}" />
<c:set var="pw" value="${qnaVO.pw}" />
<c:set var="title" value="${qnaVO.title}" />
<c:set var="content" value="${qnaVO.content}" />
<c:set var="qdate" value="${qnaVO.qdate}" />

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>HoneyCar</title>
<link rel="shortcut icon" href="/images/honeycar.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
  
</head> 
 
<body>
<c:import url="/menu/top.do" />
 
  <div class='title_line'>문의사항 등록</div>
  
  <aside class="aside_right">
    <span class='menu_divide' >│</span>
    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>
    <a href="./list_all.do">문의사항 목록</a>    
  </aside>
    
    <div class='menu_line'></div>
   <form name='frm' method='post' action='./create.do'>

    <div>
       <label>제목</label>
       <input type='text' name='title' required="required" autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>내용</label>
       <textarea name='content' required="required" class="form-control" rows="20" style='width: 100%;'></textarea>
    </div>
    <div>
       <label>비밀번호</label>
       <input type='int' name='pw'  required="required" 
                 class="form-control" style='width: 20%;'>
    </div>   

    <div class="content_body_bottom">
      <button type="submit" class="btn btn-secondary btn-sm">등록</button>
      <button type="button" onclick="history.back();" class="btn btn-secondary btn-sm">취소</button>
      <button type="button" onclick="location.href='./list_all'" class="btn btn-secondary btn-sm">목록</button>
    </div>
  
  </form>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
