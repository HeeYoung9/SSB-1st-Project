<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="img/icons/icon-48x48.png" />
<link rel="canonical" href="https://demo-basic.adminkit.io/" />

<title>SSB 관리자 페이지</title>

<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet">
<link href="css/app.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	
</head>
<body>
  <!-- 
	  로그인을 수행한 관리자만 접근 가능 
	  로그인 없이 접근한 경우 로그인페이지로 이동
   -->
  <%-- <c:if test="${id == null }"> --%>
  <c:if test="${empty userId }">
	<c:redirect url="./AdminLogin.ad"/>  	
  </c:if>

  <div class="wrapper">
	
  <!-- 사이드바 시작 -->
  <nav id="sidebar" class="sidebar js-sidebar">
  	<div class="sidebar-content js-simplebar">
	  <a class="sidebar-brand" href="./AdminMain.ad">
        <span class="align-middle">SSB</span>
      </a>

	  <ul class="sidebar-nav">
		<li class="sidebar-header">
			게시판 관리
		</li>

		<li class="sidebar-item">
			<a class="sidebar-link" href="./NoticeList.no">
              <i class="align-middle" data-feather=""></i> 
			  <span class="align-middle">공지사항</span>
            </a>
		</li>
		<li class="sidebar-item">
			<a class="sidebar-link" href="./InquiryList.iq">
              <i class="align-middle" data-feather=""></i> 
               <span class="align-middle">Q&A</span>
            </a>
		</li>				

		<li class="sidebar-header">
		</li>

		<li class="sidebar-item">
			<a class="sidebar-link" href="./AdMemberList.me">
              <i class="align-middle" data-feather=""></i> 
              <span class="align-middle">회원관리</span>
           	</a>
		</li>
		<li class="sidebar-item">
			<a class="sidebar-link" href="#">
              <i class="align-middle" data-feather=""></i> 
              <span class="align-middle">주문관리</span>
            </a>
		</li>
		<li class="sidebar-item">
			<a class="sidebar-link" href="./ItemMgt.it">
              <i class="align-middle" data-feather=""></i> 
              <span class="align-middle">상품관리</span>
            </a>
		</li>
					
	  </ul>
  	</div>
  </nav>
  <!-- 사이드바 끝 -->
		
  <!-- 메인 시작 -->
  <div class="main">
	<header class="navbar navbar-expand navbar-light navbar-bg">
		<a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>
        </a>       
    		<a href="./Main.in">
			  <img class="home" alt="home" src="./adImg/icons/home.png" width="22" height="22">
 			</a>    
		<c:if test="${sessionScope.userId == null }">
    		<a href="./AdminLogin.ad">
			  <img class="log-button" alt="login" src="./adImg/icons/login.png" width="25" height="25">
 			</a>    
		</c:if>
		<c:if test="${sessionScope.userId != null }">
    		<a href="./AdminLogout.ad">
			  <img class="log-button" alt="logout" src="./adImg/icons/logout.png" width="25" height="25">
 			</a>   
    	</c:if>	
	</header>

  	<!-- 본문 시작 -->
  	<main class="content">
	  <div class="container-fluid p-0">

	  </div>
    </main>
    <!-- 본문 시작 -->

    <!-- 푸터 들어가는 곳 -->
    <footer class="footer">
	  <div class="container-fluid">
		
	  </div>
    </footer>
    <!-- 푸터 들어가는 곳 -->		
  	
  </div>
  <!-- 메인 -->	
  	
  </div>
  <script src="js/app.js"></script>
</body>
</html>