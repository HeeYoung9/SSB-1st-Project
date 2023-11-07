<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
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
				<button class="login-button"><a href="./MemberLogin.me">login</a> </button>
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
	<div class="menu">
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
	</div>
	<!-- 상단 메인 메뉴바 끝 -->



	<!-- section 시작 -->

	<section class="section">

		<!-- 본인 페이지에 맞게 수정하려면 여기 아래서부터 삭제하고, 새로 만들면 됩니다. 혹시 문제 생기면 섹션까지 삭제 해보는거 추천!!!!-->

		<!-- 우측 영역 내용 추가 -->
		<div class="right-section" style="margin-top: 8%;">
			<h2>Welcome to SSB Style</h2>
			<p>Find your style in the Sports style box.</p>

			<!-- 이벤트 슬라이드 시작 -->
			<div id="carouselExampleAutoplaying" class="carousel slide"
				data-bs-ride="carousel" style="margin: 1% 5%;">
				<div class="carousel-inner">

					<!-- 실제 JSP 코드 시작 부분 -->
					<!--  세일 이벤트  -->

					<div class="carousel-item active">
						<a href="#"><img class="d-block"
							src="./main/item_img/diadora_event.png" alt="디아도라이벤트슬라이드">
						</a>
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
					<!-- 실제 JSP 코드 종료 부분 -->

					<div class="carousel-item">
						<a href="#"><img class="d-block"
							src="./main/img/blackFriday.png" alt="블랙프라이데이"> </a>
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
					<div class="carousel-item">
						<a href="#"><img class="d-block"
							src="./main/item_img/nordisk.png" alt="노르디스크"> </a>
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>

				<!-- 이벤트 슬라이드 끝 -->

			</div>

			<div class="container px-4 px-lg-5 mt-5">
				<div
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-6 justify-content-center">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo -->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/head_logo.png"
									alt="헤드로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/head_sktB.png" alt="head 스커트 블랙" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">스트레치 플리츠 테니스 스커트 블루</h5></a>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">159,000원</span>
									143,100원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
					</div>
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo -->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/head_logo.png"
									alt="헤드로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/head_jacket.png" alt="head 트랙 셋트 집업" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">세미오버핏 테이핑 트랙 셋업 자켓</h5></a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">179,000원</span>
									161,100원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
					</div>
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo -->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/head_logo.png"
									alt="헤드로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/head_pants.png" alt="head 트랙 셋트 팬츠" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">와이드핏 테이핑 트랙 셋업 팬츠</h5></a>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">159,000원</span>
									143,100원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
					</div>
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo -->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/head_logo.png"
									alt="헤드로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/head_racket.png" alt="head 테니스 라켓" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">IG 챌린지 PRO 라켓 (G2)</h5></a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									145,000원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>

					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/head_logo.png"
									alt="헤드로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/head_qulting.png" alt="디아도라 스커트" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">세미오버핏 HRC 샌드위치 퀼팅 점퍼 블랙</h5></a>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">239,000원</span>
									215,100원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
					</div>
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/head_logo.png"
									alt="헤드로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/head_yangmal.png" alt="head 삼색양말" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">남여공용 로고 네온 테니스 양말 화이트 (3PACK)</h5></a>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">27,000원</span>
									24,300원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
						<!-- 브랜드 제품 구분 -->
						<div>
							<a href="" class="more"><b> head 제품 더보기 </b></a>
						</div>
						<!-- head 제품 끝 -->
					</div>
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="18" width="40"
									src="./main/item_img/diadora_logo.png" alt="디아도라로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/diadora_skirt.png" alt="디아도라 스커트" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">플리츠 더블라인 스커트</h5></a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									139,000원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="18" width="40"
									src="./main/item_img/diadora_logo.png" alt="디아도라로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/diadora_outer.png" alt="디아도라 윈드브레이커" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">루즈핏 윈드브레이커</h5></a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									179,000원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="18" width="40"
									src="./main/item_img/diadora_logo.png" alt="디아도라로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/diadora_crop.png" alt="디아도라 크롭 자켓" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">아틀레티카 플리스 크롭 자켓</h5></a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">219,000원</span>
									208,050원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="18" width="40"
									src="./main/item_img/diadora_logo.png" alt="디아도라로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/diadora_slip.png" alt="디아도라 슬리퍼" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">테니스 그래픽 슬라이드 GREEN</h5></a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									59,000원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="18" width="40"
									src="./main/item_img/diadora_logo.png" alt="디아도라로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/diadora_soccor.png" alt="디아도라 축구화" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">FG 브라질 엘리트2 테크 ITALIA LPX WHITE</h5></a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">399,000원</span>
									199,500원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="18" width="40"
									src="./main/item_img/diadora_logo.png" alt="디아도라로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/diadora_bag.png" alt="디아도라 가방" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">테니스 보스턴백 YELLOW</h5></a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									$40.00
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
						<div>
							<a href="" class="more"><b> 디아도라 제품 더보기 </b></a>
						</div>
					</div>

					<!-- 디아도라 제품 끝! -->

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="55" src="./main/item_img/xexy_logo.png"
									alt="젝시믹스로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/xexy_outer.png" alt="젝시믹스 아우터 남" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">넥리스 심플 경량 패딩</h5></a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">119,000원</span>
									99,000원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="55" src="./main/item_img/xexy_logo.png"
									alt="젝시믹스로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/xexy_yang.png" alt="젝시 양털집업" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"> <h5 class="fw-bolder">리버서블 집업 플리스 자켓 카키 그린</h5> </a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">109,000원</span>
									69,000원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="55" src="./main/item_img/xexy_logo.png"
									alt="젝시믹스로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/xexy_golf.png" alt="젝시골프(여)" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">케이블 패턴 하이넥 베스트</h5></a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">99,000원</span>
									89,000원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="55" src="./main/item_img/xexy_logo.png"
									alt="젝시믹스로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/xexy_baram.png" alt="젝시 루즈핏 바람막이" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">루즈핏 브이 배색 바람막이 얼쓰그린블럭</h5></a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">89,000원</span>
									69,000원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>

					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="55" src="./main/item_img/xexy_logo.png"
									alt="젝시믹스로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/xexy_leg.png" alt="젝시믹스 레깅스" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">블랙라벨 시그니처 레깅스 4.5부 1+1</h5></a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">84,000원</span>
									38,800원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>

					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="55" src="./main/item_img/xexy_logo.png"
									alt="젝시믹스로고" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/xexy_swim.png" alt="젝시스윔웨어(남)" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">멀티프로텍션 아쿠아 슬리브리스 블루</h5></a>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
										<div class="bi-star-fill"></div>
									</div>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">84,000원</span>
									38,800원
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
						<div>
							<a href="" class="more"><b> 젝시믹스 제품 더보기 </b></a>
						</div>
					</div>

					<!-- 젝시믹스 제품 끝! -->

				</div>
			</div>


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
