<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="name" value="${modelVO.name }" />

<c:set var="modelno" value="${carVO.modelno }" />
<c:set var="carno" value="${carVO.carno }" />
<c:set var="thumb1" value="${carVO.thumb1 }" />
<c:set var="file1saved" value="${carVO.file1saved }" />
<c:set var="title" value="${carVO.title }" />
<c:set var="content" value="${carVO.content }" />
<c:set var="rdate" value="${carVO.rdate }" />
<c:set var="youtube" value="${carVO.youtube }" />
<c:set var="map" value="${carVO.map }" />
<c:set var="file1" value="${carVO.file1 }" />
<c:set var="size1_label" value="${carVO.size1_label }" />
<c:set var="word" value="${carVO.word }" />
<c:set var="manufacturer" value="${carVO.manufacturer }" />
<c:set var="minprice" value="${carVO.minprice }" />
<c:set var="maxprice" value="${carVO.maxprice }" />
 
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
  <DIV class='title_line'><A href="./list_by_modelno.do?modelno=${modelno }" class='title_link'>${name }</A></DIV>

  <ASIDE class="aside_right">
    <%-- 마스터로 로그인해야 메뉴가 출력됨 --%>
    <c:if test="${sessionScope.master_id != null }">
      <%--
      http://localhost:9092/car/create.do?modelno=1
      http://localhost:9092/car/create.do?modelno=2
      http://localhost:9092/car/create.do?modelno=3
      --%>
       <a href="./create.do?modelno=${modelno }">등록</a>
      <span class='menu_divide' >│</span>
      <a href="./update_text.do?carno=${carno}&now_page=${param.now_page}&word=${param.word }">글 수정</a>
      <span class='menu_divide' >│</span>
      <a href="./update_file.do?carno=${carno}&now_page=${param.now_page}">파일 수정</a>  
      <span class='menu_divide' >│</span>
      <a href="./map.do?modelno=${modelno }&carno=${carno}">지도</a>
      <span class='menu_divide' >│</span>
      <a href="./youtube.do?modelno=${modelno }&carno=${carno}">Youtube</a>
      <span class='menu_divide' >│</span>
      <a href="./delete.do?carno=${carno}&now_page=${param.now_page}&modelno=${modelno}">삭제</a>  
      <span class='menu_divide' >│</span>
    </c:if>

    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>    
    <a href="./list_by_modelno.do?modelno=${modelno }&now_page=${param.now_page}&word=${param.word }">목록형</a>    
    <span class='menu_divide' >│</span>
    <a href="./list_by_modelno_grid.do?modelno=${modelno }&now_page=${param.now_page}&word=${param.word }">갤러리형</a>
  </aside> 
  
  <div style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_modelno.do'>
      <input type='hidden' name='modelno' value='${param.modelno }'>  <%-- 게시판의 구분 --%>
      
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우는 검색어를 출력 --%>
          <input type='text' name='word' id='word' value='${param.word }'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value=''>
        </c:otherwise>
      </c:choose>
      <button type='submit' class='btn btn-secondary btn-sm' style="padding: 2px 8px 3px 8px; margin: 0px 0px 2px 0px;">검색</button>
      <c:if test="${param.word.length() > 0 }"> <%-- 검색 상태하면 '검색 취소' 버튼을 출력 --%>
        <button type='button' class='btn btn-secondary btn-sm' style="padding: 2px 8px 3px 8px; margin: 0px 0px 2px 0px;"
                    onclick="location.href='./list_by_modelno.do?modelno=${param.modelno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </div>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 100%; word-break: break-all;">
          <c:choose>
            <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
              <%-- /static/car/storage/ --%>
              <img src="/car/storage/${file1saved }" style='width: 50%; float: left; margin-top: 0.5%; margin-right: 1%;'> 
            </c:when>
            <c:otherwise> <!-- 기본 이미지 출력 -->
              <img src="/car/images/none1.png" style='width: 50%; float: left; margin-top: 0.5%; margin-right: 1%;'> 
            </c:otherwise>
          </c:choose>

           <span style="font-size: 2em; font-weight: bold;">${title }</span>
           <span style="font-size: 1.5em;">${manufacturer }</span><br>
           <span  style="font-size: 2em;" >가격 : \ ${minprice }~</span>
           <span style="font-size: 2em;">${maxprice } 만원</span><br>
          <span style="font-size: 1em;">등록일 : ${rdate }</span><br>
          <span style="font-size: 1.3em;">${content }</span>
        </DIV>
      </li>
      
      <c:if test="${youtube.trim().length() > 0 }">
        <li class="li_none" style="clear: both; padding-top: 5px; padding-bottom: 5px;">
          <DIV style="text-align: center;">
            ${youtube }
          </DIV>
        </li>
      </c:if>
      
      <c:if test="${map.trim().length() > 0 }">
        <li class="li_none" style="clear: both; padding-top: 5px; padding-bottom: 5px;">
          <DIV style='text-align: center; width:640px; height: 360px; margin: 0px auto;'>
            ${map }
          </DIV>
        </li>
      </c:if>
      
      <li class="li_none" style="clear: both;">
        <DIV style='text-decoration: none;'>
          <br>
          검색어(키워드): ${word }
        </DIV>
      </li>
      <li class="li_none">
        <DIV>
          <c:if test="${file1.trim().length() > 0 }"> <%-- ServletRegister.java: registrationBean.addUrlMappings("/download"); --%>
            첨부 파일: <a href='/download?dir=/car/storage&filename=${file1saved}&downname=${file1}'>${file1}</a> (${size1_label}) 
            <a href='/download?dir=/car/storage&filename=${file1saved}&downname=${file1}'><img src="/car/images/download.png"></a> 
          </c:if>
        </DIV>
      </li>   
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>

