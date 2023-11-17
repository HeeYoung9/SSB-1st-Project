<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

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

<!-- 상단 메뉴바 오픈 및 영역 확장 -->
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
<title>SSB Layout</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link href="./main/main_css/main.css" rel="stylesheet">

<style>
.coupon-select {
	width: 100%;
	padding: 20px;
	margin-bottom: 20px;
	text-align: left;
}

textarea, select {
	width: 100%;
	padding: 15px;
	border: 1px solid #ddd;
	border-radius: 6px;
	box-sizing: border-box;
	margin-top: 8px;
	margin-bottom: 16px;
	font-size: 16px;
}
</style>

<!-- 파비콘 -->
<link rel="shortcut icon" href="./main/img/favicon.ico">

</head>

<body>

	<!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->
	<div class="header">
		<jsp:include page="../Mcommon/top.jsp" />
	</div>
	<!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->



	<!-- section 시작 -->

	<section class="section" style="margin: 5%;">

		<!-- 본인 페이지에 맞게 수정하려면 여기 아래서부터 삭제하고, 새로 만들면 됩니다. 혹시 문제 생기면 섹션까지 삭제 해보는거 추천!!!!-->

		<!-- left-container 시작 -->
		<div class="left-container" style="margin: 15%; width: 70%;">
			<div class="col-md-7 col-lg-8">
				<h4 class="mb-3">주문서</h4>
				<hr>
				<h4 class="mb-3">구매 희망 상품</h4>

				<form action="./OrderSalePay.od" method="post">

					<table class="table table-dark table-striped">
						<thead>
							<tr>
								<th scope="col">상품번호</th>
								<th scope="col">상품명</th>
								<th scope="col">가격</th>
								<th scope="col">수량</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${requestScope.cartList}">
								<tr>
									<td>${item.item_id}</td>
									<td>${item.item_name }</td>
									<td>호우</td>
									<td>${item.cart_quantity}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>


					<hr class="my-4">



					<h4 class="mb-3">쿠폰</h4>
					<div class="coupon-select">
						<label for="coupon">쿠폰 선택:</label> <select id="coupon"
							name="coupon">
							<option value="coupon1">쿠폰 1</option>
							<option value="coupon2">쿠폰 2</option>
							<!-- 추가 쿠폰 옵션 -->
						</select>
					</div>

					<h4 class="mb-3">배송지</h4>
					<select class="form-select form-select-lg mb-3"
						aria-label="Large select example" name="location_id">
						<c:forEach var="item" items="${requestScope.locations}">
							<option value=${item.location_id}>${item.location_add}${item.locationD_add}</option>
						</c:forEach>
					</select>

					<div>
						<input type="hidden" name=strCartList value="${strCartList}">
					</div>


					<hr>
					<h4 class="mb-3">할인적용</h4>
					<hr>
					<h4 class="mb-3">총 가격</h4>
					<h4 class="mb-3"></h4>

					<div style="margin-left: 25%">
						<input type="submit" class="btn btn-secondary btn-lg"
							style="width: 25%" value="결제하기">
						</button>
						<button type="button" class="btn btn-secondary btn-lg"
							style="width: 25%">취소하기</button>
					</div>
				</form>
			</div>

		</div>
		<!-- right-container 끝 -->


		<!-- 본인 페이지에 맞게 수정하려면 여기까지 삭제하고, 새로 만들면 됩니다. 혹시 문제 생기면 섹션까지 삭제 해보는거 추천!!!!-->
	</section>
	<!-- section 끝  -->

	<!-- footer 시작 -->
	<footer class="footer">
		<p>&copy; 2023 SSB Style</p>
	</footer>
	<!-- footer 끝 -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

	<script>

</script>


</body>

</html>




