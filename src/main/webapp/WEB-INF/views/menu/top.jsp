<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
  .top_menu_link:link{  /* 방문전 상태 */
    text-decoration: none; /* 밑줄 삭제 */
    color: #000000;
    font-weight: bold;
  }

  .top_menu_link:visited{  /* 방문후 상태 */
    text-decoration: none; /* 밑줄 삭제 */
    color: #000000;
    font-weight: bold;
  }

  .top_menu_link:hover{  /* A 태그에 마우스가 올라간 상태 */
    text-decoration: none; /* 밑줄 출력 */
    color: #000000;
    font-size: 1.05em;
  }
</style> 

<div class='container_main'>
  <div class='top_img'>
      <div class="top_menu_label">HoneyCar 중고차 추천 사이트</div>
      </div>
      
      
 <nav class="navbar navbar-expand-md navbar-dark bg-danger">
      <a class="navbar-brand" href="/">HoneyCar Home</a><a style='display: block; color: #FFFFFF; padding-left: 5px;'></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle Navigation">
        <span class="navbar-toggler-icon"></span>
      </button>    

      <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <%-- 게시판 목록 출력 --%>
            <c:forEach var="modelVO" items="${list_top}">
              <c:set var="modelno" value="${modelVO.modelno }" />
              <c:set var="name" value="${modelVO.name }" />
              <li class="nav-item"> <%-- 서브 메뉴가 없는 독립메뉴 --%>
                <a class="nav-link top_menu_link" href="/car/list_by_modelno.do?modelno=${modelVO.modelno }&now_page=1">${modelVO.name }</a> 
              </li>
            </c:forEach>
            
            <li class="nav-item"> <%-- 서브 메뉴가 없는 독립메뉴 --%>
              <a class="nav-link top_menu_link" href="/car/list_all.do">전체 글 목록</a>
            </li>

            <li class="nav-item dropdown"> <%-- 고객서브 메뉴 --%>
              <a class="nav-link top_menu_link dropdown-toggle" data-bs-toggle="dropdown" href="#">회원</a>
              <div class="dropdown-menu">
                <c:choose>
                  <c:when test="${sessionScope.id == null }">
                    <a class="dropdown-item" href="/customer/create.do">회원가입</a>
                    <a class="dropdown-item" href="#">아이디 찾기</a>
                    <a class="dropdown-item" href="#">비밀번호 찾기</a>
                  </c:when>
                  <c:otherwise>
<<<<<<< HEAD
                    <a class="dropdown-item" href="http://43.202.225.181:8000/ais/recommend_form/?customerno=${sessionScope.customerno }">관심분야 등록하고 추천받기</a>
                    <a class="dropdown-item" href="http://13.124.141.127:5000/chatbot?customerno=${sessionScope.customerno }">챗봇</a>
                    
=======
                    <a class="dropdown-item" href="http://localhost:8000/ais/recommend_form/?customerno=${sessionScope.customerno }">관심분야 등록하고 추천받기</a>
                    <a class="dropdown-item" href="http://localhost:5000/chatbot">챗봇</a>
>>>>>>> dae5fd58abaa4171eaa777e0cb83f126ef074010
                    <a class="dropdown-item" href="/customer/read.do">고객정보 수정</a>
                    <a class="dropdown-item" href="/customer/passwd_update.do">비밀번호 변경</a>
                    <a class="dropdown-item" href="/sms/form.do">로그인 내역</a>
                     <a class="dropdown-item" href="/condition/create.do">조건 등록</a>
                     <a class="dropdown-item" href="/condition/list_all.do">조건 전체 목록</a>
                     <a class="dropdown-item" href="/qna/list_all.do">문의사항</a>
                     <a class="dropdown-item" href="#">고객탈퇴</a>
                  </c:otherwise>
                </c:choose>    
              </div>
            </li>
          
            <c:choose>
              <c:when test="${sessionScope.master_id == null }">
                <li class="nav-item">
                  <a class="nav-link top_menu_link" href="/master/login.do">마스터 로그인</a>
                </li>
              </c:when>
              <c:otherwise>
                <li class="nav-item dropdown"> <%-- 마스터 서브 메뉴 --%>
                  <a class="nav-link top_menu_link dropdown-toggle" data-bs-toggle="dropdown" href="#">마스터</a>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href='/model/list_all.do'>차종 전체 목록</a>
                    <a class="dropdown-item" href='/customer/list.do'>고객목록</a>
                    <a class="dropdown-item" href='/recommend/list_all.do'>추천 목록</a>
                    <a class="dropdown-item" href='/good/list_all.do'>좋아요 목록</a>
                    <a class="dropdown-item" href='/master/logout.do'>마스터 ${sessionScope.master_id } 로그아웃</a>
                  </div>
                </li>
              </c:otherwise>
            </c:choose>
            
            <li class="nav-item"> <%-- 서브 메뉴가 없는 독립메뉴 --%>
              <c:choose>
                  <c:when test="${sessionScope.id == null}">
                      <a class="nav-link top_menu_link" href="/customer/login.do">로그인</a>
                  </c:when>
                  <c:otherwise>
                      <a class="nav-link top_menu_link" href='/customer/logout.do'>${sessionScope.id } 로그아웃</a>
                  </c:otherwise>
              </c:choose>
            </li>     
          </ul>
      </div>    
  </nav>
    

  <div class='content_body'> <!--  내용 시작 -->  