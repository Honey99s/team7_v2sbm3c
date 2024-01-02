<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>HoneyCar</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<c:import url="/menu/top.do" />
  <DIV class="title_line">
    등록된 모든 댓글
  </DIV>
  <ASIDE class='aside_right'>
    <A href='./list.do'>모든 댓글</A>
    <span class='menu_divide' >│</span> 
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE>
   
  <div class='menu_line'></div>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 43%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 7%;"></col>
        
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
<<<<<<< HEAD
          <th style='text-align: center;'>댓글<br>번호</th>
          <th style='text-align: center;'>차<br>번호</th>
          <th style='text-align: center;'>회원<br> ID</th>
=======
          <th style='text-align: center;'>댓글 번호</th>
          <th style='text-align: center;'>차 번호</th>
          <th style='text-align: center;'>회원 ID</th>
>>>>>>> 8bb6fcc2fb61f13d799e03eebfc98900b0918c21
          <th style='text-align: center;'>내용</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="replyCustomerVO" items="${list }">
          <c:set var="replyno" value="${replyCustomerVO.replyno }" />
          <c:set var="carno" value="${replyCustomerVO.carno }" />
          <c:set var="customerno" value="${replyCustomerVO.customerno }" />
          <c:set var="id" value="${replyCustomerVO.id }" />
          <c:set var="content" value="${replyCustomerVO.content }" />
          <c:set var="rdate" value="${replyCustomerVO.rdate }" />
          
          <tr style='height: 50px;'> 
            <td style='text-align: center; vertical-align: middle;'>
              ${replyno }
            </td> 
            <td style='text-align: center; vertical-align: middle;'>
              <A href='../car/read.do?carno=${carno }'>${carno}</A>
            </td>
            <td style='text-align: center; vertical-align: middle;'>
              <A href='../customer/read.do?customerno=${customerno }'>${id}</A>
            </td>
            <td style='text-align: left; vertical-align: middle;'>${content}</td>
            <td style='text-align: center; vertical-align: middle;'>
              ${rdate.substring(0, 10)}
            </td>
            <td style='text-align: center; vertical-align: middle;'>
              <a href="./delete.do?replyno=${replyno}"><img src="/reply/images/delete.png" title="삭제"  border='0' /></a>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>