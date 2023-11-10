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

<title>Q&A&nbsp;|&nbsp;SSB</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet">
<link href="./css/app.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
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
	    <div class="table-responsive">
		  <h3>Q&A 관리</h3>
			<table class="table table-striped table-sm">
			  <colgroup>
				<%-- <col style="width:5%;" /> --%>
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:auto;" />
				<col style="width:10%;" />
			  </colgroup>		
			  <thead>		
			  	<tr style="text-align: center;">
			  	 <th>답변상태</th>
			  	 <th>구분</th>
			  	 <th>제목</th>
			  	 <th>작성자</th>
			  	 <th>등록일</th>
			  	 <th></th>
			  	</tr>
			  </thead>
			  <tbody>
			    <c:forEach var="bdto" items="${inquiryList }">
				  <tr>
				    <td style="text-align: center;">
				     <c:if test="${!empty bdto.answer_state }">
				       <font style="color: red;">${bdto.answer_state }</font>
 				       <%-- <c:out value="${bdto.answer_state }"/> --%>
				     </c:if>
				     <c:if test="${bdto.answer_state == null}">답변예정</c:if>
				    </td>
				    <td style="text-align: center;"><c:out value="${bdto.inquiry_type }"/></td>
					<td style="text-align: center;">${bdto.board_subject }</td>
				    <td style="text-align: center;">${bdto.member_user_id }</td>
					<td style="text-align: center;">${bdto.board_writeTime }</td>
					<td><input type="button" value="관리" class="btn btn-sm btn-primary"
		  		 			onclick="location.href='./InquiryContent.iq?boardId=${bdto.board_id }&pageNum=${pageNum }';">
		  		 	</td>
				  </tr>
			    </c:forEach>
			  </tbody>				
			</table>
	    </div>
	    <div>
		  <input type="button" value="글쓰기" class="btn btn-sm btn-primary" onclick="location.href='./InquiryQWrite.iq';">
	    </div>
	  </div>
	</article>	
			
	<nav aria-label="Page navigation example">
  		<ul class="pagination justify-content-center">
		  <li class="page-item disabled">
		    <c:if test="${startPage > pageBlock }">
      		  <a href="./BoardList.bo?pageNum=${startPage-pageBlock }" class="page-link">Pre</a>
		    </c:if> 
		  </li>
		  <li class="page-item">
		    <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
    		  <a href="./BoardList.bo?pageNum=${i }" class="page-link" href="#">${i }</a>
		    </c:forEach>
		  </li>
		  <li class="page-item">
		    <c:if test="${endPage < pageCount }">
    		  <a href="./BoardList.bo?pageNum=${startPage+pageBlock }" class="page-link">Next</a>
		    </c:if>
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