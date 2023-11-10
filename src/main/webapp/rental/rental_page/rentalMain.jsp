<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<!-- header js �ڵ� ���� �����. -->
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

<!-- ��� �޴��� ���� �� ���� Ȯ�� js�ڵ� ����� -->
<script>
	document.addEventListener("DOMContentLoaded", function() {

		const submenus = document.querySelectorAll(".menu .submenu");
		const submenuContents = document.querySelectorAll(".submenu-content");

		submenus.forEach(function(submenu, index) {
			const submenuContent = submenuContents[index];

			// �޴� �׸��� ȣ���� ��
			submenu.addEventListener("mouseover", function() {
				// �ش� �޴� �׸��� ���� �޴��� ǥ�õǸ� �޴��� ���̸� ����
				submenuContent.style.display = "block";
				submenu.style.height = submenuContent.clientHeight + "px";
			});

			// �޴� �׸񿡼� ���콺�� ���� ��
			submenu.addEventListener("mouseout", function() {
				// �ش� �޴� �׸��� ���� �޴��� �������� �޴��� ���̸� ������� ����
				submenuContent.style.display = "none";
				submenu.style.height = "auto";
			});
		});
	});
</script>


<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSB RentalMain</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link href="./rental/rental_css/rental.css" rel="stylesheet">

</head>

<body>

<!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->
	<div class="header">
	<jsp:include page="../Rcommon/top.jsp" />
	</div>
<!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->



	<!-- section ���� -->

	<section class="section">

		<!-- ���� �������� �°� �����Ϸ��� ���� �Ʒ������� �����ϰ�, ���� ����� �˴ϴ�. Ȥ�� ���� ����� ���Ǳ��� ���� �غ��°� ��õ!!!!-->

		<!-- ���� ���� ���� �߰� -->
		<div class="right-section" style="margin-top: 170px;">
			<h2>Welcome to <b style="color:red; ">R</b>SB Style</h2>
			<p>Find your style in the Rental style box.</p>

			<!-- �̺�Ʈ �����̵� ���� -->
			<div id="carouselExampleAutoplaying" class="carousel slide"
				data-bs-ride="carousel" style="margin: 1% 5%;">
				<div class="carousel-inner">

					<!-- ���� JSP �ڵ� ���� �κ� -->
					<!--  ���� �̺�Ʈ  -->

					<div class="carousel-item active">
						<a href="#"><img class="d-block"
							src="./main/item_img/diadora_event.png" alt="��Ƶ����̺�Ʈ�����̵�">
						</a>
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
					<!-- ���� JSP �ڵ� ���� �κ� -->

					<div class="carousel-item">
						<a href="#"><img class="d-block" 
							src="./main/img/blackFriday.png" alt="�������̵���"> </a>
							<!-- DB���� �̹��� ���� �����ö� ���ε� ���� �� ���ϸ� ��η� -->
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
					<div class="carousel-item">
						<a href="#"><img class="d-block"
							src="./main/item_img/nordisk.png" alt="�븣��ũ"> </a>
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
			</div>
				<!-- �̺�Ʈ �����̵� �� -->
		
			<div class="container px-4 px-lg-5 mt-5">
				<div
					class="row gx-4 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach var="rdto" items="${rentalList }">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo -->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
							</div>
							<!-- Product image-->
							<a href="./RentalItem.re?rental_item_id=${rdto.rental_item_id }">

							<img class="card-img-top" width="450" height="300"
								src="./main/rental_item/${rdto.rental_img_main }" alt="ķ�ο�ǰ" />
							
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${rdto.rental_item_name }</h5>
									<!-- Product price-->
								<fmt:formatNumber value="${rdto.rental_item_price }" />��
								</div>
							</div> </a>
							<!-- Product actions-->
							<div class="box">
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 40px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="18" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="18" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
							</div>
						</div>
				
					</div>
					</c:forEach>
				<!-- ķ�� ��Ż ��ǰ �� -->
						<div style="margin-top:-50px; margin-left:900px; z-index:3;">
							<a href="" class="more"><b> ķ�� ��ǰ ������ </b></a>
						</div>
					</div>
			</div>
			
		</div>
		

		<!-- ���� �������� �°� �����Ϸ��� ������� �����ϰ�, ���� ����� �˴ϴ�. Ȥ�� ���� ����� ���Ǳ��� ���� �غ��°� ��õ!!!!-->
	</section>
	<!-- section ��  -->

	<!-- footer ���� -->
	<footer class="footer">
		<p>&copy; 2023 SSB Style</p>
	</footer>
	<!-- footer �� -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>



</body>

</html>
