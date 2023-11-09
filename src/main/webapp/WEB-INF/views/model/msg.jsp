<%@ page contentType="text/html; charset=UTF-8" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Add Car</title>
<link rel="shortcut icon" href="/images/honeycar.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <%-- /static/css/style.css --%> 

</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />

<%
String code = (String)request.getAttribute("code");
int cnt = (int)request.getAttribute("cnt");
String name = (String)request.getAttribute("name");
%>
<div class='title_line'>차종 > 알림</div>
<div class='message'>
  <fieldset class='fieldset_basic'>
    <ul>
        <%
        if (code.equals("create_success")) {
        %>
          <li class="li_none">
            <span class="span_success">차종을 등록했습니다.</span><br>
            등록된 차종: <%=name %>
          </li>
          
        <%  
        } else if (code.equals("create_fail")) {
        %>
          <li class="li_none">
            <span class="span_fail">차종 등록에 실패했습니다.</span><br>
            등록 실패된 차종: <%=name %>
          </li>
        <%  
        }else if (code.equals("update_success")) {
        %>
          <li class="li_none">
            <span class="span_success">차종 수정을 성공했습니다.</span><br>
            수정된 차종: <%=name %>
          </li>
        <%  
        } else if (code.equals("update_fail")) {
        %>
          <li class="li_none">
            <span class="span_fail">차종수정에 실패했습니다.</span><br>
            수정 실패된 차종: <%=name %>
          </li>
        <%  
        } else if (code.equals("delete_success")) {
        %>
          <li class="li_none">
            <span class="span_success">차종 삭제를 성공했습니다.</span><br>
            차종명: <%=name %>
          </li>
        <%  
        } else if (code.equals("delete_fail")) {
        %>
          <li class="li_none">
            <span class="span_fail">차종 삭제에 실패했습니다.</span><br>
            삭제 실패된 차종: <%=name %>
          </li>
        <%  
        } 
        %>
        
        <li class="li_none">
          <br>
          <%
          if (cnt == 1) {
          %>
            <button type="button" onclick="location.href='./create.do'" class="btn btn-secondary btn-sm">차종 계속 등록</button>
          <%  
          } else {
          %>
            <button type="button" onclick="history.back()" class="btn btn-secondary btn-sm">다시 시도</button>
          <%  
          }
          %>
          <button type="button" onclick="location.href='./list_all.do'" class="btn btn-secondary btn-sm">전체 목록</button>
        </li>
        
    </ul>
  </fieldset>

</div>

<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>