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

<!-- �ĺ��� -->
<link rel="shortcut icon" href="./main/img/favicon.ico">
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
				<button class="login-button">login</button>
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
	<!-- <div class="menu">
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
	</div> -->
	<!-- ��� ���� �޴��� �� -->



	<!-- section ���� -->

	<section class="section" style="margin: 5%;">

		<!-- ���� �������� �°� �����Ϸ��� ���� �Ʒ������� �����ϰ�, ���� ����� �˴ϴ�. Ȥ�� ���� ����� ���Ǳ��� ���� �غ��°� ��õ!!!!-->

		<!-- left-container ���� -->
		<div class="left-container" style="margin: 20%; width: 60%;">
			<div class="col-md-7 col-lg-8">
				<h4 class="mb-3">���� ����</h4>
				<hr>
				<h4 class="mb-3">���� ����</h4>
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th scope="col">���� ��ȣ</th>
							<td>${payment.merchantUid}</td>
						</tr>

						<tr>
							<th scope="col">�����ݾ�</th>
							<td>${payment.paidAmount}</td>
						</tr>

						<tr>
							<th scope="col">�������</th>
							<td>${payment.paidMethod}</td>
						</tr>

						<tr>
							<th scope="col">���� ����</th>
							<td>${payment.pgProvider}</td>
						<tr>
						<tr>
							<th scope="col">���� ����</th>
							<td>${payment.status}</td>
						<tr>
					</thead>

				</table>

				<hr>

				<hr class="my-4">

				<a class="btn btn-secondary" role="button" aria-disabled="true">������������
					����</a> <a class="btn btn-secondary" role="button" aria-disabled="true">��
					���� ��ǰ ��������</a>


			</div>
		</div>
		</main>

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