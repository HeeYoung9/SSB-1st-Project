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
<form action="./Order.bo" method="post">
		<!-- 烙矫林家 -->
		<table border="1px solid black">
			<tr>
				<td>力前疙</td>
				<td>可记疙</td>
				<td>可记蔼</td>
				<td>厘官备聪 荐樊</td>
				<td>力前啊拜</td>
			</tr>
			<c:forEach var="dto" items="${dtoArray }">
				<tr>
					<td>${dto.item_name }</td>
					<td>${dto.options_name }</td>
					<td>${dto.options_value }</td>
					<td>${dto.cart_quantity }</td>
					<td>${dto.options_price * dto.cart_quantity}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="林巩">
	</form>
</body>
</html>