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

</head>
<body>
<c:import url="/menu/top.do" />

<div class='title_line'>차종 등록</div>

<form name='frm' method='post' action='/model/create.do'>
  <div>
    <label>차종 이름</label>
    <input type="text" name="name" value="" required="required" autofocus="autofocus" class="form-control" style="width:50%">
  </div>
  <div class="content_body_bottom">
    <button type="submit" class="btn btn-secondary">등록</button>
    <button type="button" class="btn btn-secondary">목록</button>
  </div>
</form> 

<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>