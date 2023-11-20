<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항&nbsp;|&nbsp;SSB</title>
<!----------- Bootstrap CSS ----------->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<!------------ common CSS ------------->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/adItem/css/itemD.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/Mcommon/top.css"> --%>
<!-------------- jQuery --------------->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<!------------- 공통 헤더 ------------->
<div class="header">
	<c:import url="../Mcommon/top.jsp" charEncoding="UTF-8" />
</div>

<!-- 파비콘 -->
<link rel="shortcut icon" href="./main/img/favicon.ico">
</head>
<body>
	<main style="width: 1500px;">
		<section>
			<form class="item_container" id="one" style="margin-bottom: 40px;">
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 10%" />
						<col style="width: 70%" />
						<col style="width: 20%" />
					</colgroup>
				<thead>
				<tr style="text-align: center;">
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="bdto" items="${noticeList }" varStatus="status">
					  <tr style="text-align: center;">
						<td>${status.count }</td>
						<td>${bdto.board_subject }</td>
						<td>${bdto.board_writeTime }</td>
					  </tr>
					</c:forEach>
				</tbody>
				</table>
			</form>

		 	<nav aria-label="Page navigation example">
  		   	<ul class="pagination pagination-sm justify-content-center">
    	     <c:if test="${startPage > pageBlock }">
    	      <li class="page-item">
      		   <a class="page-link" href="" aria-label="Previous">
        		<span aria-hidden="true">&laquo;</span>
      		   </a>
    	      </li>
      		 </c:if>  
    	     <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
    	      <li class="page-item">
    	        <a class="page-link" href="">${i }</a>
    	      </li>
			 </c:forEach>
    	     <c:if test="${endPage < pageCount }">
    	      <li class="page-item">
    	       <a class="page-link" href="" aria-label="Next">
    	         <span aria-hidden="true">&raquo;</span>
    	       </a>
    	      </li>
    	     </c:if> 
  		   	</ul>
		 	</nav>
		</section>
	</main>

	<footer>
		<div class="last"></div>
	</footer>



	<script src="../adItem/js/itemD.js"></script>

</body>
</html>