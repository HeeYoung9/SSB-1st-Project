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
  <div class="wrapper">
	
  <!-- 사이드바 -->
  <nav id="sidebar" class="sidebar js-sidebar">
  	<div class="sidebar-content js-simplebar">
	  <a class="sidebar-brand" href="./AdminMain.ad">
        <span class="align-middle">SSB</span>
      </a>

	  <ul class="sidebar-nav">
		<li class="sidebar-header">
			게시판
		</li>

		<li class="sidebar-item">
			<a class="sidebar-link" href="./NoticeList.bo">
              <i class="align-middle" data-feather=""></i> 
			  <span class="align-middle">공지사항</span>
            </a>
		</li>
		<li class="sidebar-item">
			<a class="sidebar-link" href="index.html">
              <i class="align-middle" data-feather=""></i> 
               <span class="align-middle">Q&A</span>
            </a>
		</li>				

		<li class="sidebar-header">
		</li>

		<li class="sidebar-item">
			<a class="sidebar-link" href="index.html">
              <i class="align-middle" data-feather=""></i> 
              <span class="align-middle">회원관리</span>
           	</a>
		</li>
		<li class="sidebar-item">
			<a class="sidebar-link" href="index.html">
              <i class="align-middle" data-feather=""></i> 
              <span class="align-middle">주문관리</span>
            </a>
		</li>
		<li class="sidebar-item">
			<a class="sidebar-link" href="index.html">
              <i class="align-middle" data-feather=""></i> 
              <span class="align-middle">상품관리</span>
            </a>
		</li>
					
	  </ul>
  	</div>
  </nav>
  <!-- 사이드바 -->
		
  <!-- 메인 -->
  <div class="main">
	<header class="navbar navbar-expand navbar-light navbar-bg">
		<a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>
        </a>
		<c:if test="${sessionScope.adminId == null }">
    		<a href="./AdminLogin.ad">
			  <img class="log-button" alt="login" src="./img/icons/login.png" width="25" height="25">
 			</a>    
		</c:if>
		<c:if test="${sessionScope.adminId != null }">
    		<a href="./AdminLogout.ad">
			  <img class="log-button" alt="logout" src="./img/icons/logout.png" width="25" height="25">
 			</a>   
    	</c:if>	
	</header>

  <!-- 게시판 -->
  <main class="content">
	<div class="container-fluid p-0">

	</div>
  </main>
  <!-- 게시판 -->

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