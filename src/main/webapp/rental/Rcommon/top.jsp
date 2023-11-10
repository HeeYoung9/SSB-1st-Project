<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
	<!-- header ���� -->
	<header class="header">
		<div class="logo">
			<a href="./RentalMain.re"><img src="./main/img/SSB_gold.png" alt="SSB �ΰ�"
				style="width: 200px;"></a>
		</div>
		<div class="fm">
			<form role="search" class="search-box"> <!--style="display: flex;"  -->
				<input class="search-input" type="text" placeholder="�� ��Ÿ�� ã��"
					style="width: 80%;">
				<button type="submit" class="search-icon">
					<img width="38" height="38" src="./main/img/camping.png" alt="�˻���ư" />
				</button>
			</form>
		</div>

			<!-- ID ���ǰ��� null �϶� ���� ��ư (�α׾ƿ�/ ��ȸ������)-->
		<c:if test="${empty sessionScope.userId }">
			<div class="button-container">
				<button class="login-button"><a href="./MemberLogin.me" style="color:white;">login</a></button>
				<button class="signup-button">
					<img width="20" height="15" src="./main/img/market.png" alt="��ٱ���" />cart
				</button>
			</div>
		</c:if>
		<!-- ID ���ǰ��� null �϶� ���� ��ư (�α׾ƿ�/ ��ȸ������) -->

		<!-- ID ���ǰ��� ������ ���� ��ư(�α��� ����) -->
		<c:if test="${!empty sessionScope.userId && not fn:containsIgnoreCase(sessionScope.userId, 'admin')}">
			<div class="button-container">
				<button class="signup-button">My Page</button>
				<button class="signup-button">
				<img width="20" height="15" src="./main/img/redHeart.png" alt="��Ʈ" /> ��</button>
				<button class="signup-button">
				<img width="20" height="15" src="./main/img/market.png" alt="��ٱ���" /> cart
				</button>
				<button class="login-button"><a href="./MemberLogout.me" style="color:white;">logout
				</a></button>
			</div>
		</c:if>
		<!-- ID ���ǰ��� ������ ���� ��ư (�α��� ����) -->
		
		<!-- ID ���ǰ��� admin�϶� ���� ��ư (����������) -->
		<c:if test="${fn:containsIgnoreCase(sessionScope.userId, 'admin')}">
			<div class="button-container">
				<a style="background-color: transparent; margin-top:10px; " href="./AdminMain.ad">
				<img width="30" height="30" src="./main/img/admin.png" /></a>
			</div>
		</c:if>
		<!-- ID ���ǰ��� admin�϶� ���� ��ư (����������) -->
	</header>
	<!-- header �� -->
	
	
	<!-- ��� ���� �޴��� ���� -->
	<div class="menu">
		<div class="submenu">
			<a href="#"><b>Camping</b></a>
			<div class="submenu-content">
				<a href="#">��Ʈ</a><a href="#">��Ʈ</a> <a href="#">���̺�&����</a> <a href="#">�״ø�</a>
			</div>

		</div>
		<div class="submenu">
			<a href="#"><b>Ski/SnowBoard</b></a>
			<div class="submenu-content">
				<a href="#">��Ű���</a> <a href="#">�������</a> <a href="#">���</a> <a href="#">�尩</a>
			</div>
		</div>

		<div class="submenu">
			<a href="#"><b>Golf</b></a>
			<div class="submenu-content">
				<a href="#">����</a> <a href="#">����</a> <a href="#">����</a> <a href="#">���ǽ�</a> <a href="#">�Ź�</a>
			</div>
		</div>

		<div class="submenu">
			<a href="./Main.in"><b>For Buy</b></a>
		</div>
	</div>
	<!-- ��� ���� �޴��� �� -->