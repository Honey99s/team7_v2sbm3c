<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
 
  <div class='title_line'>${modelVO.name } > 글 등록</div>
  
  <aside class="aside_right">
    <a href="./create.do?modelno=${modelVO.modelno }">등록</a>
    <span class='menu_divide' >│</span>
    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>
    <a href="./list_by_modelno_search_paging.do?modelno=${modelVO.modelno }">기본 목록형</a>    
    <span class='menu_divide' >│</span>
    <a href="./list_by_modelno_grid.do?modelno=${modelVO.modelno }">갤러리형</a>
  </aside>
  
  <div style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_modelno_search_paging.do'>
      <input type='hidden' name='modelno' value='${modelVO.modelno }'>  <%-- 게시판의 구분 --%>
      
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' class='input_word'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' class='input_word'>
        </c:otherwise>
      </c:choose>
      <button type='submit' class='btn btn-info btn-sm'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' class='btn btn-info btn-sm' 
                    onclick="location.href='./list_by_modelno_search.do?modelno=${modelVO.modelno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </div>
  
  <div class='menu_line'></div>
  
  <form name='frm' method='post' action='./create.do' enctype="multipart/form-data">
    <input type="hidden" name="modelno" value="${param.modelno }">
    
    <div>
       <label>제목</label>
       <input type='text' name='title' value='중고차 추천' required="required" autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>내용</label>
       <textarea name='content' required="required" class="form-control" rows="12" style='width: 100%;'>자동차 추천을 받아보세요! </textarea>
    </div>
    <div>
       <label>제조사</label>
       <input type='text' name='manufacturer' value='현대' required="required" class="form-control" style='width: 100%;'>
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
       <label>검색어</label>
       <input type='text' name='word' value='아반떼,쏘나타,그랜져,제네시스,쏘렌토,싼타페,팰리세이드,k3,k5,k8' required="required" 
                 class="form-control" style='width: 100%;'>
    </div>   
    <div>
       <label>이미지</label>
       <input type='file' class="form-control" name='file1MF' id='file1MF' value='' placeholder="파일 선택">
    </div>   
    <div>
       <label>패스워드</label>
       <input type='password' name='passwd' value='1234' required="required" 
                 class="form-control" style='width: 50%;'>
    </div>   
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-secondary btn-sm">등록</button>
      <button type="button" onclick="location.href='./list_by_modelno_search_paging.do?modelno=${param.modelno}'" class="btn btn-secondary btn-sm">목록</button>
    </div>
  
  </form>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
