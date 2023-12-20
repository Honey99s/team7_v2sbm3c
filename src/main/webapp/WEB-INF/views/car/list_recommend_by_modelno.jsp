<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 
  
  <div style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
    <c:forEach var="carVO" items="${list_recommend_by_modelno }" varStatus="status">
      <c:set var="title" value="${carVO.title.trim() }" />
      <c:set var="content" value="${carVO.content.trim() }" />
      <c:set var="modelno" value="${carVO.modelno }" />
      <c:set var="carno" value="${carVO.carno }" />
      <c:set var="thumb1" value="${carVO.thumb1 }" />
      <c:set var="size1" value="${carVO.size1 }" />
      
        
      <!-- 4기준 하나의 이미지, 24 * 4 = 96% -->
      <!-- 5기준 하나의 이미지, 19.2 * 5 = 96% -->
      <!-- 6기준 하나의 이미지, 16 * 6 = 96% -->
      <div onclick="location.href='/car/read.do?carno=${carno }&word=${param.word }&now_page=${param.now_page == null ? 1 : param.now_page }'" class='hover'  
             style='width: 15%; height: 168px; float: left; margin: 0.5%; padding: 0.1%; background-color: #EEEFFF; text-align: left; cursor: pointer;'>
        
        <c:choose> 
          <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <%-- 이미지인지 검사 --%>
            <%-- registry.addResourceHandler("/car/storage/**").addResourceLocations("file:///" +  Contents.getUploadDir()); --%>
            <img src="/car/storage/${thumb1 }" style="width: 100%; height: 140px;">
          </c:when>
          <c:otherwise> <!-- 이미지가 없는 경우 기본 이미지 출력: /static/car/images/none1.png -->
            <IMG src="/car/images/none1.png" style="width: 100%; height: 140px;">
          </c:otherwise>
        </c:choose>
        
        <strong>
          <span style="font-size: 0.8em;">
            <c:choose>
              <c:when test="${title.length() > 20 }"> <%-- 20 이상이면 20자만 출력, 공백:  6자 --%>
                ${title.substring(0, 20)}...
              </c:when>
              <c:when test="${title.length() <= 20 }">
                ${title}
              </c:when>
            </c:choose>
          </span>
        </strong>
        <br>
       
      </div>
     
    </c:forEach>
  </div>
  
