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

<!-- ��� �޴��� ���� �� ���� Ȯ�� js �ڵ� �����.-->
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
<title>SSB Layout</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link href="./main/main.css" rel="stylesheet">

</head>

<body>
<!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->
<div class="header">
	<jsp:include page="../Mcommon/top.jsp" />
</div>
<!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->


	<!-- section ���� -->

	<section class="section">

		<!-- ���� �������� �°� �����Ϸ��� ���� �Ʒ������� �����ϰ�, ���� ����� �˴ϴ�. Ȥ�� ���� ����� ���Ǳ��� ���� �غ��°� ��õ!!!!-->

		<!-- ���� ���� ���� �߰� -->
		<div class="right-section" style="margin-top: 170px;">
			<h2>Welcome to <b style="color:blue;">S</b>SB Style</h2>
			<p>Find your style in the Sports style box.</p>

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

				<!-- �̺�Ʈ �����̵� �� -->

			</div>

			
			
			<!-- �׽�Ʈ�� -->
			<div class="container px-4 px-lg-5 mt-5">
				<div
					class="row gx-4 row-cols-2 row-cols-md-3 row-cols-xl-6 justify-content-center">
			<c:forEach var="idto" items="${itemList }">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo -->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/${idto.item_img_logo }"
									alt="���ΰ�" />
							</div>
							<!-- Product image-->
							
							<!-- ��ǰ �������� �̵� �ּ� ���� �־��. -->
							<a href="./ItemSub.in?item_id=${idto.item_id }">
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/${idto.item_img_main }" alt="head ��ĿƮ ��" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${idto.item_name }</h5>
									<!-- Product price-->
								<fmt:formatNumber value="${idto.item_price }" />��
								
								</div>
							</div> </a>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent garo">
								<span class="text-center" style="margin-left: 5px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
					</div>
		</c:forEach>
						<!-- �귣�� ��ǰ ���� -->
						<div class="loce1">
							<a href="" class="more"><b> head ��ǰ ������ </b></a>
						</div>
 						<!-- �귣�� ��ǰ ���� -->
 						
 						<!-- �귣�� ��ǰ ���� -->
						<div class="loce2">
							<a href="" class="more"><b> ��Ƶ��� ��ǰ ������ </b></a>
						</div>
 						<!-- �귣�� ��ǰ ���� -->
 						
 						<!-- �귣�� ��ǰ ���� -->
						<div class="loce3">
							<a href="" class="more"><b> ���ùͽ� ��ǰ ������ </b></a>
						</div>
 						<!-- �귣�� ��ǰ ���� -->

				</div>
			</div>
			
			<!-- �׽�Ʈ�� -->


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
