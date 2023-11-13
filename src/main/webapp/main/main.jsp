<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
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

<!-- 상단 메뉴바 오픈 및 영역 확장 js 코드 접어둠.-->
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
<link href="./main/main.css" rel="stylesheet">

</head>

<body>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->
<div class="header">
	<jsp:include page="../Mcommon/top.jsp" />
</div>
<!-- 헤더/ 상단메뉴바 영역 top.jsp 공통 페이지 사용 -->


	<!-- section 시작 -->

	<section class="section">

		<!-- 본인 페이지에 맞게 수정하려면 여기 아래서부터 삭제하고, 새로 만들면 됩니다. 혹시 문제 생기면 섹션까지 삭제 해보는거 추천!!!!-->

		<!-- 우측 영역 내용 추가 -->
		<div class="right-section" style="margin-top: 170px;">
			<h2>Welcome to <b style="color:blue;">S</b>SB Style</h2>
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
							<!-- DB에서 이미지 파일 가져올때 업로드 폴더 및 파일명 경로로 -->
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

			
			<!-- 제품 목록 -->
	
			<div class="container px-4 px-lg-5 mt-5" >
				<div
					class="row gx-4 row-cols-2 row-cols-md-3 row-cols-xl-6 justify-content-center">
			<c:forEach var="idto" items="${itemList }">
					<div  class="col mb-5">
						<div id="test" class="card h-100">
							<!-- brand logo -->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/${idto.item_img_logo }"
									alt="헤드로고" />
							</div>
							<!-- Product image-->
							
							<!-- 제품 상세페이지 이동 주소 여기 있어요. -->
							<a href="./ItemSub.in?item_id=${idto.item_id }">
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/${idto.item_img_main }" alt="head 스커트 블랙" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${idto.item_name }</h5>
									<!-- Product price-->
								<fmt:formatNumber value="${idto.item_price }" />원
								
								</div>
							</div> </a>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent garo">
								<span class="text-center" style="margin-left: 5px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="하트" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="장바구니" /> cart</a></span>
							</div>
						</div>
					</div>
		</c:forEach>
						<!-- 검색시 창 크기 안겹치게 필요한 div임-->
						<div style="margin-top:-50px; margin-left:900px; z-index:3;">
						</div>
						<!-- 검색시 창 크기 안겹치게 필요한 div임-->
 						
 						
 						<!--브랜드 제품 구분
						<div class="loce2">
							<a href="" class="more"><b> 디아도라 제품 더보기 </b></a>
						</div>
 						브랜드 제품 구분
 						
 						브랜드 제품 구분
						<div class="loce3">
							<a href="" class="more"><b> 젝시믹스 제품 더보기 </b></a>
						</div> -->
 						<!-- 브랜드 제품 구분 -->

				</div>
			</div>
			
			<!-- 제품 목록 -->


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
