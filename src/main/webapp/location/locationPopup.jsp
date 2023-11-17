<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="./location/locationPopup.js"></script>
<script type="text/javascript" src="./Mcommon/util.js"></script>
<link rel="stylesheet" href="./location/locationPopup.css">

<!-- �ĺ��� -->
<link rel="shortcut icon" href="./main/img/favicon.ico">
</head>
<body>
	<main>
		<div class="insertPopup">
			<h1>배송지 변경</h1>
			<input type="button" value="배송지 추가(팝업)" onclick="insertPopup(-1)">
		</div>
		<c:forEach var="dto" items="${dtoArray }">
			<div class="locationItem">
				<div class="locationItemTitle"><!-- 배송지명 -->
					${dto.location_name} ${dto.location_title}
				</div>
				<div class="locationItemContent"><!-- 정보 -->
					${dto.location_phone.substring(0,3)}-${dto.location_phone.substring(3,7)}-${dto.location_phone.substring(7,11)}<br>
					(${dto.location_postcode}) ${dto.location_add}
				</div>
				<div class="locationItemButton"><!-- 버튼 -->
					<input type="button" value="배송지 수정(팝업)" onclick="updatePopup('${dto.location_id}')">
					<input type="button" value="배송지 삭제(팝업)" onclick="deletePopup('${dto.location_id}')">
					<input class="select" type="button" value="선택" onclick="selectPopup('${dto.location_id}')">
				</div>
			</div>
		</c:forEach>
	</main>
</body>
</html>