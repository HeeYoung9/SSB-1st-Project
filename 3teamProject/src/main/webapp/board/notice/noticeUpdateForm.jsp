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

<title>공지사항&nbsp;|&nbsp;SSB</title>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet">
<link href="./css/app.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

<!-- Bootstrap CSS -->
</head>
<body>
  <div class="wrapper">
	
  <!-- 사이드바 -->
  <jsp:include page="../inc/sidebar.jsp"/>
  <!-- 사이드바 -->
		
  <!-- 메인 -->
  <div class="main">		
  <jsp:include page="../inc/top.jsp"/>

  <!-- 게시판 -->
  <main class="content">
	<article>
		<div class="container" role="main">
			<h3>공지사항 수정</h3>

			<form action="./NoticeUpdateProAction.no?pageNum=${pageNum }" method="post">
			<!-- 폼태그 안의 데이터는 DB로 전달 -->
			<!-- 제목 중복 가능하므로 글번호로 구분해야함 -->
			<input type="hidden" name="boardId" value="${bdto.board_id }">
				<div class="mb-3">
					<label for="subject">제목</label>
					<input type="text" class="form-control" name="subject" id="subject" value="${bdto.board_subject }">
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="20" name="content" id="content"><c:out value="${bdto.board_content}"/></textarea>
				</div>
					
				<div>
					<input type="submit" value="수정" class="btn btn-sm btn-primary" id="btnSave">
	 				<!--<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>-->					
	 			</div>
			</form>					
		</div>
	</article>
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
  <script src="./js/app.js"></script>
</body>
</html>