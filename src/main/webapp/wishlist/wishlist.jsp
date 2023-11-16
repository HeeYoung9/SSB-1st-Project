<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="./wishlist/wishlist.js"></script>
<script type="text/javascript" src="./wishlist/wishlistPage.js"></script>
<link rel="stylesheet" href="./location/location.css">
</head>
<body>
	<header>
		<jsp:include page="../Mcommon/top.jsp" />
	</header>
	<main>
		<div class="wishlist" value="7">
			<img src="위시리스트이미지" alt="위시리스트">
		</div>
		<div class="wishlist" value="8">
			<img src="위시리스트이미지" alt="위시리스트">
		</div>
		<div class="wishlist" value="9">
			<img src="위시리스트이미지" alt="위시리스트">
		</div>
		<div class="wishlist" value="10">
			<img src="위시리스트이미지" alt="위시리스트">
		</div>
		<table class="table">
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="20%">
				<col width="30%">
				<col width="10%">
			</colgroup>
			<thead class="thead">
				<tr>
					<th><input type="checkbox" id="checkAll"></th>
					<th>제품ID</th>
					<th>제품이름</th>
					<th>제품이미지</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<c:forEach var="dto" items="${dtoArray}">
					<tr>
						<td><input type="checkbox" name="wishlist_id" value="${dto.item_id}"></td>
						<td>${dto.item_id}</td>
						<td>${dto.item_name}</td>
						<td>${dto.item_img_main}</td>
						<td>${dto.item_price}원</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="moveButton">
			<input type="hidden" id="checkArray" name="checkArray">
			<input type="button" value="삭제" onclick="deleteWishlist()">
		</div>
	</main>
	<footer> </footer>
</body>
</html>