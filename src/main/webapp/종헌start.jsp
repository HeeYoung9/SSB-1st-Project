<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>start.jsp</h1>

	MVC 프로젝트의 시작지점
	
	<input type="button" value="장바구니" onclick="location.href='./cartList.ca?member_id=1'">
	<input type="button" value="배송지" onclick="location.href='./location.lo?member_id=1'">
	<input type="button" value="위시리스트" onclick="location.href='./wishlist.wl?member_id=1'">
</body>
</html>