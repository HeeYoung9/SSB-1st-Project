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
		<!-- �ӽ��ּ� -->
		<table border="1px solid black">
			<tr>
				<td>��ǰ��</td>
				<td>�ɼǸ�</td>
				<td>�ɼǰ�</td>
				<td>��ٱ��� ����</td>
				<td>��ǰ����</td>
			</tr>
			<c:forEach var="dto" items="${dtoArray }">
				<tr>
					<td>${dto.item_name }</td>
					<td>${dto.item_options_name }</td>
					<td>${dto.item_options_value }</td>
					<td>${dto.cart_quantity }</td>
					<td>${dto.item_price * dto.cart_quantity}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="�ֹ�">
	</form>
</body>
</html>