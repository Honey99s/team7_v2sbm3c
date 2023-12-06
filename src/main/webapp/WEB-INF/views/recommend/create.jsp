<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<c:set var="recommendno" value="${recommendVO.recommendno }" />
<c:set var="modelno" value="${recommendVO.modelno }" />
<c:set var="carno" value="${recommendVO.carno }" />
<c:set var="customerno" value="${recommendVO.customerno }" />
<c:set var="seq" value="${recommendVO.seq }" />
<c:set var="rdate" value="${recommendVO.rdate }" />

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
 
  <div class='title_line'>추천 차종 등록</div>
  
  <aside class="aside_right">
    <span class='menu_divide' >│</span>
    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>
    <a href="./list_all.do">추천 목록</a>    
  </aside>
    
    <div class='menu_line'></div>
   <form name='frm' method='post' action='./create.do'>

    <div>
       <label>추천 차종</label>
       <input type='int' name='modelno' value='1' required="required" autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
        <label>추천 자동차</label>
       <input type='int' name='carno' value='1' required="required" class="form-control" style='width: 100%;'>
    </div>
     <div>
       <label>고객 번호</label>
       <input type='int' name='customerno' value='1' required="required" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>순서</label>
       <input type='int' name='seq' value='1' required="required" class="form-control" style='width: 100%;'>
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
