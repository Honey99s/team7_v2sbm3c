<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9093/</title>
<link rel="shortcut icon" href="/images/honeycar.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
 

<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 14px;}
</style>
</head>
<body>
<c:import url="/menu/top.do" />

<div style="width: 70%; margin: 30px auto;">
  <img src="/images/home.jpg" style="width: 100%;">
</div>

<c:choose>
     <c:when test="${sessionScope.id != null }">
       <div class='title_line'>
          ${customerVO.cname }님을 위한 추천 차종
       </div>
       <c:import url="/car/list_recommend_by_modelno.do" /> <%-- http://localhost:9093/car/list_recommend_by_modelno.do  --%>
         <DIV style='width: 100%; margin: 0px auto;'>
         </DIV>
     </c:when>
     <c:otherwise>
          <c:import url="/car/list_recommend_by_rdate.do"/>
          <DIV style='width: 100%; margin: 0px auto;'>
          </DIV>
     </c:otherwise>
   </c:choose>
   
  
<jsp:include page="./menu/bottom.jsp" flush='false' /> 
</body>
</html>