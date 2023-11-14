<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="./location/locationPopup.js"></script>
<link rel="stylesheet" href="./location/locationPopup.css">
</head>
<body>
	<main>
		<div class="insertPopup">
			<h1>����� ����</h1>
			<input type="button" value="����� �߰�(�˾�)" onclick="insertPopup(1,-1)">
		</div>
		<c:forEach var="dto" items="${dtoArray }">
			<div class="locationItem">
				<div class="locationItemTitle"><!-- ������� -->
					${dto.location_name} ${dto.location_title}
				</div>
				<div class="locationItemContent"><!-- ���� -->
					${dto.location_phone.substring(0,3)}-${dto.location_phone.substring(3,7)}-${dto.location_phone.substring(7,11)}<br>
					(${dto.location_postcode}) ${dto.location_add}
				</div>
				<div class="locationItemButton"><!-- ��ư -->
					<input type="button" value="����� ����(�˾�)" onclick="updatePopup('${dto.member_id}','${dto.location_id}')">
					<input type="button" value="����� ����(�˾�)" onclick="updatePopup('${dto.member_id}','${dto.location_id}')">
					<input class="select" type="button" value="����" onclick="">
				</div>
			</div>
		</c:forEach>
	</main>
</body>
</html>