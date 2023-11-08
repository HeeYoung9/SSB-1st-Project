<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 

	<!-- header ���� -->
	<header class="header">
		<div class="logo">
			<a href="./Main.in"><img src="./main/item_img/SSB_gold.png"
				style="width: 200px;"></a>
		</div>
		<div class="fm">
			<form role="search" class="search-box"> <!--style="display: flex;"  -->
				<input class="search-input" type="text" placeholder="�� ��Ÿ�� ã��"
					style="width: 80%;">
				<button type="submit" class="search-icon">
					<img width="38" height="38" src="./main/img/hoodie.png" alt="�˻���ư" />
				</button>
			</form>
		</div>

		<!-- ID ���ǰ��� null �϶� ���� ��ư (�α׾ƿ�/ ��ȸ������)-->
		<c:if test="${empty sessionScope.loginId }">
			<div class="button-container">
				<button class="login-button">login</button>
				<button class="signup-button">
					<img width="20" height="15" src="./main/img/market.png" alt="��ٱ���" />cart
				</button>
			</div>
		</c:if>
		<!-- ID ���ǰ��� null �϶� ���� ��ư (�α׾ƿ�/ ��ȸ������) -->

		<!-- ID ���ǰ��� ������ ���� ��ư(�α��� ����) -->
		<c:if test="${!empty sessionScope.loginId && not fn:containsIgnoreCase(sessionScope.loginId, 'admin')}">
			<div class="button-container">
				<button class="login-button">logout</button>
				<button class="signup-button">My Page</button>
				<button class="signup-button">��</button>
				<button class="signup-button">
				<img width="20" height="15" src="./main/img/market.png" alt="��ٱ���" />cart
				</button>
			</div>
		</c:if>
		<!-- ID ���ǰ��� ������ ���� ��ư (�α��� ����) -->
		
		<!-- ID ���ǰ��� admin�϶� ���� ��ư (����������) -->
		<c:if test="${fn:containsIgnoreCase(sessionScope.loginId, 'admin')}">
			<div class="button-container">
				<a style="background-color: transparent; margin-top:10px; " href="./AdminMain.ad">
				<img width="30" height="30" src="./main/img/admin.png" />������</a>
			</div>
		</c:if>
		<!-- ID ���ǰ��� admin�϶� ���� ��ư (����������) -->
		
	</header>
	<!-- header �� -->
	
		<!-- ��� ���� �޴��� ���� -->
	<div class="menu">
		<div class="submenu">
			<a href="#"><b>New arrival</b>l</a>
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
			<a href="./RentalMain.re"><b>For rental</b></a>
			<div class="submenu-content">
				<a href="#">����</a> <a href="#">ķ��</a> <a href="#">�ܿｺ����</a>
			</div>
		</div>
	</div>
	<!-- ��� ���� �޴��� �� -->