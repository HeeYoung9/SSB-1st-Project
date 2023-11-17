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

<!-- �ĺ��� -->
<link rel="shortcut icon" href="./main/img/favicon.ico">

</head>

<body>

	<!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->
	<div class="header">
		<jsp:include page="../Mcommon/top.jsp" />
	</div>
	<!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->



	<!-- section ���� -->

	<section class="section" style="margin: 5%;">

		<!-- ���� �������� �°� �����Ϸ��� ���� �Ʒ������� �����ϰ�, ���� ����� �˴ϴ�. Ȥ�� ���� ����� ���Ǳ��� ���� �غ��°� ��õ!!!!-->

		<!-- left-container ���� -->
		<div class="left-container" style="margin: 15%; width: 70%;">
			<div class="col-md-7 col-lg-8">
				<h4 class="mb-3">�ֹ���</h4>
				<hr>
				<h4 class="mb-3">���� ��� ��ǰ</h4>

				<form action="./OrderSalePay.od" method="post">

					<table class="table table-dark table-striped">
						<thead>
							<tr>
								<th scope="col">��ǰ��ȣ</th>
								<th scope="col">��ǰ��</th>
								<th scope="col">����</th>
								<th scope="col">����</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${requestScope.cartList}">
								<tr>
									<td>${item.item_id}</td>
									<td>${item.item_name }</td>
									<td>ȣ��</td>
									<td>${item.cart_quantity}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>


					<hr class="my-4">



					<h4 class="mb-3">����</h4>
					<div class="coupon-select">
						<label for="coupon">���� ����:</label> <select id="coupon"
							name="coupon">
							<option value="coupon1">���� 1</option>
							<option value="coupon2">���� 2</option>
							<!-- �߰� ���� �ɼ� -->
						</select>
					</div>

					<h4 class="mb-3">�����</h4>
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
					<h4 class="mb-3">��������</h4>
					<hr>
					<h4 class="mb-3">�� ����</h4>
					<h4 class="mb-3"></h4>

					<div style="margin-left: 25%">
						<input type="submit" class="btn btn-secondary btn-lg"
							style="width: 25%" value="�����ϱ�">
						</button>
						<button type="button" class="btn btn-secondary btn-lg"
							style="width: 25%">����ϱ�</button>
					</div>
				</form>
			</div>

		</div>
		<!-- right-container �� -->


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

	<script>

</script>


</body>

</html>




