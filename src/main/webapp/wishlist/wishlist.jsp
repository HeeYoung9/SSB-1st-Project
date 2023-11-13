<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="./wishlist/wishlist.js"></script>
<link rel="stylesheet" href="./location/location.css">
</head>
<body>
	<header>
		<jsp:include page="../Mcommon/top.jsp" />
	</header>
	<main>
	<div class="wishlist" value="7">
		<img src="" alt="위시리스트">
	</div>
	<div class="wishlist" value="8">
		<img src="" alt="위시리스트">
	</div>
	<div class="wishlist" value="9">
		<img src="" alt="위시리스트">
	</div>
	<div class="wishlist" value="10">
		<img src="" alt="위시리스트">
	</div>
	<div class="wishlist" value="11">
		<img src="" alt="위시리스트">
	</div>
		<table class="table">
			<colgroup>
				<col width="30%">
				<col width="30%">
				<col width="30%">
			</colgroup>
			<thead class="thead">
				<tr>
					<th>위시리스트ID</th>
					<th>제품ID</th>
					<th>회원ID</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<c:forEach var="dto" items="${dtoArray }">
					<tr>
						<td><input type="radio" name="location_id" value="${dto.location_id}"></td>
						<td>${dto.wishlit_id}</td>
						<td>${dto.item_id}</td>
						<td>${dto.member_id}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="moveButton">
		
		</div>
	</main>
	<footer> </footer>
</body>
</html>