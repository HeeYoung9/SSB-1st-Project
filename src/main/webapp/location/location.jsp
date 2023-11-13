<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="./location/location.js"></script>
<link rel="stylesheet" href="./location/location.css">
</head>
<body>
	<header>
		<jsp:include page="../Mcommon/top.jsp" />
	</header>
	<main>
		<table class="table">
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="10%">
				<col width="5%">
				<col width="20%">
				<col width="20%">
				<col width="10%">
				<col width="20%">
			</colgroup>
			<thead class="thead">
				<tr>
					<th>배송지ID</th>
					<th>수취인이름</th>
					<th>수취인전화번호</th>
					<th>배송지우편번호</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>배송지이름</th>
					<th>배송요청사항</th>
				</tr>
			</thead>
			<tbody class="tbody">
				<c:forEach var="dto" items="${dtoArray }">
					<tr>
						<td><input type="radio" name="location_id" value="${dto.location_id}"></td>
						<td>${dto.location_name}</td>
						<td>${dto.location_phone}</td>
						<td>${dto.location_postcode}</td>
						<td>${dto.location_add}</td>
						<td>${dto.locationD_add}</td>
						<td>${dto.location_title}</td>
						<td>${dto.location_requested}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="moveButton">
			<input type="hidden" value="${dtoArray[0].member_id}" id="member_id">
			<input type="button" value="배송지 추가" onclick="location.href='./locationInsert.lo?location_id=-1&member_id=1'">
			<input type="button" value="배송지 수정" onclick="selectLocation('locationInsert.lo')">
			<input type="button" value="배송지 삭제" onclick="selectLocation('deleteLocation.lo')">
		</div>
	</main>
	<footer>
		
	</footer>
</body>
</html>