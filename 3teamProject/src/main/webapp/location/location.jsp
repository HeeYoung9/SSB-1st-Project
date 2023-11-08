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
			<th>�����ID</th>
			<th>�������̸�</th>
			<th>��������ȭ��ȣ</th>
			<th>����������ȣ</th>
			<th>�ּ�</th>
			<th>���ּ�</th>
			<th>������̸�</th>
			<th>��ۿ�û����</th>
			<th>ȸ����ȣ(hidden,�ܷ�Ű)</th>
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
	<input type="button" value="����" onclick="deleteCart()">
	<input type="submit" value="�ֹ�" onclick="arrayData()">
</body>
</html>