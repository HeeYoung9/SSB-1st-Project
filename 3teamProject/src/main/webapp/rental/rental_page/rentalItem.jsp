<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<!-- header js 코드 영역 접어둠. -->
<script type="text/javascript">
	function toggleCategory() {
		var categoryContent = document.querySelector('.category-content');
		var brandContent = document.querySelector('.brand-content');

		categoryContent.style.display = 'block';
		brandContent.style.display = 'none';
	}

	function toggleBrand() {
		var categoryContent = document.querySelector('.category-content');
		var brandContent = document.querySelector('.brand-content');

		categoryContent.style.display = 'none';
		brandContent.style.display = 'block';
	}
</script>

<!-- 상단 메뉴바 오픈 및 영역 확장 js코드 접어둠 -->
<script>
	document.addEventListener("DOMContentLoaded", function() {

		const submenus = document.querySelectorAll(".menu .submenu");
		const submenuContents = document.querySelectorAll(".submenu-content");

		submenus.forEach(function(submenu, index) {
			const submenuContent = submenuContents[index];

			// 메뉴 항목을 호버할 때
			submenu.addEventListener("mouseover", function() {
				// 해당 메뉴 항목의 하위 메뉴가 표시되면 메뉴의 높이를 조절
				submenuContent.style.display = "block";
				submenu.style.height = submenuContent.clientHeight + "px";
			});

			// 메뉴 항목에서 마우스가 나갈 때
			submenu.addEventListener("mouseout", function() {
				// 해당 메뉴 항목의 하위 메뉴가 숨겨지면 메뉴의 높이를 원래대로 복원
				submenuContent.style.display = "none";
				submenu.style.height = "auto";
			});
		});
	});
</script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Rentalitem.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link href="./rental/rental_css/rentalItem.css" rel="stylesheet">

</head>
<body>
<!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->
	<div class="header">
	<jsp:include page="../Rcommon/top.jsp" />
	</div>
<!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->
	
	
	
	<!-- 전달정보 저장 -->
	

	<section class="subscript">
		<div class="product-container">
			<div class="product-image">
				<img src="./main/rental_item/${rdto.rental_img_main }" alt="제품 이미지">
			</div>
			<div class="product-details">
				<h1>${rdto.rental_item_name }</h1>
				<h2>${rdto.rental_opt_value }</h2>
				<p><fmt:formatNumber value="${rdto.rental_item_price }" />원</p>
				<p>리뷰 별점: 4.5/5</p>
				<button class="reserve-button">예약하기</button>
			</div>
		</div>
		<div class="product-description">
			<h2>상품 상세 이미지</h2>
			<img src="./main/rental_item/${rdto.rental_item_sub }" alt="상품 상세 이미지">
		</div>
		<div class="reviews">
			<h2>리뷰 게시판</h2>
			<!-- 리뷰 게시판 내용을 여기에 추가 -->
		</div>
		<div class="questions">
			<h2>문의 게시판</h2>
			<!-- 문의 게시판 내용을 여기에 추가 -->
		</div>
	</section>
	
	<nav class="top">
		<a href="#">↑TOP</a>
	</nav>







</body>
</html>