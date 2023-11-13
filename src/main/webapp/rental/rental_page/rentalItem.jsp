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

<title>Rentalitem.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link href="./rental/rental_css/rentalItem.css" rel="stylesheet">

</head>
<body>
<!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->
	<div class="header">
	<jsp:include page="../Rcommon/top.jsp" />
	</div>
<!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->
	
	
	
	<!-- �������� ���� -->
	

	<section class="subscript">
		<div class="product-container">
			<div class="product-image">
				<img src="./main/rental_item/${rdto.rental_img_main }" alt="��ǰ �̹���">
			</div>
			<div class="product-details">
				<h1>${rdto.rental_item_name }</h1>
				<hr>
				<h2>�뿩�Ⱓ : ${rdto.rental_opt_value }</h2>
				<p>�ݾ� : <fmt:formatNumber value="${rdto.rental_item_price }" />��</p>
				<p>
				
				<c:forEach begin="1" end="4" step="1">
				<img width="20" height="20" src="./rental/icon/star.png" /> 
				</c:forEach>
				<img width="20" height="20" src="./rental/icon/harfStar.png" /> 
				<a href="����Խ���">
				4.5/5  ���� 426�� </a></p>
				
				<!-- ���� �޷�!!!  -->
				<jsp:include page="calendar.html" />
				
				
				<button class="reserve-button"><a href="#" style="color:white;">
				�����ϱ�</a></button>
			</div>
		</div>
		<div class="product-description">
			<h2>��ǰ �� �̹���</h2>
			<img src="./main/rental_item/${rdto.rental_item_sub }" alt="��ǰ �� �̹���">
		</div>
		<div class="reviews">
			<h2>���� �Խ���</h2>
			<!-- ���� �Խ��� ������ ���⿡ �߰� -->
		</div>
		<div class="questions">
			<h2>���� �Խ���</h2>
			<!-- ���� �Խ��� ������ ���⿡ �߰� -->
		</div>
	</section>
	
	<nav class="top">
		<a href="#">��TOP</a>
	</nav>







</body>
</html>