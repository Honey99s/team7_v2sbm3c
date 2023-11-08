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
  *{ font-family: Malgun Gothic; font-size: 15px;}
</style>
</head>
<body>
<c:import url="/menu/top.do" />

<div style="width: 70%; margin: 30px auto;">
  <img src="/images/home.jpg" style="width: 100%;">
</div>
  
<jsp:include page="./menu/bottom.jsp" flush='false' /> 
</body>
</html>