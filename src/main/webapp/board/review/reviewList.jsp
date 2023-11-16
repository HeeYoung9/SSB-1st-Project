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

<title>Review&nbsp;|&nbsp;SSB</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet">
<link href="./css/app.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

<!-- 파비콘 -->
<link rel="shortcut icon" href="./favicon/favicon.ico">
</head>

<script type="text/javascript">
function openPop(){
	var popup = window.open('./ReviewWrite.rv', '리뷰팝업', 'width=550px,height=750px,scrollbars=yes');
}
</script>
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
	
  <!-- 사이드바 -->
  <jsp:include page="../inc/sidebar.jsp"/>
		
  <!-- 메인 -->
  <div class="main">		
	<jsp:include page="../inc/top.jsp"/>

  <!-- 게시판 -->
  <main class="content">
    <article>
	  <div class="container" role="main">
	    <div>
		  <button type="button" class="btn btn-sm btn-primary"
		  		 onclick="openPop()">리뷰</button>
	    </div>
	  </div>
    </article>	
			
	<nav aria-label="Page navigation example">
  		<ul class="pagination justify-content-center">
		  
  		</ul>
	</nav>
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  <script src="./js/app.js"></script>
</body>
</html>