<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dev.mvc.model.ModelVO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>http://localhost:9093/model/update.do?modelno=2</title>
<link rel="shortcut icon" href="/images/honeycar.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
  
</head>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<div class='title_line'>차종 수정</div>

<%
ModelVO modelVO = (ModelVO)request.getAttribute("modelVO");
int modelno = modelVO.getModelno();
%>
  
<form name='frm' method='post' action='/model/update.do'>
  <input type='hidden' name='modelno' value='<%=modelno %>'>
  <div>
    <label>차종명</label>
    <input type="text" name="name" value="<%=modelVO.getName() %>" required="required" autofocus="autofocus" 
               class="form-control form-control-sm" style="width: 50%">
  </div>

  <div style="margin-top: 20px;">
    <label>글수</label>
    <input type="text" name="cnt" value="<%=modelVO.getCnt() %>" required="required" autofocus="autofocus" 
               class="form-control form-control-sm" style="width: 50%">
  </div>
  
  <div class="content_body_bottom">
    <button type="submit" class="btn btn-secondary btn-sm">저장</button>
    <button type="button" onclick="history.back();" class="btn btn-secondary btn-sm">취소</button> 
  </div>
</form>

<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>

