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

<!-- ��� �޴��� ���� �� ���� Ȯ�� -->
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
<link href="./main/main_css/main.css" rel="stylesheet">

</head>

<body>

	<!-- header ���� -->
	<header class="header">
		<div class="logo">
			<a href="./Main.in"><img src="./main/item_img/SSB_gold.png"
				style="width: 200px;"></a>
		</div>
		<div>
			<form role="search" style="display: flex;" class="search-box">
				<input class="search-input" type="text" placeholder="�� ��Ÿ�� ã��"
					style="width: 80%;">
				<button type="submit" class="search-icon">
					<img width="38" height="38" src="./main/img/hoodie.png" alt="�˻���ư" />
				</button>
			</form>
		</div>

		<!-- ID ���ǰ��� null �϶� ���� ��ư -->
		<c:if test="${sessionScope.loginId ==null }">
			<div>
				<button class="login-button"><a href="./MemberLogin.me">login</a> </button>
				<button class="signup-button">
					<img width="20" height="15" src="./main/img/market.png" alt="��ٱ���" />cart
				</button>
			</div>
		</c:if>

		<!-- ID ���ǰ��� ������ ���� ��ư -->
		<c:if test="${sessionScope.loginId != null }">
			<div>
				<button class="login-button">logout</button>
				<button class="signup-button">My Page</button>
				<button class="signup-button">��</button>
				<button class="signup-button">
					<img width="20" height="15" src="./main/img/market.png" alt="��ٱ���" />cart
				</button>
			</div>
		</c:if>
	</header>
	<!-- header �� -->

	<!-- ��� ���� �޴��� ���� -->
	<div class="menu">
		<div class="submenu">
			<a href="#"><b>New arriva</b>l</a>
			<div class="submenu-content">
				<a href="#">��ü����</a> <a href="#">����Ʈ</a> <a href="#">��õ��ǰ</a>
			</div>

		</div>
		<div class="submenu">
			<a href="#"><b>Sports</b></a>
			<div class="submenu-content">
				<a href="#">����</a> <a href="#">�״Ͻ�</a> <a href="#">����</a> <a href="#">������</a> <a href="#">��</a> <a href="#">�౸</a>
				<a href="#">�䰡/�ʶ��׽�</a> <a href="#">����</a> <a href="#">�ܿｺŰ/����</a> <a href="#">�߱�</a> <a href="#">�ｺ</a> <a href="#">����</a> <a href="#">��Ÿ</a>
			</div>
		</div>

		<div class="submenu">
			<a href="#"><b>Clothing</b></a>
			<div class="submenu-content">
				<a href="#">��ü����</a> <a href="#">�ƿ���</a> <a href="#">����</a> <a href="#">����</a>
			</div>
		</div>

		<div class="submenu">
			<a href="#"><b>Shoes</b></a>
			<div class="submenu-content">
				<a href="#">�ǳ�������</a> <a href="#">��Ƽ��Ƽ</a> <a href="#">������</a>
			</div>
		</div>

		<div class="submenu">
			<a href="#"><b>Accessories</b></a>
			<div class="submenu-content">
				<a href="#">����</a> <a href="#">����</a> <a href="#">����</a> <a href="#">�縻</a>
			</div>
		</div>

		<div class="submenu">
			<a href="#"><b>Outlet</b></a>
			<div class="submenu-content">
				<a href="#">��ü����</a> <a href="#">Shoes</a> <a href="#">Clothing</a> <a href="#">Acc</a>
			</div>
		</div>

		<div class="submenu">
			<a href="#"><b>For rental</b></a>
			<div class="submenu-content">
				<a href="#">����</a> <a href="#">ķ��</a> <a href="#">�ܿｺ����</a>
			</div>
		</div>
	</div>
	<!-- ��� ���� �޴��� �� -->



	<!-- section ���� -->

	<section class="section">

		<!-- ���� �������� �°� �����Ϸ��� ���� �Ʒ������� �����ϰ�, ���� ����� �˴ϴ�. Ȥ�� ���� ����� ���Ǳ��� ���� �غ��°� ��õ!!!!-->

		<!-- ���� ���� ���� �߰� -->
		<div class="right-section" style="margin-top: 8%;">
			<h2>Welcome to SSB Style</h2>
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

			<div class="container px-4 px-lg-5 mt-5">
				<div
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-6 justify-content-center">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo -->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/head_logo.png"
									alt="���ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/head_sktB.png" alt="head ��ĿƮ ��" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">��Ʈ��ġ �ø��� �״Ͻ� ��ĿƮ ���</h5></a>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">159,000��</span>
									143,100��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
					</div>
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo -->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/head_logo.png"
									alt="���ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/head_jacket.png" alt="head Ʈ�� ��Ʈ ����" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">���̿����� ������ Ʈ�� �¾� ����</h5></a>
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
									<span class="text-muted text-decoration-line-through">179,000��</span>
									161,100��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
					</div>
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo -->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/head_logo.png"
									alt="���ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/head_pants.png" alt="head Ʈ�� ��Ʈ ����" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">���̵��� ������ Ʈ�� �¾� ����</h5></a>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">159,000��</span>
									143,100��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
					</div>
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo -->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/head_logo.png"
									alt="���ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/head_racket.png" alt="head �״Ͻ� ����" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">IG ç���� PRO ���� (G2)</h5></a>
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
									145,000��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>

					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/head_logo.png"
									alt="���ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/head_qulting.png" alt="��Ƶ��� ��ĿƮ" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">���̿����� HRC ������ġ ���� ���� ��</h5></a>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">239,000��</span>
									215,100��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
					</div>
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="35" src="./main/item_img/head_logo.png"
									alt="���ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/head_yangmal.png" alt="head ����縻" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">�������� �ΰ� �׿� �״Ͻ� �縻 ȭ��Ʈ (3PACK)</h5></a>
									<!-- Product price-->
									<span class="text-muted text-decoration-line-through">27,000��</span>
									24,300��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
						<!-- �귣�� ��ǰ ���� -->
						<div>
							<a href="" class="more"><b> head ��ǰ ������ </b></a>
						</div>
						<!-- head ��ǰ �� -->
					</div>
					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="18" width="40"
									src="./main/item_img/diadora_logo.png" alt="��Ƶ���ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/diadora_skirt.png" alt="��Ƶ��� ��ĿƮ" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">�ø��� ������� ��ĿƮ</h5></a>
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
									139,000��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="18" width="40"
									src="./main/item_img/diadora_logo.png" alt="��Ƶ���ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/diadora_outer.png" alt="��Ƶ��� ����극��Ŀ" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">������ ����극��Ŀ</h5></a>
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
									179,000��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="18" width="40"
									src="./main/item_img/diadora_logo.png" alt="��Ƶ���ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/diadora_crop.png" alt="��Ƶ��� ũ�� ����" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">��Ʋ��Ƽī �ø��� ũ�� ����</h5></a>
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
									<span class="text-muted text-decoration-line-through">219,000��</span>
									208,050��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="18" width="40"
									src="./main/item_img/diadora_logo.png" alt="��Ƶ���ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/diadora_slip.png" alt="��Ƶ��� ������" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">�״Ͻ� �׷��� �����̵� GREEN</h5></a>
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
									59,000��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="18" width="40"
									src="./main/item_img/diadora_logo.png" alt="��Ƶ���ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/diadora_soccor.png" alt="��Ƶ��� �౸ȭ" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">FG ����� ����Ʈ2 ��ũ ITALIA LPX WHITE</h5></a>
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
									<span class="text-muted text-decoration-line-through">399,000��</span>
									199,500��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="18" width="40"
									src="./main/item_img/diadora_logo.png" alt="��Ƶ���ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/diadora_bag.png" alt="��Ƶ��� ����" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">�״Ͻ� �����Ϲ� YELLOW</h5></a>
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
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
						<div>
							<a href="" class="more"><b> ��Ƶ��� ��ǰ ������ </b></a>
						</div>
					</div>

					<!-- ��Ƶ��� ��ǰ ��! -->

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="55" src="./main/item_img/xexy_logo.png"
									alt="���ùͽ��ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/xexy_outer.png" alt="���ùͽ� �ƿ��� ��" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">�ظ��� ���� �淮 �е�</h5></a>
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
									<span class="text-muted text-decoration-line-through">119,000��</span>
									99,000��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="55" src="./main/item_img/xexy_logo.png"
									alt="���ùͽ��ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/xexy_yang.png" alt="���� ��������" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"> <h5 class="fw-bolder">�������� ���� �ø��� ���� īŰ �׸�</h5> </a>
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
									<span class="text-muted text-decoration-line-through">109,000��</span>
									69,000��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="55" src="./main/item_img/xexy_logo.png"
									alt="���ùͽ��ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/xexy_golf.png" alt="���ð���(��)" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">���̺� ���� ���̳� ����Ʈ</h5></a>
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
									<span class="text-muted text-decoration-line-through">99,000��</span>
									89,000��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="55" src="./main/item_img/xexy_logo.png"
									alt="���ùͽ��ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/xexy_baram.png" alt="���� ������ �ٶ�����" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">������ ���� ��� �ٶ����� �󾲱׸���</h5></a>
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
									<span class="text-muted text-decoration-line-through">89,000��</span>
									69,000��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>

					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="55" src="./main/item_img/xexy_logo.png"
									alt="���ùͽ��ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/xexy_leg.png" alt="���ùͽ� ���뽺" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">���� �ñ״�ó ���뽺 4.5�� 1+1</h5></a>
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
									<span class="text-muted text-decoration-line-through">84,000��</span>
									38,800��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>

					</div>

					<div class="col mb-5">
						<div class="card h-100">
							<!-- brand logo-->
							<div class="position-absolute" style="top: 0.5rem; right: 0.5rem">
								<img height="15" width="55" src="./main/item_img/xexy_logo.png"
									alt="���ùͽ��ΰ�" />
							</div>
							<!-- Product image-->
							<img class="card-img-top" width="450" height="300"
								src="./main/item_img/xexy_swim.png" alt="���ý�������(��)" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<a href="#"><h5 class="fw-bolder">��Ƽ�����ؼ� ����� �����긮�� ���</h5></a>
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
									<span class="text-muted text-decoration-line-through">84,000��</span>
									38,800��
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<span class="text-center" style="margin-left: 10px;"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/img/heart.png" alt="��Ʈ" />
										wish</a></span> <span class="text-center"><a
									class="btn btn-outline-dark mt-auto" href="#"><img
										width="20" height="20" src="./main/item_img/market.png"
										alt="��ٱ���" /> cart</a></span>
							</div>
						</div>
						<div>
							<a href="" class="more"><b> ���ùͽ� ��ǰ ������ </b></a>
						</div>
					</div>

					<!-- ���ùͽ� ��ǰ ��! -->

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
