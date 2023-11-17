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

<!-- 파비콘 -->
<link rel="shortcut icon" href="./main/img/favicon.ico">
</head>

<body>

	<!-- header 시작 -->
	<header class="header">
		<div class="logo">
			<a href="./Main.in"><img src="./main/item_img/SSB_gold.png"
				style="width: 200px;"></a>
		</div>
		<div>
			<form role="search" style="display: flex;" class="search-box">
				<input class="search-input" type="text" placeholder="내 스타일 찾기"
					style="width: 80%;">
				<button type="submit" class="search-icon">
					<img width="38" height="38" src="./main/img/hoodie.png" alt="검색버튼" />
				</button>
			</form>
		</div>

		<!-- ID 세션값이 null 일때 보일 버튼 -->
		<c:if test="${sessionScope.loginId ==null }">
			<div>
				<button class="login-button">login</button>
				<button class="signup-button">
					<img width="20" height="15" src="./main/img/market.png" alt="장바구니" />cart
				</button>
			</div>
		</c:if>

		<!-- ID 세션값이 있을때 보일 버튼 -->
		<c:if test="${sessionScope.loginId != null }">
			<div>
				<button class="login-button">logout</button>
				<button class="signup-button">My Page</button>
				<button class="signup-button">찜</button>
				<button class="signup-button">
					<img width="20" height="15" src="./main/img/market.png" alt="장바구니" />cart
				</button>
			</div>
		</c:if>
	</header>
	<!-- header 끝 -->

	<!-- 상단 메인 메뉴바 시작 -->
	<!-- <div class="menu">
		<div class="submenu">
			<a href="#"><b>New arriva</b>l</a>
			<div class="submenu-content">
				<a href="#">전체보기</a> <a href="#">베스트</a> <a href="#">추천제품</a>
			</div>

		</div>
		<div class="submenu">
			<a href="#"><b>Sports</b></a>
			<div class="submenu-content">
				<a href="#">골프</a> <a href="#">테니스</a> <a href="#">런닝</a> <a href="#">배드민턴</a> <a href="#">농구</a> <a href="#">축구</a>
				<a href="#">요가/필라테스</a> <a href="#">보드</a> <a href="#">겨울스키/보드</a> <a href="#">야구</a> <a href="#">헬스</a> <a href="#">수영</a> <a href="#">기타</a>
			</div>
		</div>

		<div class="submenu">
			<a href="#"><b>Clothing</b></a>
			<div class="submenu-content">
				<a href="#">전체보기</a> <a href="#">아우터</a> <a href="#">상의</a> <a href="#">하의</a>
			</div>
		</div>

		<div class="submenu">
			<a href="#"><b>Shoes</b></a>
			<div class="submenu-content">
				<a href="#">실내스포츠</a> <a href="#">액티비티</a> <a href="#">릴렉스</a>
			</div>
		</div>

		<div class="submenu">
			<a href="#"><b>Accessories</b></a>
			<div class="submenu-content">
				<a href="#">가방</a> <a href="#">모자</a> <a href="#">라켓</a> <a href="#">양말</a>
			</div>
		</div>

		<div class="submenu">
			<a href="#"><b>Outlet</b></a>
			<div class="submenu-content">
				<a href="#">전체보기</a> <a href="#">Shoes</a> <a href="#">Clothing</a> <a href="#">Acc</a>
			</div>
		</div>

		<div class="submenu">
			<a href="#"><b>For rental</b></a>
			<div class="submenu-content">
				<a href="#">골프</a> <a href="#">캠핑</a> <a href="#">겨울스포츠</a>
			</div>
		</div>
	</div> -->
	<!-- 상단 메인 메뉴바 끝 -->



	<!-- section 시작 -->

	<section class="section" style="margin: 5%;">

		<!-- 본인 페이지에 맞게 수정하려면 여기 아래서부터 삭제하고, 새로 만들면 됩니다. 혹시 문제 생기면 섹션까지 삭제 해보는거 추천!!!!-->

		<!-- left-container 시작 -->
		<div class="left-container" style="margin: 20%; width: 60%;">
			<div class="col-md-7 col-lg-8">
				<h4 class="mb-3">결제 정보</h4>
				<hr>
				<h4 class="mb-3">결제 내역</h4>
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th scope="col">결제 번호</th>
							<td>${payment.merchantUid}</td>
						</tr>

						<tr>
							<th scope="col">결제금액</th>
							<td>${payment.paidAmount}</td>
						</tr>

						<tr>
							<th scope="col">결제방식</th>
							<td>${payment.paidMethod}</td>
						</tr>

						<tr>
							<th scope="col">결제 상태</th>
							<td>${payment.pgProvider}</td>
						<tr>
						<tr>
							<th scope="col">결제 상태</th>
							<td>${payment.status}</td>
						<tr>
					</thead>

				</table>

				<hr>

				<hr class="my-4">

				<a class="btn btn-secondary" role="button" aria-disabled="true">메인페이지로
					가기</a> <a class="btn btn-secondary" role="button" aria-disabled="true">내
					결제 상품 보러가기</a>


			</div>
		</div>
		</main>

		</div>



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




</body>

</html>