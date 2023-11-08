<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1px solid black">
		<tr>
			<th>배송지ID</th>
			<th>수취인이름</th>
			<th>수취인전화번호</th>
			<th>배송지우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>배송지이름</th>
			<th>배송요청사항</th>
			<th>회원번호(hidden,외래키)</th>
		</tr>
		<c:forEach var="dto" items="${dtoArray }">
			<tr>
				<td>${dto.location_id}</td>
				<td>${dto.location_name}</td>
				<td>${dto.location_phone}</td>
				<td>${dto.location_postcode}</td>
				<td>${dto.location_add}</td>
				<td>${dto.locationD_add}</td>
				<td>${dto.location_title}</td>
				<td>${dto.location_requested}</td>
				<td>${dto.member_id}</td>
			</tr>
		</c:forEach>
	</table>
	<input type="hidden" id="checkArray" name="checkArray">
	<input type="button" value="삭제" onclick="deleteCart()">
	<input type="submit" value="주문" onclick="arrayData()">
</body>
</html>